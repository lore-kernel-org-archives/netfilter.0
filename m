From: Michal =?utf-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Subject: Re: FORWARD chain in Loop Back interface
Date: Mon, 21 Nov 2011 07:44:44 +0100
Message-ID: <8934641.4kEUHV0BPG@alaris>
References: <CAGZFCEEyxe-pWwZ8ZzuMV_a_20J_F9txS08aUELx7R3LauCWTw@mail.gmail.com>
Reply-To: Michal =?utf-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGZFCEEyxe-pWwZ8ZzuMV_a_20J_F9txS08aUELx7R3LauCWTw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter mailing list <netfilter@vger.kernel.org>

Dne Po 21. listopadu 2011 11:25:52, ratheesh kannoth napsal(a):
>=20
> I have a linux laptop.  i have only loop back interface. i have a
> small tcp client and tcp server running on the machine  ( simple tcp
> echo server and client ).
>=20
> I would like to log these packets  using   , iptables -A FORWARD -p
> tcp -j LOG.  But there is no log getting captured when i execute
> client and server ?
>=20
> is there any way to  produce this  logs ( with only loop back
> interface )  in forward chain ?

Packets going from your system to your system via loopback are not goin=
g=20
through FORWARD chain (there is no forwarding), they pass through OUTPU=
T=20
(as they are locally generated) and then through INPUT (they are locall=
y=20
delivered).

                                                          Michal Kube=E8=
ek

