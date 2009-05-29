From: Martin Millnert <millnert@csbnet.se>
Subject: Re: Excluding IP from connection tracking
Date: Fri, 29 May 2009 12:25:19 +0200
Message-ID: <1243592719.4477.40.camel@hsa.vpn.anti>
References: <4A1FB34B.8060902@conversis.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-sYWejoWzIiO/J1ZXPQwt"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A1FB34B.8060902@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "Dennis J." <dennisml@conversis.de>
Cc: netfilter@vger.kernel.org


--=-sYWejoWzIiO/J1ZXPQwt
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2009-05-29 at 12:04 +0200, Dennis J. wrote:
> Hi,
> Is there a way to exclude destination IPs from connection tracking? Right=
=20
> now if I enable connection tracking in general on our router after about =
30=20
> seconds the connection table fills up. 99% of the traffic is hitting a=20
> specific IP and I would like to keep the connection tracking itself=20
> available for everything else but disable it for that IP only so the=20
> connection table stops getting filled up.
>=20
> Regards,
>    Dennis
> --

Hi Dennis,

see -t raw -j NOTRACK.

Regards,
--=20
Martin Millnert <millnert@csbnet.se>

--=-sYWejoWzIiO/J1ZXPQwt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQIcBAABAgAGBQJKH7gCAAoJEKregIBmHNFOxkgP/AtQzgkAqmR7BJSM38/JDGud
t1IGm/nvJVkkxGWDjOhvqIkzlyyB7U1KFBCtuLJNLiaLTj7arv+/ejblpwgjL3Fr
0UEY9O/FPGqKplbvE/5KicW2HD+YxOXX3dYAod4v/XSsIEzWlYE2aj3bCIrzUK+D
9fKjW1K5VAQCxf7sgJoMAv+J+vXDQNOmhPNqZm6AgmKorfMafZmzsRuUi8XomkJS
f+BtccmIOhxFWZ9jFCxd53eELkTBfDoPV6drTAeT7gwt+n5V4KLu2rXxTUK6al9j
PL5i5jK6Bz117jjYjTh6i5PBQjNjh1hZg1kxbWnyFn8IQ6iHptPFEgB32mpjHfxk
10AiyKnDpU3hUXaN7AySOlu6Pb7ZvDhJ3CZB97zO+rXnmwDditS6taMW2H3LtoYv
ZWMLQUt3Kt4qnNBPnGDcknnwc9QULaEy9CtiwuKG3fvk3j+N0LsmY7Y9ukog+Pa2
awVLjZg+Cimfgt5HMn4xqC6GuaIjRlq6YM/y8YnmeEWr5JKTx5NGqKqxFzPnRu9/
Wcjty9TlW6h0lHDiIZ8+32/NvDjiK274vGkIIxCxL+E5BsarvKAr6Gm5vBIzup5u
8XLCXp6YTu28d8u41LTPeIwZhyI7KfJkI5uxKe32NDrKPcXNi9ygrMYChk6N8N7U
++29QfZjNt4CgjAxE6XA
=DjnG
-----END PGP SIGNATURE-----

--=-sYWejoWzIiO/J1ZXPQwt--

