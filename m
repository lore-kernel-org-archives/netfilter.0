From: Thomas Jacob <jacob@internet24.de>
Subject: Re: need advice for high traffic network
Date: Fri, 20 Jul 2007 00:49:09 +0200
Message-ID: <20070719224909.GA17077@internet24.de>
References: <469FE2DC.90300@relevad.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <469FE2DC.90300@relevad.com>
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


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment
Content-Transfer-Encoding: quoted-printable

> I'l looking at nf-HiPAC right now - will probably try it some time soon.=
=20
> Beyond that, I'm out of ideas for the moment.

nf-HiPAC won't help there if you just have 25 rules
( =3D> http://people.netfilter.org/kadlec/nftest.pdf ), the problem is
very likely down to you using the default parameters for the conntrack hash=
 table,
just like the other reply indicated.


--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFGn+plgF9cFv867HwRAmUIAJ40k7HEI3NMbrn59fiHPU/pXDD4fgCggLd8
TGD5coMyLuNG/6pGEvjkmKM=
=8/IC
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--

