From: Florian Westphal <fw@strlen.de>
Subject: Re: Unable to create a chain called "trace"
Date: Fri, 12 Feb 2021 13:20:07 +0100
Message-ID: <20210212122007.GE2766@breakpoint.cc>
References: <CANf9dFMJN5ZsihtygUnEWB_9T=WLbEHrZY1a5mTqLgN7J39D5w@mail.gmail.com>
 <20210208154915.GF16570@breakpoint.cc>
 <20210208164750.GM3158@orbyte.nwl.cc>
 <20210208171444.GH16570@breakpoint.cc>
 <20210209135625.GN3158@orbyte.nwl.cc>
 <20210212000507.GD2766@breakpoint.cc>
 <20210212114042.GZ3158@orbyte.nwl.cc>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210212114042.GZ3158@orbyte.nwl.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil Sutter <phil@nwl.cc>, Florian Westphal <fw@strlen.de>, Martin Gignac <martin.gignac@gmail.com>, netfilter@vger.kernel.org, netfilter-devel <netfilter-devel@vger.kernel.org>

Phil Sutter <phil@nwl.cc> wrote:
> I didn't find a better way to conditionally parse two following args as
> strings instead of just a single one. Basically I miss an explicit end
> condition from which to call BEGIN(0).

Yes, thats part of the problem.

> > Seems we need allow "{" for "*" and then count the {} nests so
> > we can pop off a scanner state stack once we make it back to the
> > same } level that we had at the last state switch.
> 
> What is the problem?

Detect when we need to exit the current start condition.

We may not even be able to do BEGIN(0) if we have multiple, nested
start conditionals. flex supports start condition stacks, but that
still leaves the exit/closure issue.

Example:

table chain {
 chain bla {  /* should start to recognize rules, but
		 we did not see 'rule' keyword */
	ip saddr { ... } /* can't exit rule start condition on } ... */
	ip daddr { ... }
 }  /* should disable rule keywords again */

 chain dynamic { /* so 'dynamic' is a string here ... */
 }
}

I don't see a solution, perhaps add dummy bison rule(s)
to explicitly signal closure of e.g. a rule context?
