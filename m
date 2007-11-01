From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: Netfilter Performance when using MAC filter
Date: Thu, 01 Nov 2007 08:17:32 -0500
Message-ID: <1193923052.5142.9.camel@grateful.d.umn.edu>
References: <54ea295d0710310923x1e5eff5cy6d70445d90d9e56e@mail.gmail.com>
	 <1193855211.18366.73.camel@grateful.d.umn.edu>
	 <4728D541.9010308@plouf.fr.eu.org>
	 <1193859183.5142.2.camel@grateful.d.umn.edu>
	 <4729A4D6.2020106@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-h6/r/pjJlvuJhcZ/rGNU"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4729A4D6.2020106@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


--=-h6/r/pjJlvuJhcZ/rGNU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Thu, 2007-11-01 at 11:05 +0100, Pascal Hambourg wrote:
> Matt Zagrabelny a =C3=A9crit :
> > On Wed, 2007-10-31 at 20:19 +0100, Pascal Hambourg wrote:
> >=20
> >>Matt Zagrabelny a =C3=A9crit :
> >>
> >>>If so, you can do MAC filtering (performance shouldn't matter as the M=
AC
> >>>address is in the link header)
> >>
> >>Can you please elaborate about the relationship beween filtering=20
> >>performance and the address layer ?
> >=20
> > There is nothing to elaborate on. ;)
> >=20
> > The frame contains the MAC address. This is what iptables will be
> > looking at. If the box running iptables is on the same network/vlan as
> > the rest of the traffic it is expecting to filter, then it will have MA=
C
> > addresses of actual hosts, however, if traffic is coming from a
> > different network/vlan then said traffic will have been routed and the
> > frame will have changed, thus the MAC address will be the MAC of the
> > network boundary, namely the router/gateway.
>=20
> Sorry, but I still do not see the point in "performance shouldn't matter=20
> as the MAC address is in the link header". Performance (read : speed) is=20
> mostly related to the number of rules, isn't it ?

Okay, I see now. Performance would be related to the number of rules
that each packet needs to be tested against not against the criterion of
the match. Caveat: perhaps layer7 matching would be slower or using the
owner module, I don't know about these modules.

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-h6/r/pjJlvuJhcZ/rGNU
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHKdHsU+eIf4TiLaIRAmrDAJ9FgXCCuWWg7HBU3uKrrcrjbtZd0wCgtPQW
70oi1oad3eGqGzHLBu1fNH0=
=ASjB
-----END PGP SIGNATURE-----

--=-h6/r/pjJlvuJhcZ/rGNU--

