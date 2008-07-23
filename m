From: Eric Leblond <eric@inl.fr>
Subject: Re: ip_queue, libnetfilter_queue, and packet alteration
Date: Wed, 23 Jul 2008 11:45:12 +0200
Message-ID: <20080723094512.GA2250@khasse.inl.fr>
References: <7915e7b50807221702m752d5b74y9283a28f4b9b1689@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7915e7b50807221702m752d5b74y9283a28f4b9b1689@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Curtis Wyatt <zhackwyatt@gmail.com>
Cc: netfilter@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tuesday, 2008 July 22 at 17:02:14 -0700, Curtis Wyatt wrote:
> I am using ip_queue.  I understand that is depreciated.
>=20
> I want to intercept a packet, alter it (change payload and source ip
> address and destination ip address) and then do an NF_ACCEPT on it, to
> have it continue on its way to another machine.  However it never
> shows up at that other machine.  Is there anyway to do this without
> doing an NF_DROP and then sending a new packet through?
>=20
> Will libnetfilter_queue do this for me?

Yes, but you will have to compute the checksum of the modified packet by
yourself.

Someone should send a patch which adds helper functions to ease that
task in a day or two.

> I don't want to move to
> libnetfilter_queue because I can't find a redhat rpm and I can't find
> hardly any documentation on it.

Compilation is not really difficult but lack of documentation is a real
problem. The only thing for now is too look at snort-inline or NuFW code
to see how to use the library.

BR,
--=20
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiG/agACgkQnxA7CdMWjzLKGgCfe+aNSojD9TrH0pMPyT4q2t9i
H9sAnAtchLKOd5yAutIABVVfofOModux
=GXnQ
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
