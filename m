From: Philip Prudich <pprudich@masaka.cs.ohiou.edu>
Subject: Re: Conntrack table editing utility
Date: Sun, 31 Jul 2005 18:58:45 -0400
Message-ID: <20050731225845.GA8387@masaka.cs.ohiou.edu>
References: <1122567204.42e90424cba63@base.mxtelecom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1122567204.42e90424cba63@base.mxtelecom.com>
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
To: ianabel@mxtelecom.com
Cc: netfilter@lists.netfilter.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> b) See if a utility already exists

While not a finished "utility," you probably want to look into the
nfnetlink_conntrack patch for implementation. It provides the "delete=20
conntrack entry X" functionality, among other things.  I had success using=
=20
this with a fedora core 1 release, 2.4.22 kernel (for doing a similar sort =
of=20
thing as you're working on).  The nfnetlink_conntrack patch I used was vers=
ion=20
0.13. =20

Hope this helps.
phil



--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (SunOS)

iD8DBQFC7VekTGU5yW1gK7ARArROAKDUnR+aooj2VWZLgIHLD8fdIgh8BgCfZEZB
4SNijJj5wF+d1Lr7ViSyPAs=
=cN02
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--

