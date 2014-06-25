From: Jamie Cockburn <jcockburn@bloxx.com>
Subject: RE: Iptables: Matching packets leaving a bridged interface
Date: Wed, 25 Jun 2014 10:49:52 +0000
Message-ID: <D1310F2F383A5D4D8D7944C4FB42CFA84CA24A@BLX-EX01.alba.local>
References: <D1310F2F383A5D4D8D7944C4FB42CFA84CA145@BLX-EX01.alba.local>
 <53AA9D26.9000505@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <53AA9D26.9000505@plouf.fr.eu.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Pascal!

Thanks for getting back to me.  Very helpful information!

Pascal Hambourg wrote:
> Because the packet is not bridged, as eth2 is not part of the bridge.=
 So  it won't follow the FORWARD bridging path but the FORWARD IP routi=
ng path.
>
> See the packet flow diagram in <http://en.wikipedia.org/wiki/Netfilte=
r>.

I think I follow... So based on the diagram, my packet is initially hit=
ting "bridge check", heading along the green "network layer" path, hitt=
ing "routing decision", and dropping down into the blue "link layer" pa=
th.  Hence, until it gets to ebtables -> nat -> output, it's not gone a=
nywhere near the bridging mechanism, so has never has PHYSOUT set.

Couple of follow-up question then!

1: Do you know if by the time it reaches ebtables -> filter -> output t=
hat the packet will have a PHYSOUT (or equivalent) set?

2: Will I be able to differentiate between packets for eth0 and eth1 (w=
hen the bridge doesn't know which specific interface it should send it =
on).

Now I need to complicate my original scenario...say I want to drop pack=
ets the originate from eth2 (the non-bridged interface) and will egress=
 on eth0.

3: I'm guessing that by the time the packet hits ebtables -> filter -> =
output, that it will have lost its IN/PHYSIN?

4: If that is the case, would something like this work:
      - In iptables -> filter: -A FORWARD -i eth2 -o br0 -j MARK --set-=
mark 1234
      - In ebtable -> filter: -A OUTPUT -physdev-out eth0 --m mark --ma=
rk 1234 -j DROP

Jamie

-----Original Message-----
=46rom: Pascal Hambourg [mailto:pascal@plouf.fr.eu.org]=20
Sent: 25 June 2014 10:58
To: Jamie Cockburn
Cc: netfilter@vger.kernel.org
Subject: Re: Iptables: Matching packets leaving a bridged interface

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
Report this message as spam http://joey.alba.local/quarantine/notificat=
ions/reportspam/message/1813852/check/9da66caf713bf11249ee4bc6db23fa2f


