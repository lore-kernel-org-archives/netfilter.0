From: Martin <mylists@itcom.com.ar>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Mon, 19 May 2008 10:20:45 -0300
Message-ID: <1211203246.23968.3880.camel@kr0sty.1.com.ar>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar>
	 <482DA36B.6070801@plouf.fr.eu.org>
	 <alpine.LNX.1.10.0805161714090.15590@fbirervta.pbzchgretzou.qr>
	 <482DAC09.90304@plouf.fr.eu.org>
	 <1210954048.23968.2777.camel@kr0sty.1.com.ar>
	 <482EC332.9000400@plouf.fr.eu.org>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <482EC332.9000400@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


On Sat, 2008-05-17 at 13:36 +0200, Pascal Hambourg wrote:
> Martin a =C3=A9crit :
> >=20
> > So I've just one question at least. If there aren't nf_conntrack_*
> > modules or aliases, does the amanda, ftp, quake3, etc. modules work=
 just
> > loading nf_conntrack?
>=20
> I don't understand. What "amanda, ftp, quake3, etc. modules" are you=20
> talking about if there "aren't nf_conntrack_* modules" ?


On ip_conntrack modules, I use to load some modules that open a second
port (ftp, quake3, and so) and make it able to mark packets as related.

Those modules were ip_conntrack_ftp, ip_conntrack_quake3 and
ip_conntrack_amanda. So, now netfilter packages and modules are in
mainstream, some names and modules have changed, and I'm searching for
the replace of those modules under the new nomenclature (nf_conntrack).

My problem comes as there are not a nf_conntrack_(ftp/quake3/amanda),
but there are nf_nat_(ftp/amanda).ko files, and wonder to know if those
file are the replace of the old ip_conntrack, or if I must install some
kind of patches or something else.


Thanks.


Martin



