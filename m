From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables problem with rules
Date: Fri, 28 Jun 2002 19:10:20 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020628181023.OBHC4626.mta02-svc.ntlworld.com@there>
References: <20020628180424.29924.qmail@webmail5.rediffmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020628180424.29924.qmail@webmail5.rediffmail.com>
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

On Friday 28 June 2002 7:04 pm, ganesh kumar godavari wrote:

> hello group,

>   i want to limit
>   the # of packets based on the type of protocol used
>
>   i have used iptables rules like
>
> #Syn-flood protection:
>   iptables -A FORWARD -s a.b.c.d -p tcp --syn -m
>   limit --limit 1/s -j ACCEPT
>
> the rule doesn't help to stop the packets
>
> i tried the following rule it helps me to stop the ping flood
> attack
>
>   iptables -A INPUT  -s 128.198.60.195 -p icmp
>   --icmp-type echo-request -m limit --limit 1/s -j
>   ACCEPT
>   iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

I am confused about whether you are trying to stop packets coming in to the 
machine running netfilter (ie you are putting the rules in the INPUT chain) 
or whether you are trying to stop packets going through the netfilter machine 
to another host (ie you are putting the rules in the FORWARD chain).

Please can you clarify your network setup ?

 

Antony.

