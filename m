From: Harald Welte <laforge@netfilter.org>
Subject: Re: Change iptables log format (would be a nice feature)
Date: Tue, 7 Oct 2003 11:47:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031007094746.GJ18246@sunbeam.de.gnumonks.org>
References: <Pine.LNX.4.56L0.0310021637520.11122@sutsko.kollegie.dk> <1065456746.1189.32.camel@valhalla>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vA66WO2vHvL/CRSR"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1065456746.1189.32.camel@valhalla>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: "Lasse B. Jensen" <gymer@odense.kollegienet.dk>, netfilter@lists.netfilter.org


--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 06, 2003 at 12:12:26PM -0400, Chris Brenton wrote:
> On Thu, 2003-10-02 at 10:40, Lasse B. Jensen wrote:
> >
> > Is it possible to change the log format of iptables?
>=20
> As others have pointed out this is not possible, however it might make a
> nice feature to be added in. I've noticed that in high bandwidth
> environments what chokes throughput the most is logging.=20

This is why you should use ULOG / ulogd if you log many packets.

> Just my $.02,
> Chris

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--vA66WO2vHvL/CRSR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/govCXaXGVTD0i/8RAr/qAKCNs+vdsrryCaSspF/FxU1tgLFkZQCfW0nx
ky5Dg4dZ0wgOcJdeWNna36Q=
=X2Kq
-----END PGP SIGNATURE-----

--vA66WO2vHvL/CRSR--

