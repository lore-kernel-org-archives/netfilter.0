From: "David C. Hart" <DCH@TQMcube.com>
Subject: IPT Still Driving Me Nuts
Date: Sun, 02 Nov 2003 13:00:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067796031.18240.5.camel@main.tqmcube.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-kdO8nXwAD7F/EDYZmj85"
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
To: iptables mailing list <netfilter@lists.netfilter.org>


--=-kdO8nXwAD7F/EDYZmj85
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

"Nov  2 12:36:45 mail2 kernel:  -FW-  IN=3Deth1 OUT=3D
MAC=3D00:09:5b:22:29:d1:00:06:25:e4:ed:a3:08:00 SRC=3D61.172.3.25
DST=3D192.168.0.31 LEN=3D530 TOS=3D0x00 PREC=3D0x00 TTL=3D239 ID=3D21777=20
PROTO=3DUDP SPT=3D32937 DPT=3D1026 LEN=3D510"

I have eliminated the virtual internal IP. The message above is still a
mismatch. That IP is on IF eth0 while it shows on eth1.

--=-kdO8nXwAD7F/EDYZmj85
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/pUY/ol4OE0cpGaIRAijsAJwJVRiJbN9mOnut/80RuDb5RudfmwCgqGlQ
4YSwACEb5qaJmFdJzY2HwEM=
=snn8
-----END PGP SIGNATURE-----

--=-kdO8nXwAD7F/EDYZmj85--


