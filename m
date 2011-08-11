From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Conntrack not matching properly - producing serious outages
Date: Thu, 11 Aug 2011 16:48:29 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1108111642590.5476@blackhole.kfki.hu>
References: <1313055975.3628.56.camel@denise.theartistscloset.com> <alpine.DEB.2.00.1108111207330.5476@blackhole.kfki.hu> <alpine.LNX.2.01.1108111554550.23274@frira.zrqbmnf.qr> <alpine.DEB.2.00.1108111635340.5476@blackhole.kfki.hu>
 <alpine.LNX.2.01.1108111637110.30703@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1108111637110.30703@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "John A. Sullivan III" <jsullivan@opensourcedevel.com>, netfilter@vger.kernel.org

On Thu, 11 Aug 2011, Jan Engelhardt wrote:

> On Thursday 2011-08-11 16:36, Jozsef Kadlecsik wrote:
> 
> >On Thu, 11 Aug 2011, Jan Engelhardt wrote:
> >
> >> On Thursday 2011-08-11 12:12, Jozsef Kadlecsik wrote:
> >> >> Packets are
> >> >> being matched as INVALID when we would expect them to be ESTABLISHED.
> >> >> We are running on kernel 2.6.30.5 on X86_64 with CentOS 5.4 and
> >> >> iptables-1.3.5-5.3.el5_4.1.
> >> >> [...]
> >> >> Aug 11 03:29:19 fw01 kernel: FORWARD INVALID IN=bond1 OUT=bond4
> >> >> SRC=172.x.y.73 DST=172.x.z.34 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=32940
> >> >> DF PROTO=TCP SPT=8080 DPT=52999 WINDOW=34 RES=0x00 ACK FIN URGP=0
> >> >
> >> >Those are, with high probabilty, late FIN packets: the belonging conntrack 
> >> >entry has already been deleted and thus conntrack cannot find the matching 
> >> >stream, therefore it sets as INVALID.
> >> 
> >> Should not FIN retransmissions ideally be classified as ESTABLISHED (or
> >> perhaps a new state) as long as the final ACK has not been seen?
> >
> >The final ACK might have already been seen. A full tcpdump could tell us 
> >what happened exactly.
> 
> But perhaps NFCT should assume that it did not reach its destination
> and should accept more FIN-ACKs until the MSL has elapsed.

The price is to waste the memory, by keeping every conntrack entry longer.

We should receive more reports that the current default values are not 
appropriate.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
