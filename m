From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Blocking all APNIC addresses vs. per-country list
Date: Mon, 26 Apr 2010 18:09:50 +0300
Message-ID: <1272294590.3750.33.camel@casper.meteor.dp.ua>
References: <0414A4FA-32F4-4D94-92E0-FC5CC9B4D646@zconsulting.net>
	 <q2m56378e321004260719i6685af2arc8faa644f555485b@mail.gmail.com>
	 <4BD5A487.3020407@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BD5A487.3020407@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter <netfilter@vger.kernel.org>

=D0=92 =D0=9F=D0=BD=D0=B4, 26/04/2010 =D0=B2 16:34 +0200, Pascal Hambou=
rg =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hello,
>=20
> Richard Horton a =C3=A9crit :
> >=20
> > A better option would be to drop ssh connections if the number of
> > attempts from a single ip address exceedes an acceptable limit
>=20
> Preferably the number of *failed* attempts. That's what fail2ban and =
the
> like do.
>=20
> > can't see many legit uses for ssh where you you connect and
> > disconnect multiple times within a 1 minute window)
>=20
> What about scp ?

Regarding my rules multiple sequential scp attempt will get slow, but
sftp won't.

> > This can be done using either hashlimit or the recent matches...
>=20
> They don't know about failed attemps.

And this might be not needed. Fail2ban is more specific solution but
also is more complex and heavy. In my enviroment I haven't been feeling
iptables is insuficient and I need fail2ban, nevertheless, it should be
considered in other enviroments.

--=20
=D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=
=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>

