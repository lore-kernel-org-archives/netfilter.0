From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: How to drop existing connections
Date: Mon, 7 Apr 2008 13:11:17 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804071307390.17722@fbirervta.pbzchgretzou.qr>
References: <316483.74640.qm@web65716.mail.ac4.yahoo.com>  <1207560499.5879.22.camel@casper.meteor.dp.ua>  <alpine.LNX.1.10.0804071137480.17722@fbirervta.pbzchgretzou.qr> <1207562913.5879.32.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1207562913.5879.32.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?B?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>
Cc: netfilter@vger.kernel.org, Vitaly <vitaly_il@yahoo.com>, Karim Asif <karimas@kfupm.edu.sa>

On Monday 2008-04-07 12:08, =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=
=B5=D0=BD=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA wrote:

>=D0=92 =D0=9F=D0=BD=D0=B4, 07/04/2008 =D0=B2 11:39 +0200, Jan Engelhar=
dt =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> >
>> >You can use conntrack utility to remove conntrack entry,
>>=20
>> This only removes the conntrack entry of course, and
>> does not induce a TCP reset.
>>=20
>> >if you also
>> >drop INVALID packets with iptables this will let you kill connectio=
n.
>>=20
>> When more packets come in, the 'connection' will go NEW, not INVALID=
=2E
>
>Maybe, I remember reading this solution somewhere.

This solution requires that you only accept NEW connections
that have SYN set. Something like

  -m conntrack --ctstate ESTABLISHED -j ACCEPT
  -p tcp --syn -m conntrack --ctstatus NEW -j ACCEPT
  -p udp -m conntrack --ctstatus NEW -j ACCEPT
  -p tcp -j REJECT --reject-with tcp-reset
  -j REJECT

yes, that is indeed a good idea to do a tcpkill on connections
using conntrack :-)
