From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: iptables analyzer - but slightly OT
Date: Wed, 29 Oct 2003 20:20:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310292020.08103.Alistair@nerdnet.ca>
References: <20031029212129.58201.qmail@web40207.mail.yahoo.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031029212129.58201.qmail@web40207.mail.yahoo.com>
Content-Disposition: inline
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
To: SBlaze <dagent.geo@yahoo.com>, Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>, netfilter@lists.netfilter.org

On October 29, 2003 04:21 pm, SBlaze wrote:
> --- Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com> wrote:
> > SBlaze wrote:
> > >Upon really thinking about it.... if I could just do a continuous
> > > iptables -vxnL   I would be happy. Perhaps some added counters for in
> > > which the the differences are shown from the last time it is last
> > > checked... say like a
> >
> > 5-10
	
	If you throw a -Z in there you clear the counters in iptables.
	you could accumulate the counters internally and map the differences.
	... You would have to do some fancy stuff with 
iptables-save/awk/sed/iptables-restore afterwards to put the counters back 
though.
	

> >
> > >second delay?
> > >
> > >Sort of a iptop heh.... an iptables in... top like display...
> >
> > I think this is a very cool idea that should be much easier to implement
> > than any kind of rule analyzer. Even better, you could calculate the
> > delta between -vxnL readings and drop it into a graph that updates at
> > user defined intervals, kinda like the bar graph model used in spectrum
> > analyzers. You could "see" traffic on each rule in real time and know
> > instantly if a particular rule was getting pounded. Maybe set "alarm"
> > limits based on % of historical traffic or a user defined level. Set a
> > longer (daily) interval and it would produce the kind of output Chris
> > Brenton could use with a bar for each of his reject rules. Perhaps an
> > option to normalize average traffic to a straight line so that abnormal
> > traffic would look like "static" with positive and negative deflection
> > from the x-axis. Ooohhh, my head is spinning . . .
> >
> > Jeff
>
> Again I concur with ya Jeff. The options I suggested would be great
> building blocks for...further statistical and analytical advacnment of the
> iptables/netfilter firewall. Let's face it, us geeks like numbers. I'm
> amazed that this has never come up before or hasn't already become a part
> of iptables. We want real time data... and be able to shape it however we
> want..be it console display, SQL databases, or any other means. We like
> options and access to data even if we don't use those options.
>
> However what we like and what we can get are sometimes very different. We
> have all these really great ideas. Getting developers to acknoledge that
> this is a nice feature and perhaps would be invalueable to some is not
> always easy. I believe you said you don't program Jeff and neither do I. It
> may be difficult to get deverlopers to take note of this..since they may
> not consider it "vital" to the iptables core.
>
> I will be the first to admit I really want this. I just hope what I want is
> shared throughout the community so that in versions soon... iptables will
> have easier  ways to analyze what it does. Jeff and I think the simplest
> point is -vxL...anyone else out there post up on this. If we get enough
> support we can go  about communicating to the developers a growing need.
> Otherwise Jeff and I just might be on our own.
>
> God Bless the OS Community and the makers of iptables/netfilter
> SBlaze
>
>
>
>
> =====
> In the absence of order there will be chaos.
>
> __________________________________
> Do you Yahoo!?
> Exclusive Video Premiere - Britney Spears
> http://launch.yahoo.com/promos/britneyspears/

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

