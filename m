From: Harald Welte <laforge@netfilter.org>
Subject: Re: Generate a unified patch for source RPM
Date: Fri, 3 Oct 2003 12:50:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003105021.GE5758@sunbeam.de.gnumonks.org>
References: <003a01c3837f$e482d2d0$2800a8c0@karu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TrGrrwHz9iYGKlIl"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <003a01c3837f$e482d2d0$2800a8c0@karu>
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


--TrGrrwHz9iYGKlIl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2003 at 09:42:48PM +0530, Venkatesh. K wrote:
> Hi,
>=20
> I want to patch the RedHat Kernel RPM.
>=20
> How do I generate a single patch file from patch-o-matic which can be
> applied to an src.rpm ?

# pom2patch - create a normal unified diff (patch) from patch-o-matic

included in the patch-o-matic directory

syntax is:

pom2patch my_kernel_source_dir submitted/00_foo.patch

(you have to run it seperately for every patch-o-matic patch)

> Venkatesh K
--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--TrGrrwHz9iYGKlIl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fVRtXaXGVTD0i/8RAlXPAJ9SAKQSPBBQD7qeFp6tLouSUGP1RgCgibfw
FK1X2JRr/LGosucATgvyrZA=
=AZpy
-----END PGP SIGNATURE-----

--TrGrrwHz9iYGKlIl--

