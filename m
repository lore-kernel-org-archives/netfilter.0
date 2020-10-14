From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: cannot use != with ct status
Date: Wed, 14 Oct 2020 16:11:06 +0200
Message-ID: <20201014141106.GA24037@salvia>
References: <CY4PR1001MB23116E94084D4CC5610C79C2E8050@CY4PR1001MB2311.namprd10.prod.outlook.com>
 <20201014100402.GA19556@salvia>
 <alpine.DEB.2.23.453.2010141221380.6472@localhost>
 <alpine.DEB.2.21.2010141148070.28273@piplus.local.jubileegroup.co.uk>
 <20201014125007.GA21520@salvia>
 <alpine.DEB.2.21.2010141405150.28273@piplus.local.jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010141405150.28273@piplus.local.jubileegroup.co.uk>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "G.W. Haywood" <ged@jubileegroup.co.uk>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, Oct 14, 2020 at 02:54:59PM +0100, G.W. Haywood wrote:
> Hi there,
> 
> On Wed, 14 Oct 2020, Pablo Neira Ayuso wrote:
> 
> > ... friends ... still prefer command line tools ...
> 
> :/
>
> > Please, if you have any proposal to express this in a more compact way
> > that makes sense into the expression language, we'll be glad to take
> > into consideration.
> 
> Thanks, first of all, for taking the trouble to help everyone here.
> 
> Looking at your command line example:
> 
> > nft> add x y (ct status and dnat) == dnat
> 
> When I analyze something like this, I find it quite impressive how much
> (I didn't know that) I read into logical expressions without thinking
> about it, and how badly it can go wrong when things aren't as I expect. :/
> 
> Three things about this one throw me into a flat spin.  I have no idea
> if any of this "makes sense into the expression language" as you put it
> but I hope at least I'll be able to explain the kinds of thing which I
> find confusing.
> 
> 1. "ct status"
> 
> Why is that not "ct.status" or "ct->status" or even "ct_status"?  I
> see the space after "ct", I think it's a delimiter, and fall over it.

That's right, you don't have to know what comes after ct.

So far there is the manpage only. Autocompletion should do the trick
in this case, so you just tab-tab and will get suggestions.

> 2. "and"
> 
> The word "and" says to me that you're combining two boolean values,
> not doing a bitwise mask operation.  I'd expect the bitwise operation
> to be represented by "&".  The word "and" could perhaps alternatively
> be written as "&&", but never "&".

In the rule-based language every statement (combination of matches and
targets is && basically).

> Do your sysadmin friends do Perl?  I'm not necessarily asking for
> the niceties of Perl precedence, but I really do have a lot invested
> in the meanings of logical operators in several very different
> languages.
> 
> 3. "== dnat"
> 
> This seems to be completely superfluous.  If you do a bitwise mask
> operation the result is either zero or not, that's the whole point.

Exactly: ct status and dnat == dnat is superfluous.

That's why you have:

        ct status dnat

as I said before, which is providing a shortcut to check that the dnat
status bit is set on.

For the negation, which still sounds like a very uncommon operation
(show me a use-case...), it's more verbose, yes.

> All you need to know is if the result is TRUE (non-zero) or FALSE.
> Granted that sometimes code *might* be written this way for comparing
> values with e.g. 'enum' types, but only for some clarification which
> is not AFAICT necessary in this context - and usually only in fairly
> dense code which might otherwise be tricky for a human to follow.  A
> relatively minor point is that predefined constants like "dnat" ought
> to be more readily distinguished from things like names of structure
> elements or whatever you call them like "status".  That's often done
> by using upper case or some prefix, but I don't know if that would be
> feasible here.  Is it somehow possible to 'alias' any of these names?
> 
> I hope this all makes sense to you in English, even if it does _not_
> make sense in the "expression language"; I hope it helps; I hope I'm
> not teaching my grandmother to suck anything; and I must apologize
> that I could not even attempt to express these thoughts in Spanish!

No worries.

I might not sound convincing enough: Command line tools and
expression-based languages have their own limitations. But they can be
easily extended in the shortrun by adding more extensions to assist
users in what they type, and to spew warnings when they express things
that make no sense and even recommend better ways to do it.

All that I say above will come sooner or later, it's just a matter of time.
