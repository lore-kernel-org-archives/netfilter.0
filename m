From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Basic Routing
Date: Sun, 2 Nov 2008 20:53:46 +0100
Message-ID: <014201c93d24$b7dab310$27901930$@info>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490DF4CA.1010808@amfes.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> Thanx.  I'm still not sure of the vocabulary with which to phrase
> my "true" question - so I'll try it with more words (although I
> think you've already answered me - I'm just looking for
> confirmation).
> 
> Given:
> 1.  A linux box "router" that has ip-fowarding enabled, and no
> restrictions via iptables.
> 2.  This box has a routing table that lists two or more networks
> 
> If another host on network 'A', lists the box "router" as its
> default gateway, and tries to contact network 'B' through the
> router - will the router automagically pass along the packets? 

If network A is your LAN and network B is "the internet", the packet
might be routed onto the internet but even if it reaches the destination
IP (which it may not because of the configuration of other routers and
firewalls), you'll never get a reply packet because a reply packet for a
private IP will most likely be routed to their own DMZ or LAN. So, you
can't setup a full connection like this.
However, if you were using public IP's (not in 192.168.x.x, etc) on your
LAN then you could just route the packet.

> Or this simply doesn't work, because of a basic networking concept
> I haven't grasped - and NAT is the technique to accomplish this?

Yes, one way or another, some form of NAT is the technique to be used.
As Grant explained you can also use ebtables. I'm writing about NAT
using iptables.

> I guess part of my difficulty lies in a lack of experience
> configuring non-linux routers.  Behind-the-scenes, as it were, do
> all/most routers use NAT to accomplish the goal of linking
> networks? 

Normally you'd only encounter NAT situations when connecting a
host/network to the internet and you're using private space IP's on the
network.

> It always seemed to me NAT was a 'kludge' that was somehow
> unnecessary when "more expensive?" equipment was involved.

No, NAT is a necessary kludge because not every computer that must be
connected to the internet can have a public IP: there just aren't enough
IP's to do that. That's why home networks and corporate networks (well,
those I know of) mostly use private IP's on their LAN and use NAT
(and/or a proxy) to get to the internet.

NAT is not/should not be necessary between networks if you have
something like this:

-------------  -------  -------------
| Network A |--| RTR |--| Network B |
-------------  -------  -------------
 
Here, the router knows the route to each network and can just route
packets to each other. No need for NAT here.
 
Maybe you find this tutorial useful in understanding things. The history
says it's not updated since 2006, but the information still holds for at
least the large part.
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


Grts,
Rob


