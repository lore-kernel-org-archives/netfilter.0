From: Scott van Looy <scott@ethosuk.org.uk>
Subject: what have I done wrong to make 1.2.7a not compile?
Date: 20 Feb 2003 00:48:27 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045702107.1406.22.camel@pixel.ethosuk.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-0mXaNa5VVx6wZUFO+FAD"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--=-0mXaNa5VVx6wZUFO+FAD
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

extensions/libipt_ROUTE.c: In function `print':
extensions/libipt_ROUTE.c:119: structure has no member named `if_name'
extensions/libipt_ROUTE.c:120: structure has no member named `if_name'
extensions/libipt_ROUTE.c:122: structure has no member named `if_index'
make: *** [extensions/libipt_ROUTE_sh.o] Error 1

What's wrong then? :)
--=20
Scott van Looy - email:me@ethosuk.org.uk | web:www.ethosuk.org.uk
PGP Fingerprint: 7180 5543 C6C4 747B 7E74  802C 7CF9 E526 44D9 D4A7
      -------------------------------------------
      |/// /// /// /// WIDE LOAD /// /// /// ///|
      -------------------------------------------

Your ignorance cramps my conversation.

--=-0mXaNa5VVx6wZUFO+FAD
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+VCXbfPnlJkTZ1KcRAogPAJ9ezI+IaPCnqJorN1MfCdIyLrMLOwCeJPTb
QjbC/OFAJSo+dgttQECwx/E=
=fgXO
-----END PGP SIGNATURE-----

--=-0mXaNa5VVx6wZUFO+FAD--

