From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Routing traffic over two gateways by fwmark
Date: Thu, 02 Apr 2015 00:13:20 +0200
Message-ID: <551C6D80.8010506@plouf.fr.eu.org>
References: <b2ca7b1036797bf4b84622f88540585d@killock.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <b2ca7b1036797bf4b84622f88540585d@killock.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matt Killock <lists@killock.net>
Cc: netfilter@vger.kernel.org

Matt Killock a =E9crit :
>=20
> I am having trouble re-using scripts that worked in kernel 2.6.24 wit=
h a=20
> more recent 3.16.0 series kernel. The essence of what I am trying to =
do=20
> is this:
>=20
> iptables mark all packets arriving from anywhere on interface 1 with=20
> '10'
> iptables mark all packets arriving from anywhere on interface 2 with=20
> '20'
>=20
> iptables DNAT incoming traffic on interface 1 on port 1111 to interna=
l=20
> server via interface 3
> iptables DNAT incoming traffic on interface 2 on port 1111 to interna=
l=20
> server via interface 3
>=20
> ip rule from all fwmark 10 table T1
> ip rule from all fwmark 20 table T2
>=20
> default gateway in table T1 is through interface 1
> default gateway in table T2 is through interface 2
>=20
> With the view to make everything that arrives on a particular interfa=
ce=20
> leave via that interface. The above approach worked fine in kernel 2.=
6=20

I don't think so. You must mark packets from the server arriving from
the server at interface 3, not packets arriving at interface 1 and 2.
Packets arriving at interface 1 and 2 are all routed via interface 3, s=
o
they have no need for advanced routing.

> but does not seem to work any more. With no default gateway in the ma=
in=20
> routing table, the packets arrive on the external interfaces but do n=
ot=20
> appear on the LAN interface, almost as if DNAT is having no effect at=
=20
> all.

Check the value of rp_filter for interface 1, interface 2 and all.
Since some kernel version the logic has changed from AND to MAX.

> One of the two DNAT rules works if I add a default gateway to the=20
> main routing table, but then it appears that the policy routing table=
s=20
> or firewall marks are ignored.

You must mark packets arriving from the server at interface 3. For this
you must mark the incoming connections (CONNMARK) and transfer the
connection mark to the packets arriving at interface 3.

Another method not requiring connection marking is to use the original
destination address (-m conntrack --ctorigdst) to mark the packets.
