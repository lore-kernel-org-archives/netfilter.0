From: Eric Leblond <eric@inl.fr>
Subject: Re: libnetfilter_queue ---- set_mode function not returning .
Date: Mon, 10 Aug 2009 12:16:23 +0200
Message-ID: <1249899383.7133.13.camel@khasse.inl.fr>
References: <cfeab66d0908100126g54834d7au51f7444d6edcefcb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-4CTIogdIEevcuo31VjeL"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d0908100126g54834d7au51f7444d6edcefcb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org


--=-4CTIogdIEevcuo31VjeL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 10 ao=C3=BBt 2009 =C3=A0 13:56 +0530, ratheesh k a =C3=A9crit :
> Hi ,
>=20
>  I have following code
>=20
>=20
> nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xffff);
> printf ("RAT");

I've nevr encounter such a problem.

Could you post a more complete code sample. (One that could be compiled
separately could be great).

BR,
--=20
=C3=89ric Leblond <eric@inl.fr>
EdenWall, http://www.edenwall.com/
NuFW, http://www.nufw.org

--=-4CTIogdIEevcuo31VjeL
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkp/83QACgkQnxA7CdMWjzLYuACfRvlDAw1TLEUFkjUUl10nij1Z
jHAAoIMq2yGlipMj5RhvZUyXQnwDCO/B
=KKAd
-----END PGP SIGNATURE-----

--=-4CTIogdIEevcuo31VjeL--

