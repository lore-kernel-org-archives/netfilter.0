From: Anthony de Almeida Lopes <guerrilla_thought@gmx.de>
Subject: (no subject)
Date: Sat, 21 Feb 2004 04:46:59 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077367619.1966.3.camel@frozen>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-H6noxWz/uhEYDiKhEvJG"
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


--=-H6noxWz/uhEYDiKhEvJG
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi, I would like to add a certain rule to my firewall, but I have a
dynamic IP, I'm wondering if there is some way I can work with this
the line is as follows:

iptables -A INPUT -p tcp -d <MyDynamicIP> --tcp-flags SYN,FIN SYN,FIN -j
DROP

Thanks for any information you can provide.

--tony

--=-H6noxWz/uhEYDiKhEvJG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQBAN1NAiwp1djYa9UURAkzqAJ4+VcR2bjQbHFzw67k45u3xNOZX6QCfRdMQ
0SxQABkN/lREMV8N1iHGpFQ=
=W0XJ
-----END PGP SIGNATURE-----

--=-H6noxWz/uhEYDiKhEvJG--


