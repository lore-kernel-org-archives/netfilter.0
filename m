From: Harald Welte <laforge@netfilter.org>
Subject: Re: TFTP crashes the linux system...
Date: Tue, 27 Jan 2004 02:35:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040127013549.GL19250@sunbeam.de.gnumonks.org>
References: <BBKGNGAPNMGCAKAA@mailcity.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M2Pxvdb9QxnGd/3e"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BBKGNGAPNMGCAKAA@mailcity.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Gautham Thavva <gautham.thavva@lycos.com>
Cc: netfilter@lists.netfilter.org


--M2Pxvdb9QxnGd/3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2004 at 06:20:20PM -0500, Gautham Thavva wrote:
>=20
> I have enforced a firewall, using iptables-1.2.6a, on a target board runn=
ing TimeSys Linux Kernel(Kernel version is 2.4.7-10).
>=20
> I have applied the *tftp* patch available in the patch-o-matic.=20

i strongly doubt that you will get this wokring with such an incredibly
old kernel...  You'd basically need to backport more than two years of
netfilter/iptables development on top of 2.4.7...

The patch-o-matic README doesn indicate that it only supports 2.4.18 and
later.

> With regards,
> Gautham Thavva

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--M2Pxvdb9QxnGd/3e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAFcB1XaXGVTD0i/8RAgpyAJ4kOWjCxHAzL0+fPCwg0+wgxV5vxwCePnEm
ArCjDfGIA+JNfZHcitrv0rk=
=8ZwW
-----END PGP SIGNATURE-----

--M2Pxvdb9QxnGd/3e--

