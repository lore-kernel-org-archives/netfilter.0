From: Alexander Samad <alex@samad.com.au>
Subject: Re: firewall protocols
Date: Fri, 8 Apr 2005 10:33:30 +1000
Message-ID: <20050408003330.GC8563@samad.com.au>
References: <5.2.1.1.0.20050407162450.020caa30@pop.av.eastlink.ca>
	<42557D73.7070500@provident-solutions.com>
	<Pine.LNX.4.60.0504071609440.23293@darkstar.sysinfo.com>
	<20050407221351.GA8563@samad.com.au>
	<Pine.LNX.4.60.0504071927220.24064@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.60.0504071927220.24064@darkstar.sysinfo.com>
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
To: netfilter@lists.netfilter.org


--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 07, 2005 at 07:29:24PM -0400, R. DuFresne wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On Fri, 8 Apr 2005, Alexander Samad wrote:
>=20
> >
> >
> >can always try a netstat -pane | grep 23 to see what is using/listening
> >on port 23
> >
>=20
> And that will work, as long as telnetd is presently being used or used=20
> very recently.  Remember inetd, being the super server launches all it=20
> cares for as they are asked for...they run for the time required and then=
=20
> go sleep, until inetd get a request to relaunch one of the daemons it=20
> manages...

should you still see a listen on port 23 ? the process will be inetd
instead of telnetd - which is why I grepped for 23 and not telentd

>=20
>=20
> Thanks,
>=20
> Ron DuFresne
> - --=20
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         admin & senior security consultant:  sysinfo.com
>                         http://sysinfo.com
> Key fingerprint =3D 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>=20
> ...We waste time looking for the perfect lover
> instead of creating the perfect love.
>=20
>                 -Tom Robbins <Still Life With Woodpecker>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
>=20
> iD8DBQFCVcJWst+vzJSwZikRAjdtAKDOkEvI3kbmsbs2AXni4KPiCWktNQCZAceE
> v8tr5NSET+Z6WGM9t3x3YuU=3D
> =3DXGFv
> -----END PGP SIGNATURE-----
>=20

--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCVdFakZz88chpJ2MRAkkuAJ0U0d/zcaK4Nmr2NKzmlc69WM8fuQCgxBIR
iv3WaSX1R83Of6riGu0wgus=
=zgzT
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--

