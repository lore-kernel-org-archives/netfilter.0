From: Eric Leblond <eric@regit.org>
Subject: First alpha release of NuFW
Date: Mon, 01 Sep 2003 21:04:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062443096.1688.19.camel@porky>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-5PVAXJC4r5WCMbLbsBpn"
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
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>
Cc: gnufw-devel@nongnu.org


--=-5PVAXJC4r5WCMbLbsBpn
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I'm proud to announce you that the first alpha version of NuFW is
available for testing.

NuFW is a set of daemons providing filtering of packets at the user
level.

Broadly speaking, the users have to run a client that sends
authentication packets to the gateway. On the server side, the gateway
associates a userid to packet, thus bringing the possibilty to filter
packet on a user base.

This software is based on libipq and is written in C. It is in alpha
status : it's globally stable but lacks configuration tools and the
client is only available for TCP and Linux.=20

More information and download can be found at :	http://www.nufw.org

BR,
--=20
Eric Leblond
Nufw, Now User Filtering Works (http://www.nufw.org)

--=-5PVAXJC4r5WCMbLbsBpn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/U5hYnxA7CdMWjzIRAp8EAJ4zwrpyEdGWNc/NYDCZMt3CoDB5ywCbBcPk
BKX5R7Kj4bDCNhC8A/Zl+rI=
=O1FI
-----END PGP SIGNATURE-----

--=-5PVAXJC4r5WCMbLbsBpn--

