From: Clemens <clemens.schaefer@gmx.de>
Subject: Marks set in PREROUTING got lost
Date: Thu, 28 Sep 2006 01:50:59 +0200
Message-ID: <451B0E63.3010806@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig529AC56D6C396070211DEF59"
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
To: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig529AC56D6C396070211DEF59
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi everyone,

after experimenting with setting marks (--set-mark) in the
PREROUTING chain in the mangle table, I found out, that those marks
were not accessible/matchable in PREROUTING nat table. I was able to
see the marks in chain FORWARD mangle table though :-(

Is this behavior supposed to be like that?

Thank you for your help!

Greets, Clemens


--------------enig529AC56D6C396070211DEF59
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFGw5qnDei4azjmoERAt2gAJ92te59DzE2nPzTHoOdIwwXebFbugCeOaUF
f+z4KBSV5P7enRQRvhsEk9A=
=UzHF
-----END PGP SIGNATURE-----

--------------enig529AC56D6C396070211DEF59--

