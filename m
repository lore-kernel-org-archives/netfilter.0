From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: Netfilter Performance when using MAC filter
Date: Wed, 31 Oct 2007 14:33:03 -0500
Message-ID: <1193859183.5142.2.camel@grateful.d.umn.edu>
References: <54ea295d0710310923x1e5eff5cy6d70445d90d9e56e@mail.gmail.com>
	 <1193855211.18366.73.camel@grateful.d.umn.edu>
	 <4728D541.9010308@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-bjCf63VxEuibpHBHqQDF"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4728D541.9010308@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


--=-bjCf63VxEuibpHBHqQDF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Wed, 2007-10-31 at 20:19 +0100, Pascal Hambourg wrote:
> Hello,
>=20
> Matt Zagrabelny a =C3=A9crit :
> >=20
> > If so, you can do MAC filtering (performance shouldn't matter as the MA=
C
> > address is in the link header)
>=20
> Can you please elaborate about the relationship beween filtering=20
> performance and the address layer ?

There is nothing to elaborate on. ;)

The frame contains the MAC address. This is what iptables will be
looking at. If the box running iptables is on the same network/vlan as
the rest of the traffic it is expecting to filter, then it will have MAC
addresses of actual hosts, however, if traffic is coming from a
different network/vlan then said traffic will have been routed and the
frame will have changed, thus the MAC address will be the MAC of the
network boundary, namely the router/gateway.

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-bjCf63VxEuibpHBHqQDF
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHKNhvU+eIf4TiLaIRAjzvAKDOjY06gmqrwNrB7OHfPwjzRlQLKwCgzGY2
Q/YkHwYkCFsYPv0lzz6Z3x4=
=LQbW
-----END PGP SIGNATURE-----

--=-bjCf63VxEuibpHBHqQDF--

