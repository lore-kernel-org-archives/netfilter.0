From: Eric Leblond <eric@regit.org>
Subject: Re: per host accounting
Date: Mon, 23 Jul 2012 10:00:47 +0200
Message-ID: <1343030447.12730.5.camel@tiger.regit.org>
References: <CAJygYd3B1rReg_-cLX599CScd7u2SBcO7_7uU1gb83knS4MM3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-c5rKnpL6s5tsM5cu1ecT"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJygYd3B1rReg_-cLX599CScd7u2SBcO7_7uU1gb83knS4MM3w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Yucong Sun =?UTF-8?Q?=28=E5=8F=B6=E9=9B=A8=E9=A3=9E=29?= <sunyucong@gmail.com>
Cc: netfilter@vger.kernel.org


--=-c5rKnpL6s5tsM5cu1ecT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le dimanche 22 juillet 2012 =C3=A0 20:22 -0700, Yucong Sun (=E5=8F=B6=E9=9B=
=A8=E9=A3=9E) a =C3=A9crit :
> Hi,
>=20
> I need a way to account traffic (bytes) for ~500 ips (fixed),  and it
> seems creating a plain 500 rules will affect the performance a lot.
> Without implement layered rule (like a binary search?) , is there
> something existing to do automatic hashing?
> Things like hashlimit is great, but I don't need limit matching
> function, just a way to create a hashtable and count bytes and
> packets.
>=20
> If there's none, I suppose it would easy enough to fork some hashlimit
> code to do this.

You can have a look at how ulogd2 and nfacct can be used for accounting:
https://home.regit.org/2012/07/flow-accounting-with-netfilter-and-ulogd2/

BR,
--=20
Eric Leblond=20
Blog: http://home.regit.org/ - Portfolio: http://regit.500px.com/

--=-c5rKnpL6s5tsM5cu1ecT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAlANBK8ACgkQnxA7CdMWjzI+BACfej2oIky2MRvmwA6WmwdF/v6d
+5IAnA1BoMTH2ovQaI0Jixu2w5egJcIQ
=XofB
-----END PGP SIGNATURE-----

--=-c5rKnpL6s5tsM5cu1ecT--

