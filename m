From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: The "badguy" example in the man page not working (-->
	"iptables: No chain/target/match by that name")
Date: Fri, 14 Nov 2008 10:00:30 -0600
Message-ID: <1226678430.11373.265.camel@grateful.d.umn.edu>
References: <gfk58b$qlv$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-UaSj9KK62yV5bHHsoMzA"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gfk58b$qlv$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Adem <for-gmane@alicewho.com>
Cc: netfilter@vger.kernel.org


--=-UaSj9KK62yV5bHHsoMzA
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2008-11-14 at 16:22 +0100, Adem wrote:
> The following example from the man page doesn't work on my box:
>=20
>   iptables -A FORWARD -m recent --name badguy --rcheck --seconds 60 -j DR=
OP
>   iptables -A FORWARD -p tcp -i eth0 --dport 139 -m recent --name badguy =
--set -j DROP

I see 'eth0' in your rule, but below there is no eth0.

>=20
> It says: "iptables: No chain/target/match by that name"
>=20
> What could be the reason?
>=20
> My ifconfig:
>=20
> lo        Link encap:Local Loopback
>           inet addr:127.0.0.1  Mask:255.0.0.0
>           UP LOOPBACK RUNNING  MTU:16436  Metric:1
>           RX packets:382878 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:382868 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:3307823766 (3.0 GiB)  TX bytes:78410937 (74.7 MiB)
>=20
> venet0    Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-0=
0-00-00-00
>           inet addr:127.0.0.1  P-t-P:127.0.0.1  Bcast:0.0.0.0  Mask:255.2=
55.255.255
>           UP BROADCAST POINTOPOINT RUNNING NOARP  MTU:1500  Metric:1
>           RX packets:109018 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:101974 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:49437708 (47.1 MiB)  TX bytes:49733010 (47.4 MiB)
>=20
> venet0:0  Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-0=
0-00-00-00
>           inet addr:87.x.x.x  P-t-P:87.x.x.x  Bcast:0.0.0.0  Mask:255.255=
.255.255
>           UP BROADCAST POINTOPOINT RUNNING NOARP  MTU:1500  Metric:1
>=20
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--=20
Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
University of Minnesota Duluth
Information Technology Systems & Services
PGP key 1024D/84E22DA2 2005-11-07
Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2

He is not a fool who gives up what he cannot keep to gain what he cannot
lose.
-Jim Elliot

--=-UaSj9KK62yV5bHHsoMzA
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkkdoJoACgkQU+eIf4TiLaJLdQCcC9SC5Yjf5AcrPIjfRh6aIp6G
4eUAoIKs8esr/0JOgh0MKEqLl5js9E4A
=Afb4
-----END PGP SIGNATURE-----

--=-UaSj9KK62yV5bHHsoMzA--

