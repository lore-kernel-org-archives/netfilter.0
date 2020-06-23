From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nft 0.9.3 | kernel 5.4.48] cannot get NAT to work
Date: Tue, 23 Jun 2020 21:34:00 +0000
Message-ID: <cf63c2f8-3aaf-9af6-739e-8928b803fb8c@gmx.net>
References: <87b5491f-dbd3-1f09-a9cb-303596da4e10@gmx.net>
 <20200623212323.GS26990@breakpoint.cc>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="eGR3gRhjInEMGyhRYIzas3UFu2QUPN839"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1592948093;
        bh=+Jbc8Oyj5HyxiFh81venEbAXIlY/aLsYaxWViIuK6pM=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Cc:Date:
         In-Reply-To;
        b=DTu2fNkZj2sFBTB32mRxJkqvCoOBVP04vT7NaR4oInul/hQ74xHwc0SnsIBzzxAZF
         9cj3GVpHF3MIcDcE2+9Y7t5c6X3R+D5n2Wcnqz2U+U/t41y2t7U9UYkDy4xfTh8iXY
         M+vt1aEhCyPlOEToEanBvAwXosJlJT8n63bzhNzw=
In-Reply-To: <20200623212323.GS26990@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Florian Westphal <fw@strlen.de>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eGR3gRhjInEMGyhRYIzas3UFu2QUPN839
Content-Type: multipart/mixed; boundary="K9htmnPa4hJRo6zvjlUzz6PNpXG8r0TdG";
 protected-headers="v1"
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Reply-To: vtol@gmx.net
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Florian Westphal <fw@strlen.de>
Message-ID: <cf63c2f8-3aaf-9af6-739e-8928b803fb8c@gmx.net>
Subject: Re: [nft 0.9.3 | kernel 5.4.48] cannot get NAT to work
References: <87b5491f-dbd3-1f09-a9cb-303596da4e10@gmx.net>
 <20200623212323.GS26990@breakpoint.cc>
In-Reply-To: <20200623212323.GS26990@breakpoint.cc>

--K9htmnPa4hJRo6zvjlUzz6PNpXG8r0TdG
Content-Type: multipart/mixed;
 boundary="------------85185CAA64E3CE73DB2A7D1F"
Content-Language: en-GB

This is a multi-part message in MIME format.
--------------85185CAA64E3CE73DB2A7D1F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 23/06/2020 21:23, Florian Westphal wrote:
> =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> wrote:
>> Since the ruleset that worked with kernel 4.19 did not anymore with ke=
rnel
>> 5.4 (throwing segfault) I started from scratch to see what gives.
>>
>> nft add table inet filter
>> nft add chain inet filter input { type filter hook input priority 0 \;=
 }
>> nft add chain inet filter forward { type filter hook forward priority =
0 \; }
>> nft add chain inet filter output=C2=A0=C2=A0=C2=A0 { type filter hook =
output priority 0 \;
>> }
>> nft add table inet nat
>>
>> Thus far good and then things go awry and the output does not help to
>> understand what might be wrong:
>>
>> nft add chain inet nat prerouting { type nat hook prerouting priority =
\-100
>> \; }
>> nft: unrecognized option: 1
> If you use the shell, you should use single-quote for the entire
> arguments.  nft 'add chain ...'
>
> here, nft thinks you passed '-1' as an option.

Thanks for the pointer, I just copied that from the wiki though...

>
>> and next up
>>
>> nft add chain inet nat postrouting { type nat hook postrouting priorit=
y 100
>> \; }
>> Error: Could not process rule: No such file or directory
> inet nat depends on CONFIG_NF_TABLES_INET.

That is apparently enabled in the kernel

xzgrep NF_TABLES /proc/config.gz
CONFIG_NF_TABLES=3Dm
CONFIG_NF_TABLES_SET=3Dm
CONFIG_NF_TABLES_INET=3Dy
CONFIG_NF_TABLES_NETDEV=3Dy
CONFIG_NF_TABLES_IPV4=3Dy
CONFIG_NF_TABLES_ARP=3Dy
CONFIG_NF_TABLES_IPV6=3Dy
CONFIG_NF_TABLES_BRIDGE=3Dm

--------------85185CAA64E3CE73DB2A7D1F
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

--------------85185CAA64E3CE73DB2A7D1F--

--K9htmnPa4hJRo6zvjlUzz6PNpXG8r0TdG--

--eGR3gRhjInEMGyhRYIzas3UFu2QUPN839
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEemyk2LJ8gvWPJnOR9Pc1kx8Fxc4FAl7ydX4FAwAAAAAACgkQ9Pc1kx8Fxc67
8Q/9GPfZF0DHmKCKQYYN/7cd5zIpW6pZM9OvGdHsoAqJQwHNMla60Ee/tMsZJ0Y+FNcbIF23RAEw
fLUcl9vDSFs1g95WLjVJfDCGzvoeeSaMALXgf+nCAvp5jIh5bk3tD8/pMuvC4N0ZS4U9Gc3+66r3
cHgVJUWdpaHkGywEP06lXqZSq2ke0/ge/iKp+q+pwANAQ8OWN+p1mqry0rX+Kha14elkoMpXRH3v
uL6FgFr6OI/v+BbSMGLctbbfND42EOtuh2ml63lE6PhXxICFcgdzoH1ZXKHKpYDaWs/LcPNYCYHF
hs57AzYrNdafpAu+xUNyMUFKFdz0AaBhG0O/yccjaicc2tXnWiSchCiXtf8GuFC8W8Lp3j4xE9h8
Pd9Vwgm0ZSlqi4ajnindZIrE/X/qez1bANGR+DH1Cezpm77N3ApzBluGnRyC0rYZzenR9WJwGEAe
qaZ0UFC9f4+jBhH1I1h6Cu2D1JYeeoHorjhxt8yqeKqMdOirZ0sIoG8sRclfjWe2TyGTpjMdpL8M
xPm6vlLeOPsvxQ0ylifALw5l5a/DnhFfim1FDHbtbd7XXgPvGWzpWkxPra0cyjkWOUJHVwCnUuzL
Ni8xVAzcQV2iEUsCOZI5/LmDjsDdtaIjS+Oi1CG9V0k9naNx0t2Wynn7VakxF+0adaTiNr+a8VsN
hjU=
=AjrZ
-----END PGP SIGNATURE-----

--eGR3gRhjInEMGyhRYIzas3UFu2QUPN839--
