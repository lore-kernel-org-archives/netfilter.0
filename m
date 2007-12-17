From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: Captive portal and DNAT
Date: Mon, 17 Dec 2007 09:55:45 -0600
Message-ID: <1197906945.19486.244.camel@grateful.d.umn.edu>
References: <47050bf90712170641h7cdcf7f5kfe352a999a60beb3@mail.gmail.com>
	 <1197905123.19486.231.camel@grateful.d.umn.edu>
	 <47669B1C.3090605@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-B0NLaE2cktqmU3ZO2moN"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47669B1C.3090605@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


--=-B0NLaE2cktqmU3ZO2moN
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Mon, 2007-12-17 at 16:51 +0100, Pascal Hambourg wrote:
> Hello,
>=20
> Matt Zagrabelny a =C3=A9crit :
> >=20
> > I had issues with tcp keepalives. I had to tweak the apache configs:
> >=20
> > KeepAlive Off
>=20
> This is HTTP keep-alive, an option for permanent connections, allowing=20
> multiple HTTP transactions in a single connection. It has nothing to do=20
> with TCP keep-alive, which would not solve the problem.

Thanks for the clarification. My bad.

Either way, that directive solved my problems which seem to have the
same manifestations as the OP.

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-B0NLaE2cktqmU3ZO2moN
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHZpwBU+eIf4TiLaIRAvxcAKDEdyw0ZFbGe+wD4Ai9cSaQQeUvLgCfbC+9
BVOZxZUWkuNtNtxT5pDNEtQ=
=67jh
-----END PGP SIGNATURE-----

--=-B0NLaE2cktqmU3ZO2moN--

