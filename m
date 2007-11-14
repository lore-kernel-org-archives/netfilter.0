From: Brian S Julin <BJulin@clarku.edu>
Subject: Do I need ipt_ROUTE to do this?
Date: Wed, 14 Nov 2007 10:55:16 -0500
Message-ID: <5A630F46702DD1498FFD48394B4A664C27DD5909@john.ad.clarku.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


Greetings,

I need to determine A) if the below solution is workable and B) if
there is any way to do the following without using ipt_ROUTE, what
seems to be removed from most distros now due to build problems, and
is still marked experimental.

Objective: We have two ISPs sending routes in via BGP, however both
ISPs traffic is consolidated on a single link.  There is no vlan tag, MPLS
wrap, or any other way to distinguish the traffic coming in, only the
BGP table.  We need to separate this traffic onto two physical links
in both directions, so that inline proprietary stateful packet shapers
can work on each link independently.

This is no problem when sending traffic to the ISPs.  Normal BGP
routing can take care of that.

However it is proving impossible even with Cisco equipment to do
policy routing based on a dynamic BGP route table.  The best we can
get from their gear is to apply tos markings through "QoS Policy
Propagation Via BGP."  We need to flip the BGP tables backwards and
choose the route into our network based on the reverse path of the
source addresses, and have this behavior update promptly when
BGP tables are updated (hopefully promptly enough that packets
are rarely dropped due to RPF checks and are not held up very long
during table updates.)

If I read things right, we could put in a linux box running
quagga/bgpd and tell zebra to install routes for one ISP into a specific
table.  Then, using iproute2's rule command we can assign a realm to
anything routed through this table.  Again, if I read this right,
iproute2 will assign two realms to any packet matching the BGP table
-- one based on the destination and one based on the source.

Since realm assignment happens after routing, we cannot, however,
(again if I am reading things right) use iproute2 policy routing on
the packets heading into our network at this point, but we could match
on the realm in the mangle table and send them via -j ROUTE.

Can anyone think of a way to do this without using -j ROUTE or
gluing things together with scripts?  This has to be a "stable"
solution.  Not opposed to using ebtables/bridging, either way
is fine.

(A more elegant solution than ipt_ROUTE might be a "match" that
can test a packet's source or destination against a kernel route
table in the INPUT or FORWARD/PREROUTING stage, which would
allow a mark to be applied earlier, and iproute2 to do the rest,
but if there is one I've managed to miss noticing it.)

As an aside, the build problems with ipt_ROUTE seem to have zapped
a good number of people who were using it when it was yanked from
distros.  In most cases this seems to be a good thing in that
most of these folks could do what they wanted to do with iproute2.
However, if ipt_ROUTE is still something that netfilter wants to
maintain, distro package maintainers now seem to be under the
misimpression that it is deprecated.

Thanks a bunch,

--
Brian

