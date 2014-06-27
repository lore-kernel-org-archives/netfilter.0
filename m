From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: eth - NAT - Bridge - veth
Date: Fri, 27 Jun 2014 12:44:47 +0200
Message-ID: <53AD4B1F.1000705@plouf.fr.eu.org>
References: <CALPbv1_LnTW-F+xagDb6MU4pOgarNH6BousUbXkuzKNixXZHbA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALPbv1_LnTW-F+xagDb6MU4pOgarNH6BousUbXkuzKNixXZHbA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vijay Viswanathan <vijay.vishy@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hello,

Vijay Viswanathan a =E9crit :
> I have a setup where
> lxc ( container/light weight sandbox ) brings up veth and setsup IP a=
s
> 192.168.10.2. and runs telnet server ( on port 2300 )
>=20
> I created a bridge with IP 192.168.10.2 attaching the veth.

Why ?
Note : the address on br0 is different in the output of ifconfig.
Is 192.168.10.2 the address of the container or the host ?

> After the route setup, the host ( with eth1: 10.4.38.222 )

Note : the address on eth1 is different in the output of ifconfig.

> is able to ping the veth ( 192.168.10.2 ) and vice versa.

Vice versa ? What do you mean exactly ? What commands do you run ?

> Now how do I connect to the telnet server on 192.168.10.2: 2300 from
> 10.4.3x.xxx network ?

Assuming the routing is properly set up on the network (i.e. hosts on
the network or the default router have a route to 192.168.10.0/24 with
gateway 10.4.38.182) and forwarding is enable on the host
(net.ipv4.ip_forward=3D1), just run :

$ telnet <container_address> 2300

> I guess I need some kind of NAT rules

Only as a last resort if you cannot setup proper routing on the network=
=2E

> also tried adding :
>=20
> # brctl addif br0 eth1

If you add eth1 to the bridge, then you must :
- move the IP address from eth1 to br0,
- use an IP address in the external network subnet for the container.
