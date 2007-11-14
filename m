From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Do I need ipt_ROUTE to do this?
Date: Wed, 14 Nov 2007 10:34:54 -0600
Message-ID: <473B23AE.9010106@riverviewtech.net>
References: <5A630F46702DD1498FFD48394B4A664C27DD5909@john.ad.clarku.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5A630F46702DD1498FFD48394B4A664C27DD5909@john.ad.clarku.edu>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/14/07 09:55, Brian S Julin wrote:
> I need to determine A) if the below solution is workable and B) if 
> there is any way to do the following without using ipt_ROUTE, what 
> seems to be removed from most distros now due to build problems, and 
> is still marked experimental.
> 
> Objective: We have two ISPs sending routes in via BGP, however both 
> ISPs traffic is consolidated on a single link.  There is no vlan tag, 
> MPLS wrap, or any other way to distinguish the traffic coming in, 
> only the BGP table.  We need to separate this traffic onto two 
> physical links in both directions, so that inline proprietary 
> stateful packet shapers can work on each link independently.

What type of physical connection do you have leaving your router that 
has both upstream providers going out the same physical connection?  Are 
you using multiple providers over the same ethernet connection?  (I'm 
going to presume yes for the sake of discussion.)

<snip>

Sorry, I can't comment on the BGP as I have no experience working with it.

> Can anyone think of a way to do this without using -j ROUTE or gluing 
> things together with scripts?  This has to be a "stable" solution. 
> Not opposed to using ebtables/bridging, either way is fine.

I'm glad that you mentioned EBTables and bridging because that is the 
first place that I was going to go.  This statement further makes me 
believe that you are dealing with an ethernet solution.  If this is 
indeed the case I'm betting that each provider connects to the same 
ethernet segment out side of your control, thus you can not put your 
load management equipment upstream before the traffic is aggregated. 
However if this is an ethernet connection, that means that you should 
have the MAC address of the router(s) that are putting the ethernet 
frames on the segment.

If you have the MAC addresses, you could easily set up a Linux box to 
divide the traffic based on source MAC address.  Have one interface 
pointing up stream, one pointing downstream to one piece of equipment, 
and one pointing downstream to the other piece of equipment.

So long as the upstream MAC addresses do not change on you (they should 
not, or it should be predictable) you can direct the traffic one way or 
the other.  If for some reason your upstream provider has multiple MAC 
addresses, you can use multiple as a key to send one way or the other.

I'm not quite sure what the proper EBTables config would be, but I 
suspect that it would be something along the lines of allowing traffic 
to come in the upstream interface and out one downstream interface while 
blocking traffic out the other downstream interface for provider and 
switch the downstream interfaces for the other provider.  You would 
probably want to block or seriously limit the flow of traffic from one 
down stream interface to the other too.  Naturally you will need to 
allow traffic that comes in the downstream interfaces to go out the 
upstream interface.



Grant. . . .
