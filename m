From: Harald Welte <laforge@netfilter.org>
Subject: Re: Masquerading multiple VPN clients (Windows)
Date: Thu, 22 Jan 2004 15:30:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040122203039.GA10688@obroa-skai.de.gnumonks.org>
References: <20040122083018.5896a9da.bs@axysdesign.com> <20040122102939.71b72b55.bs@axysdesign.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040122102939.71b72b55.bs@axysdesign.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Vichaya Sidhipong <bs@axysdesign.com>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2004 at 10:29:39AM -0800, Vichaya Sidhipong wrote:
> Hi Harald,
>=20
> patch-o-matic 20031219
> kernel version 2.4.24, debian sid
> iptables 1.2.9, also patched and rebuilt
>=20
> I did load these modules:
>=20
> ip_conntrack_proto_gre
> ip_conntrack_pptp
> ip_nat_pptp

you are missing the ip_nat_proto_gre module

> Thank you,
> Bill

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAEDLvXaXGVTD0i/8RAiu1AKCmtiwPn0i2Cti5BF0ebglwkewKkgCdFiFP
ANKdLud2K5sVp0ZDZSYPzz0=
=DcF7
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--

