From: Harald Welte <laforge@netfilter.org>
Subject: Re: compilation problem with cuseeme patch.
Date: Sun, 15 Feb 2004 16:28:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040215152832.GM15567@sunbeam.de.gnumonks.org>
References: <1076587638.1004.49.camel@krishnap>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3hAdtgBjtgL7p0NQ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1076587638.1004.49.camel@krishnap>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Krishna Prasanth P <krishnap@teneoris.com>
Cc: netfilter@lists.netfilter.org


--3hAdtgBjtgL7p0NQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2004 at 05:36:50PM +0530, Krishna Prasanth P wrote:
> Hi!!
>  I'm trying to use cuseeme patch with netfilter and downloaded the patch
> from the cvs repository.

a) Which kernel version are you using
b) did you correctly use the 'runme' program or did you apply the patch
   manually?

> While building the kernel with the new patch, i'm not able to do
> linking. The reason is the cuseeme(ip_nat_cuseeme.c) is using function
> ip_nat_mangle_udp_packet() function which is not defined.

net/ipv4/netfilter/ip_nat_helper.c includes this function, at least in
all kernels released for at least one year.

> -prasanth

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--3hAdtgBjtgL7p0NQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAL5AgXaXGVTD0i/8RApIkAKCwQXb28nznTvqS+goVkVHhfTA66QCeJT+o
WGXb64/YpCiLBlbUTgzyeyw=
=A9Mt
-----END PGP SIGNATURE-----

--3hAdtgBjtgL7p0NQ--

