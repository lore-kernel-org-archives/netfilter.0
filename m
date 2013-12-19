From: Noel Butler <noel.butler@ausics.net>
Subject: Re: BUG ip6tables and helper
Date: Fri, 20 Dec 2013 07:50:14 +1000
Message-ID: <1387489814.4038.5.camel@tardis>
References: <1387438538.10463.0.camel@tardis>
	 <20131219092252.GA4828@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-rR13/mjWMX//8M3NnkQX"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20131219092252.GA4828@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-rR13/mjWMX//8M3NnkQX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pablo,

Thanks, patched.
build:        OK
execute:   OK
work for remote users:   time will tell :)


On Thu, 2013-12-19 at 10:22 +0100, Pablo Neira Ayuso wrote:=20
> Hi Noel,
>=20
> On Thu, Dec 19, 2013 at 05:35:38PM +1000, Noel Butler wrote:
> > Hi Pablo,
>=20
> Please, CC me if this is addressed to me. I read all mailing lists
> quite often but I have lots of email and chances are this gets lost
> increases.
>=20
> > Bug with ip6tables and helpers
> >=20
> > -j CT --helper irc
> >=20
> > ip6tables: No chain/target/match by that name.
> >=20
> > This *does* work with iptables
>=20
> I sent this patch time ago, just compiled tested:
>=20
> http://www.spinics.net/lists/netfilter/msg54642.html
>=20
> But got no feedback on it. Could you take it, give it a try and let me
> know if it fixes this issue? Thanks!
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=-rR13/mjWMX//8M3NnkQX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAABAgAGBQJSs2oVAAoJECg/hgl/0DbHiVsH/0R7dRC8BLokuSI8WukEIez4
SG81Tr6FTwhkb2rnPsFc5Gf4Mt6KMIKpWeCoD1VMVPSSbI3+heCjuUXf6MQaQeKd
t9XV3/qi7YG65TyTcBxZKFc7JGErMNo4Ai5b3qr3s1sNjIagHov3l3k+9BIcX2Rx
XXGH0i4E6jsdNSXJuFFTQe2xvWkPDeJ1d5UngBnD0LAXY8d4Z8rT4RO8mc0CJbJF
EzZlTQu9DQ5ZS9XAuLWOxkeRclFdo44Z+T+4wYxa7ffU9hDXU1wsgtzd31DVFb45
+GukK7wTf7FDtzpMOl/QiTt7Tp6JOrhGaYHzKxq5NDBlRadZgBkXuqSgtBM78GA=
=/jus
-----END PGP SIGNATURE-----

--=-rR13/mjWMX//8M3NnkQX--

