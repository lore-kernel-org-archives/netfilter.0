From: Harald Welte <laforge@netfilter.org>
Subject: Re: [ANNOUNCE] rh7.3 / rh9 / cl9 RPMS of iptables-1.2.8 and ulogd-1.0.0
Date: Thu, 3 Jul 2003 12:31:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030703103132.GA7073@sunbeam.de.gnumonks.org>
References: <20030605104134.GH18183@sunbeam.de.gnumonks.org> <3F03F89D.5000108@lycos.es>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e+JRL32uBeeWnrD4"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3F03F89D.5000108@lycos.es>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: LMCM <docume@lycos.es>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--e+JRL32uBeeWnrD4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 03, 2003 at 11:34:21AM +0200, LMCM wrote:
> Hi Harald,
>=20
> As I read in a web, I can't remember which one, this problem ->=20
> http://www.secunia.com/advisories/8786, also affects to iptables or=20
> netfilter code.
> I would like to know if iptables 1.2.8 fixed that problem;bug.

iptables-1.2.8 is the userspace part.   The bug is inside the kernel, so
you need a recent kernel (2.4.21)

> LuisMi

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--e+JRL32uBeeWnrD4
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/BAYEXaXGVTD0i/8RAqZCAJ4x6f5XFVxGM2T8HUqCwFltwgcZqQCfYUPE
k/XR5Kqly/Co+JN63auN7uM=
=AAyf
-----END PGP SIGNATURE-----

--e+JRL32uBeeWnrD4--

