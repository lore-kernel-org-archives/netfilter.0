From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: ebtables mac update
Date: Thu, 01 Jul 2010 13:11:49 +0300
Message-ID: <1277979109.4200.20.camel@casper.meteor.dp.ua>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua>
	 <4C29E8B4.5060205@plouf.fr.eu.org>
	 <1277821770.4006.33.camel@casper.meteor.dp.ua>
	 <4C2B6536.2060401@plouf.fr.eu.org>
	 <1277941138.11021.20.camel@casper.meteor.dp.ua>
	 <4C2C66F1.1080602@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C2C66F1.1080602@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

=F7 =FE=D4=D7, 01/07/2010 =D7 11:59 +0200, Pascal Hambourg =D0=C9=DB=C5=
=D4:
> Pokotilenko Kostik (approximate romanization) wrote :
> >=20
> > Funny thing is that the problem persist. Tonight I've made some tes=
ts
> > with 782M. I've connected two computers in my office (win7 and linu=
x)
> > through this pair directly. I seccessfully tested ping both directi=
ons,
> > then switched them so that each crossed the bridge and was unable t=
o
> > ping.
> >=20
> > tcpdump from linux showed:
> >=20
> > 1. while pinging from linux to win7:
> >=20
> > - Linux sends broadcast ARP-WHO-HAS win7-ip and no one replays
> > - I was able to see win7's ARP-WHO-HAS some-other-ip after that lin=
ux
> > probably learned it's MAC and started to send unicast ping requests=
,
> > still no replay
> > - I also saw some unicast packets from win7 crossed the bridge
> >=20
> > 2. while pinging from win7 to linux:
> >=20
> > - linux gets broadcast ARP-WHO-HAS linux-ip
> > - linux replays unicast ARP-IS-AT
> > - those two repeat, so win7 doesn't get replay
> >=20
> > Regarding this I can surely tell (this is all about 782M pair) that
> > after box crossing the bridge MAC-port table is not updating (how i=
t
> > should be if it were switch's logic). Packets with srcMAC of crosse=
d box
> > CAN cross the bridge, but with dstMAC of crossed box CANNOT cross t=
he
> > bridge.
>=20
> An explanation may be that the MAC table in each modem is updated onl=
y
> with the source address of packets received on the ethernet port and =
not
> those received through the VDSL link, based on the assumption that th=
e
> other modem already takes care of them.
>=20
> Do the modems have a management interface that shows the contents of =
the
> MAC table ?

They do have management interface, but I was unable to find a way to se=
e
MAC table. I'll discuss this with Zyxel support maybe they'll clear tha=
t
out. Main thing is that tonight I got chance to pull modems off
production and make those tests in simplified enviroment.

Thanks to all. Now it doesn't seem related to linux bridge, so if there
is new input I'll continue this thread.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

