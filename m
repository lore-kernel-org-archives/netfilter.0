From: Noel Butler <noel.butler@ausics.net>
Subject: BUG ip6tables and helper
Date: Thu, 19 Dec 2013 17:35:38 +1000
Message-ID: <1387438538.10463.0.camel@tardis>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-rhTMraGRCNsCWPk3ahfw"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-rhTMraGRCNsCWPk3ahfw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pablo,

Bug with ip6tables and helpers

-j CT --helper irc

ip6tables: No chain/target/match by that name.


This *does* work with iptables


On 22/11/2013 22:12, Pablo Neira Ayuso wrote:
> Hi! The Netfilter project proudly presents: iptables 1.4.21


--=-rhTMraGRCNsCWPk3ahfw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAABAgAGBQJSsqHFAAoJECg/hgl/0DbHTZUIAKjJbQCnM9yGLZaPpaH8tpmu
xA8uDcGPmsKGKZ17TUq19JcFk11PiHROdFELaxLN/+o28NMHKf5w9rqDrWbED7Ji
hKcLIChi48AZs3rWwSsA8q+lyIpow06jxxEBEhWX0cmQGxFNk0QALPQRwh0nvZrS
H0myHwV/tx5KASS2A0lRVlNcyg+ML/CtMiUjO/nNZQgMizVcXBhP8bUTPjOVC2im
UD9MzY8YX5bTJYtuEmgpnwzy4Jpr/yAP/S6uO0GaWxniPHtlJRgPC3QJnULvemzX
vgmjCavt4FXjL89IAo8wuOuMxFUXpgV/ydQkVpPJHFqrx2sCZj9aH4bNbyQk9h8=
=GeLP
-----END PGP SIGNATURE-----

--=-rhTMraGRCNsCWPk3ahfw--

