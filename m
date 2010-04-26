From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Blocking all APNIC addresses vs. per-country list
Date: Mon, 26 Apr 2010 18:14:15 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004261813360.30464@obet.zrqbmnf.qr>
References: <0414A4FA-32F4-4D94-92E0-FC5CC9B4D646@zconsulting.net>  <q2m56378e321004260719i6685af2arc8faa644f555485b@mail.gmail.com>  <4BD5A487.3020407@plouf.fr.eu.org> <1272294590.3750.33.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1272294590.3750.33.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?B?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>
Cc: netfilter <netfilter@vger.kernel.org>


On Monday 2010-04-26 17:09, =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=
=B5=D0=BD=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA wrote:
>=D0=92 =D0=9F=D0=BD=D0=B4, 26/04/2010 =D0=B2 16:34 +0200, Pascal Hambo=
urg =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hello,
>>=20
>> Richard Horton a =C3=A9crit :
>> >=20
>> > A better option would be to drop ssh connections if the number of
>> > attempts from a single ip address exceedes an acceptable limit
>>=20
>> Preferably the number of *failed* attempts. That's what fail2ban and=
 the
>> like do.
>>=20
>> > can't see many legit uses for ssh where you you connect and
>> > disconnect multiple times within a 1 minute window)
>>=20
>> What about scp ?
>
>Regarding my rules multiple sequential scp attempt will get slow, but
>sftp won't.

scp is a little slow itself, nor does it copy attributes well. Use rsyn=
c
where available.

