From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Mon, 19 May 2008 16:41:45 +0200
Message-ID: <483191A9.5020404@plouf.fr.eu.org>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar>	 <482DA36B.6070801@plouf.fr.eu.org>	 <alpine.LNX.1.10.0805161714090.15590@fbirervta.pbzchgretzou.qr>	 <482DAC09.90304@plouf.fr.eu.org>	 <1210954048.23968.2777.camel@kr0sty.1.com.ar>	 <482EC332.9000400@plouf.fr.eu.org> <1211203246.23968.3880.camel@kr0sty.1.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1211203246.23968.3880.camel@kr0sty.1.com.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Martin a =E9crit :
>=20
> On ip_conntrack modules, I use to load some modules that open a secon=
d
> port (ftp, quake3, and so) and make it able to mark packets as relate=
d.

Conntrack modules do not open any port, they just mark packets as=20
RELATED. The actual filtering job is done by iptables rules.

> Those modules were ip_conntrack_ftp, ip_conntrack_quake3 and
> ip_conntrack_amanda. So, now netfilter packages and modules are in
> mainstream, some names and modules have changed, and I'm searching fo=
r
> the replace of those modules under the new nomenclature (nf_conntrack=
).

ip_conntrack_* helper modules have been replaced by nf_conntrack_* when=
=20
available and moved from net/ipv4/netfilter to net/netfilter.

> My problem comes as there are not a nf_conntrack_(ftp/quake3/amanda),
> but there are nf_nat_(ftp/amanda).ko files, and wonder to know if tho=
se
> file are the replace of the old ip_conntrack, or if I must install so=
me
> kind of patches or something else.

If you have some NAT helper modules, then you should have the=20
corresponding conntrack helpers as NAT depends on conntrack, unless you=
=20
messed with your .config file. Maybe you have the conntrack helpers=20
built-in instead of built as modules. Check in your .config or=20
/proc/config.gz if available.

AFAIK quake3 conntrack support was never included in mainstream, it was=
=20
only in patch-o-matic for ip_conntrack. I don't know if it has been=20
converted to nf_conntrack.
