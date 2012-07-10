From: Nikolai Lusan <nikolai@lusan.id.au>
Subject: iptables and vlan tagging
Date: Tue, 10 Jul 2012 17:04:15 +1000
Message-ID: <1341903855.5850.20.camel@donetsk.home.lusan.id.au>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-GlGuWw4S+F/OWSKsePmp"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-GlGuWw4S+F/OWSKsePmp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I have a 2 vlans, 1 untagged with private IP's (vlan1) and 1 tagged
(vlan2) with non-private IP addresses, and I want to remove the vlan
tags before sending vlan2 packets out over my internet link and add them
back before sending packets from the internet to vlan2. Should this be
done in the iptbales mangle table? or do I need to use ebtables? And
exactly how should I go doing this?

Thanks
--=20
Nikolai Lusan <nikolai@lusan.id.au>

--=-GlGuWw4S+F/OWSKsePmp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABCgAGBQJP+9PvAAoJEJOjmtAqHQSLqGgP/AojIewv+ORMpIS1Tqr/G/yZ
xEyl74tpoQb/EoK9A8XyJfTh9PaByjFJ7UzfyJ9eoXjC7nDG2XXtJhPqUQBVttH7
dvoLtLiSgRQ+ygYh6TiX9LoWgPvxACbETbLIyRn7KEdULL5PgEqBB+JJpQVxCpqm
FHNdJoHTCvR/A9BRyPCHauiovhHlUyLqOcAzUFi1t8iOOI6XXqDvJJDbkxLIAfAP
D41ejFn92smoEbjE4Og7Yk6bPH1O3dx2HsX3YuphoBlXyf5Cp886WAJf9yOkO5vK
R0yadM9Hx1zRHWlKadS6sljRAZW7ihCZEh1uQv9si/OTuxBVgH2e78ZQJl955s3s
VSyoWZUL/e1PCo9R0uFpK7cnp6NA1O/AjspFEcxw+GrUOHp0lBXqepL3uYOdLZJW
Y7Ds4L+k9WGHVtJIZqSfvlo5F0vkF+A00UFNi0nN+0cPCv6KS9Ku6EgZRWt8rVIb
gjUJDF4MEY1QTFZAeswkry+gwrIBZxqPnA6Z65mngENZC8SApKfuT662PP6ctpQn
0rukovJs6UDknM7aqpLfxQ6xoW40E9S+q12UYRhnD+ydVj9h7L0E34ZENMHHBwZd
v/Zca1CYp3tRxXtrgxW9H0B3VQBrfKe/TDIDSr6I3XvRjpDvi5ig0tZI/j90B4BI
QM7NN/amrNrk/oRq4v5J
=/V2T
-----END PGP SIGNATURE-----

--=-GlGuWw4S+F/OWSKsePmp--

