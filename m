From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: dummy target?
Date: Fri, 18 Mar 2005 15:41:26 +0100
Message-ID: <20050318144126.GA2604@zion.homelinux.com>
References: <423ADBAC.4020406@uplink-verein.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <423ADBAC.4020406@uplink-verein.ch>
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
To: Moritz Gartenmeister <moritz@uplink-verein.ch>
Cc: netfilter@lists.netfilter.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Moritz,

On Fri, Mar 18, 2005 at 02:46:20PM +0100, Moritz Gartenmeister told us:
> hi all
>=20
> i want to use the counters for statistic stuff. i already have a working=
=20
> example. but i want to get numbers for pakets, which i acutally have no=
=20
> rule for (e.g. all incoming traffic).
> is there a dummy target? like:
> $IPTABLES -t mangle -A PREROUTING -m physdev --physdev-in $INET_IF -j DUM=
MY
>=20
> dummy target: do nothing, do not terminate, do just increment counters.

just don't provide the '-j TARGET' on the commandline, then you'll
have a rule (with its counters) which "does" nothing...


HTH

Sven

>=20
> cheers
> moritz
>=20
>=20

--=20
Linux zion 2.6.11-mm3 #1 Sun Mar 13 00:10:52 CET 2005 i686 athlon i386 GNU/=
Linux
 15:40:16 up 5 days, 15:08,  1 user,  load average: 0.23, 0.06, 0.02

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFCOuiWo4FAdB2PneQRAlU/AJ4lCXVxvwACyRy3lcujI9fXmen+LACeKhVY
Zb/Cw/cRX2uHpJUGwWXOKuM=
=AVrh
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--

