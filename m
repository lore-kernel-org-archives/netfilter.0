From: Harald Welte <laforge@netfilter.org>
Subject: Re: PPTP Nat Conflicts with PPTP server
Date: Fri, 3 Oct 2003 12:17:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003101730.GT5758@sunbeam.de.gnumonks.org>
References: <00aa01c388c7$53e2d570$2800a8c0@karu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LF8A4izpY2Fai3uI"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <00aa01c388c7$53e2d570$2800a8c0@karu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Venkatesh. K" <venkatesh@cbayscribe.com>
Cc: netfilter@lists.netfilter.org


--LF8A4izpY2Fai3uI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2003 at 02:56:46PM +0530, Venkatesh. K wrote:
> Hi,
>=20
> when ip_nat_proto_gre module is loaded, the pptp connections to the
> server fail. It seems ip_nat_proto_gre.o module confilicts with PPTP
> server.

which version of the pptp-conntrack-nat.patch have you been using?

This was a well known problem with old versions.

> Thanks
> Venkatesh

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--LF8A4izpY2Fai3uI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fUy6XaXGVTD0i/8RAphqAJ9ymkiDfuNiwHdF/6xQtM7BAmdltgCdGjzM
qg/XP/c0rRYa7NT6pPd7Fbw=
=dpRp
-----END PGP SIGNATURE-----

--LF8A4izpY2Fai3uI--

