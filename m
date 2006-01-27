From: Christian Seberino <seberino@spawar.navy.mil>
Subject: How make iptables script with NAT handle "active FTP"?
Date: Fri, 27 Jan 2006 11:34:34 -0800
Message-ID: <1138390474.4844.79.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-WLyZHnGGkVkVzPfIBpZf"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org, Ray Schumacher <rays@blue-cove.com>


--=-WLyZHnGGkVkVzPfIBpZf
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Active FTP seems to need to open new sockets.

This creates problems for NAT'ing firewalls.

What is easiest way to open the right ports

and do NAT'ing back to clients on 192.168.x.y IP addresses?


Chris

--=-WLyZHnGGkVkVzPfIBpZf
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iQEVAwUAQ9p1ysXAD6FzhZH3AQL9zQf+IkKs01zxsEojrEDAFZ2QvZCmdyaCwpvW
YFe1aU/OeF1chINiKnX9chn2hxKk23ZrDHaIGc+oP6aMK5Q/xTZu7KIHQ4eLbu4t
EW2BYYOEPzYlJMmsnkXgo+MpvmhrxHM8cy4bXz0zKUxtbAkRjQFA97U+EBrGChg7
gXbUJHTzinHOlqs4sIhMleFrXVDi5yanMYW8OTIYm5xZ2fgJPNw+LDayikuuIFv9
8Zn5ig17sLoKnjI+jJ6eeNPIJhNOEz1DQKP1Eor7rd0yJnjqJXzunuDXnTsTQvgX
snMJ5BPXLDMOPKSiUDAsUYd/Y4Wo3p8HfqMU3ZF8qZItdwb7hAgcvw==
=PT4F
-----END PGP SIGNATURE-----

--=-WLyZHnGGkVkVzPfIBpZf--


