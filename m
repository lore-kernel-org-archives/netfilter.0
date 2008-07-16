From: Eric Leblond <eric@inl.fr>
Subject: Re: ipq_get_packet returns wrong data_len value
Date: Wed, 16 Jul 2008 08:24:25 +0200
Message-ID: <20080716062424.GB11639@bayen.regit.org>
References: <7915e7b50807151507m3d1ccadfub7cf1882817c72ca@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7915e7b50807151507m3d1ccadfub7cf1882817c72ca@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Curtis Wyatt <zhackwyatt@gmail.com>
Cc: netfilter@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tuesday, 2008 July 15 at 15:07:30 -0700, Curtis Wyatt wrote:
> Hey guys,
>=20
> I'm new at this, but does anyone know of a case where ipq_get_packet
> would return a data_len value of 671088640.  I have a toy program that
> works just fine.  However, when I tried to copy it into another
> program I receive these kinds of data lengths.  The buffer is returned
> w/ the packet contents correctly, but I can't look at it because I
> don't know how big it is, because of the corrupt data length.  Any
> suggestions?  Thank you.


Please use libnetfilter_queue. ip_queue is deprecated since at least two
years.

About your problem :
	ntohl(671088640) =3D 40

BR,
--=20
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIfZQYnxA7CdMWjzIRAqECAJ9Lp4RICzbm/4YfIGpu6CuqZ2yGcgCgiOXq
1J98kPbCl4JRCyflrwBtA+0=
=v5U2
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
