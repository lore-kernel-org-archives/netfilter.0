From: Phil Sutter <phil@nwl.cc>
Subject: Re: Unable to create a chain called "trace"
Date: Mon, 8 Feb 2021 17:47:50 +0100
Message-ID: <20210208164750.GM3158@orbyte.nwl.cc>
References: <CANf9dFMJN5ZsihtygUnEWB_9T=WLbEHrZY1a5mTqLgN7J39D5w@mail.gmail.com>
 <20210208154915.GF16570@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210208154915.GF16570@breakpoint.cc>
Sender: <n0-1@orbyte.nwl.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: Martin Gignac <martin.gignac@gmail.com>, netfilter@vger.kernel.org, netfilter-devel <netfilter-devel@vger.kernel.org>

Hi,

On Mon, Feb 08, 2021 at 04:49:15PM +0100, Florian Westphal wrote:
> Martin Gignac <martin.gignac@gmail.com> wrote:
> 
> [ cc devel ]
> 
> > Out of curiosity, is there a reason why calling a chain "trace"
> > results in an error?
> > 
> > This configuration:
> > 
> >   chain trace {
> >     type filter hook prerouting priority -301;
> >     ip daddr 24.153.88.9 ip protocol icmp meta nftrace set 1
> >   }
> > 
> > Results in the following error when I try loading the ruleset:
> > 
> >   /etc/firewall/rules.nft:40:9-13: Error: syntax error, unexpected
> > trace, expecting string
> >   chain trace {
> >         ^^^^^
> 
> grammar bug.
> 
> Pablo, Phil, others, can you remind me why we never did:

Because this would be followed up by:

| Subject: Unable to create a table called "trace"

Jokes aside:

I think Pablo didn't like the obvious consequence of having to quote
*all* string types which are user-defined in output. He played with
keeping the quotes as part of the name, so they are sent to kernel and
in listing they would automatically appear quoted. I don't quite
remember why this was problematic, though.

In general, shells eating the quotes is problematic and users may not be
aware of it. This includes scripts that mangle ruleset dumps by
accident, etc. (Not sure if it is really a problem as we quote some
strings already).

Using JSON, there are no such limits, BTW. I really wonder if there's
really no fix for bison parser to make it "context aware".

Cheers, Phil


