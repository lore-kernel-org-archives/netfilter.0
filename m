From: Alexander Samad <alex@samad.com.au>
Subject: Re: state match support in ip6tables
Date: Fri, 12 Mar 2004 11:08:55 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040312000855.GE26800@samad.com.au>
References: <1079045669.6476.3.camel@localhost> <20040311233044.GC26800@samad.com.au> <1079049557.20501.6.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="//IivP0gvsAy3Can"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1079049557.20501.6.camel@localhost>
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


--//IivP0gvsAy3Can
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2004 at 12:59:18AM +0100, marco wrote:
> this mean i cannot set my input policy to drop, or i'll kill all my ack
> packets, right?
What it means is that you can't use -match state  so you don't have
access to the NEW, ESTABLISH or RELATED=20

You can still check on all the ip flags

Alex

>=20
> Il ven, 2004-03-12 alle 00:30, Alexander Samad ha scritto:
> > On Thu, Mar 11, 2004 at 11:54:30PM +0100, marco wrote:
> > > hi all, i need help with ip6tables and match support
> > >=20
> > > can i use it with vannilla2.4?
> > > where can i get a patch to enable the it (evenif there's one)?
> >=20
> > Conntection tracking isn't implemented in ipv6 AFSIK.
> >=20
> > >=20
> > > tnx
> > >=20
> > >=20
> > >=20
>=20
>=20
>=20

--//IivP0gvsAy3Can
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAUP+XkZz88chpJ2MRAqNpAJwJH+isZfpHCj+SfgkdYCW4bPzeFgCgmL6e
4E6g3fznjS/qmz5wGJJsyQw=
=MrwG
-----END PGP SIGNATURE-----

--//IivP0gvsAy3Can--

