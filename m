From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: NAT for multiple non-directly connected subnets
Date: Thu, 08 Nov 2007 16:25:55 -0600
Message-ID: <1194560755.19115.110.camel@grateful.d.umn.edu>
References: <e97f32c10711081353t5602912fr560386581cd39c7@mail.gmail.com>
	 <1194559495.19115.105.camel@grateful.d.umn.edu>
	 <e97f32c10711081417s19405b28p39cdf353ac2731cb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-r4lwu9d8hOxOU8F46UPw"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e97f32c10711081417s19405b28p39cdf353ac2731cb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Bradley Kite <bradley.kite@gmail.com>
Cc: netfilter@vger.kernel.org


--=-r4lwu9d8hOxOU8F46UPw
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


On Thu, 2007-11-08 at 22:17 +0000, Bradley Kite wrote:
> On 08/11/2007, Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:

[...]

> > Perhaps do some logging (-j LOG) or check the counters on the various
> > chains.
> >
> > # iptables -t nat -L -v -n
>=20
> Hmm. The pre-routing couters are increasing, but that is all. When I
> ping from the router then the post-routing counters increase (because
> its directly connected).

Is your rp_filter getting in the way?

# cat /proc/sys/net/ipv4/conf/eth1/rp_filter

If this returns 1, then:

# echo 0 > /proc/sys/net/ipv4/conf/eth1/rp_filter

Of course setting it in /etc/sysctl.conf for reboots.

--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-r4lwu9d8hOxOU8F46UPw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHM4zzU+eIf4TiLaIRAuphAJ9P2fus0IWnoonFCx8Mz2O9WFENTgCfQLOj
knooR7XgRTcgy/BtCBcevVo=
=idJV
-----END PGP SIGNATURE-----

--=-r4lwu9d8hOxOU8F46UPw--

