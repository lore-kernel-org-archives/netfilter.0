From: Nikolai Lusan <nikolai@lusan.id.au>
Subject: Using multiple ipsets in a single rule.
Date: Thu, 02 Aug 2012 13:50:33 +1000
Message-ID: <1343879433.4471.3.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4tHAVgOAl4JV9KUEy8rk"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-4tHAVgOAl4JV9KUEy8rk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

After receiving advice that multiple set matching was supported I have
written a firewall that uses multiple set matches in a single iptables
rule only to receive the error message "--match-set can on be used
once". Is there support for matching against more than one set? Or is it
possible that this can be done in a future release?


--=20
Nikolai Lusan <nikolai@lusan.id.au>

--=-4tHAVgOAl4JV9KUEy8rk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABCgAGBQJQGfkKAAoJEJOjmtAqHQSLq1UP/0+TGS91Nypy7W/J66VuOxnA
L2RV79nhnm7iYKgSvwgDGSvELSJTS4WUW5cHSbZlbEjleJAX/X6oFd5RHVuCfjpQ
ENdlxdK8G9vFETnrwujVIqOTRyjjBe0rZi5DwiI5xGy++kiu+EIDQ/HkR4gsn5Yk
ADiYBFYF3GYocOYjYW3VxTWC2E6I+N5SEW7+89J2GsN3ZyUDYnzQZRw/fNuBmwCr
O/cV4UrF+ztGdgbiX52ctgoJEVWPSnuGaroCsYt4XLHAAv2G19xrM82C6yngRdtA
hrSRXR4J2fo1Ar/O8/0EQjH0eQ8Z8jnNiKxa2MmTJdjLGTSIvLINATwFmo/cTjuO
QgtraHGAIs90DpfSmJjAUVZIxrNEK0Ve9VV913e+czhG0aqOdVJz5hmTZg5QWRBM
ncC7mPnrA0vb41aVH4+qUfCSJnrwlOAVCPjmZ9yBfoqYDrz6U/rW2d3qM2pVFQYL
amLXmDTyaMAQ/cguw3yi5wBa91qkHHtVQeX/w9ajfxovWUL5HgKnCeJ+HP9f4N2q
NZAE43r852qPPsSdI9kyXFTdUuqonA5U8shdbw6rNYguFZUXv2mjMwtQcOd/8jXJ
C9556cbsAmWjQL0KnbUOyNop5nKlVFwxQbImNX23PBXqKpw7Nbswkgk8J7lUayfj
XKGjWcNIAPupwLj2A7Vu
=jZSY
-----END PGP SIGNATURE-----

--=-4tHAVgOAl4JV9KUEy8rk--

