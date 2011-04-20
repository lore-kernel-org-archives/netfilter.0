From: Andrew Beverley <andy@andybev.com>
Subject: Re: Problem with SNAT trying to configure a load balancing router
Date: Wed, 20 Apr 2011 21:24:41 +0100
Message-ID: <1303331081.4938.307.camel@andybev-desktop>
References: <1303323523.25148.10.camel@uqbar.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1303331082; bh=8wQjrVhBoaXOnGP6svIEjPgJFj7HkeRRd7JoZ
	ir63yE=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=wN5AY+2k
	blWtCz5UmRqJ7oUNwkG1jFP9QXTDRFVUgf71OJfKFcUJMweeVQeip2bkHNNSlh/zW5i
	zRE4mnjvpXGcJFAB3MaYkfiYdUmm9RSDPBlxuhBmX4+FlmYBuGuRjDZgKkmw2+jf+6i
	o1uzn2f+aL5YluzJ3FIbI+J0STRfo=
In-Reply-To: <1303323523.25148.10.camel@uqbar.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Emilio Lazo Zaia <emiliolazozaia@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 2011-04-20 at 13:48 -0430, Emilio Lazo Zaia wrote:
> I had problems trying to configure two ISP links on a Linux router with
> Netfilter and iproute2. Both links are 1Mbps. 
> 
> The ISP1's routing table is called 'CANTV' and its network interface is
> called 'wan'. ISP2 is 'Inter' and network interface 'wan2'. Both ISP
> gives me IP addresses via DHCP.

It it a "static" DHCP - do you get the same IP address assigned each
time?

> 
> After bringing up both links and some manual fix and addons to routing
> tables, rules and Netfilter's SNAT, we have the following:
> 
> # ip rule
> 0: from all lookup local 
> 32747: from all fwmark 0x2 lookup Inter 
> 32748: from all fwmark 0x1 lookup CANTV 

These 2 look good, but what rules are you using to mark packets?

> 32750: from x.x.90.26 lookup Inter 
> 32751: from x.x.222.247 lookup CANTV 

I don't think you need these - packets are already on their way back in
regardless.

> 32766: from all lookup main 
> 32767: from all lookup default 
> 
> # ip route show table main
> x.x.192.0/19 dev wan proto kernel scope link src x.x.222.247 
> x.x.64.0/18 dev wan2 proto kernel scope link src x.x.90.26 
> default via x.x.192.1 dev wan
> default via x.x.64.1 dev wan2

I *think* these are okay.

> 
> # ip route show table Inter
> x.x.64.0 dev wan2 scope link src x.x.90.26 

Not sure that you need this.

> default via x.x.64.1 dev wan2

You do need this.

> 
> # ip route show table CANTV
> x.x.192.0 dev wan scope link src x.x.222.247 

Again, not sure that you need this.

> default via x.x.192.1 dev wan
> 

You do need this.

> At this point I have some questions:
> 
> 1) The routing path "127.0.0.0/8 dev lo  scope link" needs to be in both
> routing tables? if so, why? what is its purpose?
> 

I don't think you need that.

> 2) The main routing table had to have both default routes like above or
> this is a mistake in the addition? only one (the "default", i.e.
> preferred) gateway or both using multipath nexthop mechanism?

Depends what you are trying to achieve. I would leave just one in there.
If you get your load balancing rules right then it shouldn't be used,
except for things like locally generated traffic.

> 
> Regardless what configuration is used, some packets leaves one interface
> with the IP address of the other, so I hoped this can be fixed with two
> NAT rules:
> 
> # iptables -t nat -F
> # iptables -t nat -A POSTROUTING -o wan2 -j SNAT --to-source x.x.90.26
> # iptables -t nat -A POSTROUTING -o wan -j SNAT --to-source x.x.222.247
> # conntrack -F
> # ip route flush cache
> 
> However this only reduces the routing of packets with the incorrect
> address but is not completely stopped. I.e. SNAT seems to be not
> applying to all the traffic, maybe only to certain combination of TCP
> flags. 

That doesn't seem right to me; the rules above should catch everything.
Maybe it is something to do with the extra rules above?

> 
> What I did used to test the behavior of SNAT was marking all outbound
> traffic with 0x01 or 0x02 to let the routing rules decide routing all
> packets to ISP1 or ISP2 and look at two simultaneous tcpdump running
> instances.
> 
> # iptables -t mangle -F
> # iptables -t mangle -A OUTPUT -j MARK --set-mark 1 # or --set-mark 2
> 
> This marks all OUTPUT packets regardless anything (NEW,
> ESTABLISHED, ...)? If so, why not all these packets, after crossing
> routing tables and are ready to be sent to wan/wan2 are natted?

I don't know. Can I suggest that you look at the tutorial below? It
looks like it should help you do what you want to achieve:

http://www.sysresccd.org/Sysresccd-Networking-EN-Iptables-and-netfilter-load-balancing-using-connmark

Andy


