From: Harry <simonsharry@gmail.com>
Subject: Re: Why aren't INPUT and FORWARD chains available to a
 locally-generated packet?
Date: Thu, 12 Aug 2021 07:07:06 +0530
Message-ID: <CACj4R3_JQqkCSefPg=f4LNuB0zjPXbU9ctZFSvUo7nnVG99pRw@mail.gmail.com>
References: <CACj4R39Zf=cK5p3-_YtDhvqqBMLd3Jyrk7uhcoc9pTm_PrUhtA@mail.gmail.com>
 <20210811142921.GW607@breakpoint.cc> <CACj4R39Whos6mVwo1CsvR7me61raq2udnxevjBYgMru3V__JGQ@mail.gmail.com>
 <20210811210919.GX607@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ZQkdiqiqiejBdbAdZZc3XeR2Je1EhepXfJJbossAo8=;
        b=r2X8xigFvaZ5+QSRJxiQnoyL4XCBiyaEbRdDQ3EuUyuRQ9/yCEeNRMC79xeRao2zE6
         drmP5lkY5NubiHCtuKeNLRZjcu7o8DnntWOEd8FRYpSwSJ9lOl0Avszg9evs/ZBfQOU2
         Gc9ZrlPmeyJelz0pxYfqVM6yQKL287fWj2cGph99wygIZ/3Q11pAluj6Uw/xuEICWQdV
         ihjBElgUU0H9boAjyc7KYg185G+GLCv2ghewN/pVXdeDMQPj/7fqNiF04T+Rmfy12yXn
         5IXFSw6w/45ZnTFSANofk0pSDYFEA8s/9yFTxj5xcZQ2VCRS74FrOVuEuPxRDH4jEOG7
         Z3xQ==
In-Reply-To: <20210811210919.GX607@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

On Thu, Aug 12, 2021 at 2:39 AM Florian Westphal <fw@strlen.de> wrote:
>
> Harry <simonsharry@gmail.com> wrote:
>
> > On Wed, Aug 11, 2021 at 7:59 PM Florian Westphal <fw@strlen.de> wrote:
>
> > I guess, my confusion is: Even if routing happens before OUTPUT, why
> > in the Netfilter Packet Flow diagram above there is no arrow going to
> > mangle:INPUT *also* apart from the raw:OUTPUT arrow already shown in
> > the diagram?
>
> Because packets never move directly from OUTPUT to INPUT.
> > packet is out on the wire!

In the current diagrams and explanations -- obviously yes!

I guess, the gist or the spirit of my original question was (and still
is): It would've been more consistent and logical, and /more 'elegant'
to have had Netfilter make the packet go through the same chains
(either INPUT or FORWARD) once the (very first) routing decision has
been taken on it. Consider, again: the locally-generated packet
following this routing decision can only go to two places: either to
the local host or to another host... which is conceptually the same as
the fate of the packet immediately after the routing decision
happening after PREROUTING.

In other words, what is different about these two:
    1. the routing decision taken after PREROUTING, and
    2. the routing decision taken right after a packet is generated locally?

In fact, a PREROUTING-like chain 'should have' existed for a
locally-generated packet *also*.

In fact, and even better, the locally-generated packet 'should have
been' treated exactly like the packet arriving from another host. I'm
not sure why it isn't.

Hope, I'm not annoying you/others with my conceptual question about
the *why's* behind the current design. In the current design, *of
course* I can see in various diagrams that the OUTPUT path is being
treated differently from the INPUT path.
