From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Filter by Packet's size
Date: Mon, 18 Feb 2008 15:36:18 +0200
Message-ID: <1203341778.18561.2.camel@localhost>
References: <1203337519.2366.4.camel@amokk.microserv.cl>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1203337519.2366.4.camel@amokk.microserv.cl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Michael =?ISO-8859-1?Q?Fern=E1ndez?= M <michael@michael.cl>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=9F=D0=BD=D0=B4, 18/02/2008 =D0=B2 09:25 -0300, Michael Fern=C3=
=A1ndez M =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi,=20
>=20
> Is there a way to filter a picket by the size of it?, i mean I Would
> like to filter all the packet hat it size 2 MB.
>=20
> Is that possible?
>=20
> Thanks to any answer.

iptables -m length --length 0:1024

But let me admit that normal packet length is up to 1500 bytes, in some
cases up to 65535 bytes. Maybe you didn't correctly face the question?

--=20
=D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=
=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>

