From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: limit extension
Date: Wed, 20 Jul 2005 17:15:43 +0200
Message-ID: <20050720151543.GA15634@zion.homelinux.com>
References: <42DD417F.4090804@rbw.goe.net> <42DE5C90.70603@rbw.goe.net>
	<20050720144531.GA14941@zion.homelinux.com>
	<42DE65C6.6030504@rbw.goe.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42DE65C6.6030504@rbw.goe.net>
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
To: Michael Schachtebeck <schachti@rbw.goe.net>
Cc: netfilter@lists.netfilter.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Michael,

On Wed, Jul 20, 2005 at 04:55:02PM +0200, Michael Schachtebeck told us:
> But on the other hand, the counter correctly shows the number of packets
> that matched the rule; iptables -t nat -vnL PREROUTING says:
>=20
> 9 540 REDIRECT tcp -- eth1 * 10.10.10.69 0.0.0.0/0 tcp spts:1024:65535
> dpt:80 flags:0x16/0x02 limit: avg 1/day burst 1 redir ports 5000
>=20
> So it would be very strange if the rules were extracted to user space,
> rewritten/modified, "uploaded" to the kernel with the correct counters
> for the remaining rules, and then, the rules do not look to this
> counters. ;-)

I'm not that familiar with the iptables internals, but I suspect that
the counters (which are probably part of the "core" rule data structure)
are downloaded to userspace and get uploaded again untouched when just
adding or deleting a rule from an existing ruleset, but the limit-match
internal data structure will will get reallocated.

Maybe one of the developers reads this mail and can prove me wrong or
perhaps even right :-)



Sven

>=20
> Why then save and restore the counters, if they are not used by the rules?
>=20
> Michael.

--=20
Linux zion 2.6.13-rc3-mm1 #6 PREEMPT Mon Jul 18 19:42:52 CEST 2005 i686 ath=
lon i386 GNU/Linux
 17:11:17 up 1 day, 21:23,  1 user,  load average: 0.00, 0.05, 0.05

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFC3mqfo4FAdB2PneQRAlbIAJ0TZTc1/n+x/MJoij+G6xVg8sBtUACeOmvZ
XDONImUOFeAuZE9mC8uNcyg=
=W9zB
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--

