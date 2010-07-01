From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: ebtables mac update
Date: Thu, 01 Jul 2010 12:08:35 +0300
Message-ID: <1277975315.4200.8.camel@casper.meteor.dp.ua>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua>
	 <4C29E8B4.5060205@plouf.fr.eu.org>
	 <1277821770.4006.33.camel@casper.meteor.dp.ua>
	 <4C2B6536.2060401@plouf.fr.eu.org>
	 <1277941138.11021.20.camel@casper.meteor.dp.ua>
	 <4C2BD923.9020503@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C2BD923.9020503@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

=F7 =F3=D2=C4, 30/06/2010 =D7 18:54 -0500, Grant Taylor =D0=C9=DB=C5=D4=
:
> =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB wrote:
> > Funny thing is that the problem persist. Tonight I've made some tes=
ts=20
> > with 782M. I've connected two computers in my office (win7 and linu=
x)=20
> > through this pair directly. I seccessfully tested ping both=20
> > directions, then switched them so that each crossed the bridge and=20
> > was unable to ping.
>=20
> When you switch then, do the Linux and Windows systems know that thei=
r=20
> network cable has been unplugged?

Yes, because I just switched ethernet cables.

> If they do, they will very likely flush their caches.
>=20
> If the problem persists after the Linux and Windows systems flush the=
ir=20
> cache, I'm strongly thinking that the problem is with the DSL bridges=
=2E

In this case, from the Windows and Linux boxes point of view nothing
should change, either they still remembering other's MAC (this case it
will just send unicast direct packet) or not (broadcast ARP is send).

> > Regarding this I can surely tell (this is all about 782M pair) that=
=20
> > after box crossing the bridge MAC-port table is not updating (how i=
t=20
> > should be if it were switch's logic). Packets with srcMAC of crosse=
d=20
> > box CAN cross the bridge, but with dstMAC of crossed box CANNOT cro=
ss=20
> > the bridge.
>=20
> That really sounds like the something is not forwarding traffic b/c i=
t=20
> still thinks that the destination MAC is on the local side.
>=20
> Please clarify, when you ran your test, did you try trading sides of =
the=20
> Linux bridge individually or the Linux bridge in combination with the=
=20
> DSL bridge?
>=20
> Can you try repeating your test on either side of the Linux bridge?

I repeat, that in this test case with 782M modems I brought them both t=
o
office, connected with 2 meters phone cable, and connected Windows box
to one modem, Linux to other, then switched.

So the scheme was this:

Win --- 782M Server ----- 782M Client --- Linux

and after switch:

Linux --- 782M Server ----- 782M Client --- Win

The fact that problem persisted tells me that the problem is in modems
and not in linux bridge.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

