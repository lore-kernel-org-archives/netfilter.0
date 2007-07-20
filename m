From: Thomas Jacob <jacob@internet24.de>
Subject: Re: even hash tables sizes, FAQ entry
Date: Fri, 20 Jul 2007 09:41:34 +0200
Message-ID: <20070720074134.GB17809@internet24.de>
References: <469FE2DC.90300@relevad.com>
	<Pine.LNX.4.63.0707191516340.23721@qynat.qvtvafvgr.pbz>
	<469FE85B.3010502@relevad.com>
	<20070719225931.GA17114@internet24.de>
	<469FF100.5020509@relevad.com>
	<20070719232836.GA17202@internet24.de>
	<469FF52F.5010301@relevad.com>
	<20070719234741.GB17253@internet24.de>
	<Pine.LNX.4.63.0707191712150.23721@qynat.qvtvafvgr.pbz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CdrF4e02JqNVZeln"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.63.0707191712150.23721@qynat.qvtvafvgr.pbz>
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


--CdrF4e02JqNVZeln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 19, 2007 at 05:13:11PM -0700, David Lang wrote:
[..]
> >Is this still true? What is the reason for this? And: Does
> >any odd hashtable size work as well as other odd hash tables sizes
> >in the same order of magnitude?
>=20
> changing conntrack_max is not chaning the hash bucket count, that change=
=20
> can only be done in the code or as a module parameter at module load time.

Sure, I meant odd hash bucket counts of course, so is this
FAQ still accurate?

--CdrF4e02JqNVZeln
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFGoGcugF9cFv867HwRAvV3AKDFrBG029U1LbMm1m05ya5YcGF5cQCgpAC9
PVm18X0h2cvtTf5b01nI1JU=
=IXsY
-----END PGP SIGNATURE-----

--CdrF4e02JqNVZeln--

