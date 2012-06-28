From: =?utf-8?Q?Stefan_Bauer?= <stefan.bauer@cubewerk.de>
Subject: general question about DNAT-rule
Date: Thu, 28 Jun 2012 19:38:24 +0200
Message-ID: <zarafa.4fec9690.2921.2a067fab23d16ee0@zarafa.cubewerk.int>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?Q?netfilter=40vger=2Ekernel=2Eorg?= <netfilter@vger.kernel.org>

-----Urspr=C3=BCngliche Nachricht-----
Von:	Yucong Sun (=E5=8F=B6=E9=9B=A8=E9=A3=9E) <sunyucong@gmail.com>
Gesendet:	Do 28.06.2012 19:35
Betreff:	Re: general question about DNAT-rule
An:	Stefan Bauer <stefan.bauer@cubewerk.de>;=20
CC:	netfilter@vger.kernel.org;=20
> DNAT will auto create a SNAT rule for=C2=A0reverse=C2=A0stream, it is=
 based on connection=20
> tracking .=C2=A0

This is done internally right? hence i dont see such a rule in the ipta=
bles -t nat -vnL output?

Stefa
