From: "Eljas Alakulppi" <Buzer@buzer.net>
Subject: Re: Network Communication Issues
Date: Fri, 14 Dec 2007 11:12:37 +0200
Message-ID: <op.t3bijbh3rtqp7s@hagumi.home.buzer.net>
References: <000b01c83ce4$71df9fb0$fe02a8c0@brammo.main> <4760800B.7040601@riverviewtech.net> <003e01c83db1$25d10460$fe02a8c0@brammo.main> <47617846.5090101@riverviewtech.net> <004001c83db7$cd376bd0$fe02a8c0@brammo.main> <1197620620.2970.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1197620620.2970.2.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: casper@meteor.dp.ua, Jacob Lear <jlear@brammo.com>
Cc: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

You can actually add more default gateways to one interface by using =20
Advanced option under TCP/IP properties. Of course, these are default =20
gateways, so all traffic that doesn't match other routing rules will ge=
t =20
routed thru these. You can alter the metrics to define gateway priority=
=2E

I doubt you can add default gateways that reside under different networ=
ks =20
this way tho. (I have used multiple default gateways on different =20
interfaces in Windows before tho and I didn't have any problems. The re=
al =20
default interface had lower metric value than then the other, so if I =20
wanted use the other, I would need to bind to it directly)

Anyway, this got a little off-topic :)

=D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=
=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua> kirjoitti Fri, 14 =
Dec 2007 =20
10:23:40 +0200:

> =D0=92 =D0=A7=D1=82=D0=B2, 13/12/2007 =D0=B2 10:41 -0800, Jacob Lear =
=D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
>> I don't think that's the problem... based on what I've read online, =
=20
>> Windows
>> doesn't like having more than 1 Default Gateway -- it confuses it (b=
ig
>> shocker there huh?). I tried it that way at first and it was complai=
ning
>> when I tried to save the TCP/IP properties. I don't think the routin=
g =20
>> was
>> working right either... I seem to recall some issues.
>
> Because that way windows will get two default gateways, which it thin=
ks
> is not correct. You can add only one default gateway (via TCP/IP
> properties), and if you need more you can add one non-default with a
> comamnd "route add...".
>



--=20
K=C3=A4yt=C3=B6ss=C3=A4 Operan vallankumouksellinen s=C3=A4hk=C3=B6post=
iohjelma: =20
http://www.opera.com/mail/
