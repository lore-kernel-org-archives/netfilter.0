From: Florian Westphal <fw@strlen.de>
Subject: Re: conntrack: confirm existing but do not create new entries
Date: Thu, 19 Aug 2021 16:18:02 +0200
Message-ID: <20210819141802.GU607@breakpoint.cc>
References: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
 <20210818161340.GR607@breakpoint.cc>
 <2ff25113-05c9-bf14-30bd-09bc21ed5a05@average.org>
 <20210819090905.GT607@breakpoint.cc>
 <0c0ec75c-8862-bb7e-65d0-a7e7101c4b3f@average.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0c0ec75c-8862-bb7e-65d0-a7e7101c4b3f@average.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eugene Crosser <crosser@average.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Eugene Crosser <crosser@average.org> wrote:
> On 19/08/2021 11:09, Florian Westphal wrote:
> > You might have to clarify what you are looking for.
> 
> Yes, I oversimplified our case and omitted the part that turned to be important.
> This is a host for multiple VMs. We want VM traffic to go through unfiltered and
> _untracked_ because tracking _this_ traffic overflows the table.
> 
> Traffic to the host itself (management and configuration) needs to be filtered,
> and to do it effectively we need stateful firewall, hence it should be tracked.
> Flooding of the table by traffic that ends up in the INPUT path is not really a
> concern, and we would drop bad traffic anyway, preventing ct entries from being
> committed (as far as I understood your explanation).
> 
> So the problem, as far as I understand it, is that decision to track or not
> track has to be taken _before_ the decision between FORWARD and INPUT. We want
> FORWARD to go (ahem) forward without modifying the table, and INPUT to be
> processed against the table to be able to decide if it belongs to an existing
> outgoing connection.

Yes, conntrack hooks at prerouting and output, so by the the input or
forward are reached the conntrack lookup was already done.

Hence, NOTRACK has to be decided before conntrack lookup/create.

> >> Yet I am surprised that a flag meaning "conntrack, but only to confirm exiting
> >> entries" does not exist. Would not it be useful to have?..
> > 
> > How would that even work?
> >
> > To know if a given packet is a reply there needs to be a record in the
> > state table.
> 
> I was guessing this piece of code
> 
> =====
>         /* look for tuple match */
>         zone = nf_ct_zone_tmpl(tmpl, skb, &tmp);
>         hash = hash_conntrack_raw(&tuple, state->net);
>         h = __nf_conntrack_find_get(state->net, zone, &tuple, hash);
>         if (!h) {
>                 h = init_conntrack(state->net, tmpl, &tuple,
>                                    skb, dataoff, hash);
>                 if (!h)
>                         return 0;
>                 if (IS_ERR(h))
>                         return PTR_ERR(h);
>         }
>         ct = nf_ct_tuplehash_to_ctrack(h);
> =====
> 
> could _not_ call `init_conntrack()` depending on the (hypothetical) "track only
> when entry exists" flag, and return early otherwise?.. But my understanding of
> the workings of netfilter is really poor, it is very likely that I am missing
> something crucial.

I don't see how it can work, something does need to create entries, else
__nf_conntrack_find_get() never finds an entry, so init_conntrack() is
never called, so table is always empty.

> While I am here, may I ask: is there a "correct" way to re-enable conntrack that
> was disabled in someone else's chain that happened to run before mine?

You mean, 'cancelling' earlier NOTRACK rule? I'm not aware of such a
feature.
