From: Alexander Samad <alex@samad.com.au>
Subject: Re: vpn under linux
Date: Sun, 11 Apr 2004 09:41:27 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040410234127.GD14988@samad.com.au>
References: <4077B7EF.5070805@tin.it> <200404101018.38664.Antony@Soft-Solutions.co.uk> <4077C15E.9080701@tin.it> <200404101100.25648.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TybLhxa8M7aNoW+V"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200404101100.25648.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter <netfilter@lists.netfilter.org>


--TybLhxa8M7aNoW+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 10, 2004 at 11:00:25AM +0100, Antony Stone wrote:
> On Saturday 10 April 2004 10:41 am, Gianni Pucciani wrote:
>=20
> > Hi,
> > I forget one things, waht about the CIPE solution. I read that in the
> > rh9 sec guide about VPN.
>=20
> Yes, I should have mentioned that.   It uses a different method for encry=
pting=20
> the data than IPsec does (Blowfish instead of 3DES) and is therefore supp=
osed=20
> to be faster.   However in my experience you need to have a *big* pipe to=
 the=20
> outside world in order to be encrypting so much data down your VPN that a=
=20
> basic CPU can't handle it.
>=20
> I've never used CIPE so can't comment on it in practice.
>=20
> I tend to use the standard which is supported by most other vendors for=
=20
> cross-compatibility, therefore I like IPsec.
>=20
> > And then, I see this  news:  the FreeS/WAN project is no longer in
> > active development, it could be a problem?
>=20
> I don't regard it as a problem - I think people will continue to use the=
=20
> latest version for setting up IPsec with Linux 2.4 kernels, and they'll=
=20
> migrate to using the built-in IPsec for 2.6 kernels.
>=20
> The main reason that FreeS/WAN is no longer being developed is because=20
> although it works well as a VPN, the team don't think they can achieve on=
e of=20
> their goals, which was Opportunistic Encryption (using DNS to hold public=
=20
> keys so that routers could create VPN tunnels on their own when they want=
ed=20
> to talk to each other, instead of being manually configured to set up=20
> specific tunnels).
>=20
> In my opinion that doesn't stop it still being very useful as a way to=20
> configure standard IPsec links.

Development has moved to openswan=20

>=20
> Regards,
>=20
> Antony.
>=20
> --=20
> The difference between theory and practice is that in theory there is no=
=20
> difference, whereas in practice there is.
>=20
>                                                      Please reply to the =
list;
>                                                            please don't C=
C me.
>=20
>=20
>=20

--TybLhxa8M7aNoW+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAeIYnkZz88chpJ2MRAp14AKCHljW9GIVAIOkJVRciDI2PMzfTRwCffiz8
Oa+m1qYDLXpvbIdXyud2jXw=
=/01t
-----END PGP SIGNATURE-----

--TybLhxa8M7aNoW+V--

