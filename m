From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Question about NAT, src ports and dst ports.
Date: Mon, 24 Nov 2008 16:44:21 +0100
Message-ID: <492ACBD5.20405@plouf.fr.eu.org>
References: <5ed0ca650811240548v39adffd2ndfc24ee7d858f9fe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5ed0ca650811240548v39adffd2ndfc24ee7d858f9fe@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

patrick daures a =E9crit :
>=20
> iptables -t nat -A PREROUTING -d .... -m dscp --dscp 46 -j NETMAP --t=
o
> 193.0.0.0/8
>=20
> But (yes, there is a but)
> when my tool generates packets, it can create TCP, UDP, ... packets
> with dst port and src port values.
> When it creates udp packets with DIFFERENT dscp values but using the
> SAME ports, iptables rules doesn't work like I want.
[...]
> Is this normal ? (I think "yes")

Yes. NAT works on a per-connection basis, not on a per-packet basis. It=
=20
relies on connection tracking (aka conntrack) to identify which=20
connection a packet belongs to. When a packet belongs to an existing=20
connection, it does not go through the nat chains, it is applied the=20
same NAT operations as those which were applied to the first packet=20
which created the connection instead. This way the same NAT operations=20
are applied to all the packets belonging to the same connection. The=20
conntrack uses addresses, protocol and ports but not the DSCP field to=20
uniquely identify connections. So packets with the same addresses,=20
protocol and ports are associated to the same connection regardless of=20
the DSCP field.

> Could I change it ? Is it possible to set iptables in order to avoid
> the srcPort and dstPort check ?

I'm afraid not. You must change at least one element among the source=20
and destination addresses and ports so packets appear to belong to=20
different connections.
