From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: iptables with irc and auth
Date: Mon, 10 Jan 2005 12:30:56 +0100
Message-ID: <20050110113056.GB14390@zion.homelinux.com>
References: <33413.212.100.225.41.1105354789.squirrel@webmail.*>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <33413.212.100.225.41.1105354789.squirrel@webmail.*>
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
To: squid@oranged.to
Cc: netfilter@lists.netfilter.org


--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

On Mon, Jan 10, 2005 at 10:59:49AM -0000, squid@oranged.to told us:
> Hello,
>=20
> I am trying to configure iptables so that when I connect to IRC on port
> 6667 it will allow the auth connection back on 113 from that IP address.
>=20
> I have both inbound and outbound rules on the system. When I try any of
> the state information it wont work. Im guessing thats because the iptables
> config cant see that its a related connection. Is there any way that I can
> setup iptables so that it will allow AUTH only if im connected on port
> 6667 to that same IP?

use ipt_recent, see

http://snowman.net/projects/ipt_recent/


HTH

Sven

>=20
> thanks
>=20
> Jimmy.
>=20
>=20

--=20
Linux zion 2.6.10-bk7 #0 Fri Jan 7 19:08:39 CET 2005 i686 athlon i386 GNU/L=
inux
 12:30:23 up 2 days, 17:07,  1 user,  load average: 0.07, 0.06, 0.05

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFB4mdwo4FAdB2PneQRAskoAJ0ezzPrciXZrlGWfdRQQ9Gajp43jgCfRlhC
aVbQW976OEttvPweL+NwZ0A=
=juI9
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--

