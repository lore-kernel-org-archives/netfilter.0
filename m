From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Iptables Reject with TCP Reset
Date: Fri, 6 Jan 2017 18:52:18 +0100
Message-ID: <4f4fa7f2-0f5f-ac04-4bc2-f10c455da613@familie-kuntze.de>
References: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <d991fbe7-ca57-6045-8bfe-88e590ed2f65@familie-kuntze.de>
 <HK2PR0201MB2129ABDBC46F8805B3757387E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <19ab6efe-7891-3950-e468-11dd59e71246@familie-kuntze.de>
 <HK2PR0201MB212932A38853DB306E300014E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OErm1cQL4T6d0e5Nv6W2UVmj4TqEBNUob"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <HK2PR0201MB212932A38853DB306E300014E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Matt Killock <matt.killock@praemium.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OErm1cQL4T6d0e5Nv6W2UVmj4TqEBNUob
Content-Type: multipart/mixed; boundary="SV4Q1CdDhD3dxdJufTPEmD2DNGjhP6i9e";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Matt Killock <matt.killock@praemium.com>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-ID: <4f4fa7f2-0f5f-ac04-4bc2-f10c455da613@familie-kuntze.de>
Subject: Re: Iptables Reject with TCP Reset
References: <HK2PR0201MB21296E195C755C65E4110DDCE8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <d991fbe7-ca57-6045-8bfe-88e590ed2f65@familie-kuntze.de>
 <HK2PR0201MB2129ABDBC46F8805B3757387E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
 <19ab6efe-7891-3950-e468-11dd59e71246@familie-kuntze.de>
 <HK2PR0201MB212932A38853DB306E300014E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>
In-Reply-To: <HK2PR0201MB212932A38853DB306E300014E8630@HK2PR0201MB2129.apcprd02.prod.outlook.com>

--SV4Q1CdDhD3dxdJufTPEmD2DNGjhP6i9e
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06.01.2017 17:44, Matt Killock wrote:
> My server has unusual interface names, so I changed them before.
>=20
> root@aspfw2:~# route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use=
 Iface
> 0.0.0.0         192.168.0.254   0.0.0.0         UG    0      0        0=
 enp2s12f0
> 192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0=
 enp2s12f0
> 192.168.20.0    0.0.0.0         255.255.255.0   U     0      0        0=
 enp2s12f1
> 192.168.40.0    0.0.0.0         255.255.255.0   U     0      0        0=
 enp6s7


Use iproute2. Don't use the net-tools. They're unmaintained, less powerfu=
l and lie.

> [4:208] -A FORWARD -s 192.168.20.0/24 -d 212.58.244.71/32 -i enp2s12f1 =
-p tcp -m tcp --dport 80 -j REJECT --reject-with tcp-reset
The rule is hit.

Your rule set is absolutely broken, because you don't permit ctstate RELA=
TED
and at the same time, it's unnecessarily convoluted unstructered.

You need to permit it to allow ICMP errors through and the TCP reset pack=
ets.

I advise to rewrite the complete rule set. You should start by taking thi=
s example
rule set for edge-routers, understanding the different components and rew=
riting your current one based of
the example. You are strongly encouraged to filter traffic based on ctsta=
tes. Use the conntrack module
instead of the state module. It is more powerful.

Please use the documents at [2] and [3] to improve your rule set.


[1] https://github.com/QueuingKoala/netfilter-samples/tree/master/rules-e=
dge-router
[2] http://sfvlug.editthis.info/wiki/Things_You_Should_Know_About_Netfilt=
er
[3] http://inai.de/images/nf-packet-flow.png

--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--SV4Q1CdDhD3dxdJufTPEmD2DNGjhP6i9e--

--OErm1cQL4T6d0e5Nv6W2UVmj4TqEBNUob
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJLBAEBCAA1FiEEI8q7YCFGBedyeGWSODkpj2PsZlgFAlhv2VIXHG5vZWxAZmFt
aWxpZS1rdW50emUuZGUACgkQODkpj2PsZlguMw/+NJvzpJvAEYt8/liTpp51Ejy4
ndNWubwruJi7ycqgoEkvyVp6Uipzpv0pIoYbIPq530vL/2Tm+gj1llgZpgpUd6xn
y+1qft9CRZniQxwCC3j2MZC7RC+cqG30WX6czP4ABIzFJOpoO0NCpOwkkFiTs9UK
ljhlZc3lpmI8/tkCyt8SK1bOvuWI4bWy8ToVGSbGk+67Z4WgBRRQIDcjK+XTWDI2
SOrwQpzIrvMEfwpdD0FiyK0+UJMbimO6c29TH+liOTWdpaI5kO7eNyCXfGTs8df3
XxmJxu+61JYePreHhVzv30Ye3tvAZKEUcDrOxANUCGTZnMcz/bCpIg+fkoNTnVZ5
kdBFQbzZ4O6NzOHbuaxf47wXdYBfGMJTNY8NJrtiFQ2ZZDtnFZS8DEGkTg4rQeU0
cGfejaRqItiC6TZbs3ESNTPQBHJrUFCFZqftAVYpLH8G0Zq5bG4TZgAWFlC8MOkV
PgwjMxnpQdNgC2LxcJSjJ0DanSjUcmSvA+uIStFzEuiMdnDaMxAbw0QFXmeptwQK
omS8bUMVjxZfwjMqQopSO542LNnOE02vNH3b89iYXXbhp08YO8D98Yl6tO7302dT
aHOL+PmZAJzrfPfxLZz1uJVnzOI8blCAQY2O8xTVZ4M2QDL0OoMjtoRmCuR9iqOS
eqDwFtrM40U4TiY3xcE=
=P72B
-----END PGP SIGNATURE-----

--OErm1cQL4T6d0e5Nv6W2UVmj4TqEBNUob--
