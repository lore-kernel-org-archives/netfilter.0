From: Harald Welte <laforge@netfilter.org>
Subject: Re: Iptables 1.2.9 compilation problem with kernel 2.6.2
Date: Sun, 15 Feb 2004 16:58:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040215155828.GP15567@sunbeam.de.gnumonks.org>
References: <002401c3eed4$1624e520$c2bf09ca@huecal>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZqRzwd/9tauJXEMK"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <002401c3eed4$1624e520$c2bf09ca@huecal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: B H R Balaji <balaji@sol.net.in>
Cc: netfilter@lists.samba.org


--ZqRzwd/9tauJXEMK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 09, 2004 at 11:45:16AM +0530, B H R Balaji wrote:
> Hi all
>=20
> i have already installed FEDORA in PC
>=20
> i have downloaded the Latest Kernel 2.6.2
>=20
> i have uninstalled old RPM of iptables
> Downloaded 1.2.9

please try without using the connlimit patch.  It seems to mess up the
includes.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--ZqRzwd/9tauJXEMK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAL5ckXaXGVTD0i/8RAkR8AJ0WeGMf4TYnYfJcd0tFu3ZsM78L1QCeMGxR
hAdkw6kg4xmAgJl8RQ8vWEc=
=jfgD
-----END PGP SIGNATURE-----

--ZqRzwd/9tauJXEMK--

