From: Stephane Delcroix <stephane@delcroix.org>
Subject: Re: --mac-dest matching
Date: Wed, 15 Sep 2004 14:23:56 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095251036.7600.20.camel@tartiflette>
References: <1095242190.2267.24.camel@tartiflette>
	<1095249731.1899.23.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-qJcrJp+6drh74U0aCamV"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095249731.1899.23.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--=-qJcrJp+6drh74U0aCamV
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,

Indeed, I'm setting up a bridge on a network with multiples gateways.
I need to set up port forwarding different for each gateway =3D> need --
mac-dest.

I can eventually MARK packets with ebtables and filter with iptables
later.
Maybe someone had done this before and give me more informations...

regards,

Stephane

Le mercredi 15 septembre 2004 =E0 08:02 -0400, Jason Opperisano a =E9crit :
> On Wed, 2004-09-15 at 05:56, Stephane Delcroix wrote:
> > Hi,
> > for a particular firewall, I need to match packet by mac-dest.
> > I didnt find anything neither in netfilter doc nor in the kernel
> > sources :(
> >=20
> > Is there a patch or an extension for netfilter to do that?
> >=20
> > regards,
> >=20
> > Stephane
>=20
> on a routing gateway; a destination MAC match is irrelevant, as the
> destination MAC will always be that of the local machine (this pretty
> much applies to a standalone host as well).
>=20
> destination MAC addresses are only really relevant to switches...
>=20
> anyways--i'm guessing you're probably trying to setup some sort of
> bridge--in which case, you need "ebtables" which is available at:
>=20
>         http://ebtables.sourceforge.net/
>        =20
> and can match on destination MAC address.
>=20
> my other guess would be maybe you're looking to match
> broadcasts/multicasts, in which case--the pkttype match may be of some
> interest to you.
>=20
> -j
>=20
--=20
Stephane Delcroix <stephane@delcroix.org>

--=-qJcrJp+6drh74U0aCamV
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBSDRcSfiQDLvtSM8RAspkAKCkUvTH2Z7uJYy0+61fOJ47AyUDpACggR0X
D14bAY5uUxu+Fm7ws3JFgJE=
=A3vQ
-----END PGP SIGNATURE-----

--=-qJcrJp+6drh74U0aCamV--


