From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: kernel 2.6.x and iptables
Date: Tue, 13 Jan 2004 11:24:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040113102442.GA21254@zion.homelinux.com>
References: <00cb01c3d9b6$cd9b2d00$23c051cb@ns3.worldcall.net.pk> <200401130503.39528.Alistair Tonner <>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200401130503.39528.Alistair Tonner <>
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


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2004 at 05:03:39AM -0500,  told us:
>=20
> 	Ummm ...anyone know off the top if RedHat puts iptables in as modules or=
 builds it in?
>=20
>=20
> Alistair

After taking a short look at the modules directory

/lib/modules/2.4.20-28.9/kernel/net/ipv4/netfilter

it seems that Redhat compiles iptables as separate modules, as there
are ip_tables.o, iptable_filter.o etc.

Sven

--=20
Linux zion 2.6.1 #2 Mon Jan 12 14:25:44 CET 2004 i686 athlon i386 GNU/Linux
 11:22:01  up 16:52,  4 users,  load average: 0.01, 0.01, 0.00

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAA8dqo4FAdB2PneQRAtGCAJ9RO2MI5Wx3A4lEM7jvMryDiXMxXACfQewO
+hXHFyRWoRKdbwmgtgsUnVM=
=YMt5
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--

