From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: check through put
Date: Wed, 05 Dec 2007 10:03:42 -0600
Message-ID: <1196870622.19486.19.camel@grateful.d.umn.edu>
References: <4756BF08.1090106@sartorit.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-TdYSOSu+ze25XKB/LHYh"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4756BF08.1090106@sartorit.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Gian Sartor <gian@sartorit.co.uk>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


--=-TdYSOSu+ze25XKB/LHYh
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Wed, 2007-12-05 at 15:08 +0000, Gian Sartor wrote:
> Hi All,
>=20
> I am fairly new to netfilter/iptables and am wondering if there is a=20
> quick way to check the throughput of our firewall. We are having some=20
> network issues and suspect the firewall as being the bottleneck.

iperf

You could also do (if running an apt based system):

apt-cache search net benchmark
apt-cache search net performance
apt-cache search net throughput
etc.

to get some other utilities/packages.

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-TdYSOSu+ze25XKB/LHYh
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHVsveU+eIf4TiLaIRAtV2AJwOxEGL0jGbWc38EKYoZ973vTozHgCgw+W5
kNU8xbztfNJWvsGf3xMSsds=
=eKEx
-----END PGP SIGNATURE-----

--=-TdYSOSu+ze25XKB/LHYh--

