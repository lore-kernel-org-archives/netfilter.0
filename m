From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Fri, 16 May 2008 17:08:27 +0200
Message-ID: <482DA36B.6070801@plouf.fr.eu.org>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1210688686.2956.69.camel@kr0sty.1.com.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Martin a =E9crit :
>=20
> I use to have a 2.6.18 kernel with some patches, including POM and
> netfilter ones. The modules I insmod are ip_conntrack_ftp,
> ip_conntrack_irc, ip_conntrack_tftp, ip_conntrack_amanda and
> ip_conntrack_sip.
>=20
> Asking around, have finally find that to get patches on mainstream, s=
ome
> names've changed and some code have been modified =BFis that right?

nf_conntrack is layer 3-independent and works with both IPv4 and IPv6,=20
while ip_conntrack was IPv4-only.

> Anyway, there aren't nf_conntrack_amanda, nf_conntrack_irc, etc. =BFa=
re
> there available by now, or need some extra patches or something else?

Most of them were introduced in kernel 2.6.20 along with IPv4 stateful=20
NAT. Aliases have been defined, so you can keep using the old names.
