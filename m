From: Harald Welte <laforge@gnumonks.org>
Subject: Re: PPTP/GRE NAT patch for 2.4.20 kernel
Date: Thu, 13 Feb 2003 10:25:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030213092522.GE28593@sunbeam.de.gnumonks.org>
References: <Pine.LNX.4.44.0302130334350.17214-100000@lucy.troja.mff.cuni.cz>
Reply-To: Netfilter Mailinglist <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0302130334350.17214-100000@lucy.troja.mff.cuni.cz>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Petr Vagera <pvg@lucy.troja.mff.cuni.cz>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2003 at 03:50:31AM +0100, Petr Vagera wrote:
>=20
> Hi Harald,
>=20
> I'm trying to get working PPTP/GRE NAT under Linux with 2.4.20 kernel.
>=20
> What is the status of PPTP/GRE NAT and is there any patch available for=
=20
> recent kernels ?

It seems to be working for most people in most cases, though there are
still some problems with big-endian and 64bit systems.

Please use the patch from the 'extra' repository of patch-o-matic from
cvs.

> Regards
> Petr Vagera

--=20
- Harald Welte <laforge@gnumonks.org>               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
"If this were a dictatorship, it'd be a heck of a lot easier, just so long
 as I'm the dictator."  --  George W. Bush Dec 18, 2000

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+S2SCXaXGVTD0i/8RAuKAAKCO90fKPh4550SQwnstjJs7c2ZrBACgsD4g
YXhvyZwVQ+aV3CAqs6DVeCM=
=8JHS
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--

