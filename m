From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] frame rate limiting per day/minute not working (bug ?)
Date: Tue, 24 Nov 2020 22:37:00 +0000
Message-ID: <11749704-064f-b8b6-bc93-e80f7b0a7ece@gmx.net>
References: <03028b1e-e7bb-d82a-3697-9783c5f57568@gmx.net>
 <5e427c03-0348-515e-4f35-94ad45faa444@plushkava.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DF22wTwrGtgdAHPe6sGEJ1J6VSVGkUti0"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1606257442;
        bh=y14gvrZoRkNH4hvGj5KsC9KISbjEMe2lzhfX8MIsBwM=;
        h=X-UI-Sender-Class:Reply-To:To:References:From:Subject:Date:
         In-Reply-To;
        b=WNk+mR8fAaEgZ0snaKRk8HfLG6xNxZoi0dDFtEfaZ/SIasPbTd35ghxLP4N+cLUlt
         TNWVrgCt540DjOtl0fJEc71m6HARlMO8NfbCbo0WVnjSsHLacjRmT2nX0VlCi3VtP1
         QeSZdAUNL8+A9atnNRMWzQHJbt6tBLjUpDBDLYBo=
In-Reply-To: <5e427c03-0348-515e-4f35-94ad45faa444@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DF22wTwrGtgdAHPe6sGEJ1J6VSVGkUti0
Content-Type: multipart/mixed; boundary="wSFSakgen22E4lCj4CIaLRwInfOc8gRjc";
 protected-headers="v1"
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Reply-To: vtol@gmx.net
To: netfilter@vger.kernel.org
Message-ID: <11749704-064f-b8b6-bc93-e80f7b0a7ece@gmx.net>
Subject: Re: [nftables] frame rate limiting per day/minute not working (bug ?)
References: <03028b1e-e7bb-d82a-3697-9783c5f57568@gmx.net>
 <5e427c03-0348-515e-4f35-94ad45faa444@plushkava.net>
In-Reply-To: <5e427c03-0348-515e-4f35-94ad45faa444@plushkava.net>

--wSFSakgen22E4lCj4CIaLRwInfOc8gRjc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 24/11/2020 23:08, kfm@plushkava.net wrote:
> On 14/11/2020 12:29, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>> host: armv7l GNU/Linux
>> kernel: 5.10.0-rc3-next-20201113
>> nftables: v0.9.6
>> ______
>>
>> this rule in a > inet filter prerouting chain:
>>
>> icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over 2/day }=20
>> log flags all prefix "ping_ip4 from LAN > rate_limit_d DROP: " drop;
>>
>> Having tried different values, e.g.
>>
>> limit rate over 2/day
>> limit rate over 44/day
>> limit rate over 300/day
>>
>> frames # 1 -5 are always passing through but as of frame count # 6=20
>> the frames always being dropped, no matter the x/day value.
>
> That's probably because the default burst value is 5, not that anyone=20
> would know this by reading the nft documentation. The terse=20
> explanation of the limit module in iptables-extensions(8) applies but=20
> there is a better explanation to be found here:
>
> https://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWTO-7.=
html=20
>
>
> Given 2/day, the initial five tokens are being taken from the bucket,=20
> following which no token is added until 12 hours have elapsed. Try=20
> repeating your experiments with the burst value specified as 1.
>
> Documentation aside, it doesn't help that both iptables/xt_limit and=20
> nft/limit fail to report the burst value unless it was explicitly=20
> defined.


Thank you for your valuable thoughts. I am not sure however that the=20
default bust limit is the cause here, for two reasons:

the outcome is the same with:

limit rate over 44/day
limit rate over 300/day

and should not be however. The other reason is that it should be the=20
same outcome with limit rate over X/minute but it is not.

