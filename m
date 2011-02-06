From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: How can I test my tc script?
Date: Sat, 05 Feb 2011 22:24:26 -0400
Message-ID: <1296959066.3695.24.camel@debian-laptop.OptimumWireless>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <20110203120131.38cd818d@catus>
	 <1296827153.3644.7.camel@debian-laptop.OptimumWireless>
	 <20110205212151.27f217e0@catus>  <20110206010527.4457d220@catus>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110206010527.4457d220@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

This IS very complex.

I'm going to have to print this and sit to take a closer look at it.

I would like to thank you all for replying to my post you have being
very helpful.



On Sun, 2011-02-06 at 01:05 +0100, Marek Kierdelewicz wrote:
> And here's a bit more complex example for shaping upload with tc u32
> hashing filters and IFB.
> 
> As in download example, we want to share 100mbit connection. Internet
> access is connected to the router on eth0 and lan in on eth1. We do
> ingress shaping of upload traffic on ifb0 after ingress eth1 traffic
> is redirected to the device.
> 
> ---------------------complete script------------------------------
> tc qdisc add dev ifb0 root handle 1: htb default 1
> tc class add dev ifb0 parent 1: classid 1:1 htb rate 100Mbit
> tc filter add dev ifb0 parent 1:1 prio 11 handle 2: protocol ip \
> u32 divisor 256
> tc filter add dev ifb0 protocol ip parent 1:1 prio 11 u32 match \
> ip dst 0.0.0.0/0 hashkey mask 0x000000ff at 12 link 2:
> 
> tc class add dev ifb0 parent 1:1 classid 1:400 htb rate 5mbit
> tc qdisc add dev ifb0 parent 1:400 handle 400: sfq perturb 1
> tc filter add dev ifb0 protocol ip prio 11 u32 ht 2:46: match ip \
> src 10.5.0.70 flowid 1:400
> 
> tc class add dev ifb0 parent 1:1 classid 1:401 htb rate 5mbit
> tc qdisc add dev ifb0 parent 1:401 handle 401: sfq perturb 1
> tc filter add dev ifb0 protocol ip prio 11 u32 ht 2:a: match ip \
> src 10.5.0.10 flowid 1:401
> 
> tc qdisc add dev eth1 ingress
> tc filter add dev eth1 protocol ip parent ffff: prio 4 u32 match \
> ip dst 0.0.0.0/0 flowid :1 action mirred egress redirect dev ifb0
> ---------------------------------------------------------------------
> 
> Now lets go line by line.
> 
> >tc qdisc add dev eth1 root handle 1: htb default 1
> >tc class add dev eth1 parent 1: classid 1:1 htb rate 100Mbit
> >tc filter add dev eth1 parent 1:1 prio 11 handle 2: protocol ip \
> >u32 divisor 256 
> 
> analogous to download example
> 
> >tc filter add dev eth1 protocol ip parent 1:1 prio 11 u32 match \
> >ip dst 0.0.0.0/0 hashkey mask 0x000000ff at 12 link 2:
> 
> "at 12" instead of 16, because we want to hash on source ip address
> 
> >tc class add dev eth1 parent 1:1 classid 1:400 htb rate 5mbit
> >tc qdisc add dev eth1 parent 1:400 handle 400: sfq perturb 1
> 
> analogous to download example
> 
> >tc filter add dev eth1 protocol ip prio 11 u32 ht 2:46: match ip \
> >src 10.5.0.70 flowid 1:400
> 
> compared to download shaping, dst is changed to src
> 
> >tc class add dev ifb0 parent 1:1 classid 1:401 htb rate 5mbit
> >tc qdisc add dev ifb0 parent 1:401 handle 401: sfq perturb 1
> >tc filter add dev ifb0 protocol ip prio 11 u32 ht 2:a: match ip \
> >src 10.5.0.10 flowid 1:401
> 
> analogous to previous client
> 
> >tc qdisc add dev eth1 ingress
> 
> add ingress qdisc to eth1 interface
> 
> >tc filter add dev eth1 protocol ip parent ffff: prio 4 u32 match \
> >ip dst 0.0.0.0/0 flowid :1 action mirred egress redirect dev ifb0
> 
> redirect any ip traffic from ingress qdisc on device eth1 to ifb0;
> note! redirection to ifb doesn't interfere with routing/firewalling/nat;
> 
> Best regards,
> Marek Kierdelewicz
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

