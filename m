From: Harald Welte <laforge@netfilter.org>
Subject: Re: Netfilter in an HA-Enviroment
Date: Tue, 7 Oct 2003 10:47:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031007084741.GE18246@sunbeam.de.gnumonks.org>
References: <200310070137.AA367067176@mirrormind.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200310070137.AA367067176@mirrormind.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Simon Lodal <simonl@mirrormind.com>
Cc: netfilter@lists.netfilter.org


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2003 at 01:37:24AM +0200, Simon Lodal wrote:
>=20
> Hello
>=20
> Harald, I read your paper, and I'd love something like this. As I
> understand it, you imply a one master / multiple slaves model.
> However, what would prevent your protocol from being used in a
> master/master setup?

the protocol is not strictly limited to that.    However, you would need
a way of distributing the load between the nodes _without_ a loadsharing
box in front of them, because otherwise this box again has the problem
of having to deal with all packets.

> That would be much better, sometimes one fast machine is not enough.
> Each master could have a lighter load, and therefore more ressources
> to communicate with the others. And when one master goes down, only a
> group of users will be bothered by the delay before the others catch
> up it's traffic.

This is theoretically an option once the master/multiple slave model has
been implemented.   But don't underestimate the complexity behind this. =20

> Simon
--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/gn2tXaXGVTD0i/8RAs77AJwM4Os6i/tZLk3sF7bKxr9TcP2i4ACfavYg
RJgfOAoUbuzxwD2yhXRBQRk=
=DHNe
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--

