From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nft 0.9.3 | kernel 5.4.48] cannot get NAT to work
Date: Tue, 23 Jun 2020 22:12:00 +0000
Message-ID: <6e919ed9-50d9-7a23-a581-2c6110af5108@gmx.net>
References: <87b5491f-dbd3-1f09-a9cb-303596da4e10@gmx.net>
 <20200623212323.GS26990@breakpoint.cc>
 <cf63c2f8-3aaf-9af6-739e-8928b803fb8c@gmx.net>
 <20200623215239.GT26990@breakpoint.cc>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1PHtYrmgXGxWSVGQA3EtHs3K2pxoMbuob"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1592950320;
        bh=dHNeq3vlg6op76mfSLUWDEHPF57040zXt5M/qa6H89c=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:Cc:References:From:Date:
         In-Reply-To;
        b=WDIM95XeOUVEuDedpZgV7u05706liL/XfhA/BiL3vNC/cOIWYuKokrBmhOlbPp8Tx
         mHqxSOb+6uF0doJWZlCqV/1wlTcfEg1ZbKTKchYqQ+AZQYZbW7bxibz9F7p/nGEzL0
         LTEEyW+Cc3zgeuWt0rzwHLTvdAE3unWmLZFpTDVE=
In-Reply-To: <20200623215239.GT26990@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Florian Westphal <fw@strlen.de>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1PHtYrmgXGxWSVGQA3EtHs3K2pxoMbuob
Content-Type: multipart/mixed; boundary="XheKxTFF3O388WEcbRR9b4gPOeQRBxKsn";
 protected-headers="v1"
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Reply-To: vtol@gmx.net
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Florian Westphal <fw@strlen.de>
Message-ID: <6e919ed9-50d9-7a23-a581-2c6110af5108@gmx.net>
Subject: Re: [nft 0.9.3 | kernel 5.4.48] cannot get NAT to work
References: <87b5491f-dbd3-1f09-a9cb-303596da4e10@gmx.net>
 <20200623212323.GS26990@breakpoint.cc>
 <cf63c2f8-3aaf-9af6-739e-8928b803fb8c@gmx.net>
 <20200623215239.GT26990@breakpoint.cc>
In-Reply-To: <20200623215239.GT26990@breakpoint.cc>

--XheKxTFF3O388WEcbRR9b4gPOeQRBxKsn
Content-Type: multipart/mixed;
 boundary="------------2EEAA7E5980C81DD4938B800"
Content-Language: en-GB

This is a multi-part message in MIME format.
--------------2EEAA7E5980C81DD4938B800
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 23/06/2020 21:52, Florian Westphal wrote:
> =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> wrote:
>> On 23/06/2020 21:23, Florian Westphal wrote:
>>> =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> wrote:
>>>> Since the ruleset that worked with kernel 4.19 did not anymore with =
kernel
>>>> 5.4 (throwing segfault) I started from scratch to see what gives.
>>>>
>>>> nft add table inet filter
>>>> nft add chain inet filter input { type filter hook input priority 0 =
\; }
>>>> nft add chain inet filter forward { type filter hook forward priorit=
y 0 \; }
>>>> nft add chain inet filter output=C2=A0=C2=A0=C2=A0 { type filter hoo=
k output priority 0 \;
>>>> }
>>>> nft add table inet nat
>>>>
>>>> Thus far good and then things go awry and the output does not help t=
o
>>>> understand what might be wrong:
>>>>
>>>> nft add chain inet nat prerouting { type nat hook prerouting priorit=
y \-100
>>>> \; }
>>>> nft: unrecognized option: 1
>>> If you use the shell, you should use single-quote for the entire
>>> arguments.  nft 'add chain ...'
>>>
>>> here, nft thinks you passed '-1' as an option.
>> Thanks for the pointer, I just copied that from the wiki though...
> I've changed quoting style to nft 'add chain ...'.
>
>>>> Error: Could not process rule: No such file or directory
>>> inet nat depends on CONFIG_NF_TABLES_INET.
>> That is apparently enabled in the kernel
>>
>> xzgrep NF_TABLES /proc/config.gz
>> CONFIG_NF_TABLES=3Dm
>> CONFIG_NF_TABLES_SET=3Dm
>> CONFIG_NF_TABLES_INET=3Dy
> yup, looks good.

It should work then but somehow does not, any way to figure out what is=20
going wrong then? I would rather prefer not having to return to IPT.



--------------2EEAA7E5980C81DD4938B800
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

--------------2EEAA7E5980C81DD4938B800--

--XheKxTFF3O388WEcbRR9b4gPOeQRBxKsn--

--1PHtYrmgXGxWSVGQA3EtHs3K2pxoMbuob
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEemyk2LJ8gvWPJnOR9Pc1kx8Fxc4FAl7yfjEFAwAAAAAACgkQ9Pc1kx8Fxc6X
cQ/+Jxc7AYWCDnhQneVOv3JYaRelINqugWlVjjZ4AnhQjBtOY+gWwRLD2ioO5iBJryYvFhqZdGl0
zbkBVoEiz8ZSpajbIlizgcjUCJlm3jHT1qbztsiiX+zK6KOVoDwxwUF2DaeE5szLCPNqHEUiwZjz
PaFc2u1Hi2b3+5+8PqPVNy1ANKC2DakCRJeSfryrVjndQ1jeCHbamF2FYHiYIb0zY8WDDgxzbSlW
WxUXqUdOiYsxrKMTDw9vhYOFBdqLvMuJnhzSIJvcbHlSUIizcbnElFZUTBDpn64QOQU+noBd6+o8
/ECsrOJOGns9FZYWo9e18jPDmK5fR3FwnvgnKlgw0ZebpOO1clR4Fuh8T8BISXlgF8kjfc4eIfr9
XX9dsZ/hME7D0m36cbNbmMZmOBPrZUGeaJ5DJ5OwgimUHdgHrRv084q6O5HcVqzP8M92MD+ckNgM
+d9gsr/lf8zu41txTs4a2Q7Sf0brPlTYnCjLvVuZe6DQy7aCDh69PJ2lJb/B9yIZiufh3XbUO3F6
ZVieCct3eDANbKha0ml6Y6Y3tqYyVp2fSNwzSFgBaGSDWdIhjwGqN0RfOO/yOc0pXP6BR4SOno5+
GSEtrPN1oghzNriZNcusKB8QfAh7TeJ2sYVSg0wyHRv8tOn5Usv33ClGqd24CBkcHwXc+WHhgCJs
cnU=
=1caF
-----END PGP SIGNATURE-----

--1PHtYrmgXGxWSVGQA3EtHs3K2pxoMbuob--
