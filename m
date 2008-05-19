From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Mon, 19 May 2008 19:10:37 +0200
Message-ID: <4831B48D.3060902@plouf.fr.eu.org>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar>	 <482DA36B.6070801@plouf.fr.eu.org>	 <alpine.LNX.1.10.0805161714090.15590@fbirervta.pbzchgretzou.qr>	 <482DAC09.90304@plouf.fr.eu.org>	 <1210954048.23968.2777.camel@kr0sty.1.com.ar>	 <482EC332.9000400@plouf.fr.eu.org>	 <1211203246.23968.3880.camel@kr0sty.1.com.ar>	 <483191A9.5020404@plouf.fr.eu.org> <1211208951.23968.3990.camel@kr0sty.1.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1211208951.23968.3990.camel@kr0sty.1.com.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Martin a =E9crit :
>=20
> I've built-in nf_conntrack_ftp and amanda
> in kernel. Should I compile them as modules?=20

Not unless you need to be able to unload them or load them with=20
different parameters (e.g. port list) without rebooting.
