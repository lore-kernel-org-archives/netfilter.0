From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Filtering Broadcasted UDP Packets on a Specific Bridged Interface
Date: Tue, 04 Jun 2013 09:35:13 +0200
Message-ID: <51AD98B1.6000105@plouf.fr.eu.org>
References: <CAO9Kb4BjaV-C0OzPJmifhVZ5p6MTX8=4o2BN7yMthzy+Q89TjA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAO9Kb4BjaV-C0OzPJmifhVZ5p6MTX8=4o2BN7yMthzy+Q89TjA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dan Osawa <dkosawa@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

Hello,

Dan Osawa a =E9crit :
>=20
> iptables -A OUTPUT -p udp --dport 7000 -m physdev --physdev-out eth0 =
-j DROP
>=20
> Doing the above results in an error: *xt_physdev: using --physdev-out
> in the OUTPUT, FORWARD and POSTROUTING chains for non-bridged traffic
> is not supported anymore.*

Weird message. I wonder how bridged traffic could ever reach the OUTPUT
chain...

> So i tried the following:
>=20
> iptables -F
>=20
> iptables -A OUTPUT -p udp --dport 7000 -m physdev --physdev-out eth0
> --physdev-is-bridged -j DROP
>=20
> The above doesn't fail, but also doesn't suppress the packets.
>=20
> Any suggestions?  Am I way off in thinking that IP tables can do this=
?
>  Do I need to use etables instead?

Yes. At the time iptables handles the packet, the output port is not
known yet.
