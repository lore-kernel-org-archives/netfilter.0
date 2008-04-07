From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: How to drop existing connections
Date: Mon, 7 Apr 2008 11:39:10 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804071137480.17722@fbirervta.pbzchgretzou.qr>
References: <316483.74640.qm@web65716.mail.ac4.yahoo.com> <1207560499.5879.22.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1207560499.5879.22.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?B?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>
Cc: Vitaly <vitaly_il@yahoo.com>, netfilter@vger.kernel.org


On Monday 2008-04-07 11:28, =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=
=B5=D0=BD=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA wrote:
>> > Using iptables?
>> > just add a drop rule having src/dest ip addressess
>> > and ports and protocol on
>> > top of other rules.
>>=20
>> Probably I wasn't clear - I want to kill existing,
>> already opened connection.=20
>> Now, after reading some articles/threads, it seems
>> that only utils like tcpkill, cutter can do this...
>
>You can use conntrack utility to remove conntrack entry,

This only removes the conntrack entry of course, and
does not induce a TCP reset.

>if you also
>drop INVALID packets with iptables this will let you kill connection.

When more packets come in, the 'connection' will go NEW, not INVALID.
