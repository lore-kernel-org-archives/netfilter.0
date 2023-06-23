From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: ipset hash:net:port:net
Date: Fri, 23 Jun 2023 20:30:40 +0200 (CEST)
Message-ID: <4d4b3ca0-e994-3f29-e5da-a828d6a1c13@netfilter.org>
References: <CAEmTpZGTbHcd84vA5VL6FfDc8+n+E0VMt+GpPkVLw5Vijp5iLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="1393428146-1108618937-1687545040=:7658"
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <CAEmTpZGTbHcd84vA5VL6FfDc8+n+E0VMt+GpPkVLw5Vijp5iLA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
To: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?= <socketpair@gmail.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1393428146-1108618937-1687545040=:7658
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, 22 Jun 2023, =D0=9C=D0=B0=D1=80=D0=BA =D0=9A=D0=BE=D1=80=D0=B5=D0=
=BD=D0=B1=D0=B5=D1=80=D0=B3 wrote:

> 1. In the latest ipset, adding "1.2.3.4/0,tcp:0,1.2.3.0/24" is not
> allowed. I would like it to be allowed. It should match on any TCP
> traffic that matches source and destination.
> 2. The same for protocol number 0. I want  "1.2.3.4/0,0:0,1.2.3.0/24"
> to match all traffic that matches source and destination.
>=20
> These requirements come from the real cases, where an administrator add=
s=20
> rules to control access to his networks.
>=20
> Is it possible to make such changes? TCP port 0 is not real thing, as=20
> well as IP protocol 0. So we can give them special meaning in IPSets.
>=20
> although icmp:0 is not so clear in this case. Possibly allow to set -1 =
?=20
> as protocol or port for matching any ?

Sorry, no. It could ony be implemented with the price of doubling the=20
lookup time in the set.

Why don't you simply use a hash:net,net type of set?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
--1393428146-1108618937-1687545040=:7658--
