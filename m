From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: AW: snat dnat question
Date: Sun, 7 Jul 2002 13:03:43 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020707120346.YAJW23840.mta03-svc.ntlworld.com@there>
References: <8C14C590A51EB74285ADCA3DAD1A9DD705C11E@hilgert-srv1.internal.hilgert.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <8C14C590A51EB74285ADCA3DAD1A9DD705C11E@hilgert-srv1.internal.hilgert.de>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Sunday 07 July 2002 12:51 pm, Thomas Hilgert wrote:

> Here is a small picture and the iptables commands
>
> #  ETH1: External
> #  ETH2: DMZ 10.2.0.1
> #  ETH0: LAN 10.1.0.1

> # SNAT all outgoing traffic
> #
> iptables -t nat -A POSTROUTING -o  eth1 -j MASQUERADE
> #
> # DNAT all incoming traffic to out DMZ WEB and MAIL Server (10.2.0.2)
> #
> iptables -t nat -A PREROUTING -i eth1 -j DNAT --to 10.2.0.2

I suggest you change that last rule so that it is specific to the services 
you actually want to be accessed:

1. It might solve your problem
2. It's an *awful* lot more secure - at present you're making the whole 
machine 10.2.0.2 accessible to the Internet with no filtering

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 25 -j DNAT --to 10.2.0.2
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to 10.2.0.2

Add more rules with appropriate port numbers if you want to make your ftp, 
ssh, dns, https and http-proxy servers accessible to the outside as well.

By the way, whilst you're at it, you might like to tidy up your name server 
configuration - it seems to have an awful lot of redundant entries in it....

 

Antony.

