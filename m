From: Thomas Jacob <jacob@internet24.de>
Subject: Re: need advice for high traffic network
Date: Fri, 20 Jul 2007 01:44:58 +0200
Message-ID: <20070719234458.GA17253@internet24.de>
References: <469FE2DC.90300@relevad.com>
	<Pine.LNX.4.63.0707191516340.23721@qynat.qvtvafvgr.pbz>
	<469FE85B.3010502@relevad.com>
	<20070719225931.GA17114@internet24.de>
	<469FF100.5020509@relevad.com>
	<20070719232836.GA17202@internet24.de>
	<469FF52F.5010301@relevad.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
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


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hmm, not sure really, but lower TIME WAIT settings should keep
your conntrack table afloat at least ;-)

I'd rather increase ip_conntrack_max and ip_conntrack_buckets
to the values suggested by David,=20


http://www.netfilter.org/documentation/FAQ/netfilter-faq-3.html#ss3.7

On Thu, Jul 19, 2007 at 04:35:11PM -0700, Konstantin Svist wrote:
> Sorry, I meant:
> Which parameters are those and what values would you recommend?
>=20
> Thanks!
>=20
>=20
> Thomas Jacob wrote:
> >On Thu, Jul 19, 2007 at 04:17:20PM -0700, Konstantin Svist wrote:
> > =20
> >>How do I reduce those timers?
> >>   =20
> >
> >echo <VALUE>  > /proc/sys/net/ipv4/netfilter/<SETTING>
> >
> > =20
>=20

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFGn/d6gF9cFv867HwRArd8AJ9wQTbv1vGkP7dMAcnwVxrNqRr7RgCeID94
kW3D5fWU7eWSVr+irC7xdUY=
=9bPZ
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--

