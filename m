From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: [nftables] frame rate limiting per day/minute not working (bug ?)
Date: Sat, 14 Nov 2020 12:29:00 +0000
Message-ID: <03028b1e-e7bb-d82a-3697-9783c5f57568@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="osegqlkZrTkkalXdJid6PjL3ihTcHn8Tm"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1605356963;
        bh=utlLkLqIVV2D2B/Pt0EgaVwaOveFCRv0fekmf7CvctU=;
        h=X-UI-Sender-Class:To:Reply-To:From:Subject:Date;
        b=Uu5fMw++qZMlP0tcI/hXRBtlwJgoGxelVdWKNoF+DWd3ZoAsr26ecUhIM2zZqiudy
         CvOcsdtrcp/1HpuIVkbmu3OQbbpnEr2J0mux3HrD2YJoOED6hL/zmzLIZ434dq+wxz
         U5V2CachrDIBpL/g15dY7yC/Z9MuwPOV6SzUMMNY=
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--osegqlkZrTkkalXdJid6PjL3ihTcHn8Tm
Content-Type: multipart/mixed; boundary="5dukNaYoWSgo12nOzsrRkDztiQfrntEYj";
 protected-headers="v1"
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Reply-To: vtol@gmx.net
To: netfilter@vger.kernel.org
Message-ID: <03028b1e-e7bb-d82a-3697-9783c5f57568@gmx.net>
Subject: [nftables] frame rate limiting per day/minute not working (bug ?)

--5dukNaYoWSgo12nOzsrRkDztiQfrntEYj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

host: armv7l GNU/Linux
kernel: 5.10.0-rc3-next-20201113
nftables: v0.9.6
______

this rule in a > inet filter prerouting chain:

icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over 2/day } log =

flags all prefix "ping_ip4 from LAN > rate_limit_d DROP: " drop;

Having tried different values, e.g.

limit rate over 2/day
limit rate over 44/day
limit rate over 300/day

frames # 1 -5 are always passing through but as of frame count # 6 the=20
frames always being dropped, no matter the x/day value.


A somewhat inconsistent behaviour with x/minute value, e.g.

icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over 13/minute } =

log flags all prefix "ping_ip4 from LAN > rate_limit_d DROP: " drop;

produces on the client side:

ping -4 -n 20 google.com

Pinging google.com [216.58.208.110] with 32 bytes of data:
Reply from 216.58.208.110: bytes=3D32 time=3D14ms TTL=3D114
Reply from 216.58.208.110: bytes=3D32 time=3D15ms TTL=3D114
Reply from 216.58.208.110: bytes=3D32 time=3D14ms TTL=3D114
Reply from 216.58.208.110: bytes=3D32 time=3D18ms TTL=3D114
Reply from 216.58.208.110: bytes=3D32 time=3D18ms TTL=3D114
Reply from 216.58.208.110: bytes=3D32 time=3D13ms TTL=3D114
Request timed out.
Reply from 216.58.208.110: bytes=3D32 time=3D14ms TTL=3D114
Request timed out.
Reply from 216.58.208.110: bytes=3D32 time=3D16ms TTL=3D114
Request timed out.
Reply from 216.58.208.110: bytes=3D32 time=3D16ms TTL=3D114
Reply from 216.58.208.110: bytes=3D32 time=3D13ms TTL=3D114
Request timed out.
Reply from 216.58.208.110: bytes=3D32 time=3D154ms TTL=3D114
Request timed out.
Reply from 216.58.208.110: bytes=3D32 time=3D32ms TTL=3D114
Reply from 216.58.208.110: bytes=3D32 time=3D13ms TTL=3D114
Request timed out.
Reply from 216.58.208.110: bytes=3D32 time=3D14ms TTL=3D114

Ping statistics for 216.58.208.110:
 =C2=A0=C2=A0=C2=A0 Packets: Sent =3D 20, Received =3D 14, Lost =3D 6 (30=
% loss),
Approximate round trip times in milli-seconds:
 =C2=A0=C2=A0=C2=A0 Minimum =3D 13ms, Maximum =3D 154ms, Average =3D 26ms=



Whilst the count is matching the rule it is not clear why not all 13=20
initial frames are passing through consistently and the excess being=20
dropped consistently but instead the first being dropped is earlier?



--5dukNaYoWSgo12nOzsrRkDztiQfrntEYj--

--osegqlkZrTkkalXdJid6PjL3ihTcHn8Tm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEemyk2LJ8gvWPJnOR9Pc1kx8Fxc4FAl+vzaIFAwAAAAAACgkQ9Pc1kx8Fxc5d
7Q//QiRzQKHqOlemWA4NhilrWA98/f6KElz3Cdq6RGOPtjkRHGGysGpWOEEUpYYz6LVYO/ucPxJ5
aUmfInG+B9oeU2IMTK2lZne+HCBhHZ4XdRxCHZwxH0FikfheasOcdnCkGbq8YREO6m8B80UEgdtr
rGnY25FfGyjXDmkvtZB2oN+Gy+CToM0/yT50pDdZCtKbtGkjjGGHQvVQ262xH0Pkvz5vr9ArIady
H4ep3vZAuVU2ucH/SrHm0sxlWb8BKhN0n1wdZkg/O0LN2SNRC4UqUVnFECU7AJ4yOe5nJPO3+qQa
v3hiir5RC3/bFXdJAQbOGC6z9z4lkpwbJk/laMUrC9b5pNLftuY1eBKfIF/Xa6q65IkujB1XnzIM
eqRYIQiqteempE1l/GMf0Mldq4RYDYgeSMiK3K9VvEqh90Uld9R9WRBt9R7nzZucQKIZSO+cSqkT
JbnwOlDKOwmQni7pVTpvMKHt8aH7HJD8a87LQwisjnHKjXDT/vs+v9KREMQCVrfX+sUhj11WjpdQ
u7xSsJiPYALvKGiaVuq9d+drRPH1Conr5wlswK2oEaB/Xf+j94gm34gaUZipJOr5uS3k7lK3TQn/
xN/hl805SFLExbItoQ8G05s2kxiJKe/GjDQ7pnLSAc9qLHfM2gdD1dfUT6IJKqFiwwJ5Y+gTArWZ
cjE=
=goez
-----END PGP SIGNATURE-----

--osegqlkZrTkkalXdJid6PjL3ihTcHn8Tm--
