From: Michael =?ISO-8859-1?Q?Fern=E1ndez?= M <michael@michael.cl>
Subject: Re: Filter by Packet's size
Date: Mon, 18 Feb 2008 10:59:00 -0300
Message-ID: <1203343140.2366.22.camel@amokk.microserv.cl>
References: <1203337519.2366.4.camel@amokk.microserv.cl>
	 <1203341778.18561.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1203341778.18561.2.camel@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: casper@meteor.dp.ua
Cc: netfilter@vger.kernel.org

On Mon, 2008-02-18 at 15:36 +0200, =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=
=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA wro=
te:
> =D0=92 =D0=9F=D0=BD=D0=B4, 18/02/2008 =D0=B2 09:25 -0300, Michael Fer=
n=C3=A1ndez M =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hi,=20
> >=20
> > Is there a way to filter a picket by the size of it?, i mean I Woul=
d
> > like to filter all the packet hat it size 2 MB.
> >=20
> > Is that possible?
> >=20
> > Thanks to any answer.
>=20
> iptables -m length --length 0:1024
>=20

> But let me admit that normal packet length is up to 1500 bytes, in so=
me
> cases up to 65535 bytes. Maybe you didn't correctly face the question=
?
>=20

Yea, i know... but the thing is:

I have a mail server (Postfix), and if I restrict the size of messages
up to 2 MB.. then a user send an email (3 MB) and Postfix receive the
message an then say: "You cannot send this message because of the
size"... and send a notification to the user... so I want to stop the
packets before them arrives to Postfix... and take off this load to the
mail server... =20

Now is better explain?=20

Regars,...

Michael.-





