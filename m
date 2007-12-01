From: Eric Leblond <eric@inl.fr>
Subject: Re: Linking error using libnetfilter_queue on FC8
Date: Sat, 01 Dec 2007 12:18:58 +0100
Message-ID: <1196507938.16574.31.camel@localhost>
References: <a2997d4b0711291544g7d8da729t6b965af6c1201292@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-C1iERQpwshrdbSfJWXyB"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a2997d4b0711291544g7d8da729t6b965af6c1201292@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Damian Hites <nizebulous@gmail.com>
Cc: netfilter@vger.kernel.org


--=-C1iERQpwshrdbSfJWXyB
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 29 novembre 2007 =E0 15:44 -0800, Damian Hites a =E9crit :

>=20
> g++ -g -Wall -c test.cpp -o test.o
> g++ test.o -lnfnetlink -lnetfilter_queue -o test
> test.o: In function `main':
> test.cpp:65: undefined reference to `nfq_open()'

Could you post your test code please ?

Have you install all needed -devel package ?

By the way, I've posted a bugreport relatively to fedora core package :
	https://bugzilla.redhat.com/show_bug.cgi?id=3D381321
There is no correct dependencies in the *-devel packages.

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-C1iERQpwshrdbSfJWXyB
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHUUMinxA7CdMWjzIRAsR0AJ425olm3bIqnXgVhOrRbgK3vst3igCcCbr9
mTQp/iScRa+7g5n0GSd0190=
=xMf1
-----END PGP SIGNATURE-----

--=-C1iERQpwshrdbSfJWXyB--

