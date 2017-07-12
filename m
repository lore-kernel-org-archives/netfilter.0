From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Distinguishing NAT(PAT) inbound frames when using IPsec Transport
 mode from multiple NAT(PAT) systems
Date: Wed, 12 Jul 2017 21:48:15 +0200
Message-ID: <93d51af8-c58e-470e-8592-cf4dc96b9fc9@familie-kuntze.de>
References: <DM5PR07MB3532A88C49D99A7A420F56CD9AAF0@DM5PR07MB3532.namprd07.prod.outlook.com>
 <5b853f53-9c76-25a5-42d3-e2b693c0201b@familie-kuntze.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="age1q8LAvJV3nbQcnhwC5jOsNGmwnSLs8"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5b853f53-9c76-25a5-42d3-e2b693c0201b@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "Rajcan, Steven L" <Steven.Rajcan@unisys.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--age1q8LAvJV3nbQcnhwC5jOsNGmwnSLs8
Content-Type: multipart/mixed; boundary="Ag4emiT21aFXLjpAnNr43GTdRghCe4sVP";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: "Rajcan, Steven L" <Steven.Rajcan@unisys.com>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-ID: <93d51af8-c58e-470e-8592-cf4dc96b9fc9@familie-kuntze.de>
Subject: Re: Distinguishing NAT(PAT) inbound frames when using IPsec Transport
 mode from multiple NAT(PAT) systems
References: <DM5PR07MB3532A88C49D99A7A420F56CD9AAF0@DM5PR07MB3532.namprd07.prod.outlook.com>
 <5b853f53-9c76-25a5-42d3-e2b693c0201b@familie-kuntze.de>
In-Reply-To: <5b853f53-9c76-25a5-42d3-e2b693c0201b@familie-kuntze.de>

--Ag4emiT21aFXLjpAnNr43GTdRghCe4sVP
Content-Type: text/plain; charset=windows-1252
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

I forgot to mention, that you can perform nat in INPUT and randomize the =
source ports with SNAT.
-t nat -A INPUT -m policy --pol ipsec --dir in -j SNAT --random

Check the man page for iptables-extensions for details.
*nat INPUT isn't in the colourful graph that Jan Engelhardt made, but it =
exists.

On 12.07.2017 21:41, Noel Kuntze wrote:
> Hello Steven,
>=20
> Take a look at what the connmark plugin[1] of strongSwan does.
> I think doing the same fixes your problem. Or switch to strongSwan
> right away and use the plugin.
>=20
> [1] https://wiki.strongswan.org/projects/strongswan/wiki/Connmark
>=20
> Kind regards
>=20
> Noel
>=20
> On 12.07.2017 21:35, Rajcan, Steven  L wrote:
>> Hello,
>>
>> I have created IPsec policies using transport mode that allow systems =
behind
>> a NAT(PAT) router to connect to a public system. The issue I am having=
 is on
>> a public system with established IPsec tunnels to systems behind a PAT=

>> (Port-Address-Translation) router. These routers multiplex systems beh=
ind a
>> single IPV4 address. The IPsec SAs are created properly and I am able =
to
>> send data from these PAT system to the public system through the IPsec=

>> tunnels in most scenarios. However, it is possible that frames sent fr=
om two
>> or more PAT systems arrive at the public server stack with the same so=
urce
>> port, same source IP, same destination port, and same destination IP. =
This
>> occurs because the PAT router cannot modify the original TCP or UDP pa=
yload
>> encapsulated in the ESP frame. In these scenarios, the stack on the pu=
blic
>> system gets confused and cannot map replies to those frame back throug=
h the
>> correct IPsec tunnel of the PAT system.=20
>>
>> Consider two PAT systems attempting a TCP connection to the same publi=
c
>> server but each happens to use the same local port of 45000.=20
>> 	PAT1 system IP addr:               192.168.0.1
>> 	PAT2 system IP addr                192.168.0.2
>> 	PAT router public IP addr        20.20.20.10
>> 	Public system IP addr:              20.20.20.20
>> Note that the original TCP frame, sent by the PATx system is encapsula=
ted in
>> a UDP/ESP frame and is therefore, not modified by the PAT router.
>>                 PAT1 [192.168.0.1:45000,20.20.20.20:80] --> PAT Router=
 [
>> 10.10.10.10] -> public system [20.20.20.20:80]
>>                 PAT2 [192.168.0.2:45000,20.20.20.20:80] --> PAT Router=
 [
>> 10.10.10.10] -> public system [20.20.20.20:80]
>> The original IP of the PAT systems is NAT'ed to that of the PAT router=
 and
