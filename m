From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE]: Release of nftables 0.099
Date: Tue, 21 Jan 2014 14:12:23 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1401211401540.32183@blackhole.kfki.hu>
References: <20140120131132.GA32427@macbook.localnet> <20140121115909.GR5409@kvmbude> <20140121121413.GC30577@macbook.localnet> <20140121122406.GS5409@kvmbude> <20140121123238.GB30955@macbook.localnet> <20140121124340.GT5409@kvmbude>
 <20140121124907.GA32383@macbook.localnet>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20140121124907.GA32383@macbook.localnet>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Andreas Herz <andi@geekosphere.org>, netfilter@vger.kernel.org

On Tue, 21 Jan 2014, Patrick McHardy wrote:

> On Tue, Jan 21, 2014 at 01:43:40PM +0100, Andreas Herz wrote:
> > On 21/01/14 at 12:32, Patrick McHardy wrote:
> > > > 
> > > > > Timeouts shouldn't be that hard as well, but I would need to think about
> > > > > this some more, I'd prefer not to add struct timer_lists everywhere.
> > > > 
> > > > That sounds like it rather won't come into nftables code. So what would
> > > > be the suggestion?
> > > 
> > > I'm not saying this, I merely want to check how do so this with as little
> > > waste as possible. Some possibilities are:
> > 
> > So it's better to just wait some time to see how it will go on :) That's
> > fine, too.
> 
> Yeah. At least the dynamic updates are quite likely to happen soon.
> 
> > > - add a new set feature flag and only implement it for those types. Downside
> > >   is code duplication.
> > > 
> > > - somehow trigger removal from outside the set. Downside is memory waste
> > >   since we'd need to store the elements twice.
> > > 
> > > - use dynamic sized structures and add the timer at the end. Problem is that
> > >   we're in some cases already using optional members at the end, so it would
> > >   complicate the code a bit.
> > 
> > I see that all three possibilities are far from perfect :/
> 
> Well, all have some downsides, but I guess its something people will want
> to have, otherwise Joszef wouldn't have added it, so we'll find a way.

Sets with timeout give an easy way to stop/slow down scanners/attackers 
without the need (usually) of any maintenance when honeypots, detectors 
add the entries.

ipset doesn't use struct timer_lists either, but implements 
timeout as a data extension (similar to conntrack). The elements are fixed 
sized, so it's simpler than the third case above for nftables.

Best regards,
Jozsef	
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
