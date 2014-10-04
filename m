From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Basic routing
Date: Sat, 4 Oct 2014 01:02:28 -0400
Message-ID: <201410040102.28427.neal.p.murphy@alum.wpi.edu>
References: <m0nhf2$oqq$1@ger.gmane.org> <201410032134.59160.neal.p.murphy@alum.wpi.edu> <m0nncm$t77$1@ger.gmane.org>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m0nncm$t77$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Friday, October 03, 2014 10:52:06 PM John Smithee wrote:
> Neal Murphy wrote, On 10/04/2014 03:34 AM:
> > On Friday, October 03, 2014 09:10:58 PM John Smithee wrote:
> >> Hi,
> >> 
> >> I've 2 NICs on a machine, both attached to seperate networks
> >> (192.168.68.0/24 and 192.168.69.0/24). I'm trying to set up a
> >> basic gateway (or routing?) between the two networks.
> >> 
> >> Is this a classical routing issue or has this to be done via iptables?
> > 
> > Standard networking, standard routing. Netfilter doesn't enter the
> > equation.
> > 
> > The prime directive: every router must have explicit routes to all
> > networks it can reach, except that the default route can eliminate many
> > explicit routes. In other words, "These routes specify how to reach
> > these LANs; packets for all other networks will be sent via the default
> > route if it exists. Packets for which there is no route will be dribbled
> > into the bit bucket." Note the phrase "every router"; it include all of
> > your internal routers as well as your perimeter (default) gateway.
> > 
> > For a router to transmit a packet it must know *where* to send it. Your
> > machine must have explicit routes to networks reachable via 192.168.68.X
> > and explicit routes to networks reachable via 192.168.69.Y, where the X
> > and Y addresses are the addresses of the routers that are gateways to
> > those other LANs.
> > ----
> > 
> >    ip route add 10.20.30.0/24 via 192.168.69.34
> >    ip route add 192.168.128.0/17 via 192.168.68.200
> >    etc.
> > 
> > ----
> > 
> > If your 'internetwork' includes the universe (the Internet), you need a
> > default route (send all packets I don't have a route for to this
> > address). ----
> > 
> >    ip route add default via 192.168.68.254
> > 
> > ----
> 
> Thx, yes this is indeed standard IP networking stuff, but unfortunately
> it still isn't working; there must be something more to it.
> 
> I think the ping error text is perhaps misleading: I guess the ping request
> does reach the destination, but the answer packet from the ping reply
> gets not forwarded to the originating second interface eth1 (192.168.69.*).
> 
> Ie. the the request from eth1 correctly goes out thru the eth0 interface
> and the reply comes as well over the same eth0 interface,
> but there is on the return path something missing to forward it from
> eth0 to eth1. Isn't it?

Actually, your ping (below) works correctly. '-I eth1' tells ping to send the 
packet out that interface; linux doesn't know where to send the packet on that 
IF and correctly says the host is unreachable. (Technically, it send ARP 
requests out but gets no response, as expected.)

Use 'ping -I 192.168.69.22' to use that address on pings going out the other 
IF.

> auto eth0
> allow-hotplug eth0
> iface eth0 inet static
>    address   192.168.68.22
>    netmask   255.255.255.0
>    broadcast 192.168.68.255
>    gateway   192.168.68.254
> 
> auto eth1
> allow-hotplug eth1
> iface eth1 inet static
>    address   192.168.69.22
>    netmask   255.255.255.0
>    broadcast 192.168.69.255
> 
> 
> 
> # route
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
> default         192.168.68.254  0.0.0.0         UG    0      0        0 eth0
> link-local      *               255.255.0.0     U     1      0        0 eth0
> 192.168.68.0    *               255.255.255.0   U     1      0        0 eth0
> 192.168.69.0    *               255.255.255.0   U     0      0        0 eth1
> 
> 
> 
> Pinging the external gateway (192.168.68.254) from eth0 works fine,
> but not from eth1:
> 
> # ping -I eth1 192.168.68.254
> PING 192.168.68.254 (192.168.68.254) from 192.168.69.22 eth1: 56(84) bytes 
of 
> data.
>  From 192.168.69.22 icmp_seq=1 Destination Host Unreachable
>  From 192.168.69.22 icmp_seq=2 Destination Host Unreachable
>  From 192.168.69.22 icmp_seq=3 Destination Host Unreachable
> ^C
> --- 192.168.68.254 ping statistics ---
> 5 packets transmitted, 0 received, +3 errors, 100% packet loss, time 4022ms
> 
