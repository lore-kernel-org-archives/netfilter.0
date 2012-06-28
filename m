From: =?utf-8?Q?Stefan_Bauer?= <stefan.bauer@cubewerk.de>
Subject: AW: general question about DNAT-rule
Date: Thu, 28 Jun 2012 19:49:44 +0200
Message-ID: <zarafa.4fec9938.2a62.2ad8418a26a48827@zarafa.cubewerk.int>
References: <515168F006F2D643952F8FFD24F2E073015AD663A6@sonne2.gw.bringe.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <515168F006F2D643952F8FFD24F2E073015AD663A6@sonne2.gw.bringe.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?Q?netfilter=40vger=2Ekernel=2Eorg?= <netfilter@vger.kernel.org>

-----Urspr=C3=BCngliche Nachricht-----
Von:	Thomas B=C3=A4tzler <t.baetzler@bringe.com>
Gesendet:	Do 28.06.2012 19:44
Betreff:	AW: general question about DNAT-rule
An:	netfilter@vger.kernel.org;=20
CC:	Stefan Bauer <stefan.bauer@cubewerk.de>;=20
> Stefan Bauer asked:
> > This is done internally right? hence i dont see such a rule in the =
iptables=20
> -t nat
> > -vnL output?
>=20
> Have a look at /proc/net/ip_conntrack, or better yet, install the con=
ntrack=20
> utility.

Ok - so it is handled internal. Can i sum this up and keep in mind the =
following?

A single DNAT-rule is enough on a router to have bi-directional traffic=
 as the required "SNAT-magic"
is automatically done.

A DNAT and SNAT-rule is required on a device to forward packages to ano=
ther device because answer packages will not flow through the first dev=
ice as it is not in the middle like a router?

thank you very much for clarification.

Stefan
