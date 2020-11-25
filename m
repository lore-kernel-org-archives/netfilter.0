From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] frame rate limiting per day/minute not working (bug ?)
Date: Wed, 25 Nov 2020 13:37:00 +0000
Message-ID: <622fee09-1ed1-1263-4248-e0a308b2aa68@gmx.net>
References: <03028b1e-e7bb-d82a-3697-9783c5f57568@gmx.net>
 <5e427c03-0348-515e-4f35-94ad45faa444@plushkava.net>
 <11749704-064f-b8b6-bc93-e80f7b0a7ece@gmx.net>
 <9d305192-a905-6b5f-1edc-344ce9812d00@plushkava.net>
 <f2ebc34a-1e3d-b826-52cc-7eea79f0fe43@gmx.net>
 <b3ebe64c-00a4-13c9-6303-d39c678a0e71@plushkava.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FZUfxANd05Q6shS1NrJeiX7LPCPs4g959"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1606311424;
        bh=wkYTOKAunZw0t3z52/pcPxTfDZ7KmfVTOSSVCsAUT/w=;
        h=X-UI-Sender-Class:Reply-To:To:References:From:Subject:Date:
         In-Reply-To;
        b=JeSzArIklcWeYjub28CKVSgheDyjpxz8wykrlkNmLjbfq6Aje4WiuNsswt9MxMv+6
         2FLAEjyXokEjX4Ui4DDOwLxlMopvU6pVXTadvfOo8a/KDRKGayyodv78qGh4B4a93g
         Zh1IUP1KluwGldwzZAfDfxLWfLmV4bI55iwD7e8A=
In-Reply-To: <b3ebe64c-00a4-13c9-6303-d39c678a0e71@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FZUfxANd05Q6shS1NrJeiX7LPCPs4g959
Content-Type: multipart/mixed; boundary="ytDSu6Q5EMCuQGvadXslyggyxOMubULi0";
 protected-headers="v1"
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Reply-To: vtol@gmx.net
To: netfilter@vger.kernel.org
Message-ID: <622fee09-1ed1-1263-4248-e0a308b2aa68@gmx.net>
Subject: Re: [nftables] frame rate limiting per day/minute not working (bug ?)
References: <03028b1e-e7bb-d82a-3697-9783c5f57568@gmx.net>
 <5e427c03-0348-515e-4f35-94ad45faa444@plushkava.net>
 <11749704-064f-b8b6-bc93-e80f7b0a7ece@gmx.net>
 <9d305192-a905-6b5f-1edc-344ce9812d00@plushkava.net>
 <f2ebc34a-1e3d-b826-52cc-7eea79f0fe43@gmx.net>
 <b3ebe64c-00a4-13c9-6303-d39c678a0e71@plushkava.net>
In-Reply-To: <b3ebe64c-00a4-13c9-6303-d39c678a0e71@plushkava.net>

--ytDSu6Q5EMCuQGvadXslyggyxOMubULi0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB


On 25/11/2020 13:49, kfm@plushkava.net wrote:
> On 25/11/2020 11:23, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>>
>> On 25/11/2020 11:48, kfm@plushkava.net wrote:
>>> On 24/11/2020 22:37, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
>>>> On 24/11/2020 23:08, kfm@plushkava.net wrote:
>>>>> On 14/11/2020 12:29, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:=

>>>>>> host: armv7l GNU/Linux
>>>>>> kernel: 5.10.0-rc3-next-20201113
>>>>>> nftables: v0.9.6
>>>>>> ______
>>>>>>
>>>>>> this rule in a > inet filter prerouting chain:
>>>>>>
>>>>>> icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over=20
>>>>>> 2/day } log flags all prefix "ping_ip4 from LAN > rate_limit_d=20
>>>>>> DROP: " drop;
>>>>>>
>>>>>> Having tried different values, e.g.
>>>>>>
>>>>>> limit rate over 2/day
>>>>>> limit rate over 44/day
>>>>>> limit rate over 300/day
>>>>>>
>>>>>> frames # 1 -5 are always passing through but as of frame count #=20
>>>>>> 6 the frames always being dropped, no matter the x/day value.
>>>>>
>>>>> That's probably because the default burst value is 5, not that=20
>>>>> anyone would know this by reading the nft documentation. The terse =