>
>>
>>
>> A somewhat inconsistent behaviour with x/minute value, e.g.
>>
>> icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over=20
>> 13/minute } log flags all prefix "ping_ip4 from LAN > rate_limit_d=20
>> DROP: " drop;
>>
>> produces on the client side:
>>
>> ping -4 -n 20 google.com
>>
>> Pinging google.com [216.58.208.110] with 32 bytes of data:
>> Reply from 216.58.208.110: bytes=3D32 time=3D14ms TTL=3D114
>> Reply from 216.58.208.110: bytes=3D32 time=3D15ms TTL=3D114
>> Reply from 216.58.208.110: bytes=3D32 time=3D14ms TTL=3D114
>> Reply from 216.58.208.110: bytes=3D32 time=3D18ms TTL=3D114
>> Reply from 216.58.208.110: bytes=3D32 time=3D18ms TTL=3D114
>> Reply from 216.58.208.110: bytes=3D32 time=3D13ms TTL=3D114
>> Request timed out.
>> Reply from 216.58.208.110: bytes=3D32 time=3D14ms TTL=3D114
>> Request timed out.
>> Reply from 216.58.208.110: bytes=3D32 time=3D16ms TTL=3D114
>> Request timed out.
>> Reply from 216.58.208.110: bytes=3D32 time=3D16ms TTL=3D114
>> Reply from 216.58.208.110: bytes=3D32 time=3D13ms TTL=3D114
>> Request timed out.
>> Reply from 216.58.208.110: bytes=3D32 time=3D154ms TTL=3D114
>> Request timed out.
>> Reply from 216.58.208.110: bytes=3D32 time=3D32ms TTL=3D114
>> Reply from 216.58.208.110: bytes=3D32 time=3D13ms TTL=3D114
>> Request timed out.
>> Reply from 216.58.208.110: bytes=3D32 time=3D14ms TTL=3D114
>>
>> Ping statistics for 216.58.208.110:
>> =C2=A0=C2=A0=C2=A0=C2=A0 Packets: Sent =3D 20, Received =3D 14, Lost =3D=
 6 (30% loss),
>> Approximate round trip times in milli-seconds:
>> =C2=A0=C2=A0=C2=A0=C2=A0 Minimum =3D 13ms, Maximum =3D 154ms, Average =
=3D 26ms
>>
>>
>> Whilst the count is matching the rule it is not clear why not all 13=20
>> initial frames are passing through consistently and the excess being=20
>> dropped consistently but instead the first being dropped is earlier?
>>
>>
>



--wSFSakgen22E4lCj4CIaLRwInfOc8gRjc--

--DF22wTwrGtgdAHPe6sGEJ1J6VSVGkUti0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEemyk2LJ8gvWPJnOR9Pc1kx8Fxc4FAl+9iyMFAwAAAAAACgkQ9Pc1kx8Fxc7b
qA//Roh83/TV2ZQ62Zr26QjS8kxhQd3L773wyb7vZyaM1mv8XlY/t7ewDun3VFedfcWlqeeW7RwT
piwtXwUZGCA9/+BxqDoHk8/TRpACOGlqXLDXZGLg9iQjl3Mk9eaPn3DdI17vefsnCbkwmXkVla8d
qwUn8yXT/TaAQRyiaktfoPTqrT7gXvDBQNjmuDJfgHjub+x/JIKIP6kXOmQEVO0WD8v6klXd3IdM
8ieqoYEzxAkLBz2jZNLSuC3RxiZn9FMqdkZOb2UWzZmH9ibizPYRm7jWpaecZdV7T0IysSm/8uor
XlT0stF+N/bglQ0kChbbqsih3zy9DjZgyysKjJagl5f4HSgd8V32WABH8kM2r+pYg27DpaqDcpAy
bZuGcG3Z4sycTVlZISXDMzefXFfTvxFnR0S9E/52YQXq6WeVZbkEgs3XHH1jDgT5KdM8RaonlAOW
7RdI5yJAVHv3m0oqaYUj81fXLPWJTb9HXZFS3X6Z0PKD8Q5fqKKkO5vlxAK6+tZGOd6848bI/HqV
Y349Nu4S/KRe7a+HAP3rPgzfmw2A+Q4WojtWOfhPIsCqrHW4+lEXhJ4HvSVqWL4wsTodk9gSTEws
8u8vWXrocjfdxZ6tRUQ+FnPdRFsFNGEGtOHV64aCAiBF3PpBMZ0RjcaDFKG4sBsA9kmVtYEzOdDC
YNE=
=7RQo
-----END PGP SIGNATURE-----

--DF22wTwrGtgdAHPe6sGEJ1J6VSVGkUti0--
