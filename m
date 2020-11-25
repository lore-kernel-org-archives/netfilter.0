From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] frame rate limiting per day/minute not working (bug ?)
Date: Wed, 25 Nov 2020 11:23:00 +0000
Message-ID: <f2ebc34a-1e3d-b826-52cc-7eea79f0fe43@gmx.net>
References: <03028b1e-e7bb-d82a-3697-9783c5f57568@gmx.net>
 <5e427c03-0348-515e-4f35-94ad45faa444@plushkava.net>
 <11749704-064f-b8b6-bc93-e80f7b0a7ece@gmx.net>
 <9d305192-a905-6b5f-1edc-344ce9812d00@plushkava.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="p0Bf4Pqp0uxQslsVh6YA4skWQccTwDCB8"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1606303425;
        bh=keG+hrNqe3ihAnacY6bcfgBGBHH2Nn1MbWFnB4Cctes=;
        h=X-UI-Sender-Class:Reply-To:To:References:From:Subject:Date:
         In-Reply-To;
        b=dc0RCqH8RP/EF6ZVPVsV8NAQhAJ99j+eaP+l+lDDtkEMPIgl2/qBbkyGZD1SXC+Cy
         W3jxsvVCFuunfwq6nHah20Y9ONmHwEmX+GhDX1+B+YZnuFVeg4083MSVrL4JFq3Agm
         CNKoqJy2MPKxv3Ajc3/ne6DIV1SZLSuJZGI4f3EE=
In-Reply-To: <9d305192-a905-6b5f-1edc-344ce9812d00@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--p0Bf4Pqp0uxQslsVh6YA4skWQccTwDCB8
Content-Type: multipart/mixed; boundary="BbcIarfxQuRc3FqXMQnuiJYJIh90ZUc2s";
 protected-headers="v1"
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Reply-To: vtol@gmx.net
To: netfilter@vger.kernel.org
Message-ID: <f2ebc34a-1e3d-b826-52cc-7eea79f0fe43@gmx.net>
Subject: Re: [nftables] frame rate limiting per day/minute not working (bug ?)
References: <03028b1e-e7bb-d82a-3697-9783c5f57568@gmx.net>
 <5e427c03-0348-515e-4f35-94ad45faa444@plushkava.net>
 <11749704-064f-b8b6-bc93-e80f7b0a7ece@gmx.net>
 <9d305192-a905-6b5f-1edc-344ce9812d00@plushkava.net>
In-Reply-To: <9d305192-a905-6b5f-1edc-344ce9812d00@plushkava.net>

--BbcIarfxQuRc3FqXMQnuiJYJIh90ZUc2s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB


On 25/11/2020 11:48, kfm@plushkava.net wrote:
> On 24/11/2020 22:37, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>> On 24/11/2020 23:08, kfm@plushkava.net wrote:
>>> On 14/11/2020 12:29, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>>>> host: armv7l GNU/Linux
>>>> kernel: 5.10.0-rc3-next-20201113
>>>> nftables: v0.9.6
>>>> ______
>>>>
>>>> this rule in a > inet filter prerouting chain:
>>>>
>>>> icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over 2/day=20
>>>> } log flags all prefix "ping_ip4 from LAN > rate_limit_d DROP: " dro=
p;
>>>>
>>>> Having tried different values, e.g.
>>>>
>>>> limit rate over 2/day
>>>> limit rate over 44/day
>>>> limit rate over 300/day
>>>>
>>>> frames # 1 -5 are always passing through but as of frame count # 6=20
>>>> the frames always being dropped, no matter the x/day value.
>>>
>>> That's probably because the default burst value is 5, not that=20
>>> anyone would know this by reading the nft documentation. The terse=20
>>> explanation of the limit module in iptables-extensions(8) applies=20
>>> but there is a better explanation to be found here:
>>>
>>> https://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWTO-=
7.html=20
>>>
>>>
>>> Given 2/day, the initial five tokens are being taken from the=20
>>> bucket, following which no token is added until 12 hours have=20
>>> elapsed. Try repeating your experiments with the burst value=20
>>> specified as 1.
>>>
>>> Documentation aside, it doesn't help that both iptables/xt_limit and =

