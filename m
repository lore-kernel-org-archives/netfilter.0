From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nft 0.9.3 | kernel 5.4.48] cannot get NAT to work
Date: Wed, 24 Jun 2020 08:59:00 +0000
Message-ID: <1c9f8c63-c2cb-a730-fb0a-a5b92ec5167b@gmx.net>
References: <87b5491f-dbd3-1f09-a9cb-303596da4e10@gmx.net>
 <20200623212323.GS26990@breakpoint.cc>
 <cf63c2f8-3aaf-9af6-739e-8928b803fb8c@gmx.net>
 <20200623215239.GT26990@breakpoint.cc>
 <6e919ed9-50d9-7a23-a581-2c6110af5108@gmx.net>
 <20200623224854.GU26990@breakpoint.cc>
 <f67206b8-aebc-47b5-a3e2-d2d07d2bb53e@gmx.net>
 <20200624081443.GV26990@breakpoint.cc>
 <c4212304-c8f3-ebc7-c9cc-101a5e2ef28a@gmx.net>
 <20200624085315.GW26990@breakpoint.cc>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UbNbRkuULK6yAaRushP11TiVzi6gymk5O"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1592989149;
        bh=Sz6HvsdkYlkjzmgd42xX829WdqxlOI5OTh4R8ZRMfH0=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:Cc:References:From:Date:
         In-Reply-To;
        b=EKGCUFAp51PcaGmMoYQVJ6fte5dG+6rBy7GlxxeP38BlMkmRuA33jXntT4UXeOhVF
         yDM+cMnkqEaE9c4Xt+5zEWqh+s9Fc6gA186MTQZMpprpwa2NniSZ5c1Y+mOMRPl/hg
         gatBBM5+wmI0pQhElg9DfLJyq13VheI3rtkUq/k4=
In-Reply-To: <20200624085315.GW26990@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Florian Westphal <fw@strlen.de>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UbNbRkuULK6yAaRushP11TiVzi6gymk5O
Content-Type: multipart/mixed; boundary="fv8lLKjgMaE3a0iWPvsfY7p87Rk98qCfX";
 protected-headers="v1"
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Reply-To: vtol@gmx.net
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Florian Westphal <fw@strlen.de>
Message-ID: <1c9f8c63-c2cb-a730-fb0a-a5b92ec5167b@gmx.net>
Subject: Re: [nft 0.9.3 | kernel 5.4.48] cannot get NAT to work
References: <87b5491f-dbd3-1f09-a9cb-303596da4e10@gmx.net>
 <20200623212323.GS26990@breakpoint.cc>
 <cf63c2f8-3aaf-9af6-739e-8928b803fb8c@gmx.net>
 <20200623215239.GT26990@breakpoint.cc>
 <6e919ed9-50d9-7a23-a581-2c6110af5108@gmx.net>
 <20200623224854.GU26990@breakpoint.cc>
 <f67206b8-aebc-47b5-a3e2-d2d07d2bb53e@gmx.net>
 <20200624081443.GV26990@breakpoint.cc>
 <c4212304-c8f3-ebc7-c9cc-101a5e2ef28a@gmx.net>
 <20200624085315.GW26990@breakpoint.cc>
In-Reply-To: <20200624085315.GW26990@breakpoint.cc>

--fv8lLKjgMaE3a0iWPvsfY7p87Rk98qCfX
Content-Type: multipart/mixed;
 boundary="------------65A033A93406C9EF6C8E15E7"
Content-Language: en-GB

This is a multi-part message in MIME format.
--------------65A033A93406C9EF6C8E15E7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 24/06/2020 08:53, Florian Westphal wrote:
> =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> wrote:
>  =20
>> Getting somewhere now, unless there are different kconf flags in 5.6 f=
or
>> building that module, least on this node with 5.4:
>>
>> modinfo: ERROR: Module alias nft_chain_nat not found.
>>
>> Which kconf flag is supposed to generate that particular module? Looke=
d into
>> https://github.com/torvalds/linux/blob/v5.4/net/netfilter/Kconfig but =
could
>> not find something specific that builds that module.
> https://github.com/torvalds/linux/blob/v5.4/net/netfilter/Makefile
>
> -> CONFIG_NFT_NAT
>
> ... which you seem to have enabled already.
> So I would guess that the build system used doesn't pick the module up
> for some reason.

Thank you for the assistance. Will take it up with the distro=20
maintainers to take a look at their build system.

--------------65A033A93406C9EF6C8E15E7
Content-Type: application/pgp-keys;
 name="OpenPGP_0xF4F735931F05C5CE.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xF4F735931F05C5CE.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFnciLoBEADBsoGGx8dPCw216OeILh7+4A851grJgGjBpjv2bjGGxJlCpnevyCHf+D3SM=
