From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: [Fwd: Re: Routing from ppp to ipsec tunnel]
Date: Tue, 19 Aug 2008 19:47:51 -0500
Message-ID: <48AB69B7.6010003@riverviewtech.net>
References: <49353.80.118.132.195.1219130398.squirrel@mail.thom.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49353.80.118.132.195.1219130398.squirrel@mail.thom.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/19/08 02:19, devel@thom.fr.eu.org wrote:
> Thank you for this quick answer.

You are welcome.

> I tried first to set it up as you mentionned : Say site 1 lan is 
> 10.211/16 site 2 lan is 10.212/16 road warrior 1 range is 10.210/16 
> (let's first don't consider the second road warrior access)

Quick question:  Road warriors are connecting to Site 1, correct?  (I'm 
presuming so, unless you say other wise, based on the fact that Site 1's 
subnet mask is being altered below to be inclusive of the road warrior's 
subnet.)

We'll not look at Site 2's road warrior(s) yet.  ;)

> So at first (before trying to turn on road warriors) I configured the 
> following SAs :
> 
> 10.211.0.0/16 to 10.212.0.0/16 and vice versa on each end of the VPN 
> (and this worked fine) and add the routes 10.212.0.0/16 through 
> 10.211.254.254 (being the vpn gateway lan address) and 10.211.0.0/16 
> through 10.212.254.254 on site 2 gateway

Um, why are you adding routes?  I (mis)understood your VPN end points to 
be NATing routers that were the default gateway for the LANs at both 
Site 1 and Site 2.  Thus there should be no need to add routes at all. 
At least as I understand it, IPSec will take care of this for you, thus 
you don't need to do it.  /Or/ were you indicating that they were added 
by your IPSec stack for you?

> These 2 VPN gateway also act as nating firewall for internet access, 
> and so all the lan client are configured with these address as 
> default gateway.

*nod*  This makes things simpler.  You should only need to add routes to 
the default gateways on each LAN if they are not also the VPN end points.

> So far, this work great.

Good.

> Then to allow road warrior attached to site 1 traffic go through the 
> tunnel, I thought I just had to modify the SAs and routes as follows 
> :

*nod*  You should expand the netmask on the SAs.

> 10.210.0.0/15 to 10.212.0.0/16 and vice versa on each end, then on 
> site 2 gateway, replace the route to site one by 10.210.0.0/15 
> through 10.212.254.254.

Yes, that should take care of your SA.  As far as the routes, I'm still 
at a loss as to why you have to add them your self.  Either way, 
expanding your route's target match netmask by one bit like you did in 
the SA netmask is correct.

> At this point, the intersite VPN works ok, but when I try to ping 
> site 2 gateway from the local (site 1) ppp end, I can't get the 
> traffic go through the tunnel. I can see the packet (I use LOG target 
> in netfilter) get out ppp0 in the OUTPUT table, then go through the 
> POSTROUTING table in NAT chain, and that's all. No IPSEC traffic is 
> generated for the packet.

Hum.

> What did I do wrong ?

I don't know.  Nor do I have an environment that I can test this to help.

Let's get some information out in the open to make sure that we are both 
thinking the same thing.

Site 1
Internet:  a.b.c.d
      LAN:  10.211/16
   RW VPN:  10.210/16

Site 2
Internet:  e.f.g.h
      LAN:  10.212/16

Site 1 and Site 2 are doing the following:
  - Establishing an IPSec VPN between a.b.c.d and e.f.g.h (respectively).
  - Adding routes to the other sites subnet through the VPN.

Presuming that your configuration is as it was prior to starting with 
road warriors, can you do the following?
  - Can a computer on the LAN at Site 1 ping a computer (not Site 2's 
router) on Site 2's LAN?
  - Can a computer on the LAN at Site 1 ping the inside of the router at 
Site 2?
  - Can a computer on the LAN at Site 1 ping the outside of the router 
at Site 2 (e.f.g.h)?
  - Can a computer on the LAN at Site 2 ping a computer (not Site 1's 
router) on Site 1's LAN?
  - Can a computer on the LAN at Site 2 ping the inside of the router at 
Site 1?
  - Can a computer on the LAN at Site 2 ping the outside of the router 
at Site 1 (a.b.c.d)?
  - Can the router at Site 1 ping the inside of the router at Site 2?
  - Can the router at Site 2 ping the inside of the router at Site 1?
    (If computers on each LAN can ping the inside of the router of the 
other site, we know the routers can ping the LAN for other sites.)
    (We know the routers can ping each others external interfaces by the 
ver fact that they can establish a VPN between each other.

I'm trying to establish how functional the VPN is or if there might be 
something else going on.



Grant. . . .
