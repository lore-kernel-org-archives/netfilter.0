From: Alexander Samad <alex@samad.com.au>
Subject: Re: how to block p2p
Date: Thu, 11 Mar 2004 20:38:53 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040311093853.GU1072@samad.com.au>
References: <001201c40744$1f34a190$2a245cc2@cea05> <1078995674.15566.65.camel@raylinux.internal> <200403110910.19979.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8gjvNdKnYEg0NgYj"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200403110910.19979.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--8gjvNdKnYEg0NgYj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2004 at 09:10:19AM +0000, Antony Stone wrote:
> On Thursday 11 March 2004 9:01 am, Ray Leach wrote:
>=20
> > On Thu, 2004-03-11 at 10:37, Tomasz Macioszek wrote:
> > > Hello!!
> > > I would like to block all known p2p program ( Kazaa, eDonkey, ...). I
> > > would like to find patch of iptables (p-o-m) which blocks all this
> > > programs??
> >
> > iptables -P FORWARD DROP
>=20
> I would perhaps add:
> iptables -F FORWARD
> just to make sure they don't sneak through on any existing rules :)

sysctl -w net.ipv4.ip_forward =3D 0

>=20
> Antony.
>=20
> --=20
> The truth is rarely pure, and never simple.
>=20
>  - Oscar Wilde
>=20
>                                                      Please reply to the =
list;
>                                                            please don't C=
C me.
>=20
>=20
>=20

--8gjvNdKnYEg0NgYj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAUDOtkZz88chpJ2MRAlZBAKDK21N/qT3S0PKm9r9L+L26ddAXAQCfbeXM
daDMtGSdGNaAHTnqTzUhA54=
=HXLv
-----END PGP SIGNATURE-----

--8gjvNdKnYEg0NgYj--

