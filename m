From: Eric Leblond <eric@inl.fr>
Subject: Re: Packet marking in user queue with VWMARK
Date: Sun, 14 Oct 2007 00:05:25 +0200
Message-ID: <1192313125.14168.6.camel@localhost>
References: <470FBD5A.2070504@jorch.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-9en9Siuq80iRxyRfzBS0"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <470FBD5A.2070504@jorch.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Jorch <news-groups@jorch.net>
Cc: netfilter@vger.kernel.org


--=-9en9Siuq80iRxyRfzBS0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 12 octobre 2007 =E0 21:30 +0300, Jorch a =E9crit :
> Hi,
>=20
> Can somebody please give me an example how to mark & match packets
> with vwmark and iptables in user queue.
>=20
> I have patched the kernel (2.6.18) and iptables (1.3.8) to support
> vwmark. Both progs compiles and installs ok and queue works normaly with
> ipq_set_verdict but not with ipq_set_vwmark.

Please switch your program to work with libnetfilter_queue. It has
default support for packet marking.

A code example can be found at :
http://software.inl.fr/trac/trac.cgi/browser/mirror/edenwall/nufw/trunk/nuf=
w/src/nufw/authsrv.c

BR,
--=20
Eric Leblond <eric@inl.fr>
INL

--=-9en9Siuq80iRxyRfzBS0
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHEUElnxA7CdMWjzIRAvjOAJ4mFU6XBsLnuMDAnYbabqwCdJaDpgCeMVFH
oLm34Xf7XGP/BGEdjj6VTEE=
=4qWf
-----END PGP SIGNATURE-----

--=-9en9Siuq80iRxyRfzBS0--

