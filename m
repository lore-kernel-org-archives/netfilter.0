From: Harald Welte <laforge@netfilter.org>
Subject: Re: ip_conntrack_pptp
Date: Mon, 26 Jan 2004 17:19:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040126161951.GD19250@sunbeam.de.gnumonks.org>
References: <20040122175345.GN1810@obroa-skai.de.gnumonks.org> <000d01c3e3ed$9875b0f0$2d64a8c0@pcjka>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2hMgfIw2X+zgXrFs"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000d01c3e3ed$9875b0f0$2d64a8c0@pcjka>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jan Kaastrup <jka@protego.dk>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2004 at 10:20:10AM +0100, Jan Kaastrup wrote:
> Hi Harald
>=20
> I have read the README file for POM - and I cannot find anything that
> could tell what is wrong:(

The README doesn't tell you anywhere to apply that patchc manually.  It
tells you to run the './runme' script.

However, you are telling me, that you are manually applying the patch.
Witch will only give you about 90% of the required changes, not all of
them.

> >I do something like this for patching my kernel (2.4.21):
> >patch -p1 < ./path-o-mat.../ip_conntrack_pptp.patch, and everything
> >seems allright.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--2hMgfIw2X+zgXrFs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAFT4nXaXGVTD0i/8RApJxAJ9zfhMx+IQXPKlilDMo4o/7/Q+y3ACfWjBE
1HNjHX8m005ZUofhVoVpg/M=
=TrXD
-----END PGP SIGNATURE-----

--2hMgfIw2X+zgXrFs--

