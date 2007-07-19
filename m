From: Thomas Jacob <jacob@internet24.de>
Subject: even hash tables sizes, FAQ entry
Date: Fri, 20 Jul 2007 01:47:41 +0200
Message-ID: <20070719234741.GB17253@internet24.de>
References: <469FE2DC.90300@relevad.com>
	<Pine.LNX.4.63.0707191516340.23721@qynat.qvtvafvgr.pbz>
	<469FE85B.3010502@relevad.com>
	<20070719225931.GA17114@internet24.de>
	<469FF100.5020509@relevad.com>
	<20070719232836.GA17202@internet24.de>
	<469FF52F.5010301@relevad.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <469FF52F.5010301@relevad.com>
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


--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The FAQ says
=20
"Please note that due to the nature of the current hashing algorithm, an ev=
en hash bucket count (and esp. values of the power of two) are a bad choice=
=2E"

Is this still true? What is the reason for this? And: Does
any odd hashtable size work as well as other odd hash tables sizes
in the same order of magnitude?

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFGn/gdgF9cFv867HwRAgrtAKDSoPkWBtzvl4cBDMywG8jJbXgLWgCgiflR
5jjr8VxWTQdl5XTtmu/NEFo=
=M//0
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--

