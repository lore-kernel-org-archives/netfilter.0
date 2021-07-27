From: Florian Westphal <fw@strlen.de>
Subject: Re: [nft] Regarding `tcp flags` (and a potential bug)
Date: Tue, 27 Jul 2021 17:10:18 +0200
Message-ID: <20210727151018.GA15121@breakpoint.cc>
References: <CAGnHSEkt4xLAO_T9KNw2xGjjvC4y=E0LjX-iAACUktuCy0J7gw@mail.gmail.com>
 <CAGnHSEncHuO2BduzGx1L9eVtAozdGb-XabQyrS7S+CO2swa1dw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGnHSEncHuO2BduzGx1L9eVtAozdGb-XabQyrS7S+CO2swa1dw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Yan <tom.ty89@gmail.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Tom Yan <tom.ty89@gmail.com> wrote:
> Just noticed something that is even worse:
> 
> # nft add rule meh tcp_flags 'tcp flags { fin, rst, ack }'
> # nft add rule meh tcp_flags 'tcp flags == { fin, rst, ack }'

These two are identical.

> # nft add rule meh tcp_flags 'tcp flags & ( fin | rst | ack ) != 0'

This matches if any one of fin/rst/ack is set.

> # nft add rule meh tcp_flags 'tcp flags & ( fin | rst | ack ) == 0'

This matches if fin/rst/ack are all 0 (not set).

> # nft list table meh
> table ip meh {
>     chain tcp_flags {
>         tcp flags { fin, rst, ack }
>         tcp flags { fin, rst, ack }
>         tcp flags fin,rst,ack
>         tcp flags ! fin,rst,ack
>     }
> }

Can you elaborate?

This looks correct to me.

> > # nft add rule meh tcp_flags 'tcp flags & (fin | syn | rst | ack) ! syn'

Its unfortunate nft accepts this.  The trailing ! syn is nonsensical.

This is equal to tcp flags ! syn.

> > # nft add rule meh tcp_flags 'tcp flags & (fin | syn | rst | ack) == syn'
> > # nft add rule meh tcp_flags 'tcp flags & (fin | syn | rst | ack) != syn'
> > # nft list table meh
> > table ip meh {
> >     chain tcp_flags {
> >         tcp flags & (fin | syn | rst | ack) syn
> >         tcp flags & (fin | syn | rst | ack) ! syn
> >         tcp flags syn / fin,syn,rst,ack
> >         tcp flags syn / fin,syn,rst,ack
> >     }
> > }
> >
> > I don't suppose the mask in the first two rules would matter. And with
> > `tcp flags syn / fin,syn,rst,ack`, I assume it would be false when
> > "syn is cleared and/or any/all of fin/rst/ack is/are set"?
> >
> > Also, as you can see, for the last two rules, `nft` interpreted them
> > as an identical rule, which I assume to be a bug. These does NOT seem
> > to workaround it either:
> >
> > # nft flush chain meh tcp_flags
> > # nft add rule meh tcp_flags 'tcp flags == syn / fin,syn,rst,ack'
> > # nft add rule meh tcp_flags 'tcp flags != syn / fin,syn,rst,ack'
> > # nft list table meh
> > table ip meh {
> >     chain tcp_flags {
> >         tcp flags syn / fin,syn,rst,ack
> >         tcp flags syn / fin,syn,rst,ack

Seems the reverse translation is broken, the negation is lost.
The rule is added correctly (i.e., flags == syn vs. != syn adds
different rules, see nft --debug=netlink add ..
