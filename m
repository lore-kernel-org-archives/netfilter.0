From: Eric Leblond <eric@inl.fr>
Subject: Re: Port redirection not working
Date: Thu, 24 Jan 2008 14:49:54 +0100
Message-ID: <1201182594.25760.17.camel@khasse.inl.fr>
References: <200801241243.43277.me@gustavonarea.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-3bJ0dKXKgmZadI64DxXd"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200801241243.43277.me@gustavonarea.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Gustavo Narea <me@gustavonarea.net>
Cc: netfilter@vger.kernel.org


--=-3bJ0dKXKgmZadI64DxXd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 24 janvier 2008 =C3=A0 12:43 +0100, Gustavo Narea a =C3=A9crit :
> Hello, everyone.
>=20
> I'm new to netfilter and I'm trying to set a port redirection from port 8=
0 to=20
> port 8080.
>=20
> I'm using this line in the attached file:
> -A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080

Miss "-t nat" in the line, you need to specify the table to use.

>=20
> But there's something wrong with it, and I don't know what.
>=20
> When I run `iptables-restore < /etc/iptables.config', I get this error:
> iptables-restore: line 7 failed
>=20
> I'm using Debian Etch.
>=20
> Thanks in advance!
--=20
=C3=89ric Leblond, eleblond@inl.fr
T=C3=A9l=C3=A9phone : +33 1 44 89 46 40, Fax : +33 1 44 89 45 01
INL, http://www.inl.fr

--=-3bJ0dKXKgmZadI64DxXd
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHmJeCnxA7CdMWjzIRAkjaAKCSgjt6j0SnrJGd+wXvgR6ObaK3owCfTnB5
vSMmew/3fyWztzToo/fd8i4=
=Laxf
-----END PGP SIGNATURE-----

--=-3bJ0dKXKgmZadI64DxXd--

