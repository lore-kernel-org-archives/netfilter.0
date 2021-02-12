From: Florian Westphal <fw@strlen.de>
Subject: Re: Unable to create a chain called "trace"
Date: Fri, 12 Feb 2021 13:29:23 +0100
Message-ID: <20210212122923.GF2766@breakpoint.cc>
References: <CANf9dFMJN5ZsihtygUnEWB_9T=WLbEHrZY1a5mTqLgN7J39D5w@mail.gmail.com>
 <20210208154915.GF16570@breakpoint.cc>
 <20210208164750.GM3158@orbyte.nwl.cc>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210208164750.GM3158@orbyte.nwl.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil Sutter <phil@nwl.cc>, Florian Westphal <fw@strlen.de>, Martin Gignac <martin.gignac@gmail.com>, netfilter@vger.kernel.org, netfilter-devel <netfilter-devel@vger.kernel.org>

Phil Sutter <phil@nwl.cc> wrote:
> > grammar bug.
> > 
> > Pablo, Phil, others, can you remind me why we never did:
> 
> Because this would be followed up by:
> 
> | Subject: Unable to create a table called "trace"
> 
> Jokes aside:
> 
> I think Pablo didn't like the obvious consequence of having to quote
> *all* string types which are user-defined in output. He played with
> keeping the quotes as part of the name, so they are sent to kernel and
> in listing they would automatically appear quoted. I don't quite
> remember why this was problematic, though.
>
> In general, shells eating the quotes is problematic and users may not be
> aware of it. This includes scripts that mangle ruleset dumps by
> accident, etc. (Not sure if it is really a problem as we quote some
> strings already).

Ok, but what if we just allow use of quotes in input?
That would at least allow to use nft to delete/add to chains created
by other tools.
