From: Harald Welte <laforge@netfilter.org>
Subject: Re: LKM unresolved symbol nf_register_hook..
Date: Tue, 15 Jul 2003 18:13:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030715161305.GQ7198@naboo>
References: <007a01c34732$94a7aee0$6401a8c0@williams>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCFQJunhLz1tFGpX"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <007a01c34732$94a7aee0$6401a8c0@williams>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: James Williams <james@ikennect.com>
Cc: netfilter@lists.netfilter.org


--lCFQJunhLz1tFGpX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2003 at 02:28:23PM -0800, James Williams wrote:
> All-
>=20
> I am building an LMK. The module compiles and links with no problem.
> When I use insmod, i.e /sbin/insmod iroute.o, I get an error
> "unresolved symbol nf_register_hook". Any thoughts?

This is a development question. Why don't you ask it on the
netfilter-devel list?

Regarding the problem: It seems like your kernel was compiled without netfi=
lter support.

> I am using Kernel 2.4.20.
> James
--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--lCFQJunhLz1tFGpX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/FCgRXaXGVTD0i/8RAnLKAKCwOA0DiFXmdAg7I7ZtQr4owFkCMwCfeBAF
YtcsJ6uTmfTXxvLSyoZQ6Q8=
=Q4z1
-----END PGP SIGNATURE-----

--lCFQJunhLz1tFGpX--

