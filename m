From: Thomas Jacob <jacob@internet24.de>
Subject: Re: need advice for high traffic network
Date: Fri, 20 Jul 2007 09:48:54 +0200
Message-ID: <20070720074854.GC17809@internet24.de>
References: <469FE2DC.90300@relevad.com>
	<Pine.LNX.4.63.0707191516340.23721@qynat.qvtvafvgr.pbz>
	<469FE85B.3010502@relevad.com>
	<20070719225931.GA17114@internet24.de>
	<469FF100.5020509@relevad.com>
	<20070719232836.GA17202@internet24.de>
	<469FF52F.5010301@relevad.com>
	<20070719234458.GA17253@internet24.de>
	<469FFF4B.5030704@relevad.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <469FFF4B.5030704@relevad.com>
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


--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2007 at 05:18:19PM -0700, Konstantin Svist wrote:
> alright, so far I have:
>=20
> net.ipv4.tcp_window_scaling =3D 1
> net.ipv4.tcp_syncookies =3D 1
> net.core.rmem_max =3D 16777216
> net.core.wmem_max =3D 16777216
> net.ipv4.tcp_rmem =3D 4096 87380 16777216
> net.ipv4.tcp_wmem =3D 4096 65536 16777216
> net.ipv4.tcp_no_metrics_save =3D 1

AFAIK those values do not influence netfilter performance,
just local tcp socket performance.

> net.ipv4.netfilter.ip_conntrack_max =3D 1024000
>=20
>=20
> what would you recommend for the buckets? is default (8192) reasonable?

At the moment I am always setting this to the value of ip_conntrack_max
(on the theory that this should result in constant lookup times), as I
can spare the memory. But I haven't run any real performance tests with
lower hash bucket counts....

The FAQ says though, that one should use odd hash bucket counts, so you
might want to decrease that by one.


--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFGoGjmgF9cFv867HwRAv5eAJ99p0MauvEDBqTsBV6EgEdT4ph49wCfRL9x
c2a3zjOFyeoS1SEn+6ho5GE=
=yUZJ
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--

