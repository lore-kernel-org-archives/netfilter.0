From: Harald Welte <laforge@netfilter.org>
Subject: Re: failed to configure iptables with 2.6.16 kernel
Date: Tue, 28 Mar 2006 12:23:46 +0200
Message-ID: <20060328102346.GJ28782@sunbeam.de.gnumonks.org>
References: <064G9Y712@briare1.heliogroup.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qVHblb/y9DPlgkHs"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751298AbWC1KXv@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <064G9Y712@briare1.heliogroup.fr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Hubert Tonneau <hubert.tonneau@fullpliant.org>
Cc: linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org


--qVHblb/y9DPlgkHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2006 at 01:10:54PM +0000, Hubert Tonneau wrote:
> Harald Welte wrote:
> >
> > this sounds like you're missing support for the tcp/udp match.
> > This functionality is implemented in xt_tcpudp.{c,ko}, which is compiled
> > as soon as x_tables is compiled.
>=20
> Loading 'xt_tcpudp' module solves the problem. Thanks for the answer.

great.

> So, the problem was just that the new 'x_tables' module is loaded automat=
ically
> according to modules dependencies, but 'xt_tcpudp' is not.

that is strange, since the iptables userspace program should explicitly
request loading that module. =20

unfortunately you didn't reply to my question on the version number of
the iptables program.  Maybe we have some yet-unknown issues with old
iptables versions, and I want to get to the bottom of this.

--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--qVHblb/y9DPlgkHs
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEKQ6yXaXGVTD0i/8RAnSNAKCKF2iy3ZbreCdUBzPyVX3rJzPqjQCfeXF/
dP/3MX7a5Qe68ysHRFgHB/Q=
=Tif9
-----END PGP SIGNATURE-----

--qVHblb/y9DPlgkHs--
