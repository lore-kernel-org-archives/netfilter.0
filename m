From: Eric Leblond <eric@inl.fr>
Subject: Re: NAT + (libnfqueue || libipq): There are some documents about
	it?
Date: Tue, 26 May 2009 08:57:29 +0200
Message-ID: <1243321049.27090.22.camel@khasse.inl.fr>
References: <3fdd6ce00905252153h2b83319q818cc0b1c9a7dfb5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ZzckymgFHxnc1+MYDe6p"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3fdd6ce00905252153h2b83319q818cc0b1c9a7dfb5@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Bruno Moreira Guedes <thbmatrix@gmail.com>
Cc: Netfilter <netfilter@vger.kernel.org>


--=-ZzckymgFHxnc1+MYDe6p
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 26 mai 2009 =C3=A0 01:53 -0300, Bruno Moreira Guedes a =C3=A9crit =
:
> Hi all,
>=20
> I need to do some tasks about translating address in user-space. So, I
> first tried using libipq because it seems to me a library present in a
> great variety of linux distros. But it was unsuccessful, the changes
> done on packets appeared to be simply 'ignored'.
>=20
> So, now I want to do it with libnfqueue. Before starting a possibly
> unsuccessful try, I want to know if is there any documents about it,
> and if anybody should give me some idea about it.

It is a really good idea to switch to nfqueue...

The thing to know is that you need to compute the checksum of the packet
after modification before setting the verdict.

If you want to code a Proof of concept, you can simply use=20
	http://software.inl.fr/trac/wiki/nfqueue-bindings
Which provide high level langage binding to libnfnetlink_queue.

BR,
--=20
=C3=89ric Leblond <eric@inl.fr>
INL, http://www.inl.fr/
NuFW, http://www.nufw.org

--=-ZzckymgFHxnc1+MYDe6p
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkobktUACgkQnxA7CdMWjzLVKgCeKwXvfyidb37WsBRK5MWwb5uK
HmMAnRDSmECcmN52WqkbkDKRHSbkCuiE
=B6+0
-----END PGP SIGNATURE-----

--=-ZzckymgFHxnc1+MYDe6p--

