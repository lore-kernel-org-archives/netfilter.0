From: Harald Welte <laforge@netfilter.org>
Subject: Re: PPTP connection tracking and Poptop on same box
Date: Tue, 27 Jan 2004 03:00:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040127020050.GS19250@sunbeam.de.gnumonks.org>
References: <739652C2AFA4834AAB5986A215F68CEC4977@svr1.home.compsup.net> <200401190003.32170.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EcLUEBHJhOmOUQ0C"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200401190003.32170.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org, Carl Farrington <carl@compsup.net>


--EcLUEBHJhOmOUQ0C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2004 at 12:03:32AM +0000, Antony Stone wrote:
> On Sunday 18 January 2004 11:47 pm, Carl Farrington wrote:
>=20
> > From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
> >
> > > On Sunday 18 January 2004 11:00 pm, Carl Farrington wrote:
> > > > Does anybody know if there is a workaround for this problem? As soon
> > > > as I insmod ip_nat_pptp , poptop cannot accept any incoming pptp
> > > > connections.
> >
> > > Why do you want to use both of these on the same box?
>=20
> > Well, I want to do both. I am putting together a router/gateway box. It
> > performs NAT for all the workstations on the private side of the box
> > (hence the need for ip_nat_pptp since some workstations need to contact
> > outside pptp servers), and also allows access from the outside when
> > users are roaming (hence the need for poptop).
> >
> > Astaro Security Linux (www.astaro.com) is one product which achieves
> > this without problem using poptop, as is win2k rras.
>=20
> In that case your simplest solution might be to ask Astaro how they've do=
ne=20
> it.   Their products are based on Linux / netfilter etc, so should be ful=
ly=20
> GPL.

If you read the PPTP helper sourcecode, you will find that I wrote it
for astaro.  There's no black magic in ASL, they're using the same code
that is in patch-o-matic.

Carl: Are you sure you are running the latest pptp helper from
patch-o-matic (20031219) ?

> Antony
=20

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--EcLUEBHJhOmOUQ0C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAFcZSXaXGVTD0i/8RAjHEAJ91s56sTOTZKukZf2IMnMu6H5bJ7gCgm8EI
Q0MpsdEwXaLwxIfswY+kh1c=
=kKyQ
-----END PGP SIGNATURE-----

--EcLUEBHJhOmOUQ0C--

