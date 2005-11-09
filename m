From: Alexander Samad <alex@samad.com.au>
Subject: Re: kernel freeze issue
Date: Thu, 10 Nov 2005 09:44:54 +1100
Message-ID: <20051109224454.GA9770@samad.com.au>
References: <43692579.8000807@elte.hu> <200511091201.03783@nienna>
	<43721E94.7060806@elte.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <43721E94.7060806@elte.hu>
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
To: Zoltan Nagy <kirk@elte.hu>
Cc: netfilter@lists.netfilter.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2005 at 05:06:44PM +0100, Zoltan Nagy wrote:
>=20
>=20
> KOVACS Krisztian wrote:
> >>today's surprise:
> >>	ip l s eth0 promisc on	=3D=3D> freeze, without any trace ;)
> >=20
> >=20
> >   You could still try getting a backtrace with SysRq + P.
> >=20
>=20
> tried, sysrq not responding...
>=20
> regards

try booting with these kernel parameters
nmi_watchdog=3D1 console=3DttyS0,9600n8 console=3D/dev/tty0

it will setup nmi_watchdog and will also send all you syslog stuff out
to the serial port.

Then connect serial port to another machine to capture the oops/crash

>=20
>=20
>=20

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDcnvmkZz88chpJ2MRAqKGAKC1BIqXPL9Vxmiqou0w4N+zXujgSQCfdX67
wBwGnOboVZTT9diOqWTANWw=
=8b8R
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--

