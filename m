From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Connection intercept
Date: Wed, 16 Jan 2008 09:36:06 -0600
Message-ID: <478E2466.2080005@riverviewtech.net>
References: <478CE2B1.2000806@telbiomed.at> <478DABBD.2000400@usa.net> <478DD043.6040904@telbiomed.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <478DD043.6040904@telbiomed.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 01/16/08 03:37, DI Roman Fiedler wrote:
> The idea was that the intercept host(s) can see the original source and 
> destination IP for traffic analysis (check if one source host scans all 
> destinations or just permanently hits one), but I guess this is not a 
> "must have". No matter which of these method is used, both of them split 
> the traffic in PREROUTING and before the filter tables, which I want to 
> avoid somehow (see below for explanation).

I'm not sure what your Layer 2 and Layer 3 setup looks like so I can't 
say for sure, but I think I would be tempted to look at doing some sort 
of Layer 2 filtering / bridging to accomplish what you are after.  More 
specifically, if I was not happy with the traffic, I would alter its 
Layer 2 destination MAC address to that of the honey pot.  This way, the 
traffic would still have the appropriate Layer 3 source and destination 
IP addresses.

> That's the problem: Our setup contains 7 networkcards, with vlan tagging 
> more than 10 networks plus some vpns. We also need to do policy routing 
> since some IPs occur more than once in the complete network setup. Some 
> hundred rules are contained in a shorewall config. The problem: 
> shorewall adds the filter rules to the filter table, after routing and 
> natting, so massive change of setup would be needed to make pre-route 
> decisions work.

It sounds like things are fairly complex with lots of interfaces and 
further more is likely to change with time as business needs change too. 
  As such, with out knowing more about your filtering rules, I can't say 
for sure if a Layer 2 approach would work for you or not.  I'm betting 
that you would need a mixture of EBTables and IPTables to do all the 
filtering that you want on the bridged traffic.  That is to say you 
could do the simple filtering via EBTables and only use IPTables (seeing 
the bridged traffic) for the things that EBTables can not do (i.e. 
connection state and other advanced match extensions).

> My goal was to do it with minimal effort, e.g. make an iptables-save 
> output patch that will transform the current iptables data to a setup 
> that can do the intercepting. I do not think that it would be possible 
> to do the thing with shorewall directly and I want to avoid recoding all 
> filter rules in the prerouting table (some would be impossible since 
> they use output interface for decision, which is not defined at this 
> point).

It may be possible to allow Shorewall manage the IPTables rules and you 
personally (possibly via scripts) manage EBTables rules before IPTables 
sees the packets.  If you did not need to use IPTables to filter the 
bridged traffic (that is to say you are comfortable with stateless 
filtering on source / destination protocol and / or port) you could 
bridge the traffic with out IPTables being any the wiser.  If you can 
use EBTables to do your filtering, I'd hope that you could put EBTables 
and bridging in as a shim between the NICs and where IPTables picks up. 
  You could possibly even bypass IPTables for some traffic entirely.

Of course with bridging you will have to manage your IP ranges 
appropriately.

> I thought that perhaps somebody has done experiments with a "strange" 
> setups, e.g. use a tricky combination of MIRROR targets or a loop via 
> some geek netlink program that can feedback the packet from the ULOG 
> target to the interface receive methods so that it can pass PREROUTING 
> twice.

Such is probably possible, though I'm not sure of any thing like that. 
You may want to look in to how various IDS / IPS systems work.



Grant. . . .
