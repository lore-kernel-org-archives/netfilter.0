From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: Multihomed Problem
Date: Tue, 11 Dec 2007 16:30:06 -0600
Message-ID: <1197412206.19486.115.camel@grateful.d.umn.edu>
References: <475EFFF8.1010606@nwcascades.com>
	 <475F095A.7040003@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ZvfVkjx/4VHXRBSn03z1"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <475F095A.7040003@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


--=-ZvfVkjx/4VHXRBSn03z1
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Tue, 2007-12-11 at 16:04 -0600, Grant Taylor wrote:
> On 12/11/07 15:24, Jack Lauman wrote:
> > I have a multihomed linux box set up as follows:
> >=20
> > eth0: 192.168.100.1
> > eth1: 192.168.1.1
> >=20
> > I need to be able to print from a workstation at 192.168.100.2 to a=20
> > Xerox workstation at 192.168.1.30
>=20
> Ok...
>=20
> > How can I make this work?
>=20
> Seeing as how (I'm betting) you can not set up routing on the Xerox, you=20
> will probably need to NAT the traffic from the 192.168.100.x network to=20
> appear as if it is from 192.168.1.1.  This way when any system on the=20
> 192.168.100.x network tries to talk to the Xerox, it will think that=20
> 192.168.1.1 is talking to it and thus be able to reply back.

You wouldn't need to set up NAT if both IPs on the gnu/linux box are the
gateways for the respective networks. Just enable forwarding:

echo 1 > /proc/sys/net/ipv4/ip_forward

No NAT required, the linux box is aware of the subnets and will pass
traffic happily between them.

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-ZvfVkjx/4VHXRBSn03z1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHXw9uU+eIf4TiLaIRAtaWAJ97QYB8ausI8NEIXlyXCKMfXBEv6ACffvnu
GeXZOkFRt3lN6g1xlwR2kmQ=
=TM17
-----END PGP SIGNATURE-----

--=-ZvfVkjx/4VHXRBSn03z1--

