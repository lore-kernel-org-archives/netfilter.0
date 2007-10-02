From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: prerouting and route
Date: Tue, 02 Oct 2007 13:29:02 +0200
Message-ID: <47022B7E.3010208@plouf.fr.eu.org>
References: <200709292323.12968.comp.ogz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200709292323.12968.comp.ogz@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Oguz Yarimtepe a =E9crit :
>=20
> I gave some points that i couldnt visualize.=20
> First question is related with the route command. Lets say i defined =
a local=20
> route as,
>=20
> route add 10.2.0.0 netmask 255.255.255.0 gw 10.2.0.1 dev eth1

Weird route. It looks like the gateway address belongs to the=20
destination range. If so, how do you reach the gateway ?

> and while i am configuring iptables i wrote some rules:
[...]
> iptables -t nat -A PREROUTING -i eth0 -p ALL -d 10.2.0.0/24 -j DNAT -=
-to=20
> 10.2.0.1
>=20
> At this point i ask myself whether i need this rule,

The question is : what do you expect from this rule ?

> because i had already=20
> defined a route while configuring interfaces. So is there a relation =
between=20
> route definitions and prerouting,

Not directly. Routes tell how to route a packet, i.e. how it must be=20
sent out, mostly depending on its destination address, without altering=
=20
the destination address. DNAT rules say how to alter the destination=20
address, not how to route that destination.

In both cases here the packets will be sent to the gateway with address=
=20
10.2.0.1. But the difference is that routing does not change the=20
original destination address, and the gateway will forward the packets=20
to their final destination. With DNAT, the gateway becomes the final=20
destination.

> is it unnecessary to define a local route=20
> and try to the same thing with iptables?

I do not see what you mean.

> Second, i have a rule as,
>=20
> iptables -t nat -A PREROUTING -i eth1 -p ALL  -j DNAT --to 192.168.1.=
4
>=20
> 192.168.1.4 is the ip of eth0 which is plugged to a gateway with the =
ip=20
> 192.168.1.3. If i send a package from eth1 to lets say 192.168.1.10, =
its=20
> destination address is replaced with 192.168.1.4. After this point, w=
ill it=20
> continue to 192.168.1.3? If yes how?

No. The new destination address belongs to the host which becomes the=20
final destination, so the packet will be received locally instead of=20
being forwarded.
