From: Harald Welte <laforge@netfilter.org>
Subject: Re: IPV6 and NetFilter
Date: Tue, 15 Jul 2003 17:22:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030715152255.GL7198@naboo>
References: <008301c34a04$58d3b560$7dadfea9@win981>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6J7GEvtanOfV9oXA"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <008301c34a04$58d3b560$7dadfea9@win981>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Carlos Delfino Carvalho Pinheiro <suporte@carlosdelfino.eti.br>
Cc: netfilter <netfilter@lists.netfilter.org>


--6J7GEvtanOfV9oXA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2003 at 09:28:08AM -0300, Carlos Delfino Carvalho Pinheiro =
wrote:
> Hi Netfilters!!!
>=20
> I want use IPV6 in my lab, but I dont know like make this with
> IPTables!

Sure, ip6tables handles IPv6 packet filtering:

See the 'man ip6tables' manpage.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--6J7GEvtanOfV9oXA
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/FBxPXaXGVTD0i/8RAipGAKCjEEI2gEcGY+TaiX5tjpQy1EwVAgCeK3zl
2g26O/z2qiqvEoLQHRFV2VM=
=7Y+J
-----END PGP SIGNATURE-----

--6J7GEvtanOfV9oXA--

