From: Martin <mylists@itcom.com.ar>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Tue, 20 May 2008 10:05:03 -0300
Message-ID: <1211288704.23968.4406.camel@kr0sty.1.com.ar>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar>
	 <482DA36B.6070801@plouf.fr.eu.org>
	 <alpine.LNX.1.10.0805161714090.15590@fbirervta.pbzchgretzou.qr>
	 <482DAC09.90304@plouf.fr.eu.org>
	 <1210954048.23968.2777.camel@kr0sty.1.com.ar>
	 <alpine.LNX.1.10.0805171329520.15590@fbirervta.pbzchgretzou.qr>
	 <1211202805.23968.3867.camel@kr0sty.1.com.ar>
	 <alpine.LNX.1.10.0805191942020.15136@fbirervta.pbzchgretzou.qr>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0805191942020.15136@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org


On Mon, 2008-05-19 at 19:42 +0200, Jan Engelhardt wrote:
> On Monday 2008-05-19 15:13, Martin wrote:
> >> On Friday 2008-05-16 18:07, Martin wrote:
> >> >
> >> >So I've just one question at least. If there aren't nf_conntrack_=
*
> >> >modules or aliases, does the amanda, ftp, quake3, etc. modules wo=
rk just
> >> >loading nf_conntrack? If so, I think I'm ready to go with this ke=
rnel
> >> >history.
> >>=20
> >> No, nf_conntrack_ftp is required for FTP (and similarly for the
> >> others).
> >
> >But there isn't nf_conntrack_ftp.ko module. May be it have been rena=
med
> >to /lib/modules/2.6.25/kernel/net/ipv4/netfilter/nf_nat_ftp.ko ?
>=20
> 19:34 yaguchi:~/pub/Documents > modinfo nf_conntrack_ftp
> filename:
> /lib/modules/2.6.23.17-ccj64-rt/kernel/net/netfilter/nf_conntrack_ftp=
=2Eko
> alias:          ip_conntrack_ftp
> description:    ftp connection tracking helper
> author:         Rusty Russell <rusty@rustcorp.com.au>
> license:        GPL
> srcversion:     5719E7793C1052C8385FF11
> depends:        nf_conntrack
> vermagic:       2.6.23.17-ccj64-rt SMP preempt mod_unload 586 REGPARM=
=20
> parm:           ports:array of ushort
> parm:           loose:bool
>=20
> When I say nf_conntrack_ftp, I meant nf_conntrack_ftp.


Pascal explained me that. Sorry, my fault. I made
nf_conntrack_(ftp/amanda) build-in kernel, not as a module, so there
isn't any *.ko with that name to modprobe.

Thanks for your advice, I'll search for more docs about difference
module--build-in, just to see if I can change some parameters while
modprobe or so.


Cheers


Mart=C3=ADn

