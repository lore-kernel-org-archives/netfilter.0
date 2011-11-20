From: Andrew Beverley <andy@andybev.com>
Subject: Re: trouble setting default route for load-balancing routing tables
Date: Sun, 20 Nov 2011 14:16:43 +0000
Message-ID: <1321798603.2382.987.camel@andybev-desktop>
References: <op.v4721hs0x1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1321798603;
	bh=N0VQzBoss5jPaRJ2thIqMnCgcnq8AWPuWRPjoumJndE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=Poemue5uzrNFDCL2tiKg8C9Fw8LSM7MPEcGmaOoiNAxni0qhdHQBDQX45P63ctfp/
	 Nt9GvC1WVptUgdBC5IQZZUdTmyYC931g1DwMWe35aTwNY58oSwDH818DhiA8jFr1kT
	 72J2WG3VL7vxLEYapxieRsMjQvt4HDAZJBGoJF1w=
In-Reply-To: <op.v4721hs0x1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

On Sat, 2011-11-19 at 20:11 -0600, Lloyd Standish wrote:
> Hi Everyone,
> 
> I'm configuring a load-balancing netfilter router.  It does round-robin load balancing over 2 external interfaces, eth0 and eth1.  The natted LAN is on eth4.  eth0 is attached to table T0, and eth1 uses table T1.
> 
> I am unable to add default routes to the routing tables T0 and T1.  Here is the output from my bash script that sets up the router:
> 
> + ip route flush table T0
> + ip route add 192.168.100.0/24 dev eth0 src 192.168.100.10 table T0
> + ip route add default via 192.168.100.11 table T0
> RTNETLINK answers: No such process

I see nothing wrong with your rules. That error implies that the kernel
doesn't know what 192.168.100.11 is, but it's clearly accepted it for
the default route in the main routing table. Has anything changed
between you writing the rules above and writing the rules for the main
table?

Is the IP address for eth0 correctly configured at this point? An
incorrect netmask will cause the error above.

> 
> Even with the lack of default route for T0 and T1, the router appears
>  to properly load-balance over the 2 outgoing interfaces (!)

I would expect that, as the nexthop rules in the main table are doing
the load balancing.

>   However,
>  it ignores my rules which should direct certain traffic over a
>  particular interface.

I assume that you have no need to keep the same connection stream on the
same interface? If you do, you can use netfilter marks (and netfilter
connection tracking) to do the load balancing instead, as described on
this page:

http://www.sysresccd.org/Sysresccd-Networking-EN-Iptables-and-netfilter-load-balancing-using-connmark

> 
> After setting up the router, here is table main:
> 
> root@debiandesk2:/home/lloyd/data/traffic_shaping# ip route show table main
> 192.168.100.0/24 dev eth0  scope link  src 192.168.100.10
> 192.168.50.0/24 dev eth4  scope link  src 192.168.50.1
> 192.168.90.0/24 dev eth1  scope link  src 192.168.90.10
> default
> 	nexthop via 192.168.100.11  dev eth0 weight 92
> 	nexthop via 192.168.90.1  dev eth1 weight 7
> 
> 
> And here is table T0, devoid of a default route:
> 
> root@debiandesk2:/home/lloyd/data/traffic_shaping# ip route show table T0
> 192.168.100.0/24 dev eth0  scope link  src 192.168.100.10
> 192.168.50.0/24 dev eth4  scope link
> 127.0.0.0/8 dev lo  scope link
> 
> Let me know if any more info is needed to debug this.
> 
> Regards,
> Lloyd
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


