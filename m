From: Thomas Jacob <jacob@internet24.de>
Subject: Re: still can't route using fwmark
Date: Sun, 19 Apr 2009 11:00:17 +0200
Message-ID: <20090419090016.GA19987@internet24.de>
References: <op.uskfabufx1lyi3@localhost> <20090418082314.GA12566@internet24.de> <op.usld3aqfx1lyi3@localhost> <20090418184809.GA15649@internet24.de> <op.uslkl80px1lyi3@localhost> <20090418205802.GA16790@internet24.de> <op.uslqwresx1lyi3@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <op.uslqwresx1lyi3@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lloyd Standish <lloyd@crnatural.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sat, Apr 18, 2009 at 03:49:29PM -0600, Lloyd Standish wrote:
> On Sat, 18 Apr 2009 14:58:02 -0600, Thomas Jacob <jacob@internet24.de> wrote:
> 
> 
> > Are you forwarding packets via this box, or do you want to loadbalance
> > packets from the local machine? In the latter case the PREROUTING
> > stuff needs to go into INPUT/OUTPUT.
> 
> Well, I want to load-balance packets from the local machine, which is serving as gateway for a home LAN (eth0).  The local machine is 192.168.1.1 on the LAN.

Then your current setup in PREROUTING is what you want to go for, just keep
in mind that this does not give you load balancing for connections originating
from your router box, just the ones from your LAN.

C.f.: http://ebtables.sourceforge.net/br_fw_ia/bridge3b.png

I'm not sure why you need NAT on your eth0 though then, what are you
trying to achieve with this? But that should not be the cause
of the load balancing failure.

> When I remove the default route in the main routing table, I completely lose Internet connectivity.   My logic tells me that a default "main" route should not be necessary at all if all packets are marked and sent to my 2 custom routing tables (rt_link1/2), each of which has a default route.

That's right, but if all your /proc/net/ip_conntrack entries contain mark values
then there really must be something wrong with the fw mark <-> route interaction.

My suggestion is to try this with the lastest IPtables user space and 2.6.27.X for
instance, then maybe more people have a comparable setup to look at.

> The only experience I have with iptables is simple firewall stuff for my Internet-connected server.  My grasp of routing is weak, and this trouble is good experience in an area I would like to become expert in.  

Do you know about LARTC? The best way to get started IMO: http://lartc.org/
> >
> > But maybe one does not need gateways for ppp since there should be no one else
> > on that link anyway (as you suggested with your "default dev pppX" routes).
> 
> I don't think I understand your comment.   I need a gateway IP to forward Internet queries to... 

Your router needs to know where to send packets it doesn't have routes for, sure. In an ethernet
you need to specify a certain nexthop gateway machine, because there are more
than two nodes on the local link, but I am not sure that is actually necessary for
ppp connections, even though it is usually done that way (as in your setup) since
all packets sent do the ppp link are definitely intended for the other node
on the link.

> I really appreciate your advice.  I'm a networking novice so my ideas are not rooted in experience, but I think it should not matter that the gateway IP is a private IP.

Using private IPs isn't a problem, having several routes to the same
destination might possibly be (even if it shouldn't be as they are in different
routing tables). It's most certainly a problem in a single routing table, as only
the first route will ever get used though.

But as you lose connectivity when you remove the two routes
from the "main" table, you definitely have another problem regardless
of this.

   Thomas
