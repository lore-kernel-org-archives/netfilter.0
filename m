From: Florian Westphal <fw@strlen.de>
Subject: Re: conntrack: confirm existing but do not create new entries
Date: Thu, 19 Aug 2021 11:09:05 +0200
Message-ID: <20210819090905.GT607@breakpoint.cc>
References: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
 <20210818161340.GR607@breakpoint.cc>
 <2ff25113-05c9-bf14-30bd-09bc21ed5a05@average.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2ff25113-05c9-bf14-30bd-09bc21ed5a05@average.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eugene Crosser <crosser@average.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Eugene Crosser <crosser@average.org> wrote:
> On 18/08/2021 18:13, Florian Westphal wrote:
> > Eugene Crosser <crosser@average.org> wrote:
> >> My use case is to set up a stateful firewall allowing any outgoing connection
> >> from a host, and restricting incoming, which obviously requires conntracking.
> >> The twist is that there exists a rather high probability of DoS-like incoming
> >> traffic, that easily overflows conntrack table with unconfirmed entries, even
> >> though their lifetime is very short.
> > 
> > Create a rule that drops NEW packets in prerouting hook. For iptables,
> > mangle will work (raw is too early).  For nftables, youl need to choose
> > a hook prioriy of -199 or higher (-198, ... to anything below 2**31).
> > 
> > Such packets will create a new connection entry, but because packet gets
> > dropped before confirmation the entry will not be committed to the table.
> 
> Unfortunately this approach does not work for my case.
> I cannot drop packets before I know that they are going to the INPUT path.
> The point of the exercise is to route transit traffic without conntracking it
> (because tracking will overflow the table), but conntrack traffic to/from the
> host itself.

Confirmation  (== commit of NEW to contnrack table) occurs at end of INPUT
(incoming case) or POSTROUTING (for locally originating and forwarded traffic)

> Maybe I'd be able to determine which traffic is transit on prerouting stage (by
> IP addresses or interfaces) and set "notrack" selectively...

You might have to clarify what you are looking for.

From your original post i concluded its this:

 <Your_Host>  ----> <internet>

... and no forwarding at all.  Requirement is to prevent NEW entries
when traffic is incoming (but not a reply).

With above, its really this:

<some_network> <---> <Your_Host> <---> <internet>

And you don't want to track forwarded traffic (but still want to track
locally originating traffic).

Only choice in that case is to NOTRACK in raw/PREROUTING based on incoming
interface.

If you are concerned about flood from <internet> -> <Your_Host>

.. then you can drop traffic coming from public interface in INPUT
if its NEW.

(assuming you still track packets coming in via the 'public' interface,
 else that won't work).

> Yet I am surprised that a flag meaning "conntrack, but only to confirm exiting
> entries" does not exist. Would not it be useful to have?..

How would that even work?

To know if a given packet is a reply there needs to be a record in the
state table.

If you are only looking for 'remote' vs 'locally generated' traffic, you might
want to have a look at the socket match, which could be used to detect
if an incoming packet would match a local socket.

There is also the 'addrtype' match, which could be used to detect
(at prerouting) if the routing table says that the daddr is local (or not).

But depending on wheter you are using NAT this might not work.
