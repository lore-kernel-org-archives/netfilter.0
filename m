From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Using MARK and TOS to route traffic through different interfaces
 to the same destination
Date: Fri, 12 Dec 2008 13:42:28 +0100
Message-ID: <49425C34.3050108@plouf.fr.eu.org>
References: <145d4e1a0812110418l3a867cb6pe6d45e9fd1007a75@mail.gmail.com>	 <1228998831.22977.9.camel@enterprise.ims-firmen.de>	 <49410A7C.6010501@plouf.fr.eu.org>	 <145d4e1a0812110515j30341cc0s438505a5e3785f74@mail.gmail.com>	 <49423E07.6050806@plouf.fr.eu.org> <145d4e1a0812120357i12694aa6o11c64fba2ab8fefb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <145d4e1a0812120357i12694aa6o11c64fba2ab8fefb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Javier G=E1lvez Guerrero a =E9crit :
>=20
> It seems that it matches and manages more or less properly, but the I=
P
> address not change while the output interface seems to be selected
> accordingly the rules. As said before, each interface is binded to a
> different IP address.

The source address is selected either by the sender process or by the=20
initial routing decision, before the OUTPUT chains. Rerouting after the=
=20
OUTPUT chains does not alter it even though the output interface has=20
changed. Thus the source address selection is unaware of iptables-based=
=20
advanced routing.

> This is the configuration I set:
[...]
> sudo ip route add table 1 192.168.0.2 dev ath0
> sudo ip route add table 2 192.168.0.2 dev eth0

Isn't there a typo ? These commands create host routes to 192.168.0.2,=20
not default routes via gateway 192.168.0.2 as in your previous message.
Another problem is that according to the interface subnets and the main=
=20
routing table, 192.168.0.2 is reachable only on eth0, not ath0.

> dulceangustia@spike:~$ ip route
> 192.168.0.0/25 dev eth0  proto kernel  scope link  src 192.168.0.3
> 192.168.0.128/25 dev ath0  proto kernel  scope link  src 192.168.0.15=
0
> default via 192.168.0.1 dev eth0

Are both interfaces on the same link ? If yes, what is the subnet on=20
that link ?

> And this is what I get:
>=20
> dulceangustia@spike:~$ sudo iptables -vL

This command only shows the default (filter) table. You want to display=
=20
the mangle table with -t mangle.

> I don't know why the source IP address is not changed. May be a
> problem of ip route and not iptables?

I explained why the source address is unchanged, see above.

> Any idea about how to solve it?

Either select the source address in the sender process (if you can=20
select the destination port, you may be able to select the source=20
address too) or use iptables SNAT.

> I tried also to add a POSTROUTING SNAT rule to change the origin
> source but it doesn't take any effect.

It should work. What rules did you try ? Note that iperf shows only the=
=20
initial source address before SNAT, not the actual address on the wire.
