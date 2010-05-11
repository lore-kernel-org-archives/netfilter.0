From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ipt_reject.c --> ip_route_me_harder ... --> ip_route_output_slow:
 iif  is loopback device?
Date: Tue, 11 May 2010 12:59:06 +0200
Message-ID: <4BE9387A.8080806@plouf.fr.eu.org>
References: <AANLkTimahQnqdaHEEB1UgkdG7mp9vysHZNvWKpPTcxI5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimahQnqdaHEEB1UgkdG7mp9vysHZNvWKpPTcxI5@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: s sg <ssg2351@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

s sg a =E9crit :
>=20
> I meet a routing issue when I try to use ipt_reject RST target in my
> policy routing enabled linux box (please see below picture).
>=20
> The linux box is configured to support policy routing, iif policy. Th=
e
> policy is, if packet is from interface group1, then it will lookup
> table 100, this table's default oif is wan1. And if packet is from
> interface group2, then it will lookup table 101, this table's default
> oif is wan2. The main table's default oif is wan1.
>=20
> The issue is, one packet comes from group2 and then ipt_reject wants
> to send RST, but the routing for the RST packet fail
> (ip_route_me_harder fail).
>=20
> I trace the code in ipt_REJECT.c. ipt_REJECT.c use ip_route_me_harder
> to find the RST packet's destination. ip_route_me_harder will first
> find the RST packet's reverse path using ip_route_output_key. The
> trace of ip_route_output_key is like this:
> ip_route_me_harder --> ip_route_output_key --> ip_route_output_flow
> --> __ip_route_output_key --> ip_route_output_slow.
>=20
> In ip_route_output_slow, before fib_lookup, the iif is set to lookbac=
k
> device, not the real device where the packet comes.

This is expected behaviour. The RST packet is locally generated, and as
such has iif set to the loopback device.

> So the policy
> finding in fib_lookup will fail to find table 101 but fall to main
> table, so the oif is wan1 but not wan2.

There is one thing I don't understand. The RST packet is generated in
reply to a packet that was received on interface group2, so I would
expect that it sent back via that same interface, not on any wan
interface. Anyway, it does not matter what interface the original packe=
t
was supposed to be forwarded to.
