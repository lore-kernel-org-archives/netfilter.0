From: Florian Westphal <fw@strlen.de>
Subject: Re: IPSec, masquerade and dnat with nftables
Date: Tue, 18 Oct 2016 22:55:44 +0200
Message-ID: <20161018205544.GA21308@breakpoint.cc>
References: <8737l9mu0c.fsf@ilexius.de>
 <20161017194405.GH24375@salvia>
 <ad567cf1-6c48-d367-1b99-9973bf08319b@familie-kuntze.de>
 <20161017201149.GB7690@salvia>
 <324a4f79-5207-6517-3cc0-49a6c2323bb0@familie-kuntze.de>
 <20161017202712.GA8529@salvia>
 <83a41f9a-608e-8c46-59b7-5a2b5af8032d@familie-kuntze.de>
 <20161018085957.GC29405@breakpoint.cc>
 <779a7b4b-1d9f-e27b-786a-fe90a4970502@familie-kuntze.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <779a7b4b-1d9f-e27b-786a-fe90a4970502@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Noel Kuntze <noel@familie-kuntze.de>
Cc: Florian Westphal <fw@strlen.de>, Pablo Neira Ayuso <pablo@netfilter.org>, Thomas Bach <t.bach@ilexius.de>, netfilter@vger.kernel.org

Noel Kuntze <noel@familie-kuntze.de> wrote:
> On 18.10.2016 10:59, Florian Westphal wrote:
> > Noel Kuntze <noel@familie-kuntze.de> wrote:
> >> > On 17.10.2016 22:27, Pablo Neira Ayuso wrote:
> > [..]
> > 
> >>> > > Allowing to match if the packet is protected/unprotected in a
> >>> > > true/false fashion.
> >> >
> >> > Well, I am active in the strongSwan community, so I believe I've seen all the
> >> > use cases there are and I've seen uses of every option, except "--next" and "--strict".
> >> > But I think there are probably use cases where they are used as well.
> > Ok.  I still believe that 'meta secpath' makes sense as a more simple
> > alternative, I think most users are just interested in 'was this packet
> > ipsec protected' rather than doing the full policy option dance.
> > 
> > Wrt. -m policy in nftables, we have two different cases:
> > 
> > 1. Check if a given daddr/saddr/spi etc is listed in *any* of the policies.
> > 2. Check if a given policy contains the exact spi/daddr/saddr.
> > 
> > As first rfc, what about the below syntax?
> > 
> > It adds one expression (to load a given policy element into a register)
> > and one statement (to search policies for a given number/address).
> > 
> > add rule filter input xfrm policy direction original 0 spi eq 1
> > 
> > would take input policies, grab first one (policy[0]), get its spi and
> > place it into a register (i.e., the 'eq 1' is not part of the xfrm
> > expression, only 'spi' is passed as key so we know what to look for).
> > 
> > Chaining these would allow the strict mode matching, but as you might
> > imagine it would be quite bloated to do exact matching :-/
> > 
> > Statement would look like this:
> > add rule filter input xfrm policy direction original spi 1
> > 
> > ... it would search all input policies for spi 1.
> > (i.e., 1 is passed as immediate value to the xfrm expression).
> > 
> > Thoughts?
> > Does anyone see a -m policy case that we could not cover with this?
> > [SNIP]
> 
> *if* we can have all the options and data we can get with -m policy
> (except --strict and --next, obviously) in nftables, then yes,
> I think all use cases would be covered.
> 
> > 1. Check if a given daddr/saddr/spi etc is listed in *any* of the policies.
> Any in the SPD or any that matched?

Policies in the secpath or xfrm dst entry.

http://lxr.free-electrons.com/source/net/netfilter/xt_policy.c#L55

Searching SPD doesn't seem useful to me unless we want to do xfrm
encap/decap from nft itself.

> > 2. Check if a given policy contains the exact spi/daddr/saddr.
> The exact SPI/daddr/saddr of what? Of a set policy match (whatever that might be)
> in nftables?

Same as above, except that it would check sp->xvec[X], for a fixed (user
defined) value of X, rather then searching all of sp->xvec[].

Or, putting it differently, in 1) user providides data (ip address,
spi, ...) and sp->xvec is the haystack we will search in.

I expect most users and use cases are covered by this, rather than 2).

For 2), user gives a policy index and tells us if they want saddr,
daddr, spi or reqid and we will then copy it to a register.

(Where another nft expression, e.g. cmp, can evaluate it)

So 2) is only needed when exact matching of the entire policies
is requested (--strict) mode.

If you think we can go without strict, then only 1) is needed.

The drawback is that 1) is very un-nftables like, but alas, I don't
think we can avoid it.
