From: Florian Westphal <fw@strlen.de>
Subject: Re: Unable to create a chain called "trace"
Date: Wed, 17 Feb 2021 21:16:18 +0100
Message-ID: <20210217201618.GI2766@breakpoint.cc>
References: <CANf9dFMJN5ZsihtygUnEWB_9T=WLbEHrZY1a5mTqLgN7J39D5w@mail.gmail.com>
 <20210208154915.GF16570@breakpoint.cc>
 <20210208164750.GM3158@orbyte.nwl.cc>
 <20210208171444.GH16570@breakpoint.cc>
 <20210209135625.GN3158@orbyte.nwl.cc>
 <20210212000507.GD2766@breakpoint.cc>
 <20210212114042.GZ3158@orbyte.nwl.cc>
 <20210212122007.GE2766@breakpoint.cc>
 <20210217195937.GA22016@orbyte.nwl.cc>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210217195937.GA22016@orbyte.nwl.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil Sutter <phil@nwl.cc>, Florian Westphal <fw@strlen.de>, Martin Gignac <martin.gignac@gmail.com>, netfilter@vger.kernel.org, netfilter-devel <netfilter-devel@vger.kernel.org>

Phil Sutter <phil@nwl.cc> wrote:
> > I don't see a solution, perhaps add dummy bison rule(s)
> > to explicitly signal closure of e.g. a rule context?
> 
> We can't influence start conditions from within bison (if that's what
> you had in mind).

Why not?  in scanner.l:

void scanner_pop_start_cond(void *scanner)
{
        yy_pop_state(scanner);
}

And then call it from bison as 'scanner_pop_start_cond(nft->scanner)'.

Needs %stack in scanner.l so yy_pop_state() is defined.

bison has more clue as to when a expression/rule/set block etc
has finished parsing than the scanner.

Not sure tracking { } nesting depth is enough with a pure scanner.l
approach.