>>>>> explanation of the limit module in iptables-extensions(8) applies=20
>>>>> but there is a better explanation to be found here:
>>>>>
>>>>> https://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWT=
O-7.html=20
>>>>>
>>>>>
>>>>> Given 2/day, the initial five tokens are being taken from the=20
>>>>> bucket, following which no token is added until 12 hours have=20
>>>>> elapsed. Try repeating your experiments with the burst value=20
>>>>> specified as 1.
>>>>>
>>>>> Documentation aside, it doesn't help that both iptables/xt_limit=20
>>>>> and nft/limit fail to report the burst value unless it was=20
>>>>> explicitly defined.
>>>>
>>>>
>>>> Thank you for your valuable thoughts. I am not sure however that=20
>>>> the default bust limit is the cause here, for two reasons:
>>>
>>> It explains the cause of the initial five packets being permitted=20
>>> before running up against any limit. Given 2 as a numerator, try=20
>>> with lower burst values.
>>>
>>> Take "2/min burst 1 packets" as an example. The bucket will have a=20
>>> capacity of just one token and will be initialised with one upon=20
>>> loading the ruleset. The bucket will be topped up with one token=20
>>> every 30 seconds, but never beyond its capacity. The result should=20
>>> be that one packet is allowed to pass at rigid 30 second intervals.
>>>
>>> Specifying "2/min burst 2 packets" will result in the bucket being=20
>>> initialised with - and having a capacity of - two tokens. Within the =

>>> first 30 second delta, it will be possible for two packets to pass=20
>>> before the limit applies. Still, the bucket is topped up at the same =

>>> rate of one token every 30 seconds.
>>>
>>>>
>>>> the outcome is the same with:
>>>>
>>>> limit rate over 44/day
>>>
>>> On average, this should allow for 44 a day by recharging the bucket=20
>>> at a rate of one token every 24/44*60 =3D 32.73 minutes.
>>>
>>>> limit rate over 300/day
>>>
>>> In this case, by recharging the bucket at a rate of one token every=20
>>> 4.8 minutes. You would need to run your test case for at least that=20
>>> long to observe a difference and for at least 24 hours to prove=20
>>> whether or not the overall rate is maintained.
>>
>> Thank you for the extensive explanation(s). To test your theory I=20
>> removed the default burst of 5 packets from the equation with:
>>
>> limit rate over 300/day burst 0 packets
>
> 0 isn't a legal value. A token bucket must have a capacity of at least =

> 1. A bucket with no capacity would be no bucket at all. I would prefer =

> for the parser to reject this. Instead, the value is disregarded,=20
> resulting in the default of 5.
>
>>
>> In which case I would expect the bucket credit of 300 to be burned pri=
or=20
>
> The credit is 5, not 300, and will never be any higher, unless you=20
> define a legal burst value to that end. Effectively, 300/day defines=20
> the top-up rate. Keep in mind that 300/day is the very definition of a =

> rate. It is not merely an upper bound, unlike the burst value.

Alright, penny finally dropped - burst value =3D amount of tokens in the =

bucket and limit rate over X/period =3D times the bucket can be refilled =

over period...

I had it that limit rate X/period =3D token in bucket for period and burs=
t=20
=3D amount of tokens to exceed, e.g. 300/day would max out at 305...

So if I want 300/day then I go with > limit rate over 1/day burst 300=20
packets

Thank you once more for the taking the time and making the effort.


>
>> rejecting frame #301 from the source, however the frames are being
>
> To be able to burn through as many as 300 before even the first 4.8=20
> minutes has elapsed, you would have to define a burst value of 300=20
> packets.
>
>> dropped as of frame count #6:
>
> This is the point at which the initial five tokens have been drained.=20
> It does not prove that the defined rate isn't maintained over the=20
> course of one day (your chosen denominator).
>
>>
>> # ping -6 -n 20 fd30:d64c:1eed:4c3a::12
>>
>> Pinging fd30:d64c:1eed:4c3a::12 with 32 bytes of data:
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D2ms
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
>> Request timed out > Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>>
>> Ping statistics for fd30:d64c:1eed:4c3a::12:
>> =C2=A0=C2=A0=C2=A0=C2=A0 Packets: Sent =3D 20, Received =3D 5, Lost =3D=
 15 (75% loss),
