From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: Fwd: The witty worm
Date: Sun, 21 Mar 2004 02:11:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040321011101.GA12491@zion.homelinux.com>
References: <20040321003455.20211.qmail@web61009.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040321003455.20211.qmail@web61009.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: SBlaze <dagent.geo@yahoo.com>
Cc: nf <netfilter@lists.netfilter.org>


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Good morning,

On Sat, Mar 20, 2004 at 04:34:55PM -0800, SBlaze told us:
> Got this in...thought I would forward it on to the nerfilter list in the
> interest of security.
>=20
> According to the link.. "Witty is a network worm that spreads through dir=
ect
> network connections, targeting machines that are running BlackIce security
> software." =20
>=20
> It exploits ICQ apparently... "Witty uses a vulnerability in ICQ instant
> messaging protocol parsing routines of the ISS Protocol Analysis Module (=
PAM)."

Just for clarification, it does not exploit ICQ but the ICQ protocol=20
parsing routines of the blackice firewall (seems to be one of those=20
personal firewalls I think).

>=20
> It might be a good idea to start LOG lines for a source of port 4000 for
> unusual traffic(for iptable secured gateways). This would be effective in=
 Even
> beter; block or limit these for awhile?

Well I think on a gateway/firewall you wouldn't have blackice running.
And in any kind of seriously corporate environment, I think chat systems
like ICQ should always be filtered and therefore stopped at the
(netfilter :) firewall. Of course you need to secure your internal LAN,
too, but have a personal firewall on each & every desktop??

>=20
> Good Luck to everyone.
>=20

Sven

--=20
Linux zion 2.6.4 #2 Thu Mar 11 20:52:05 CET 2004 i686 athlon i386 GNU/Linux
 01:59:28  up 9 days,  3:03,  1 user,  load average: 0.00, 0.02, 0.02

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD4DBQFAXOulo4FAdB2PneQRAhFUAJdIorQLLyPN3ZhCFwA151eucc6wAJ42zSyG
A2HlBgDd5lJyvXPCRVsXIg==
=9ayR
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--

