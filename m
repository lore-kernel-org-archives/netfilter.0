From: Eric Leblond <eric@inl.fr>
Subject: Re: libipq and destination IP address
Date: Fri, 19 Oct 2007 11:39:43 +0200
Message-ID: <1192786783.29962.126.camel@khasse.inl.fr>
References: <mailman.21644.1192545951.25258.netfilter@lists.netfilter.org>
	 <3d00e6dc0710160744ia8edebbn8dafb76d709622dc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-vf9WzCmx1rs/BQry+NrR"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3d00e6dc0710160744ia8edebbn8dafb76d709622dc@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Khoa Nguyen <khoa.coffee@gmail.com>
Cc: netfilter@vger.kernel.org


--=-vf9WzCmx1rs/BQry+NrR
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 16 octobre 2007 =C3=A0 10:44 -0400, Khoa Nguyen a =C3=A9crit :
> Hi,
>=20
> I am writing a small libipq program to extract packet info. I "queued"
> all packets in the OUTPUT chain. It looks like the packet has the same
> source and destination packet ( =3D host interface address). Why is
> that? Is there a way in libipq to extract the REAL destination
> address?

First of all: switch to libnetfilter_queue

For your question, libipq sends to userspace the whole content of the
packet. Thus there is no potential problem of address rewriting. You can
have a look at the following code extract from NuFW:
http://docs.nufw.org/doxygen/trunk/html/packetsrv_8c-source.html#l00292

BR,
--=20
=C3=89ric Leblond, eleblond@inl.fr
T=C3=A9l=C3=A9phone : 01 44 89 46 40, Fax : 01 44 89 45 01
INL, http://www.inl.fr

--=-vf9WzCmx1rs/BQry+NrR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHGHtfnxA7CdMWjzIRAhhUAKCEu1HpCHs9y0KxuBJFXhY0IJwB0gCghbq9
m9v4d2luv9W4F4+RD7jtGu8=
=0vM2
-----END PGP SIGNATURE-----

--=-vf9WzCmx1rs/BQry+NrR--