>>> nft/limit fail to report the burst value unless it was explicitly=20
>>> defined.
>>
>>
>> Thank you for your valuable thoughts. I am not sure however that the=20
>> default bust limit is the cause here, for two reasons:
>
> It explains the cause of the initial five packets being permitted=20
> before running up against any limit. Given 2 as a numerator, try with=20
> lower burst values.
>
> Take "2/min burst 1 packets" as an example. The bucket will have a=20
> capacity of just one token and will be initialised with one upon=20
> loading the ruleset. The bucket will be topped up with one token every =

> 30 seconds, but never beyond its capacity. The result should be that=20
> one packet is allowed to pass at rigid 30 second intervals.
>
> Specifying "2/min burst 2 packets" will result in the bucket being=20
> initialised with - and having a capacity of - two tokens. Within the=20
> first 30 second delta, it will be possible for two packets to pass=20
> before the limit applies. Still, the bucket is topped up at the same=20
> rate of one token every 30 seconds.
>
>>
>> the outcome is the same with:
>>
>> limit rate over 44/day
>
> On average, this should allow for 44 a day by recharging the bucket at =

> a rate of one token every 24/44*60 =3D 32.73 minutes.
>
>> limit rate over 300/day
>
> In this case, by recharging the bucket at a rate of one token every=20
> 4.8 minutes. You would need to run your test case for at least that=20
> long to observe a difference and for at least 24 hours to prove=20
> whether or not the overall rate is maintained.

Thank you for the extensive explanation(s). To test your theory I=20
removed the default burst of 5 packets from the equation with:

limit rate over 300/day burst 0 packets

In which case I would expect the bucket credit of 300 to be burned prior =

rejecting frame #301 from the source, however the frames are being=20
dropped as of frame count #6:

# ping -6 -n 20 fd30:d64c:1eed:4c3a::12

Pinging fd30:d64c:1eed:4c3a::12 with 32 bytes of data:
Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
Reply from fd30:d64c:1eed:4c3a::12: time=3D2ms
Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.

Ping statistics for fd30:d64c:1eed:4c3a::12:
 =C2=A0=C2=A0=C2=A0 Packets: Sent =3D 20, Received =3D 5, Lost =3D 15 (75=
% loss),
Approximate round trip times in milli-seconds:
 =C2=A0=C2=A0=C2=A0 Minimum =3D 1ms, Maximum =3D 2ms, Average =3D 1ms

---------------

Then adjusted to:

limit rate over 300/day burst 10 packets:

# ping -6 -n 20 fd30:d64c:1eed:4c3a::12

Pinging fd30:d64c:1eed:4c3a::12 with 32 bytes of data:
Reply from fd30:d64c:1eed:4c3a::12: time=3D4ms
Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
Reply from fd30:d64c:1eed:4c3a::12: time=3D2ms
Reply from fd30:d64c:1eed:4c3a::12: time=3D2ms
Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
Reply from fd30:d64c:1eed:4c3a::12: time=3D3ms
Reply from fd30:d64c:1eed:4c3a::12: time=3D2ms
Reply from fd30:d64c:1eed:4c3a::12: time=3D2ms
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.
Request timed out.

Ping statistics for fd30:d64c:1eed:4c3a::12:
 =C2=A0=C2=A0=C2=A0 Packets: Sent =3D 20, Received =3D 10, Lost =3D 10 (5=
0% loss),
Approximate round trip times in milli-seconds:
 =C2=A0=C2=A0=C2=A0 Minimum =3D 1ms, Maximum =3D 4ms, Average =3D 1ms


Now 10 frames being passed through (matching the burst value) but as of=20
count # 11 being dropped.


This seems to be indicative of:

* burst value below the default (of 5) being disregarded entirely
* limit rate over X/day being disregarded and only the burst token applie=
d.


>
>
>>
>> and should not be however. The other reason is that it should be the=20
>> same outcome with limit rate over X/minute but it is not
>
> For the benefit of anyone investigating, could you define a test case=20
> that concretely demonstrates the problem?

see below

