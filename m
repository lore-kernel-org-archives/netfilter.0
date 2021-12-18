From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: [RFC PATCH 0/2] Landlock network PoC implementation
Date: Sat, 18 Dec 2021 12:01:15 +0100
Message-ID: <c325e5f6-d8d5-b085-fd2d-7f454629a1ec@digikod.net>
References: <20211210072123.386713-1-konstantin.meskhidze@huawei.com>
 <b50ed53a-683e-77cf-9dc2-f4ae1b5fa0fd@digikod.net>
 <12467d8418f04fbf9fd4a456a2a999f1@huawei.com>
 <b535d1d4-3564-b2af-a5e8-3ba6c0fa86c9@digikod.net>
 <c8588051-8795-9b8a-cb36-f5440b590581@digikod.net>
 <a1769c4239ee4e8aadb65f9ebb6061d8@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-security-module-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <a1769c4239ee4e8aadb65f9ebb6061d8@huawei.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Cc: yusongping <yusongping@huawei.com>, Artem Kuzin <artem.kuzin@huawei.com>, linux-security-module <linux-security-module@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>


On 18/12/2021 09:26, Konstantin Meskhidze wrote:
> Hi, Micka=D1=91l
> Thanks again for your opinion about minimal Landlock IPv4 network version.
> I have already started refactoring the code.
> Here are some additional thoughts about the design.

[...]

>>>
>>> Accesses/suffixes should be:
>>> - CREATE
>>> - ACCEPT
>>> - BIND
>>> - LISTEN
>>> - CONNECT
>>> - RECEIVE (RECEIVE_FROM and SEND_TO should not be needed)
>>> - SEND
>>> - SHUTDOWN
>>> - GET_OPTION (GETSOCKOPT)
>>> - SET_OPTION (SETSOCKOPT)
>=20
>>> For now, the only access rights should be LANDLOCK_ACCESS_NET_BIND_TCP =
and LANDLOCK_ACCESS_NET_CONNECT_TCP (tie to two LSM hooks with struct socka=
ddr).
>=20
>>> These attribute and access right changes reduce the scope of the networ=
k access control and make it simpler but still really useful. Datagram (e.g=
. UDP, which could add BIND_UDP and SEND_UDP) sockets will be more
>>> complex to restrict correctly and should then come in another patch ser=
ies, once TCP is supported.
>=20
> I think that having access rights like LANDLOCK_ACCESS_NET_CREATE_TCP_SOC=
KET_DENY/LANDLOCK_ACCESS_NET_CREATE_UDP_SOCKET_DENY might be useful during =
initialization phase of container/sandbox, cause a user could have the poss=
ibility to restrict the creation of some type of sockets at all, and to red=
uce the attack surface related to security aspect.
> So the logic could be the following:
> 	1. Process restricts creation UDP sockets, allows TCP one.
> 		- LANDLOCK_ACCESS_NET_CREATE_*_SOCKET_DENY rules are tied to process ta=
sk_struct cause there are no sockets inodes created at this moment.
> 	2. Creates necessary number of sockets.
> 	3. Restricts sockets' access rights.
> 		- LANDLOCK_ACCESS_NET_BIND_* / LANDLOCK_ACCESS_NET_CONNECT_* access rig=
hts are tied to sockets inodes individually.=09
>=20

Reducing the attack surface on the kernel is valuable but not the=20
primary goal of Landlock. seccomp is designed for this task and a=20
seccomp filters can easily forbid creation of specific sockets. We=20
should consider using both Landlock and seccomp, and your use case of=20
denying UDP vs. TCP is good.

Anyway, the LANDLOCK_ACCESS_NET_CREATE_TCP_SOCKET_DENY name in not=20
appropriate. Indeed, mixing "access" and "deny" doesn't make sense. A=20
LANDLOCK_ACCESS_NET_CREATE_TCP access could be useful if we can define=20
such TCP socket semantic, e.g. with a port, which is not possible when=20
creating a socket, and it is OK.
