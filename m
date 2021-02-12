From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Unable to create a chain called "trace"
Date: Fri, 12 Feb 2021 18:54:23 +0100
Message-ID: <20210212175423.GA3033@salvia>
References: <CANf9dFMJN5ZsihtygUnEWB_9T=WLbEHrZY1a5mTqLgN7J39D5w@mail.gmail.com>
 <20210208154915.GF16570@breakpoint.cc>
 <20210208164750.GM3158@orbyte.nwl.cc>
 <20210208171444.GH16570@breakpoint.cc>
 <20210209135625.GN3158@orbyte.nwl.cc>
 <20210212000507.GD2766@breakpoint.cc>
 <20210212114042.GZ3158@orbyte.nwl.cc>
 <20210212122007.GE2766@breakpoint.cc>
 <20210212170921.GA1119@salvia>
 <20210212173201.GD3158@orbyte.nwl.cc>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210212173201.GD3158@orbyte.nwl.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil Sutter <phil@nwl.cc>, Florian Westphal <fw@strlen.de>, Martin Gignac <martin.gignac@gmail.com>, netfilter@vger.kernel.org, netfilter-devel <netfilter-devel@vger.kernel.org>

On Fri, Feb 12, 2021 at 06:32:01PM +0100, Phil Sutter wrote:
> Hi,
> 
> On Fri, Feb 12, 2021 at 06:09:21PM +0100, Pablo Neira Ayuso wrote:
> > On Fri, Feb 12, 2021 at 01:20:07PM +0100, Florian Westphal wrote:
> > > Phil Sutter <phil@nwl.cc> wrote:
> > > > I didn't find a better way to conditionally parse two following args as
> > > > strings instead of just a single one. Basically I miss an explicit end
> > > > condition from which to call BEGIN(0).
> > > 
> > > Yes, thats part of the problem.
> > > 
> > > > > Seems we need allow "{" for "*" and then count the {} nests so
> > > > > we can pop off a scanner state stack once we make it back to the
> > > > > same } level that we had at the last state switch.
> > > > 
> > > > What is the problem?
> > > 
> > > Detect when we need to exit the current start condition.
> > > 
> > > We may not even be able to do BEGIN(0) if we have multiple, nested
> > > start conditionals. flex supports start condition stacks, but that
> > > still leaves the exit/closure issue.
> > > 
> > > Example:
> > > 
> > > table chain {
> > >  chain bla {  /* should start to recognize rules, but
> > > 		 we did not see 'rule' keyword */
> > > 	ip saddr { ... } /* can't exit rule start condition on } ... */
> > > 	ip daddr { ... }
> > >  }  /* should disable rule keywords again */
> > > 
> > >  chain dynamic { /* so 'dynamic' is a string here ... */
> > >  }
> > > }
> > > 
> > > I don't see a solution, perhaps add dummy bison rule(s)
> > > to explicitly signal closure of e.g. a rule context?
> > 
> > It should also be possible to add an explicit rule to allow for
> > keywords to be used as table/chain/... identifier.
> 
> Which means we have to collect and maintain a list of all known keywords
> which is at least error-prone.

You mean, someone might forget to update the list of keywords.

That's right.

> > It should be possible to add a test script in the infrastructure to
> > create table/chain/... using keywords, to make sure this does not
> > break.
> 
> You mean something that auto-generates the list of keywords to try?

Autogenerating this list would be good, I didn't good that far in
exploring this.

Or just making a shell script that extracts the %token lines to try to
create table with a keyword as a name.

The shell script would just have a "list of unallowed keyword" to
filter out the %tokens that are not allowed, for those tokens that are
really reserved keywords.

> > It's not nice, but it's simple and we don't mingle with flex.
> > 
> > I have attached an example patchset (see patch 2/2), it's incomplete.
> > I could also have a look at adding such regression test.
> 
> Ah, I tried that path but always ended with shift/reduce conflicts. They
> appear when replacing DYNAMIC with e.g. TABLE, CHAIN or RULE in your
> patch.

Probably we have to set some explicit restrictions, like table, chain,
rule, set, map and flowtable are reserved keywords. For example, not
allowing to call a table '>'. That was not possible since the
beginning anyway.

The concern is to add a new token and break backward as it happened
with 'dynamic' as Florian reported I think.

> Of course we may declare that none of those is a sane name for a
> table, but I wonder if we'll discover less obvious cases later.

BTW, Florian mentioned your patch makes unhappy the tests infra?
What's the issue?
