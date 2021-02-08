From: Florian Westphal <fw@strlen.de>
Subject: Re: Unable to create a chain called "trace"
Date: Mon, 8 Feb 2021 18:14:44 +0100
Message-ID: <20210208171444.GH16570@breakpoint.cc>
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
> In general, shells eating the quotes is problematic and users may not be
> aware of it. This includes scripts that mangle ruleset dumps by
> accident, etc. (Not sure if it is really a problem as we quote some
> strings already).
> 
> Using JSON, there are no such limits, BTW. I really wonder if there's
> really no fix for bison parser to make it "context aware".

Right.  We can probably make lots of keywords available for table/chain names
by only recognizing them while parsing rules, i.e. via 'start conditions'
in flex.  But I don't think there is anyone with the time to do the
needed scanner changes.
