From: "Joao Alberto M. dos Reis" <joao@afreis.com.br>
Subject: choosing the output gateway
Date: Thu, 29 Jul 2004 19:29:03 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091140143.23217.29.camel@goku.afreis.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-HsYAMkLGYrRUrOqSF5Uw"
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


--=-HsYAMkLGYrRUrOqSF5Uw
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

I have the following:
1 linux box with 2 valid IPs with different gateways each.

I need to port forward different ports inside my network to different
machines.

I have set a default gateway to the first link and created a routing
table for the second link pointing to the second gateway. but when I
make my portforward to this second link, the packets try to leave by the
first gateway.

How can I fix that?

TIA,
Joao Reis.=20

--=-HsYAMkLGYrRUrOqSF5Uw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBCXovcfDZuH0KEiERAn5wAJ47UsyT5XtObC/wvtBGGfKsSh8CLACgg47k
FALeTyTtbbao8pev0sF06Kc=
=wmPH
-----END PGP SIGNATURE-----

--=-HsYAMkLGYrRUrOqSF5Uw--


