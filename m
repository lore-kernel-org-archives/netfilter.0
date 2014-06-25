From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Iptables: Matching packets leaving a bridged interface
Date: Wed, 25 Jun 2014 13:03:13 +0200
Message-ID: <53AAAC71.5000702@plouf.fr.eu.org>
References: <D1310F2F383A5D4D8D7944C4FB42CFA84CA145@BLX-EX01.alba.local> <53AA9D26.9000505@plouf.fr.eu.org> <D1310F2F383A5D4D8D7944C4FB42CFA84CA24A@BLX-EX01.alba.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <D1310F2F383A5D4D8D7944C4FB42CFA84CA24A@BLX-EX01.alba.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jamie Cockburn <jcockburn@bloxx.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Jamie Cockburn a =E9crit :
>=20
> Couple of follow-up question then!

All the answers (and much more) are in the ebtables manpage.

> 1: Do you know if by the time it reaches ebtables -> filter -> output=
 that the packet will have a PHYSOUT (or equivalent) set?

Yes. See man ebtables, -o.

> 2: Will I be able to differentiate between packets for eth0 and eth1 =
(when the bridge doesn't know which specific interface it should send i=
t on).

Yes. The bridge knows where it sends packets.

> 3: I'm guessing that by the time the packet hits ebtables -> filter -=
> output, that it will have lost its IN/PHYSIN?

Yes. See man ebtables, -i.

> 4: If that is the case, would something like this work:
>       - In iptables -> filter: -A FORWARD -i eth2 -o br0 -j MARK --se=
t-mark 1234
>       - In ebtable -> filter: -A OUTPUT -physdev-out eth0 --m mark --=
mark 1234 -j DROP

Yes. See man ebtables, mark.
