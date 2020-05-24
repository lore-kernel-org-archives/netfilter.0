From: Florian Westphal <fw@strlen.de>
Subject: Re: iif versus meta fib iif
Date: Mon, 25 May 2020 00:42:23 +0200
Message-ID: <20200524224223.GC2915@breakpoint.cc>
References: <f464fa81-93c2-62f4-9703-e84e35fb3d54@satchell.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f464fa81-93c2-62f4-9703-e84e35fb3d54@satchell.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Satchell <list@satchell.net>
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>

Stephen Satchell <list@satchell.net> wrote:
> I'm trying to understand why the nft(8) responds the way it does, and
> perhaps try to understand the underlying operation of a netfilter firewall.
> 
> What is the difference between these selectors?
> 
> 1. iif eth0

This checks the input interface index.

> 2. meta fib saddr iif eth0
> 3. meta fib daddr iif eth0

These two are invalid syntax.
Did you mean
fib saddr oif eth0
fib daddr oif eth0

?
If so, it tells the kernel to fetch the output interface index that would
be used when sending a packet to the source (or daddr) of the packet.

> 4. oif eth0

Same as 1, just for the output interface index.

> 5. meta fib saddr oif eth0
> 6. meta fib daddr oif eth0

Again, inalid syntax, I assume this was meant to be

fib saddr oif eth0, see above.

> (1) tests what interface came from, irrespective of the source and
> destination address

Yes.

> (2) uses the routing table to find out where the packet would return

That would be "fib saddr oif eth0"

> (3) uses the routing table to find out where the packet will be routed

Yes, it fetches output interface for the packets ip destination address.

> (4) tests the interface associated with the routing decision that has been
> performed in the packet flow.  In theory. (3), (4) and (6) would return the
> same result.

Yes, except that 4) doesn't do a new check, it just returns the output
interface that the packet is going to use (output happens after initial
routing decision, re-routing can occur later in the pipeline though).

> So here is the big question:  how can I determine the FIB's classification
> of the source address in rules in the output and postrouting tables?  In
> other words, how can I test that the source address denotes a uni-cast
> address that would return to this router?

This is impossible, as you can't know if the the receiver has
a route back.

If you are talking about best-effort, "fib saddr type local"
if you want to match if the soruce address is assigned *locally*
or "... type { unicast, local }" if any unicast address will do.
Or "... type unicast" if the FIB considers it non-local unicast.

> The packet routing decision *has* been made in the forward, output, and
> postrouting table, so "oif eth0" should be allowed.

I'm not following, "oif eth0" is allowed. Its just shorthand for "meta
oif eth0". And "fib" is supposed to be useable when the routing decision
has NOT been made yet, as "fib" does a lookup in the FIB based on the
parameters you provide.

