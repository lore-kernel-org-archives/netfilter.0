From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Iptables command failed
Date: Wed, 7 Apr 2004 15:21:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004701c41ca3$31c2e640$1202a8c0@admin>
References: <20040407115931.75869.qmail@web61002.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I m using kernel 2.4.22 and iptables rpm 1.2.7a-2.
> I compiled a kernel to support the Network filtering
> successfully. But when i issued the following command
> 
> iptables -A INPUT -s 127.0.0.1 -p icmp -j DROP
> 
> i got the following error
> 
> /lib/modules/2.4.22/kernel/net/ipv4/netfilter/ip_tables.o:
> unresolved symbol nf_register_sockopt_Rsmp_f5985dce
> 
....
> 
> iptables v1.2.7a: can't initialize iptables table
> `filter': iptables who? (do you need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded.
> 
> 
> what this error means?do i need to update the iptables
> or kernel?

Did you compile a new kernel without updating iptables ?
If so, compile a new iptables (1.2.9) too.


Gr,
Rob


