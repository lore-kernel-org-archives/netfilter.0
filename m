From: Thomas Jacob <jacob@internet24.de>
Subject: Warning: never matched protocol: ah. use extension match instead.
Date: Mon, 23 Jun 2008 15:55:59 +0200
Message-ID: <1214229359.9717.34.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-UyrRkrd9kjGdSJj++iAg"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-UyrRkrd9kjGdSJj++iAg
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Could someone clarify what exactly the warning message in the subject
(from ip6tables) is supposed to tell me?

It looks like that ip6tables -p ah (or -p in general) would match
packets that contain an ah header as the last extension header whereas
-m ah matches packets that contain an ah header at any position, but
I'm not sure.

The core of the question is this: how does one pass unspecified
ipsec traffic in ip6tables (the way you could do with -p ah + -p esp in
iptables)?


  Thanks & Regards,
      Thomas









--=-UyrRkrd9kjGdSJj++iAg
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBIX6tvgF9cFv867HwRAqRvAJ9KwiOIHw/c4qCPe+LI0YhUPLUGVwCePzRQ
vTBE0WmqDoGzkZuxdVz9g64=
=e4lW
-----END PGP SIGNATURE-----

--=-UyrRkrd9kjGdSJj++iAg--