>> the post-transform, inbound frames arriving at the public system stack=
 are
>> identical for both endpoints. [10.10.10.10:4500,20.20.20.20:90]
>>
>> When testing this scenario, the first PAT system establish the TCP
>> connection properly. The second PAT system also connects but only a si=
ngle
>> TCP connection is established on the public system. An iptables log se=
ems to
>> indicate that the second TCP connection replaces the first.
>>
>> We have discovered that other platforms handle this scenario automatic=
ally
>> on the public system by modifying the source port on the inbound,
>> post-transform frame before it is sent up the stack. Thus the stack se=
es a
>> unique frame for every TCP and UDP dialogue with the PAT endpoints. Th=
e
>> reply frame then contains the modified source port which is restored b=
y the
>> OS to the original source port and is directed back through the origin=
al
>> IPsec tunnel.=20
>>
>> So the questions is, can the Linux kernel do the same or something sim=
ilar?
>> I looked at the xfrm routines and could not find anything that indicat=
es
>> that it could.=20
>>
>> Please note that using tunnel mode instead of transport mode is not an=

>> option for our situation.
>>
>> Any help would be appreciated.
>> Thanks
>>
>> Steve Rajcan
>> mailto:Steven.Rajcan@unisys.com=20
>> =20
>>
>=20

--=20
GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658


--Ag4emiT21aFXLjpAnNr43GTdRghCe4sVP--

--age1q8LAvJV3nbQcnhwC5jOsNGmwnSLs8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJLBAEBCAA1FiEEI8q7YCFGBedyeGWSODkpj2PsZlgFAllmfP8XHG5vZWxAZmFt
aWxpZS1rdW50emUuZGUACgkQODkpj2PsZlgnchAAj3BRh3xx949dG+CTPpFsFKBq
fG0SrcPqKbZIolXLeEF2NF3NgzDnt8LPnjumxl65SHsyJcjj8TCAHxdU664YByuB
7dATCSEfwDfnYp8BsRE9enw+BumwcV3/KXIJd1oFFRB0ydZIeG4Mh+Eunh0iRAJF
QUY6wkJMKoyZuhLAPp8lY0e3Vp4rgvN//zWFJ1XzvCsjrBlHC24tEUC/Y6RCbJrH
gS3eqfqJLhfyH7xmxzSFZ0nbniy1E3By+k3UCFzvl1NCb2M6c74/r4Ai6aH4B7Rz
u7VREkDjUjA5vWTxWaFiuS0O14ga7ZQ3zYuOfPKVnGeYyWoFltMI2SFNtuu25g2T
DrVDih+lmivYvD/D5RGHbaphO67YHWW+wa/2hKK0DPLtm9IDau7zHeBdPvzIo+ah
I+dtPVnF8oeWB/qCP/4/3RSZ0IUKIT5906989xpbJBh1dKRIOd0Hy+C3UFn2LTLH
9ZGX9kA8x5wWX6yfBLfRHuJsLrBIIpM8P00sCFYmWYsrxK4Bc09GDKbSo4eo5lei
3/aqtyLgJKpkb0DSzA1SG562HnI7ee9fw/SinqnT5JjFKJcfMUAU7Xs4dLr1jBHY
mXw0e0oaPQbgq//B2a/mwB5YqO8IP5RZfo7EGk6WTWDoGdQYYG0WM9nTgxv9scus
vFK1ppVVMwu/F1Or5mU=
=pS3+
-----END PGP SIGNATURE-----

--age1q8LAvJV3nbQcnhwC5jOsNGmwnSLs8--
