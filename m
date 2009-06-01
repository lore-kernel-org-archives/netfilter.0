From: Eric Leblond <eric@inl.fr>
Subject: Re: Atomic get-and-watch of conntrack table
Date: Mon, 01 Jun 2009 22:28:58 +0200
Message-ID: <1243888138.6398.11.camel@ice-age>
References: <20090601183600.579332c1@nacelle.mxtelecom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-RfbupGe+3xq4gz7eWmrM"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090601183600.579332c1@nacelle.mxtelecom.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Paul Evans <paul@mxtelecom.com>
Cc: netfilter@vger.kernel.org


--=-RfbupGe+3xq4gz7eWmrM
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello,

Le lundi 01 juin 2009 =E0 18:36 +0100, Paul Evans a =E9crit :
> I'd like to write a long-running program that regularly reports
> statistics on conntrack usage (total number of connections, number of
> NATs, etc...). To do this, the program needs to start up, grab the
> current state of the table, and be informed of updates.

You could use ulogd-2 which has the ability of following the conntrack.
It can dump conntrack information inside a database and you can query it
to get your data. By using a custom SQL procedure (or custom output
plugin), you can even output what you want.

An other possibility is to use conntrackd which has a statistic mode.

Link:
ulogd2: http://www.netfilter.org/projects/ulogd/
conntrackd: http://conntrack-tools.netfilter.org/manual.html

BR,
--=20
Eric Leblond <eric@inl.fr>
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--=-RfbupGe+3xq4gz7eWmrM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Ceci est une partie de message
 =?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iD8DBQBKJDoGnxA7CdMWjzIRAnjtAJwPEkHUX/JTNhbSikzYMdL09966mACggrEp
bz+vs3TDACNdCqS7CzOAeWA=
=WMK1
-----END PGP SIGNATURE-----

--=-RfbupGe+3xq4gz7eWmrM--

