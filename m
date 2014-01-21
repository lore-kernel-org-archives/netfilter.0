From: Andreas Herz <andi@geekosphere.org>
Subject: Re: [ANNOUNCE]: Release of nftables 0.099
Date: Tue, 21 Jan 2014 13:43:40 +0100
Message-ID: <20140121124340.GT5409@kvmbude>
References: <20140120131132.GA32427@macbook.localnet>
 <20140121115909.GR5409@kvmbude>
 <20140121121413.GC30577@macbook.localnet>
 <20140121122406.GS5409@kvmbude>
 <20140121123238.GB30955@macbook.localnet>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140121123238.GB30955@macbook.localnet>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

On 21/01/14 at 12:32, Patrick McHardy wrote:
> On Tue, Jan 21, 2014 at 01:24:06PM +0100, Andreas Herz wrote:
> > On 21/01/14 at 12:14, Patrick McHardy wrote:
> > > On Tue, Jan 21, 2014 at 12:59:09PM +0100, Andreas Herz wrote:
> > > > First of all thanks for the release and ongoing work!
> > > > 
> > > > On 20/01/14 at 13:11, Patrick McHardy wrote:
> > > > > nftables features native support for sets and dictionaries of arbitrary
> > > > > types, support for many different protocols, meta data types, connection
> > > > > tracking, NAT, logging, atomic incremental and full ruleset updates,
> > > > > a netlink API with notification support, a format grammar, a compatiblity
> > > > > layer for iptables/ip6tables and more.
> > > > 
> > > > Does the native set support also include sets with timeout, like the
> > > > ipset maintained by Jozsef?
> > > > Or is there any plan to introduce this feature into nftables or just use
> > > > ipset and make it nftables compatible?
> > > > 
> > > > Since i'm using a patched version of ipset i would like to know the
> > > > future related to that feature :)
> > > 
> > > Currently we don't support timeouts and also don't support dynamically
> > > adding members to sets, though the last part would be pretty easy to
> > > implement.
> > 
> > Thanks for the info.
> > 
> > > Timeouts shouldn't be that hard as well, but I would need to think about
> > > this some more, I'd prefer not to add struct timer_lists everywhere.
> > 
> > That sounds like it rather won't come into nftables code. So what would
> > be the suggestion?
> 
> I'm not saying this, I merely want to check how do so this with as little
> waste as possible. Some possibilities are:

So it's better to just wait some time to see how it will go on :) That's
fine, too.

> - add a new set feature flag and only implement it for those types. Downside
>   is code duplication.
> 
> - somehow trigger removal from outside the set. Downside is memory waste
>   since we'd need to store the elements twice.
> 
> - use dynamic sized structures and add the timer at the end. Problem is that
>   we're in some cases already using optional members at the end, so it would
>   complicate the code a bit.

I see that all three possibilities are far from perfect :/

> > Or asking more specific, what would be the suggested way to add special
> > features needed for some scenarios?
> > For example, how would you port modules like portscan or others from
> > xtables-addons to nftables.
> > Integrate it or port it to be used as a addon.
> 
> The preferred way would be to indentify the required primitives and build
> it from a set of lower level expressions if possible. An alternative would
> be to use the compat expression or just add a native portscan expression.

Is there more information available for the compat expression or how top
add such a native expression (or at least planned, since it's quite
early and i can understand that there are other major issues first)?

> > > I'll intend to work on some set related stuff in the next time, I'll look
> > > into it then.
> > 
> > Thanks and no hurry, it just helps me to find out where i should focus
> > on my own development affected by the switch to nftables some day :)
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Andreas Herz
