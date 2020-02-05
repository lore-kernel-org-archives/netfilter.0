From: Florian Westphal <fw@strlen.de>
Subject: Re: [nftables v0.9.2] inet <> ip | ip6 family tables processing
 order?
Date: Wed, 5 Feb 2020 13:26:58 +0100
Message-ID: <20200205122658.GF26952@breakpoint.cc>
References: <dad1e392-ae29-a3bf-7411-d1dfe2095de2@gmx.net>
 <20200205112104.GA26952@breakpoint.cc>
 <5ac9783b-f841-a5a9-763d-9f794cf9216a@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5ac9783b-f841-a5a9-763d-9f794cf9216a@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> > > * which family table the packet is processed trough first/last - inet or ip
> > > | ip6?
> > None.  Ordering is by prio, not by family.
> > 
> > In ip vs ip6 case its even irrelevant because an ipv4 packet will never
> > travel any of the ip6 base chains, ever (and vice versa).
> 
> That was clear, it was meant inet <> ip or inet <> ip6

Priority, lower is evaluated first.

> > > * if the hook priority in the base chains of each family is the same but
> > > different policies being applied how would such conflict, inet vs. ip | ip6,
> > > resolve?
> > Implementation defined, right now its 'last added'.
> 
> Does that pertain to table handle value?

Only indirectly in the sense that you can guess which one is the newer.

> Does a lower handle value mean that the packet is first seen by that table?
> Noticed from the WIKI that rules can be positioned - does that work for
> table as well, e.g.

No.  Only base chains matter, these already have a priority.

> > But result is the same, if verdict is "drop", packet is discarded and
> > evaluation ends.
> > 
> > Just like with iptables: if you drop in mangle input, filter table won't
> > even get a chance to see the packet.
> > 
> > > As far as I comprehend jump | goto works with chains in the same family
> > > table but it is not possible to jump | goto from the inet table to ip | ip6
> > > or vice versa, or is it?
> > Its not, each table is a distinct entity.
> 
> The question was with same chain/hook priority in inet versus ip | ipv6 but
> a different verdict and how would such conclict resolve, e.g.
> 
> * inet chain input prio 0  policy drop
> * ip chain input prio 0 policy drop
> * ip6 chain input prio 0 policy continue
> 
> ?

I tried to answer this above.

> * inet chain input prio 0  policy drop
> * ip chain input prio 0 policy drop
> * ip6 chain input prio 0 policy continue

If its an ipv4 packet, its dropped.  Ordering possibilities:

> * inet chain input prio 0  policy drop # drop is here
> * ip chain input prio 0 policy drop

or:

> * ip chain input prio 0 policy drop # drop is here
> * inet chain input prio 0  policy drop

If its ipv6, possibilities are:

> * inet chain input prio 0  policy drop  # drop is here
> * ip6 chain input prio 0 policy continue

or:

> * ip6 chain input prio 0 policy continue
> * inet chain input prio 0  policy drop  # drop is here

so in all cases the packet is dropped.
In the last case, ip6 input chain is still evaluated, but
nothing can override the drop in the inet chain.
