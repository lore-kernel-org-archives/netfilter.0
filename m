From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Distinguishing NAT(PAT) inbound frames when using IPsec Transport
 mode from multiple NAT(PAT) systems
Date: Wed, 12 Jul 2017 21:41:38 +0200
Message-ID: <5b853f53-9c76-25a5-42d3-e2b693c0201b@familie-kuntze.de>
References: <DM5PR07MB3532A88C49D99A7A420F56CD9AAF0@DM5PR07MB3532.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="S2frDljwpo47iF8WIqWs2Too6L4GpGqKU"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <DM5PR07MB3532A88C49D99A7A420F56CD9AAF0@DM5PR07MB3532.namprd07.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "Rajcan, Steven L" <Steven.Rajcan@unisys.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--S2frDljwpo47iF8WIqWs2Too6L4GpGqKU
Content-Type: multipart/mixed; boundary="6brKBukVEU2ae7jwjSm8d8t5A5atB6wtt";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: "Rajcan, Steven L" <Steven.Rajcan@unisys.com>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-ID: <5b853f53-9c76-25a5-42d3-e2b693c0201b@familie-kuntze.de>
Subject: Re: Distinguishing NAT(PAT) inbound frames when using IPsec Transport
 mode from multiple NAT(PAT) systems
References: <DM5PR07MB3532A88C49D99A7A420F56CD9AAF0@DM5PR07MB3532.namprd07.prod.outlook.com>
In-Reply-To: <DM5PR07MB3532A88C49D99A7A420F56CD9AAF0@DM5PR07MB3532.namprd07.prod.outlook.com>

--6brKBukVEU2ae7jwjSm8d8t5A5atB6wtt
Content-Type: text/plain; charset=windows-1252
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Hello Steven,

Take a look at what the connmark plugin[1] of strongSwan does.
I think doing the same fixes your problem. Or switch to strongSwan
right away and use the plugin.

[1] https://wiki.strongswan.org/projects/strongswan/wiki/Connmark

Kind regards

Noel

On 12.07.2017 21:35, Rajcan, Steven  L wrote:
> Hello,
>=20
> I have created IPsec policies using transport mode that allow systems b=
ehind
> a NAT(PAT) router to connect to a public system. The issue I am having =
is on
> a public system with established IPsec tunnels to systems behind a PAT
> (Port-Address-Translation) router. These routers multiplex systems behi=
nd a
> single IPV4 address. The IPsec SAs are created properly and I am able t=
o
> send data from these PAT system to the public system through the IPsec
> tunnels in most scenarios. However, it is possible that frames sent fro=
m two
> or more PAT systems arrive at the public server stack with the same sou=
rce
> port, same source IP, same destination port, and same destination IP. T=
his
> occurs because the PAT router cannot modify the original TCP or UDP pay=
load
> encapsulated in the ESP frame. In these scenarios, the stack on the pub=
lic
> system gets confused and cannot map replies to those frame back through=
 the
> correct IPsec tunnel of the PAT system.=20
>=20
> Consider two PAT systems attempting a TCP connection to the same public=

> server but each happens to use the same local port of 45000.=20
> 	PAT1 system IP addr:               192.168.0.1
> 	PAT2 system IP addr                192.168.0.2
> 	PAT router public IP addr        20.20.20.10
> 	Public system IP addr:              20.20.20.20
> Note that the original TCP frame, sent by the PATx system is encapsulat=
ed in
> a UDP/ESP frame and is therefore, not modified by the PAT router.
>                 PAT1 [192.168.0.1:45000,20.20.20.20:80] --> PAT Router =
[
> 10.10.10.10] -> public system [20.20.20.20:80]
>                 PAT2 [192.168.0.2:45000,20.20.20.20:80] --> PAT Router =
[
> 10.10.10.10] -> public system [20.20.20.20:80]
> The original IP of the PAT systems is NAT'ed to that of the PAT router =
and
> the post-transform, inbound frames arriving at the public system stack =
are
> identical for both endpoints. [10.10.10.10:4500,20.20.20.20:90]
>=20
> When testing this scenario, the first PAT system establish the TCP
> connection properly. The second PAT system also connects but only a sin=
gle
> TCP connection is established on the public system. An iptables log see=
ms to
> indicate that the second TCP connection replaces the first.
>=20
> We have discovered that other platforms handle this scenario automatica=
lly
> on the public system by modifying the source port on the inbound,
> post-transform frame before it is sent up the stack. Thus the stack see=
s a
> unique frame for every TCP and UDP dialogue with the PAT endpoints. The=

> reply frame then contains the modified source port which is restored by=
 the
> OS to the original source port and is directed back through the origina=
l
> IPsec tunnel.=20
>=20
> So the questions is, can the Linux kernel do the same or something simi=
lar?
> I looked at the xfrm routines and could not find anything that indicate=
s
> that it could.=20
>=20
> Please note that using tunnel mode instead of transport mode is not an
> option for our situation.
>=20
> Any help would be appreciated.
> Thanks
>=20
> Steve Rajcan
> mailto:Steven.Rajcan@unisys.com=20
> =20
>=20

--=20
GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658


--6brKBukVEU2ae7jwjSm8d8t5A5atB6wtt--

--S2frDljwpo47iF8WIqWs2Too6L4GpGqKU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJLBAEBCAA1FiEEI8q7YCFGBedyeGWSODkpj2PsZlgFAllme3QXHG5vZWxAZmFt
aWxpZS1rdW50emUuZGUACgkQODkpj2PsZlhPpQ//RLjMJ1844zP8bX/DofvbGiKw
aJEAUW26tqvAH7pZRrIl71CeOpnImjDw5lv7jt+kq3PU+OHkg6bKygX0wSj62g7B
f1IdUYUyVxYNlxP1QSouyXrbJawS2y83r/fiP2uBGAA8J9SFsun06YyIuCrISmfJ
+QnN+A1DhtTGawpW0gI+vu1iKwioQ6+da38w2ANTRundKTkwTNygQw0EtyIjF+ga
vMeQPq6/WTiD6IkJ4b1NpI4EWR+C16F9qHyK8AVAVsOS+OsbWsjngbQBUlz6v+5Y
i3OzWU1ztBwVshsJHhBv/xfBeL0yQ3VB2HUon/PPGzKzJmqDGGJjIRiR3I+JxJfw
35z24XxhjEZfnb2y9a3GCznm4iy4brDaH698qk+8MU5mzqfi5+ovS/ZrvyHUQo2Q
JKRLiNytEReu+NRi9gomVkfL3Mb1TsrGRfi/tQ43tSEU1bK6xKdIZjBq5Bxx5tge
d9Brc1pG3X5cMXxUAwGbjjHBz9t+mkTnb9o+QgQ2ko3ZGluq881zWNADTF+oVOPv
uWmy2zTccSexI1nb/5ds5bRO7NeotnYSxBNDO1USUBJ9l1eg89dLTMSPEaUuOysu
3Dk6PJ8wcufVCsNRVQ2tXXUhOFmTzc5T3F+XFusygnRnFWHT8fvXQTbXTm3m43KA
XsqFKOP/zt+g3BJm1Ro=
=IasY
-----END PGP SIGNATURE-----

--S2frDljwpo47iF8WIqWs2Too6L4GpGqKU--
