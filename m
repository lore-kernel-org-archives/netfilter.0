From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: forwarding between subnets
Date: Sun, 23 Mar 2014 16:42:44 -0500
Message-ID: <20140323214244.GO13999@harrier.slackbuilds.org>
References: <1395441794.23816.495.camel@worklian>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1395441794.23816.495.camel@worklian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Fri, Mar 21, 2014 at 03:43:14PM -0700, Bob Miller wrote:
> I have a firewall with 3 network ports; one for internet an 
> connection and two for segregated subnets that share the
> internet connection.
> 
> I want to allow one computer on one subnetA to reach another 
> computer on the other subnetB.  It is not reaching its
> destination.  When problems like this arise, I turn to the 
> nf-packet-flow diagram and set up logging rules to make sure
> the packets are going where I think they are.

Good procedure. You can use -j TRACE in -t raw for excruciating 
detail, or just -j LOG rules in relevant places in other tables' 
chains.

> I have an existing rule in nat/PREROUTING to do SNAT on all
> packets from subnetA --to the internet-facing IP, so I write
> a rule before that to ACCEPT packets from source IP in
> subnetA to dest IP in subnetB.

Why is nat/PREROUTING relevant? Your SNAT rule should limit by 
outgoing interface, "-o ethX" for example. Packets from A to B 
(including the reverse) should never match your SNAT rule.

> I write two LOG rules to match packets with the dest and place
> one immediately before and immediately after my ACCEPT rule.
> The packet is logged before but not after the ACCEPT rule.  I
> believe this to mean the packet is accepted at nat/PREROUTING
> and should move to the next step in the diagram.

I would concur.

> On the diagram, the next thing is a routing decision, then
> the packet should show up in mangle/INPUT or mangle/FORWARD.
> I again write a log rule to match the dest IP for each of 
> mangle/INPUT and mangle/FORWARD. They are the only rules on
> those chains, but the packet is not logged on either chain.

No idea about that. I definitely would not have created a new, 
otherwise unused table just to try to track a packet.

> Examining the diagram, the packet is either being dropped down
> into the link layer or the routing decision is doing something
> else with the packet.  I understand that the link layer
> requires ebtables and that is not installed on this firewall,
> so the problem must be the routing decision.

Huh? Did you put any -j LOG rules in filter/FORWARD? Why not?

> If I check the routing table, I have 4 routes, one to each of
> the respective subnets for each port, and a default via the
> internet port. These routes are apparently working as expected
> in that packets are finding their way to the internet and back.
> 
> It seems either my troubleshooting process is broken, or
> something unexpected (to me) is happening in that routing
> process.  Can anyone drop me a clue?

I don't know why your -t mangle rules are not logging, but that
seems to have distracted your troubleshooting with the false idea
about the routing decision quietly eating your packets. Again, 
filter/FORWARD is the place you want to be.
-- 
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
