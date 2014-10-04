From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Basic routing
Date: Fri, 3 Oct 2014 21:34:59 -0400
Message-ID: <201410032134.59160.neal.p.murphy@alum.wpi.edu>
References: <m0nhf2$oqq$1@ger.gmane.org>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m0nhf2$oqq$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Friday, October 03, 2014 09:10:58 PM John Smithee wrote:
> Hi,
> 
> I've 2 NICs on a machine, both attached to seperate networks
> (192.168.68.0/24 and 192.168.69.0/24). I'm trying to set up a
> basic gateway (or routing?) between the two networks.
> 
> Is this a classical routing issue or has this to be done via iptables?

Standard networking, standard routing. Netfilter doesn't enter the equation.

The prime directive: every router must have explicit routes to all networks it 
can reach, except that the default route can eliminate many explicit routes. 
In other words, "These routes specify how to reach these LANs; packets for all 
other networks will be sent via the default route if it exists. Packets for 
which there is no route will be dribbled into the bit bucket." Note the phrase 
"every router"; it include all of your internal routers as well as your 
perimeter (default) gateway.

For a router to transmit a packet it must know *where* to send it. Your 
machine must have explicit routes to networks reachable via 192.168.68.X and 
explicit routes to networks reachable via 192.168.69.Y, where the X and Y 
addresses are the addresses of the routers that are gateways to those other 
LANs.
----
  ip route add 10.20.30.0/24 via 192.168.69.34
  ip route add 192.168.128.0/17 via 192.168.68.200
  etc.
----

If your 'internetwork' includes the universe (the Internet), you need a 
default route (send all packets I don't have a route for to this address).
----
  ip route add default via 192.168.68.254
----
