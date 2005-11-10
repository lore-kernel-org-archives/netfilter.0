From: Alexander Samad <alex@samad.com.au>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Thu, 10 Nov 2005 14:18:34 +1100
Message-ID: <20051110031834.GB9770@samad.com.au>
References: <4372A919.8020100@rosi-kessel.org>
	<4372A989.5090606@rosi-kessel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4372A989.5090606@rosi-kessel.org>
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
To: Adam Rosi-Kessel <adam@rosi-kessel.org>
Cc: netfilter@lists.netfilter.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2005 at 08:59:37PM -0500, Adam Rosi-Kessel wrote:
> Adam Rosi-Kessel wrote:
> > I'm troubleshooting an issue of accessing a VPN through NAT. Right now =
the
> > problem can be reduced to the following question:
> > Under what conditions would inbound packets not be routing through the =
nat
> > PREROUTING chain?
>=20
> I should add that, just for debugging purposes, the default policy for all
> chains is set to ACCEPT. There are also no DROP rules anywhere in any tab=
le
> (again, just for debugging).

my understanding is that the NAT table only sees the initial packets of
a connection

if this is ipsec it could be a ipsec problem ?

> --=20
> Adam Rosi-Kessel
> http://adam.rosi-kessel.org
>=20



--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDcrwKkZz88chpJ2MRAg4dAKCMWg2Efb8nxv7g1nH0vfjjOmNopQCffVOK
MTzaW5XyOxmvfPTa18Ovt+k=
=4FoS
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--