fsz
ASwV23B1TXsp3YM4X2JVnRr9RAqr8+U8pUDb6c58U1Il182/vlk6utD8q1221o3XDp3RXhEqC=
FR1
K+0BlnFnE2//CPnEs94BJ94cksaxy14QpY4VL9w9u1O02KkSXA2f0j/R6sxnHGk6SAWTn7OE7=
l57
rJsiklq6AYuEQ2j/5rEa9rMe6yfryXsiuY++bUbAhlhnsWSalA56yl1FbfCW/lXNay9yrjYwi=
/44
nEMmuj79kXmMMMX87PpoaoQUGFI0PbkOhO2TkVXqSBY8lolTtMHeGm3XSRUo3LVEFWf2K4zWX=
AKo
K4rFg8zKEGzYZy2dlHbY777h6nqLjJ84tSQH7eimouPjuaklwK0ilmyBvpcWRnUpGuZbLv89s=
p5S
ThqZ+eYaur4p3mXOXift+vPM9sN9ycXg3SUBcq+Kz+Vo32dAd5jJhiNzW+FqaKMQMNfAsu/9s=
WgP
lwVBYywcW+oqN+T+94Vb4qJ8VjooVfSFSGZ+VEkxW9nDXh9TTQb6b0eDysgGiJ2ZaZbrzSQUE=
fUl
nAhvFLlfcxWI02EA9Dnj3vPuNPt6/mSV3d83tt8mE9gWMxYkY/aWyGWohczkMlj9vY+G+2k9+=
AG1
4BpNiGK7svsr9QARAQABzQx2dG9sQGdteC5uZXTCwZQEEwEIAD4WIQR6bKTYsnyC9Y8mc5H09=
zWT
HwXFzgUCWdyIugIbAwUJBhEmdgULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRD09zWTHwXFz=
o0Y
EACzVvOGrxWq7Igv7s1ikPhrzYLjGqfETgejkfpJ4Sm6A2siidOSvFZYB8UOso2+JSxq1SRIg=
MvV
MK/3tObL7yX0lcslg7PDoJ2ZLWIBqWmrtLWHPEubYYkZnPBtEsio/z4lt04Qmz/Ydx2zjR2cS=
3+0
k+Jb9qXxHAGynWiaUV4iQ/sIKjBki6okgM3cJTBRr3Y2mvQuf1WoekolqavHp+8yD9ESnGAGw=
25K
2Ya4BVQmzvSoK32xLbqIBe+sFfKtc8sjjk7ZR3rliM7+BTqvEYOMlMX9JKTKD9yIh8cYnonkq=
EP+
6OqrZFmk7qWVq33PGvl/JLLIA6lNDhDalWhlM5026Ti4g1dtnf6C2vvpPAQZuqKc3DboKkkPi=
+tl
hyfmnLltUnHVAeu6h1lQjESNuNY0jpKDukchL+9jRBjWg4Tf6PbG5m0z/wMsF6rqJ7MF9V9hT=
pbX
hMH1LgA1HMibszs9kNufhZzIp1/ZYtgQp1L4+BDRDtWv1n32C7SBrTVNdhmCqOFGv047g9QIL=
WlK
JYUrCby70Lk74xGJeHpPvftXeoR157adv8T1h3o5dc5sLI/FnGJAa6HRRt5PetLc/pTC7qwT2=
bTS
tZtpF6KGLHcxR64BAu4uCUbgnl89Q3etEmHU3akDQIhJiM3rG5XjDuq3j6Kb0GPmWElTXWqX+=
l7V
Nc7BTQRZ3Ii6ARAA5XGN+cUiahtr/8q4pj7lB5FHlOUmLYRf+rN25Fg0Pr3lxx840wKLHYNxD=
7Cj
2XTmsxJseMPy9SbAKgA9uyBe5AaPQA8J2sP6tM0DuIssfuc+uGMgIXb3SnZvLL1ER849HtDGV=
Jzn
Oq7Aja5MACNCjWfY4xOA8ReAKK6MaDTO3xKoNSiLrFpA9nvMvMFDPK67pAdM/yeE844mzk4s9=
UCT
7fRUkf60YdoxUC6/kHz+6HInerqZQHEBxGkHVq3lkzo5InC0FrWDwmjG+Ol6PlwsWKn3uhMQI=
6vm
RlOetr00qRLFTQoGcVmOfZRgk2AoAiBanf9CWYWlRTGS0cgO7UsaLbuhAi24eR+cZccqFQ05V=
aNN
hCXZwHJa03riIJoz7LN9RCjd91e5uMs0qjKiMypgRD3K+xjf62VIAEn2d/BM+BwNirwwppqYl=
d6h
n4+igv5+ZHcotL7QBZF6+I0pcl4UVjAIJXV/ekW5g/OX0YwyesCh6xG/MukvISrmHadnY5UC8=
lPA
8rgNYahAx4jOMsmOdDcBz4gaEBJnssGCfSFvf6BEt2KjLGao7N0Z0s4dyHDosR6lJZEI3XLeq=
Rgu
6ZAGaK50V073hQ4GIFeclRA3uNcMUR6jEYw+PFh4KMD1NXuAJy9LI6r1+PBZfgk2F4GFh2rWK=
Tnf
kylyGhPqboLrxkUAEQEAAcLBfAQYAQgAJhYhBHpspNiyfIL1jyZzkfT3NZMfBcXOBQJZ3Ii6A=
hsM
BQkGESZ2AAoJEPT3NZMfBcXOgdkP/02/0ONJGu6i0lFnIJJ9gPZ4MkJqAqMwY8oUorXtNmmJg=
YLE
0CPugmcfSw+ozzPqbNbuPWYLf9UUv1sMI8HyCI4Me7WgUf7FDPU1+Os77W+5Si7o9u/Nuvh8T=
jn2
3O6Y+axTzzqdcB4MugkZMlENHdULfizL82SEONng9vK2Q5S76b6Hh0VjNUTv1ZMUjEXrPvFk2=
Coq
b+J3Myin3ptT+FKOjOn4UG4ItM88q5IfqPxawWNpbfrXbArmyOT5R9bSldgPejdAEglLSwoBY=
7gW
duf1vb28ik9iF1lFK19PYwy0gOQGgWzQTaEgTzREG3PUASeYrvR0O9zs+8jgxDwY9qWt5onsv=
sLm
rEkyuOXJYTxuITQ9z7Jgc8Qn0Hum+SvGPyL9n0ONL95X3bWjS8igkSOBopniayWq2Nd2s2fNW=
mZP
Nx7da6dJM1wbaeff7QNz8T8H/n62fifjcxWc5et0PH35/fM6u98EdzyUTiaGG+zxbX8AmwSGo=
h4o
9yxqayBp5yZ4ovW+tUlXWD6s0MZRdbCixLB18tQlC8VJdPtc2mHPCoC6aQ+XZwypG0j3K2JQp=
xbH
0M7nJopBOJZPDWR6TmwgtYjWbYjP23CxaIIgpw+wbWXIFQ9QFJUZlnR3XOBjmxWEHyq/jGqP6=
68A
6g49RhefId/b4RJ51vwUuFPvDlmm
=3DEVfn
-----END PGP PUBLIC KEY BLOCK-----

