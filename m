From: Harald Welte <laforge@netfilter.org>
Subject: Re: Netfilter in an HA-Enviroment
Date: Fri, 3 Oct 2003 13:05:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003110543.GJ5758@sunbeam.de.gnumonks.org>
References: <20030922090449.1bf05024.Marc.Hansen@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G7SA92dllFmDflQV"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030922090449.1bf05024.Marc.Hansen@gmx.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Marc Hansen <Marc.Hansen@gmx.de>
Cc: netfilter@lists.netfilter.org


--G7SA92dllFmDflQV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2003 at 09:04:49AM +0200, Marc Hansen wrote:
> Hello,
> how is it possible to have two firewalls in an HA-Enviroment?

only if you do stateless packet filtering and no NAT.=20

> Does somebody have a hint or a link for me?

There is an ongoing implementation for conntrack state synchronization,
but it's not finished or public yet.

For the design paper, please
see
http://cvs.gnumonks.org/presentation/netfilter-failover-ols2002/netfilter-f=
ailover-ols2002.tex?rev=3D1.1&content-type=3Dtext/x-cvsweb-markup

> Marc=20

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--G7SA92dllFmDflQV
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fVgHXaXGVTD0i/8RAu1iAKCA+yVuulhWn3+9BfLoJXLOSkS5YQCfdFQo
p93TxLP2cWQSamDwQJtXrU4=
=NTOQ
-----END PGP SIGNATURE-----

--G7SA92dllFmDflQV--