>
>>
>>>
>>>>
>>>>
>>>> A somewhat inconsistent behaviour with x/minute value, e.g.
>>>>
>>>> icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over=20
>>>> 13/minute } log flags all prefix "ping_ip4 from LAN > rate_limit_d=20
>>>> DROP: " drop;
>>>>
>>>> produces on the client side:
>>>>
>>>> ping -4 -n 20 google.com
>>>>
>>>> Pinging google.com [216.58.208.110] with 32 bytes of data:
>>>> Reply from 216.58.208.110: bytes=3D32 time=3D14ms TTL=3D114
>>>> Reply from 216.58.208.110: bytes=3D32 time=3D15ms TTL=3D114
>>>> Reply from 216.58.208.110: bytes=3D32 time=3D14ms TTL=3D114
>>>> Reply from 216.58.208.110: bytes=3D32 time=3D18ms TTL=3D114
>>>> Reply from 216.58.208.110: bytes=3D32 time=3D18ms TTL=3D114
>>>> Reply from 216.58.208.110: bytes=3D32 time=3D13ms TTL=3D114
>>>> Request timed out.
>>>> Reply from 216.58.208.110: bytes=3D32 time=3D14ms TTL=3D114
>>>> Request timed out.
>>>> Reply from 216.58.208.110: bytes=3D32 time=3D16ms TTL=3D114
>>>> Request timed out.
>>>> Reply from 216.58.208.110: bytes=3D32 time=3D16ms TTL=3D114
>>>> Reply from 216.58.208.110: bytes=3D32 time=3D13ms TTL=3D114
>>>> Request timed out.
>>>> Reply from 216.58.208.110: bytes=3D32 time=3D154ms TTL=3D114
>>>> Request timed out.
>>>> Reply from 216.58.208.110: bytes=3D32 time=3D32ms TTL=3D114
>>>> Reply from 216.58.208.110: bytes=3D32 time=3D13ms TTL=3D114
>>>> Request timed out.
>>>> Reply from 216.58.208.110: bytes=3D32 time=3D14ms TTL=3D114
>>>>
>>>> Ping statistics for 216.58.208.110:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Packets: Sent =3D 20, Received =3D 14, Lost=
 =3D 6 (30% loss),
>>>> Approximate round trip times in milli-seconds:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Minimum =3D 13ms, Maximum =3D 154ms, Averag=
e =3D 26ms
>>>>
>>>>
>>>> Whilst the count is matching the rule it is not clear why not all=20
>>>> 13 initial frames are passing through consistently and the excess=20
>>>> being dropped consistently but instead the first being dropped is=20
>>>> earlier?
>>>>
>>>>
>>>
>>
>>
>



--BbcIarfxQuRc3FqXMQnuiJYJIh90ZUc2s--

--p0Bf4Pqp0uxQslsVh6YA4skWQccTwDCB8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEemyk2LJ8gvWPJnOR9Pc1kx8Fxc4FAl++PsUFAwAAAAAACgkQ9Pc1kx8Fxc6T
qw/+IpS8VqMvddyvZSROailunB83TkqYhZEb+dj4I4O9gpd1pgNlGETCgPODze61kUu1R5QwXmMt
C6pPUnIgOrcu89hSlYsKW0Tb6tmh9iBHe5JkO5MIoZ3MlhEdW2UOCzMn6d8kNlURnrbfqcBm0sYb
nDPMCtDHUSTXbhvP+S6K68LaiqUNTuSa6MvJGYe/lmdxHhSqPu6g3/myOaScc9SV5dn8Cp1PRnAy
r2YHBPPjdb3yrPu3jENTihS0Cn2RMece5N9u+3JjKnufbP/+R4gGwnkZor9Bk3s2kT8QYJti5mP/
TsVbj68uZ3SP4QIGnHnaVo6Djj9B2LElphnkc39e/v2Lnax0kMntFWCiyink4cInpUJf+VNqeMkX
cXmErmG94dCDlb25tyUItghVyNuZjl/PKKs12GXB+6FeUHL+P0wHl4iHMflv3bYO7GziIbCcg0WP
2JuFKDXq8I27rBiMKbL+zQsYWCAJEdg/n3yQoOahqYDfRsqOGByRYNqvW0L+7QrGqO6ZmPE2Xv5y
Ir7UhRH91Xn6lnIflZoZAwdT/szrnKNGulj5keUhoKtoYpHZqzigFn5bFt1nDdEb/i809k0Vc7Lr
M/0nWgoK4yeHzGsD/yoivyvdKWJpewI1VhVeoVScN+T+qzOgaXFhm9uqljozOYbyA3yGdrBRODyN
Bh0=
=6T/Y
-----END PGP SIGNATURE-----

--p0Bf4Pqp0uxQslsVh6YA4skWQccTwDCB8--
