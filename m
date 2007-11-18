From: Eric Leblond <eric@inl.fr>
Subject: Re: nlif_index2name bug?
Date: Sun, 18 Nov 2007 19:35:01 +0100
Message-ID: <1195410901.6881.19.camel@localhost>
References: <473EE45F.8040008@uls.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-eObTlvSN/3aUPnw+ma8m"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <473EE45F.8040008@uls.co.za>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Jaco Kroon <jaco@uls.co.za>
Cc: netfilter@vger.kernel.org


--=-eObTlvSN/3aUPnw+ma8m
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

Le samedi 17 novembre 2007 =E0 14:53 +0200, Jaco Kroon a =E9crit :
> Hi guys,
>=20
> I've seen an error in nlif_index2name, specifically, if an interface
> comes up _after_ I've opened the nlif_handle (using nlif_open()) then it
> won't resolve the index of that device to a name.
>=20
> Is this a known issue, a bug or simply me not understanding how nlif
> works?

Yes, you did not understand how nlif is working (but I think this is due
to the lack of documentation). If fact, you have omit to listen to iface
events and to call nlif_catch after each event.

For a working code example, you can have a look at NuFW's code. nlif
related code is always prefixed by:
#ifdef HAVE_NLIF_CATCH

You can browse code online at:
http://software.inl.fr/trac/trac.cgi/browser/mirror/edenwall/nufw/trunk/nuf=
w/src/nufw/packetsrv.c
http://software.inl.fr/trac/trac.cgi/browser/mirror/edenwall/nufw/trunk/nuf=
w/src/nufw/iface.c

I've just wrote a brief nlif documentation on the following page:
http://software.inl.fr/trac/trac.cgi/wiki/articles/using_nlif

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-eObTlvSN/3aUPnw+ma8m
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHQIXVnxA7CdMWjzIRAhpOAJ9IWJYTWlRQaRa8ofW6nHDdIUd8cQCeMfDk
AxXsRtBfmVmtjyOEIklgb3c=
=b6hz
-----END PGP SIGNATURE-----

--=-eObTlvSN/3aUPnw+ma8m--

