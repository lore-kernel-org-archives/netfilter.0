From: Clemens <clemens.schaefer@gmx.de>
Subject: Re: Marks set in PREROUTING got lost
Date: Thu, 28 Sep 2006 18:05:30 +0200
Message-ID: <451BF2CA.5060001@gmx.de>
References: <451B0E63.3010806@gmx.de>	<Pine.LNX.4.61.0609281029430.21498@yvahk01.tjqt.qr>	<451B9794.9090209@gmx.de>
	<451BBD3D.40305@eternet.cc>
	<Pine.LNX.4.61.0609281430270.26317@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig86BCBDC4C004398802D25DB8"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0609281430270.26317@yvahk01.tjqt.qr>
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
--------------enig86BCBDC4C004398802D25DB8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable


> You have to mark it in the PREROUTING chain of the mangle table, to be =

> able to match on it within the PREROUTING chain of the nat table.
>=20
Is this also true, if I jump from PREROUTING mangle in a user
defined chain and mark my packets there?

--
Clemens


--------------enig86BCBDC4C004398802D25DB8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFG/LQnDei4azjmoERAs1wAJwLGOHMMDQPCH0/yY6tR2s9d9q52wCaAvQI
AAAiqLd6CP8Cq5J20VLlA7k=
=kS+r
-----END PGP SIGNATURE-----

--------------enig86BCBDC4C004398802D25DB8--

