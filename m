From: Harald Welte <laforge@netfilter.org>
Subject: Re: Logging only the first 20 packets of a new connection
Date: Tue, 1 Feb 2005 15:27:52 +0100
Message-ID: <20050201142752.GV6878@sunbeam.de.gnumonks.org>
References: <200501071829.j07ITSXH082515@jkcpub.iserver.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AEkhIf3vy/ReXTu0"
Content-Disposition: inline
In-Reply-To: <200501071829.j07ITSXH082515@jkcpub.iserver.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: Deepak Seshadri <dseshadri@broadbandmaritime.com>
Cc: netfilter@lists.netfilter.org


--AEkhIf3vy/ReXTu0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 07, 2005 at 01:29:28PM -0500, Deepak Seshadri wrote:
> Hello everybody,
>=20
> Could someone suggest how would I log only the first 15 or 20 packets of =
any
> new connection?

this should now be possible using ipt_connbytes.

iptables -A FORWARD -j ULOG -m connbytes --connbytes 0:15 --connbytes-dir b=
oth --connbytes-mode packets

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--AEkhIf3vy/ReXTu0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFB/5HoXaXGVTD0i/8RAhSoAJ9q4JjdNCQDl863Fy98A/jOQF9jUwCfdobP
IIj3pA8FzqvLn9+xQDFX0RY=
=GjpN
-----END PGP SIGNATURE-----

--AEkhIf3vy/ReXTu0--

