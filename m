From: Michael Gale <mgale@utilitran.com>
Subject: Re: Best Practices for iptables
Date: Fri, 5 Dec 2003 12:43:10 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031205124310.4d4417fc.mgale@utilitran.com>
References: <7C9884991ADAE0479C14F10C858BCDF5122EAF@alderaan.smgtec.com>
	<200312051809.15662.Antony@Soft-Solutions.co.uk>
	<1070652599.18670.152.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1070652599.18670.152.camel@tarkus>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


What about OUTPUT ?

You should block everything in every direction and then allow what you want per interface.

Michael.


On Fri, 05 Dec 2003 14:29:59 -0500
Ted Kaczmarek <tedkaz@optonline.net> wrote:

> On Fri, 2003-12-05 at 13:09, Antony Stone wrote:
> > On Friday 05 December 2003 5:40 pm, Daniel Chemko wrote:
> > 
> > > Best practices:
> > >
> > > WE ARE ALL HUMAN (I hope)
> > >
> > > If you are looking for the best case, you'd want to cover your own
> > > incompetence. Honestly, I work from this rule.
> > > I policy block everything that I haven't allowed explicitly, simply
> > > becausd if you try to build it in reverse, you're almost guaranteed to
> > > miss a lot of important blocks / etc..
> > 
> > I agree.
> > 
> > Think of it like this:
> > 
> > If you block everything, allow what you want, and forget something, then 
> > either you or someone you're providing services for will say "this isn't 
> > working - can you fix it please?" and you can correct the ruleset to allow 
> > the missing service.
> > 
> > On the other hand, if you allow everything, and block the things you don't 
> > want, then anything you forget about is more likely to be discovered by 
> > somebody else on the Internet scanning and probing their way round your IP 
> > address/es, and if they find something you forgot to block, chances are they 
> > won't tell you :)
> > 
> > Therefore correcting mistakes is a whole lot easier if you start from the 
> > "deny everything except these..." approach.
> > 
> > Antony.
> Any good firewall implementation should implicitly deny everything on
> the INPUT and FORWARD chains. If anyone tells you different they must
> work for Microsoft.
> 
> Ted
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

