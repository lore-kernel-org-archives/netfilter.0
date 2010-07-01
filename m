From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: ebtables mac update
Date: Thu, 01 Jul 2010 20:00:11 +0300
Message-ID: <1278003611.4200.56.camel@casper.meteor.dp.ua>
References: <1277808205.3791.17.camel@casper.meteor.dp.ua>
	 <4C29E8B4.5060205@plouf.fr.eu.org>
	 <1277821770.4006.33.camel@casper.meteor.dp.ua>
	 <4C2B6536.2060401@plouf.fr.eu.org>
	 <1277941138.11021.20.camel@casper.meteor.dp.ua>
	 <4C2BD923.9020503@riverviewtech.net>
	 <1277975315.4200.8.camel@casper.meteor.dp.ua>
	 <4C2CBE02.7020308@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C2CBE02.7020308@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

=D0=92 =D0=A7=D1=82=D0=B2, 01/07/2010 =D0=B2 11:10 -0500, Grant Taylor =
=D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 07/01/10 04:08, =C3=B0=C3=8F=C3=8B=C3=8F=C3=94=C3=89=C3=8C=C3=85=C3=
=8E=C3=8B=C3=8F =C3=AB=C3=8F=C3=93=C3=94=C3=89=C3=8B wrote:
> > Yes, because I just switched ethernet cables.
>=20
> Ok.
>=20
> > In this case, from the Windows and Linux boxes point of view nothin=
g=20
> > should change, either they still remembering other's MAC (this case=
 it=20
> > will just send unicast direct packet) or not (broadcast ARP is send=
).
>=20
> Agreed.
>=20
> > The fact that problem persisted tells me that the problem is in mod=
ems=20
> > and not in linux bridge.
>=20
> Agreed.
>=20
> Will you try one more step after you re-run the test?  Namely, when t=
he=20
> boxen can't ping each other, try rebooting one or both of the modems =
and=20
> see if the problem continues after doing so.

I've done this in production enviroment (with linux bridge involved) as
well as in test enviroment (just 2 modems and 2 computers).

Those SHDSL modems should have equal setup except that one should be a
Server and the other a Client.

In both those situations rebooting Client doesn't help, but rebooting
Server one solves the problem.

> I have a feeling you have just about all the evidence you need to go=20
> back to your modem vendor's support and say "Listen up... what you to=
ld=20
> me was wrong and here's my proof.".

The thing is that we have 2 pairs of modem, one VDSL and one SHDSL. The=
y
both have this problem, and my initial post to support was about VDSL
modems were they told that problem is in something else. I can't prove
that because VDSL modems has broken and are now being repaired.

At another post about this problem regarding SHDSL modems they just
suggested unofficial firmware, which I'm afraid to update b/c if
something wrong I don't have any kind of backup there. Moreover I calle=
d
local service, they say any service will lead to transportation to
capital city and will take 1-3 months :/ This is what is being happened
with VDSL.

Thanks again.

--=20
=D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=
=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>

