From: Frank =?iso-8859-1?Q?Matthie=DF?= <frankm@lug-owl.de>
Subject: Re: state match support in ip6tables
Date: Fri, 19 Mar 2004 13:45:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040319124503.GX2350@dvmwest.dvmwest.de>
References: <1079045669.6476.3.camel@localhost> <20040311233044.GC26800@samad.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eqq5Le9VNi5o1NaU"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040311233044.GC26800@samad.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--eqq5Le9VNi5o1NaU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Alexander Samad [2004-03-12 00:30 CET]:
> On Thu, Mar 11, 2004 at 11:54:30PM +0100, marco wrote:
> > hi all, i need help with ip6tables and match support
> >=20
> > can i use it with vannilla2.4?
> > where can i get a patch to enable the it (evenif there's one)?
>=20
> Conntection tracking isn't implemented in ipv6 AFSIK.

Do you know. why this isn't implemented yet?
Are there technical reasons or only a problem of priorities?

I would like to have IPv6 statefull inspection, because i and some others
want to play with IPV6 over freenet6. But making firewall rules w/o
statefull inspection isn't really funny, nor is it compareable.

Frank.
--=20
Frank Matthie=DF

[x] Nail here for new monitor.

--eqq5Le9VNi5o1NaU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAWutMLXa7dZqO5SERAlD3AKCnAmGs/kXz/8mlbF6JUZOOeCwjLQCfXNGh
c1XcO5OZzSM7hx53mQixnCM=
=oA3e
-----END PGP SIGNATURE-----

--eqq5Le9VNi5o1NaU--

