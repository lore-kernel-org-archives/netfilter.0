From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: [SOLVED] Re: IPv6 forwarding to TAP-interface fails
Date: Wed, 23 Dec 2009 14:03:41 +0100
Message-ID: <4B32152D.60003@plouf.fr.eu.org>
References: <20091219162047.04be7ac3@coercion>	<4B2CDE84.3060703@plouf.fr.eu.org>	<20091221114648.08eede72@malediction> <20091221140952.63c607f5@malediction>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20091221140952.63c607f5@malediction>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mike Kazantsev <mk.fraggod@gmail.com>
Cc: netfilter@vger.kernel.org

Mike Kazantsev a =E9crit :
>=20
> And here's the problem: no link-local address on the interface.

Good catch. I didn't notice it.

> With this address added (or rather preserved), router is able to send
> neighbor solicitation requests from it and everything works fine.
>=20
> Anyway, strange thing is that, apparently, VM on the other side is ab=
le
> to send these requests without link-local address, using global one
> instead:
[...]
> Guess older kernel (2.6.30.4) there is the cause of it, and that's al=
so
> why it worked before with pretty much the same setup.

I observed that when sending a locally generated packet, Linux uses the
source address (which is one one of its own addresses) of the packet as
the source address in the neighbour solicitation, whereas when
forwarding a packet it uses the link-local address attached to the
output interface. So there may be trouble when forwarding a packet and
the output interface has no link-local address. The tcpdump trace in
your previous message shows a neighbour solicitation packet with
unspecified source address :

> IP6 :: > ff02::1:ff00:22: ICMP6, neighbor solicitation, who has 2001:=
470:1f0b:11de::22, length 24

This may explain the different results with pings from the LAN and from
the router, and also why VM does not have the problem even though it ha=
s
no link-local address.