--------------65A033A93406C9EF6C8E15E7--

--fv8lLKjgMaE3a0iWPvsfY7p87Rk98qCfX--

--UbNbRkuULK6yAaRushP11TiVzi6gymk5O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEemyk2LJ8gvWPJnOR9Pc1kx8Fxc4FAl7zFdsFAwAAAAAACgkQ9Pc1kx8Fxc4k
8hAAmIpxGfrT0rOo1vWr6PoePgRY3c9eOcz68amE4pyEodGSkMmeNzqEKV8/rtKWR+q9zBhleMy6
CSbzGFl0aF4AgYRQKyxTnZzSJf5y0IgOIVXGSDqk/DS6zK3sdoIahkjwr/En3FpkD1y2MIguIErD
07lAOudbW65EvXbO+Sw/ybNDDte1WMgZ0RUynTAKKDeb+K/6B+xHv6HzO/vvQMKLvxKCf6XbsVCs
8sc/81Kk0a14MzMvN+3iJraVVFRkyhJjnLfP2DKfmv/g/qlG9JkWLUcRngPDlC1DooE2XpsDSYEk
0Ja5w4tJ6xHgxoDq81nNyqd3CykluWPNoKEkG2QV/ucuh1vtBurODcksKSSwAcDn54z6TAR4kXg1
AXkbzqxUr8L164DAg32KWw2pR+JRNKYeTHZJWKHpjsgvZCIE4+P8QpJIZ8d9M/76KTh/TGnRInkV
ighuEfSRoVCqD2LYooTPDWTB9Cuqd9xOgmzFHjJgLOubUh9XY9KSJkiX/21+Jw38mW/M1zP/9WPo
VAFbIR55DpL3QgX/lPR0qMGKTcfdKryA9x7Z22ZlKZ3VHgwSUVn4EmtpvaqATVco1p4zKQNtklco
XKSMUccSXn2YqilBUL2IJsZqfcMaDLhcKOr4ZGjA/15vhWbWwwhQJTNDOkMmToH0iUoqWShhsZFv
vMc=
=RwFM
-----END PGP SIGNATURE-----

--UbNbRkuULK6yAaRushP11TiVzi6gymk5O--
