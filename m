From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: connlimit problem
Date: Wed, 14 Jul 2004 12:02:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040714100222.GA24594@zion.homelinux.com>
References: <3470.80.51.249.26.1089797826.squirrel@www.elpec.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3470.80.51.249.26.1089797826.squirrel@www.elpec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Robert Czechonski <mlody@elpec.com>
Cc: netfilter@lists.netfilter.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Robert,

On Wed, Jul 14, 2004 at 11:37:06AM +0200, Robert Czechonski told us:
> Hello
> I have kernel 2.4.25 and iptables 1.2.11. When I typed:
>=20
> iptables -p tcp --syn --dport 80 -m connlimit --connlimit-above 80 -j REJ=
ECT

try iptables -A INPUT   ....
or           -A OUTPUT  ....
or           -A FORWARD ....

depending on which chain you want this rule to append to (looking at
your example, probably INPUT??). Or use

iptables -I <chainname> <number> ....

to insert the rule at rule number <number>
in the chain.


HTH

Sven

>=20
> The system pesponded:
>=20
> iptables v1.2.11: no command specified
> Try `iptables -h' or 'iptables --help' for more information.
>=20
> Anyone can tell me what did I wrong?
> --=20
>=20
> Robert
>=20

--=20
Linux zion 2.6.8-rc1 #3 Mon Jul 12 22:38:00 CEST 2004 i686 athlon i386 GNU/=
Linux
 11:59:01  up 1 day, 13:16,  2 users,  load average: 0.02, 0.04, 0.01

--huq684BweRXVnRxX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFA9QSuo4FAdB2PneQRAtOAAJ9+bgfvib21L/1yZC7JgtFmWH7l0wCfT4ik
oYn3R6KqTiivnLnIRNojeRA=
=v/BT
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--

