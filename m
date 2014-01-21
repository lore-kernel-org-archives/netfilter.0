From: Patrick McHardy <kaber@trash.net>
Subject: Re: [ANNOUNCE]: Release of nftables 0.099
Date: Tue, 21 Jan 2014 13:27:13 +0000
Message-ID: <20140121132713.GA694@macbook.localnet>
References: <20140120131132.GA32427@macbook.localnet>
 <20140121115909.GR5409@kvmbude>
 <20140121121413.GC30577@macbook.localnet>
 <20140121122406.GS5409@kvmbude>
 <20140121123238.GB30955@macbook.localnet>
 <20140121124340.GT5409@kvmbude>
 <20140121124907.GA32383@macbook.localnet>
 <alpine.DEB.2.10.1401211401540.32183@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.10.1401211401540.32183@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Andreas Herz <andi@geekosphere.org>, netfilter@vger.kernel.org

On Tue, Jan 21, 2014 at 02:12:23PM +0100, Jozsef Kadlecsik wrote:
> On Tue, 21 Jan 2014, Patrick McHardy wrote:
> 
> > > > - use dynamic sized structures and add the timer at the end. Problem is that
> > > >   we're in some cases already using optional members at the end, so it would
> > > >   complicate the code a bit.
> > > 
> > > I see that all three possibilities are far from perfect :/
> > 
> > Well, all have some downsides, but I guess its something people will want
> > to have, otherwise Joszef wouldn't have added it, so we'll find a way.
> 
> Sets with timeout give an easy way to stop/slow down scanners/attackers 
> without the need (usually) of any maintenance when honeypots, detectors 
> add the entries.
> 
> ipset doesn't use struct timer_lists either, but implements 
> timeout as a data extension (similar to conntrack). The elements are fixed 
> sized, so it's simpler than the third case above for nftables.

Thanks, I'll have a closer look at this once I get to this.
