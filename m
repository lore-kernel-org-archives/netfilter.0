From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: ebtables mac update
Date: Thu, 01 Jul 2010 02:38:58 +0300
Message-ID: <1277941138.11021.20.camel@casper.meteor.dp.ua>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua>
	 <4C29E8B4.5060205@plouf.fr.eu.org>
	 <1277821770.4006.33.camel@casper.meteor.dp.ua>
	 <4C2B6536.2060401@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C2B6536.2060401@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Thanks for your answers.

It is mess a bit, because modems I was talking about (841,841C) has
broken and are now in service.

We have another pair of Zyxel Prestige 782M SHDSL modems that are being
used as temporary replacement.

=46unny thing is that the problem persist. Tonight I've made some tests
with 782M. I've connected two computers in my office (win7 and linux)
through this pair directly. I seccessfully tested ping both directions,
then switched them so that each crossed the bridge and was unable to
ping.

tcpdump from linux showed:

1. while pinging from linux to win7:

- Linux sends broadcast ARP-WHO-HAS win7-ip and no one replays
- I was able to see win7's ARP-WHO-HAS some-other-ip after that linux
probably learned it's MAC and started to send unicast ping requests,
still no replay
- I also saw some unicast packets from win7 crossed the bridge

2. while pinging from win7 to linux:

- linux gets broadcast ARP-WHO-HAS linux-ip
- linux replays unicast ARP-IS-AT
- those two repeat, so win7 doesn't get replay

Regarding this I can surely tell (this is all about 782M pair) that
after box crossing the bridge MAC-port table is not updating (how it
should be if it were switch's logic). Packets with srcMAC of crossed bo=
x
CAN cross the bridge, but with dstMAC of crossed box CANNOT cross the
bridge.

=F7 =F3=D2=C4, 30/06/2010 =D7 17:39 +0200, Pascal Hambourg =D0=C9=DB=C5=
=D4:
> Pokotilenko Kostik (approximate romanization) wrote :
> >>> We have two building with local networks connected by Zyxel Prest=
ige 841
> >>> and 841C VDSL-modems. They work in transparent bridge mode.
> >>>
> >>> On one end 841 is connected directly to a switch. On other 841C
> >>> connected to a linux router wich is also connected to a switch, a=
nd
> >>> those interfaces bridged.
> >> So is it a bridge or a router ?
> >=20
> > Modems 841C and 841 are configured in bridge mode.
>=20
> You already made that clear. I was asking about the Linux box.
>=20
> > Linux box runs some services and have 3 interfaces, 2 of them are
> > bridged to br0 and one is left for separate local segment. So it is=
 a
> > router between br0 and eth2 and a bridge between eth0, eth1.
>=20
> Ok.
>=20
> >>> There is a problem, when a computer is being moved from one build=
ing to
> >>> another it stops seeing other end of the bridge until modems are
> >>> rebooted.
> >> Can you elaborate "stops seeing" ?
> >> Packet captures of ARP and IP traffic on both ends might provide m=
ore
> >> information.
> >=20
> > Can't repeat tests right now, but I'm remembering that if I move th=
e box
> > across the bridge and trying to ping box at other side: either
> > ARP-who-has can't cross the bridge or ARP-is-at (response) can't cr=
oss
> > the bridge.
> >=20
> > I'll play more with this soon.
>=20
> Please do so. And make sure you capture and compare traffic at each p=
ort
> of the Linux bridge (eth0 and eth1).
>=20
> > Can you confirm that if MAC (frame with source MAC) pops up on port
> > different from the one it was seen previous time then the port for =
that
> > MAC get updated?
>=20
> I can only confirm that a Linux bridge does this, because I tested it=
=2E I
> cannot confirm about other bridging devices, although this is what th=
ey
> should do.
>=20
> >> rebooting the modems and not the Linux box fixes the problem. So I=
 doubt
> >> that the Linux bridge causes the problem.
> >=20
> > It may happen that rebooting the modems brings port link down and t=
he
> > bridge may clear the MAC-port table on that port. This is similar t=
o
> > what Zyxel support told me.
>=20
> Note that you can achieve the same result by deactivating and
> reactivating br0 or its ports, without touching the modems.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

