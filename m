From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Time based rules ...
Date: 13 Nov 2002 17:01:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037199668.4556.30.camel@rayw.knowledgefactory.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-6Z731PHUi4V/+l/Rofy6"
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-6Z731PHUi4V/+l/Rofy6
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Is there a way to put time restrictions on rules?
For eaxmple, something like:

iptables -A FORWARD -i eth0 -p tcp -sport 1024: -dport 1024: -time
0700:1700 -j DROP

It would be nice ...

Ray
--=20

--=-6Z731PHUi4V/+l/Rofy6
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA90mk0h1fuR/Bv+ygRApyTAJ9gLWVuX7PChBvvEQWGBE4xip0hHQCfVYEE
K/xZUzC7cgt1FKeLwgwDWSY=
=fGZ8
-----END PGP SIGNATURE-----

--=-6Z731PHUi4V/+l/Rofy6--


