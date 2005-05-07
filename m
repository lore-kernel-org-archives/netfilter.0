From: Sebastian Siewior <bigeasy@foo.fh-furtwangen.de>
Subject: IP sent an invalid ICMP type to a broadcast and
 icmp_ignore_bogus_error_responses
Date: Sat, 7 May 2005 21:26:28 +0200
Message-ID: <20050507212628.6fd43793@mikejones.ghb.fh-furtwangen.de>
Mime-Version: 1.0
Content-Type: multipart/signed;
	boundary="Signature_Sat__7_May_2005_21_26_28_+0200_8J/KG251mNOqkw0T";
	protocol="application/pgp-signature"; micalg=pgp-sha1
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

--Signature_Sat__7_May_2005_21_26_28_+0200_8J/KG251mNOqkw0T
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hallo,

My kernel complaints himself every second with:

kernel: XX.XX.XX.XX sent an invalid ICMP type 3, code 1 error to a
broadcast: 0.0.0.0 on lo

In the meantime I supressed the messages via =20

echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses".=20

Other people solved this problem with=20

iptables -A INPUT -i lo -j ACCEPT

but it won't work here. Does someone have an idea how I could find out
where the packets are comming from?

--=20
Mit freundlichem Gru=DF
Sebastian Siewior

--Signature_Sat__7_May_2005_21_26_28_+0200_8J/KG251mNOqkw0T
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCfRZkmNVcHP4/RwYRAgkkAJ4lUIRFVW8WyN1xmOMGlzLX4JbqfwCeMPTc
W1PwN+CgGohN2DGVq1w+L0U=
=ZdkO
-----END PGP SIGNATURE-----

--Signature_Sat__7_May_2005_21_26_28_+0200_8J/KG251mNOqkw0T--

