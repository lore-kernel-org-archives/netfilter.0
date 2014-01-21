From: Patrick McHardy <kaber@trash.net>
Subject: Re: [ANNOUNCE]: Release of nftables 0.099
Date: Tue, 21 Jan 2014 12:49:07 +0000
Message-ID: <20140121124907.GA32383@macbook.localnet>
References: <20140120131132.GA32427@macbook.localnet>
 <20140121115909.GR5409@kvmbude>
 <20140121121413.GC30577@macbook.localnet>
 <20140121122406.GS5409@kvmbude>
 <20140121123238.GB30955@macbook.localnet>
 <20140121124340.GT5409@kvmbude>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140121124340.GT5409@kvmbude>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Herz <andi@geekosphere.org>
Cc: netfilter@vger.kernel.org

On Tue, Jan 21, 2014 at 01:43:40PM +0100, Andreas Herz wrote:
> On 21/01/14 at 12:32, Patrick McHardy wrote:
> > > 
> > > > Timeouts shouldn't be that hard as well, but I would need to think about
> > > > this some more, I'd prefer not to add struct timer_lists everywhere.
> > > 
> > > That sounds like it rather won't come into nftables code. So what would
> > > be the suggestion?
> > 
> > I'm not saying this, I merely want to check how do so this with as little
> > waste as possible. Some possibilities are:
> 
> So it's better to just wait some time to see how it will go on :) That's
> fine, too.

Yeah. At least the dynamic updates are quite likely to happen soon.

> > - add a new set feature flag and only implement it for those types. Downside
> >   is code duplication.
> > 
> > - somehow trigger removal from outside the set. Downside is memory waste
> >   since we'd need to store the elements twice.
> > 
> > - use dynamic sized structures and add the timer at the end. Problem is that
> >   we're in some cases already using optional members at the end, so it would
> >   complicate the code a bit.
> 
> I see that all three possibilities are far from perfect :/

Well, all have some downsides, but I guess its something people will want
to have, otherwise Joszef wouldn't have added it, so we'll find a way.

> > > Or asking more specific, what would be the suggested way to add special
> > > features needed for some scenarios?
> > > For example, how would you port modules like portscan or others from
> > > xtables-addons to nftables.
> > > Integrate it or port it to be used as a addon.
> > 
> > The preferred way would be to indentify the required primitives and build
> > it from a set of lower level expressions if possible. An alternative would
> > be to use the compat expression or just add a native portscan expression.
> 
> Is there more information available for the compat expression or how top
> add such a native expression (or at least planned, since it's quite
> early and i can understand that there are other major issues first)?

The compat expression simply uses x_tables modules. We don't support it
in nftables userspace, but you should find enough information in the
iptables-nftables compatibility layer.

For native expressions, just have a look at any of the existing ones.
