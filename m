From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: ebtables mac update
Date: Tue, 29 Jun 2010 17:29:30 +0300
Message-ID: <1277821770.4006.33.camel@casper.meteor.dp.ua>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua>
	 <4C29E8B4.5060205@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C29E8B4.5060205@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

=F7 =F7=D4=CF, 29/06/2010 =D7 14:36 +0200, Pascal Hambourg =D0=C9=DB=C5=
=D4:
> Pokotilenko Kostik (approximate romanization) wrote :
> >=20
> > We have two building with local networks connected by Zyxel Prestig=
e 841
> > and 841C VDSL-modems. They work in transparent bridge mode.
> >=20
> > On one end 841 is connected directly to a switch. On other 841C
> > connected to a linux router wich is also connected to a switch, and
> > those interfaces bridged.
>=20
> So is it a bridge or a router ?

Modems 841C and 841 are configured in bridge mode.

Linux box runs some services and have 3 interfaces, 2 of them are
bridged to br0 and one is left for separate local segment. So it is a
router between br0 and eth2 and a bridge between eth0, eth1.

> > There is a problem, when a computer is being moved from one buildin=
g to
> > another it stops seeing other end of the bridge until modems are
> > rebooted.
>=20
> Can you elaborate "stops seeing" ?
> Packet captures of ARP and IP traffic on both ends might provide more
> information.

Can't repeat tests right now, but I'm remembering that if I move the bo=
x
across the bridge and trying to ping box at other side: either
ARP-who-has can't cross the bridge or ARP-is-at (response) can't cross
the bridge.

I'll play more with this soon.

> > I was thinking the problem is in modems' part, but in Zyxel support=
 I've
> > been told they are just dumn transparent bridges and doesn't behave=
 like
> > that.
>=20
> A bridge (or a switch) is never completely as dumb as a hub. It uses =
a
> MAC-port table in order to forward frames only through the relevant p=
orts.

This is how I was thinking. It *should* be like the logic in a switch.

> > So, the only device left that may cause such problem is linux
> > router/bridge.
> >=20
> > Is there any kind of behaviour of linux bridge (ebtables) that may =
cause
> > such problem?
>=20
> The Linux bridge maintains a MAC-port table based on the source MAC
> address in received frames.

This is brctl showmacs, right?

>  As expected, if a MAC address was associated
> to a given port and a frame from that MAC address is received on a
> different port, then the table is updated accordingly.

So, this is exactly the same logic that switches use, right?

Can you confirm that if MAC (frame with source MAC) pops up on port
different from the one it was seen previous time then the port for that
MAC get updated?

What then "brctl setageing" for?

>  Besides,
> rebooting the modems and not the Linux box fixes the problem. So I do=
ubt
> that the Linux bridge causes the problem.

It may happen that rebooting the modems brings port link down and the
bridge may clear the MAC-port table on that port. This is similar to
what Zyxel support told me.

> Of course the update process requires that the moved box sends traffi=
c
> first. If it just sits there waiting then MAC-port tables won't be
> updated, until the entry eventually expires.

In my case on moved box I'm unable to make connections or even ping.

> > P.S. there is no ebtables rules at all, no iptables related rules.
>=20
> Then may I ask what is the purpose of this box ?

Besides that it is a server, iptables is used to restrict access for
separate local segment at eth2 (allow access to Internet and not to
local net). Ebtables is empty now, but I wanted to be able to filter
bridge traffic if that matters someday.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

