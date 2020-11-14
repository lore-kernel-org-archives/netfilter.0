From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables] frame rate limiting clashing with log rate limiting (bug
 ?)
Date: Sat, 14 Nov 2020 11:22:00 +0000
Message-ID: <f825a95a-fc00-98ea-a075-c63ba93183f3@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KrqurqpmIqGjuWbctiOU159j9G6yoaTaM"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1605352968;
        bh=grEsZBwXqoUbuLng4J8DokY92+IzbAjYAq84ajWsEbs=;
        h=X-UI-Sender-Class:To:Reply-To:From:Subject:Date;
        b=Q5OOmgz293OShFcTrU4LplyqKD23gkSUvSmdBJl/UlSw79pe9kKspVhFUGQm4Kbi2
         yig/zJBk4vpHKMkpXszh5d1zk5RHJ2Cnos1zN4lLnmzLx0VYL7abSg6UiInpjU2hxS
         FRCmI+2C905c1XMAOTfnyS4YG8wuYmtwbqANR+4U=
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KrqurqpmIqGjuWbctiOU159j9G6yoaTaM
Content-Type: multipart/mixed; boundary="58qx1sBqAwpGxZA9ZY5YOjv3kxUMVW2qr";
 protected-headers="v1"
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Reply-To: vtol@gmx.net
To: netfilter@vger.kernel.org
Message-ID: <f825a95a-fc00-98ea-a075-c63ba93183f3@gmx.net>
Subject: [nftables] frame rate limiting clashing with log rate limiting (bug
 ?)

--58qx1sBqAwpGxZA9ZY5YOjv3kxUMVW2qr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

host: armv7l GNU/Linux
kernel: 5.10.0-rc3-next-20201113
nftables: v0.9.6
______

Whilst rate limiting frames I would like those to be logged but the logs =

not to be flooded and thus trying to rate limit the log entries as well, =

however it seems that the log rate limiting is interfering with the=20
frame rate limiting. The observation is that the log rate limit is being =

applied as frame limit instead - am I missing something in the the syntax=
?

with this rule:

icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over 5/day }=C2=A0=
=20
log flags all prefix "ping_ip4 from LAN > rate_limit_d DROP: " limit=20
rate 5/minute drop;

or alternatively:

icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over 5/day }=20
limit rate 5/minute log flags all prefix "ping_ip4 from LAN >=20
rate_limit_d DROP: " drop;

it is observed that the icmp frames # 1 - 5 are going through, as=20
expected. Then icmp frames # 6 -10 being dropped but unexpectedly as=20
from icmp frame # 11 the frames as going through again and not being=20
dropped - which is unexpected/unwanted.

If the log rate limit is being removed:

icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over 5/day } log =

flags all prefix "ping_ip4 from LAN > rate_limit_d DROP: " drop;

then all icmp frames exceeding 5 count=C2=A0 being dropped, as expected b=
ut=20
the log being flooded.


--58qx1sBqAwpGxZA9ZY5YOjv3kxUMVW2qr--

--KrqurqpmIqGjuWbctiOU159j9G6yoaTaM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEemyk2LJ8gvWPJnOR9Pc1kx8Fxc4FAl+vvgcFAwAAAAAACgkQ9Pc1kx8Fxc5U
9Q//Y2lvROoaMaud4+RVvHVOtQCC2kVOwjKTVsNZMVu1lPj2c6oECkotfF3ZVuP/WEg60Y7+fxGz
EH0KlxkFv15Z8wnliIYhKsp5NvaWe3Bov86prZAePDSnv5UEdiM0gqwn32P0vQxtlT4f6Atb6PpB
IPhqyL54rweb8Sr7P7nclg5iGUI65v8RIilat09hjFGCf0t7VteECsHftTvpcOulVQ+Mk08HXevl
l0A1Lfk5oJePTUopOAZTvrIX4QiwwA8uXKAatfmaDfq3Skpl47TY6eaLb14eToTu62aW95TJ9rI6
Toy3EPutGCV85t14TrgkhSx/j2g54hugF2O9ff5cgFQO/W4u0GtFrBr9W8WpgZbCVS88IAhaB7k+
Mh1oAy1STwJB/SlcUJgUO0K/uH7KpSYTCXNbgTQtcR09MvACPtdvI58hDHIK5lboyuD+CMFamhU0
Hxo9MvoZIYtrbF1CU2/t+QxD1yv5Zt+MbAmz2ac8Wq9OtJ0uUROH0HI0Q7cYndPWbXe8/TJbXRF5
A1YtILM6KOt2+gUMj1m/PrQDgfRplfiK3Yi+bkbENLSiihneF68mpHt8lP+yiagmSLraDokXLLYE
pgyJ+Zy7HEX9xJ10tzJ7kLbA8TOSqQBBboAdc1DJjYe/s1xWOyycyBrJ4x62EdM+JD9NIEIFxE5V
2gI=
=sygc
-----END PGP SIGNATURE-----

--KrqurqpmIqGjuWbctiOU159j9G6yoaTaM--
