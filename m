From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: symmetric NAT and ICMP
Date: Wed, 05 May 2010 13:29:39 +0200
Message-ID: <4BE156A3.2010204@plouf.fr.eu.org>
References: <AANLkTinm_rvGHEZQ_RpBqfvERQgI1JXNlBjn00owut6o@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinm_rvGHEZQ_RpBqfvERQgI1JXNlBjn00owut6o@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

ratheesh k a =E9crit :
>=20
> My understanding is : - NAT on Router R is  symmetric nat . I am able
> to browse internet from both machine A  and B .
>=20
> My question is : Can Router R can support different types of NAT
> simultaneously ( full cone nat  ,address restricted nat ....etc ) ?

I don't think so. NAT behaviour is determined by how the connection
tracking works.

> IF only one type of nat is supported , how "ping  google.com " works
> from both machine ? icmp dont have any port information .Still
> icmp-reply gets routed to correct machine ?

ICMP request/reply types (echo, timestamp...) contain an identifier
field that helps matching requests and replies (Cf. RFC 792). Conntrack
uses it, see /proc/net/ip_conntrack or /proc/net/nf_conntrack, e.g. :

icmp     1 27 src=3D192.168.0.1 dst=3D192.168.0.2 type=3D8 code=3D0 id=3D=
62027
[UNREPLIED] src=3D192.168.0.2 dst=3D192.168.0.1 type=3D0 code=3D0 id=3D=
62027 use=3D2
mark=3D0
icmp     1 14 src=3D192.168.0.1 dst=3D192.168.0.2 type=3D8 code=3D0 id=3D=
61259
[UNREPLIED] src=3D192.168.0.2 dst=3D192.168.0.1 type=3D0 code=3D0 id=3D=
61259 use=3D1
mark=3D0

Two different pings with the same source and destination but different
identifiers create two separate conntrack entries.
