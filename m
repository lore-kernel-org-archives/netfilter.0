From: Martin Tomasek <mtd@mk.cvut.cz>
Subject: advanced ip accounting
Date: Fri, 5 Jul 2002 09:45:08 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020705074508.GB2006@mt.mk.cvut.cz>
Reply-To: mtd@mk.cvut.cz
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org


--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello all,

I'm looking for some accounting for netfilter, which should be used like
this:

iptables -A FORWARD -s 1.2.0.0/16 -j ACCOUNTING

and which sends data to userspace periodically. It should collect=20
protocol-ips-ports triplets, for which it will count bytes.
I could't use -j ULOG or pcap because of big overhead -- I want to use
it on gigabit router.

Have you seen something like this?

--=20
Martin Tomasek, mtd@email.cz
BOFH excuse #175:
OS swapped to disk

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9JU6EzWKqGie3rqoRAuyhAKCF+RT1xBnCkwopa8/r7Uh6K3IYygCfawwS
si3qVWAWnwLzymicBIUXI1Y=
=sXIH
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--

