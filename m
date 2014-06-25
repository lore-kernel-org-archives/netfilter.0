From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Iptables: Matching packets leaving a bridged interface
Date: Wed, 25 Jun 2014 11:57:58 +0200
Message-ID: <53AA9D26.9000505@plouf.fr.eu.org>
References: <D1310F2F383A5D4D8D7944C4FB42CFA84CA145@BLX-EX01.alba.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <D1310F2F383A5D4D8D7944C4FB42CFA84CA145@BLX-EX01.alba.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jamie Cockburn <jcockburn@bloxx.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

Jamie Cockburn a =E9crit :
>=20
> Given a setup with eth0 and eth1 in a bridge br0 and a third interfac=
e eth2.
>=20
> In this scenario, lets say I want TCP port 80 traffic to be dropped i=
f it is going to the network attached to eth0, but allow it to eth1.
>=20
> I am therefore trying to reliably match packets that go out over the =
specific interface eth0.
>=20
> If I add the following iptables rule in the filter table:
>=20
>     -A FORWARD -o br0 --physdev-out eth0 -j LOG
>=20
> Given a packet that originates from eth1 (the other half of the bridg=
e), then the rule matches just fine, logging:
>=20
>     ... IN=3Dbr0 OUT=3Dbr0 PHYSIN=3Deth2 PHYSOUT=3Deth1 ...
>=20
> However if the packet origniates from eth2, then the rule no longer m=
atches.

Because the packet is not bridged, as eth2 is not part of the bridge. S=
o
 it won't follow the FORWARD bridging path but the FORWARD IP routing p=
ath.

See the packet flow diagram in <http://en.wikipedia.org/wiki/Netfilter>=
=2E
According to it, the packet will enter the bridging OUTPUT path only
after the last iptables chain was traversed.

I'm afraid you only option to deal with that case is to use ebtables
filtering in the OUTPUT chain.
