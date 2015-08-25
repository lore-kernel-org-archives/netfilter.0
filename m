From: Nikolai Lusan <nikolai@lusan.id.au>
Subject: Re: ip6tables reject targets
Date: Wed, 26 Aug 2015 09:19:33 +1000
Message-ID: <1440544773.28787.20.camel@lusan.id.au>
References: <1440538307.28787.18.camel@lusan.id.au>
	 <55DCF320.3040104@hallowe.lt>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-CZjfqJsew9tX+McFeyty"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <55DCF320.3040104@hallowe.lt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Kevin Holly <root@hallowe.lt>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


--=-CZjfqJsew9tX+McFeyty
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
On Wed, 2015-08-26 at 00:58 +0200, Kevin Holly wrote:
>=20
> You can find the valid options in the ip6tables help. Remember that=20
> you can always use -h/--help to show also manual-like help=20
> information about modules, for example "iptables -m conntrack -h"
>=20
> root@mail:~# ip6tables -j REJECT -h
> ip6tables v1.4.14
> [...]
> REJECT target options:
> --reject-with type              drop input packet and send back
>                                 a reply packet according to type:
> Valid reject types:
>     icmp6-no-route              ICMPv6 no route
>     no-route                    alias
>     icmp6-adm-prohibited        ICMPv6 administratively prohibited
>     adm-prohibited              alias
>     icmp6-addr-unreachable      ICMPv6 address unreachable
>     addr-unreach                alias
>     icmp6-port-unreachable      ICMPv6 port unreachable
>     port-unreach                alias
>     tcp-reset                   TCP RST packet
>     tcp-reset                   alias


Thanks for that. It should have occurred to me earlier, I guess lack of
sleep is a bigger problem than I thoiught. :)

--=20
Nikolai Lusan

Email:     nikolai@lusan.id.au
Phone(H):  (07) 3136 3065
Phone(M):  0425 661 620

--=-CZjfqJsew9tX+McFeyty
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJV3PgFAAoJEJOjmtAqHQSLLEwP/1qzgICYryDRINaCfM+zTKkw
QTdAscJr4EbwDUn+290H7EL7IeaXbUxoGCrs3CMUuwJQwaMRVQ2Qll4emNqU9Gyq
TtCstot/1CE0WffdiMDeNmKdu/9aPTGn/kdkNvkexQRQifCaq7hDUFMHHN60i9uP
/DCxcD0KXZlLR4CzyFc5Q403YNQJVfQ/otKs4xu1SlMk3sZVzrWRIZUo6hyrs2tI
xeTw0Wb6TLIX9l3FxOqaLqbFvzRHmt68WMWNxfjacjmrHJ/SG9EGMAIoIsa2ACeL
KpKGVEHF42Doeg1C86xDpB8uggxWtW+gYjSA0YtWbxkLWTWO0p5skQqyc7h7b2M9
KDKL0yZbPnbeQszlaHZFuXjPRXWvjrED0nx4Iw2Yydx1dT6Val95Fk8Dx/qrU/DU
syHsTXXZvItTes5YBM67HDDatPFRiJvsxvYZiM6TSLj7gCOglV95+ink3UPxc2Es
eNuisx9XHM59QHBr/KrOMcLA8iZ7u8XtjeybR8BCGlFjD6lZkLJHCUhGrkrInezA
mvT9Zi+E9BSQvo+Bj2Zrzq1qmdxk6Ly8V/Mn8kgFBVtTBDq+2KoZw8Nze2U1XbNe
qCZRgsDmz8nOEybWkndbeQ4/7Pd/BKU1XciKuogB9ymT++G8HaLtHUOHUcNGd6AD
KsrQ/zD3zXFGgpy2pWtt
=XGGV
-----END PGP SIGNATURE-----

--=-CZjfqJsew9tX+McFeyty--

