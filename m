From: Brian S Julin <BJulin@clarku.edu>
Subject: Do I need ipt_ROUTE to do this?
Date: Wed, 14 Nov 2007 12:29:48 -0500
Message-ID: <5A630F46702DD1498FFD48394B4A664C27DD5910@john.ad.clarku.edu>
References: <5A630F46702DD1498FFD48394B4A664C27DD5909@john.ad.clarku.edu>,<473B23AE.9010106@riverviewtech.net>,<5A630F46702DD1498FFD48394B4A664C27DD590E@john.ad.clarku.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5A630F46702DD1498FFD48394B4A664C27DD590E@john.ad.clarku.edu>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



>> I need to determine A) if the below solution is workable and B) if
>> there is any way to do the following without using ipt_ROUTE, what
>> seems to be removed from most distros now due to build problems, and
>> is still marked experimental.
>>
>> Objective: We have two ISPs sending routes in via BGP, however both
>> ISPs traffic is consolidated on a single link.  There is no vlan tag,
>> MPLS wrap, or any other way to distinguish the traffic coming in,
>> only the BGP table.  We need to separate this traffic onto two
>> physical links in both directions, so that inline proprietary
>> stateful packet shapers can work on each link independently.

>What type of physical connection do you have leaving your router that
>has both upstream providers going out the same physical connection?  Are
>you using multiple providers over the same ethernet connection?  (I'm
>going to presume yes for the sake of discussion.)

Unfortunately, no this won't do it for us.  The situation is actually
a bit more complicated -- it's the same provider aggregating I2 ipv4 and
commodity internet.  Moreover we have an intervening firewall which
we cannot use in a bridging mode because doing so turns off features
we need to use.  So the MAC will always be that of the firewall, and
the firewall cannot be taught to policy route even based on input interface
and is not VRF-aware.  Not that our ISP has offered us any MPLS/VRF
solution as of yet but I'm betting that's what they come back to us with.

Anyway, not to go too much further into that mess...

A couple other ways this could happen would be to get iproute
to run the routing decision twice after pulling the traffic out of the
stack and reinjecting it.  Another would be if there were floating
around some iptables/ebtables match module that could pre-match
against a kernel routing table (by source or destination) PREROUTING.
Then a mark could be put on and iproute2 would just follow that.

Of academic interest, the eggheads seem to think dynamic "Source
Address Dependent" routing is lacking and will be needed:

http://www.google.com/search?hl=en&q=BGP+SAD+-HC-BGP&btnG=Search


