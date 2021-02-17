From: Phil Sutter <phil@nwl.cc>
Subject: Re: Unable to create a chain called "trace"
Date: Wed, 17 Feb 2021 20:59:37 +0100
Message-ID: <20210217195937.GA22016@orbyte.nwl.cc>
References: <CANf9dFMJN5ZsihtygUnEWB_9T=WLbEHrZY1a5mTqLgN7J39D5w@mail.gmail.com>
 <20210208154915.GF16570@breakpoint.cc>
 <20210208164750.GM3158@orbyte.nwl.cc>
 <20210208171444.GH16570@breakpoint.cc>
 <20210209135625.GN3158@orbyte.nwl.cc>
 <20210212000507.GD2766@breakpoint.cc>
 <20210212114042.GZ3158@orbyte.nwl.cc>
 <20210212122007.GE2766@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210212122007.GE2766@breakpoint.cc>
Sender: <n0-1@orbyte.nwl.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: Martin Gignac <martin.gignac@gmail.com>, netfilter@vger.kernel.org, netfilter-devel <netfilter-devel@vger.kernel.org>

Hi,

On Fri, Feb 12, 2021 at 01:20:07PM +0100, Florian Westphal wrote:
> Phil Sutter <phil@nwl.cc> wrote:
> > I didn't find a better way to conditionally parse two following args as
> > strings instead of just a single one. Basically I miss an explicit end
> > condition from which to call BEGIN(0).
> 
> Yes, thats part of the problem.
> 
> > > Seems we need allow "{" for "*" and then count the {} nests so
> > > we can pop off a scanner state stack once we make it back to the
> > > same } level that we had at the last state switch.
> > 
> > What is the problem?
> 
> Detect when we need to exit the current start condition.

I explored my approach further but ended up in an ugly situation due to
the use of 'set' keyword in rules: My code is not context-aware, so upon
recognizing 'set' keyword it switches to spec-condition. I can't simply
detect preceding command-keywords due to them being implicit in nested
notation.

> We may not even be able to do BEGIN(0) if we have multiple, nested
> start conditionals. flex supports start condition stacks, but that
> still leaves the exit/closure issue.
> 
> Example:
> 
> table chain {
>  chain bla {  /* should start to recognize rules, but
> 		 we did not see 'rule' keyword */

My code worked with this after enabling detection of '{' in all
conditions and making it call BEGIN(0) (regardless of nspec value).

> 	ip saddr { ... } /* can't exit rule start condition on } ... */

Maybe we could track nesting block depth in a simple counter?

> 	ip daddr { ... }
>  }  /* should disable rule keywords again */
> 
>  chain dynamic { /* so 'dynamic' is a string here ... */
>  }
> }
> 
> I don't see a solution, perhaps add dummy bison rule(s)
> to explicitly signal closure of e.g. a rule context?

We can't influence start conditions from within bison (if that's what
you had in mind). All we can do is try make flex aware of the current
input context. For instance, detect 'table' followed by '{' to open
"table definition context" and start tracking braces to detect its end.
Though after all I think your assessment of all this being "fragile" is
appropriate. :/

Cheers, Phil
