From: Bob Miller <bob@computerisms.ca>
Subject: Re: forwarding between subnets
Date: Mon, 24 Mar 2014 14:06:17 -0700
Message-ID: <1395695177.28040.20.camel@worklian>
References: <1395441794.23816.495.camel@worklian>
	 <20140323214244.GO13999@harrier.slackbuilds.org>
Reply-To: bob@computerisms.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20140323214244.GO13999@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Thanks for your reply,

> > I have an existing rule in nat/PREROUTING to do SNAT on all
> > packets from subnetA --to the internet-facing IP, so I write
> > a rule before that to ACCEPT packets from source IP in
> > subnetA to dest IP in subnetB.
> 
> Why is nat/PREROUTING relevant? Your SNAT rule should limit by 
> outgoing interface, "-o ethX" for example. Packets from A to B 
> (including the reverse) should never match your SNAT rule.

It's actually not relevant, this was just me confusing myself further.
SNAT happens in POSTROUTING, not PREROUTING.  The point I was after was
that I was paying attention to the fact that order matters.

> > On the diagram, the next thing is a routing decision, then
> > the packet should show up in mangle/INPUT or mangle/FORWARD.
> > I again write a log rule to match the dest IP for each of 
> > mangle/INPUT and mangle/FORWARD. They are the only rules on
> > those chains, but the packet is not logged on either chain.
> 
> No idea about that. I definitely would not have created a new, 
> otherwise unused table just to try to track a packet.

I am under the impression from the man page that these are built in
chains.  Do packets simply not traverse these chains if there are no
rules in them? regardless:

> > Examining the diagram, the packet is either being dropped down
> > into the link layer or the routing decision is doing something
> > else with the packet.  I understand that the link layer
> > requires ebtables and that is not installed on this firewall,
> > so the problem must be the routing decision.
> 
> Huh? Did you put any -j LOG rules in filter/FORWARD? Why not?

Yes, I did, actually one of the very first things I did, it is listed as
the very first rule in filter/FORWARD.  The packet did not get logged
there either.  My expectations being that the packet would get logged
before any decision is made to block it.  Which is what prompted me to
start logging the packet before it arrived at filter/FORWARD to see
where it was getting lost...

> I don't know why your -t mangle rules are not logging, but that
> seems to have distracted your troubleshooting with the false idea
> about the routing decision quietly eating your packets. Again, 
> filter/FORWARD is the place you want to be.

Accepted, if not fully understood.  If my conclusion about the routing
decision is false, then there is clearly still some detail I am
overlooking or am unaware of.  Google is my friend, he will tell me
eventually...

