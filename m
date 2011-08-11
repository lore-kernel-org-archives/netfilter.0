From: Fiedler Roman <Roman.Fiedler@ait.ac.at>
Subject: AW: Conntrack not matching properly - producing serious outages
Date: Thu, 11 Aug 2011 16:59:10 +0200
Message-ID: <9F69795E29C890408AC2DAF646C89BB379C2C50E3F@MAILBOX.arc.local>
References: <1313055975.3628.56.camel@denise.theartistscloset.com>
 <alpine.DEB.2.00.1108111207330.5476@blackhole.kfki.hu>
 <alpine.LNX.2.01.1108111554550.23274@frira.zrqbmnf.qr>
 <alpine.DEB.2.00.1108111635340.5476@blackhole.kfki.hu>
 <alpine.LNX.2.01.1108111637110.30703@frira.zrqbmnf.qr>
 <alpine.DEB.2.00.1108111642590.5476@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1108111642590.5476@blackhole.kfki.hu>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Jan Engelhardt <jengelh@medozas.de>
Cc: "John A. Sullivan III" <jsullivan@opensourcedevel.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> > >> >Those are, with high probabilty, late FIN packets: the belonging
> conntrack
> > >> >entry has already been deleted and thus conntrack cannot find the
> matching
> > >> >stream, therefore it sets as INVALID.
> > >>
> > >> Should not FIN retransmissions ideally be classified as ESTABLISHED (or
> > >> perhaps a new state) as long as the final ACK has not been seen?
> > >
> > >The final ACK might have already been seen. A full tcpdump could tell us
> > >what happened exactly.
> >
> > But perhaps NFCT should assume that it did not reach its destination
> > and should accept more FIN-ACKs until the MSL has elapsed.
> 
> The price is to waste the memory, by keeping every conntrack entry longer.
> 
> We should receive more reports that the current default values are not
> appropriate.

I observed the FIN-repeat problem also but thought, that increasing nf_conntrack_tcp_timeout_fin_wait fixed it. Since it was a dirty trial and error hack, I failed to find docu on that parameter and did not want to go into kernel for that old machine, this just might have been superstition.

Roman
