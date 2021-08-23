From: Mathew Heard <mat999@gmail.com>
Subject: Re: conntrack: confirm existing but do not create new entries
Date: Mon, 23 Aug 2021 23:57:40 +1000
Message-ID: <CAE5sJtTLMVOtDyh7d8caTcjFrAcFM6BQj9=fFE76mg9M6-BZhQ@mail.gmail.com>
References: <1e7f26ea-426f-0c32-829e-123cdd6c9f68@average.org>
 <20210818161340.GR607@breakpoint.cc> <2ff25113-05c9-bf14-30bd-09bc21ed5a05@average.org>
 <20210819090905.GT607@breakpoint.cc> <0c0ec75c-8862-bb7e-65d0-a7e7101c4b3f@average.org>
 <20210819141802.GU607@breakpoint.cc> <ed802f99-a946-8f9c-2918-dbf989617d3f@average.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=bUZ3ph8IGY/X57sstA3S3pIUEWwciJi2NXfwWJzLDHM=;
        b=Da/SsdRvmi4EQ21F3RV5Q0R05gFTGbff4GkXY/zDQUoNMAHP7LUp9oROlifqPsI/Hn
         lByv8+kQVGozRxMJxAE3WsujdOJ+wLke9SKchbZ7zWteHY+DpH+h+NSsKBZGjTBN+0GF
         ZG+3OyCpZJ9IwGyaw618xNJHPmrTMBVpuQrb2sdjpXGMfmAp+a5g6MDFMb44P2T2sKYU
         9ZUKDu736nS5bel+xZwXFRbLfRVIUU+OBRzVJYmTPHxptpNmSDcPpojGkcUfaJDQNdF3
         yJ5K1V+6cSlAQIXIlnpxe0o72wHGOq/RHLgIjqoU1jW9XBJfSLauWGmtZ9NcDfbV0WPS
         1YQQ==
In-Reply-To: <ed802f99-a946-8f9c-2918-dbf989617d3f@average.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Perhaps see  https://github.com/X4BNet/xt_NOCREATE



On Mon, 23 Aug 2021 at 23:31, Eugene Crosser <crosser@average.org> wrote:
>
> On 19/08/2021 16:18, Florian Westphal wrote:
> > Eugene Crosser <crosser@average.org> wrote:
> ...
> >>>> Yet I am surprised that a flag meaning "conntrack, but only to confirm exiting
> >>>> entries" does not exist. Would not it be useful to have?..
> >>>
> >>> How would that even work?
> >>>
> >>> To know if a given packet is a reply there needs to be a record in the
> >>> state table.
> >>
> >> I was guessing this piece of code
> >>
> >> =====
> >>         /* look for tuple match */
> >>         zone = nf_ct_zone_tmpl(tmpl, skb, &tmp);
> >>         hash = hash_conntrack_raw(&tuple, state->net);
> >>         h = __nf_conntrack_find_get(state->net, zone, &tuple, hash);
> >>         if (!h) {
> >>                 h = init_conntrack(state->net, tmpl, &tuple,
> >>                                    skb, dataoff, hash);
> >>                 if (!h)
> >>                         return 0;
> >>                 if (IS_ERR(h))
> >>                         return PTR_ERR(h);
> >>         }
> >>         ct = nf_ct_tuplehash_to_ctrack(h);
> >> =====
> >>
> >> could _not_ call `init_conntrack()` depending on the (hypothetical) "track only
> >> when entry exists" flag, and return early otherwise?.. But my understanding of
> >> the workings of netfilter is really poor, it is very likely that I am missing
> >> something crucial.
> >
> > I don't see how it can work, something does need to create entries, else
> > __nf_conntrack_find_get() never finds an entry, so init_conntrack() is
> > never called, so table is always empty.
>
> I was (probably incorrectly?) assuming that __nf_conntrack_find_get() looks up
> in the "main" table, so there will be entries created by previous packets that
> went "in the opposite direction" and did not have the "track only when entry
> exists" flag. In my case, packets that have traversed the OUTPUT chain.
>
> By the way, another way to implement such feature would be a settable flag in
> the skb "do not commit to the main conntrack table"?..
>
> I need to check how "fib daddr type local" will work in the presence of VRFs
> that may be forwarding the same addresses that in the default VRF are going to
> INPUT. Basing decision on the input interface is kind of undesirable for us,
> because there are so many, and some may be named differently on different hardware.
>
> >> While I am here, may I ask: is there a "correct" way to re-enable conntrack that
> >> was disabled in someone else's chain that happened to run before mine?
> >
> > You mean, 'cancelling' earlier NOTRACK rule? I'm not aware of such a
> > feature.
>
> That's what I thought. That means that different entities that need to control
> `notrack` cannot pile up "exceptions on top of exceptions" and have to cooperate
> very stringently. If I want to have a chain that ends with unconditional
> catch-all "notrack", then everyone who needs to enable tracking for a specific
> class of traffic must have rules in the same chain. But we can work with that.
>
> Eugene
>