>> Approximate round trip times in milli-seconds:
>> =C2=A0=C2=A0=C2=A0=C2=A0 Minimum =3D 1ms, Maximum =3D 2ms, Average =3D=
 1ms
>
>
>>
>> ---------------
>>
>> Then adjusted to:
>>
>> limit rate over 300/day burst 10 packets:
>>
>> # ping -6 -n 20 fd30:d64c:1eed:4c3a::12
>>
>> Pinging fd30:d64c:1eed:4c3a::12 with 32 bytes of data:
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D4ms
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D2ms
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D2ms
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D1ms
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D3ms
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D2ms
>> Reply from fd30:d64c:1eed:4c3a::12: time=3D2ms
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>> Request timed out.
>
> To burn through as many as 20 before the first 4.8 minutes has=20
> elapsed, you would have to define a burst value of 20 packets.
>
>>
>> Ping statistics for fd30:d64c:1eed:4c3a::12:
>> =C2=A0=C2=A0=C2=A0=C2=A0 Packets: Sent =3D 20, Received =3D 10, Lost =3D=
 10 (50% loss),
>> Approximate round trip times in milli-seconds:
>> =C2=A0=C2=A0=C2=A0=C2=A0 Minimum =3D 1ms, Maximum =3D 4ms, Average =3D=
 1ms
>>
>>
>> Now 10 frames being passed through (matching the burst value) but as=20
>> of count # 11 being dropped.
>>
>>
>> This seems to be indicative of:
>>
>> * burst value below the default (of 5) being disregarded entirely
>
> Only 0, because it would be impossible to honour. I'll file a bug=20
> requesting that it be treated as fatal by the parser.
>
>> * limit rate over X/day being disregarded and only the burst token=20
>> applied.
>
> It doesn't prove any such thing. Your test case ran for little more=20
> than 20 seconds, which is not enough time for the bucket to have=20
> acquired a new token having been drained. At the very least, please=20
> conduct your test for 2 x 4.8 minutes.
>



--ytDSu6Q5EMCuQGvadXslyggyxOMubULi0--

--FZUfxANd05Q6shS1NrJeiX7LPCPs4g959
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEemyk2LJ8gvWPJnOR9Pc1kx8Fxc4FAl++Xf4FAwAAAAAACgkQ9Pc1kx8Fxc4G
rhAAjGDa+vFPiItTqFGwb8gylZq51X+PPuPj6JmPy58EFzo43ynYen2IVec1ZraSqjmkypecshTt
uIcm/ow+aTx9paXBQ516H1pvcfsJdhs7cBm2yFH6wMx2d7a2cqS3TbiiFSt68xteWecu8txUbPev
XHhZNQxgEOhI5umiDDrcekVOmqrd0upJmA+B0YpzLIbPDdOFJQCq8LvAttgfvcpyogt7dTVRYbEF
4QY+Pvtkqvz0iMaHGf4UOx7hy8zcqP2GyGf2ldxfdoPOE5K1vyWXDTVVvJqwxNhmsXKb/wkkKHKU
zoOHnSF9OFkola/0dda+M22XrzdcqhHuWfKhxXfx3EjuRwLwPjwVxQoQwudzXjUmLe28ujvd2GUT
8Of+bnJ/SMhCHp56BJaWFxbahVR34TrcVyrslkeyZVQ7wr1WQALgVmq9oYF09bOHCL3RwqaSolyE
oaBohCpgZYe7mfTz7VgVdA07ctChR4DzWS1izQMZzI6OhLx0mur4oNQCuRxCEb0gjV/vIWwRZPcy
bGymSneqC5+sfo5paWf/YYfTxFWuYWABU+9lwQ3kHmhiqjHj2jA0cKAzvNp9G5rnVCGfA0bx0z2e
swRjygj/Pk3UI0bOgvo481hrIYvaIqqsqd4vnxiOs8w7LHQmfYrHwneEDxXu9duc0fxO81I0geyW
/gE=
=hDii
-----END PGP SIGNATURE-----

--FZUfxANd05Q6shS1NrJeiX7LPCPs4g959--
