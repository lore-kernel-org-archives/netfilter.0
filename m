From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: More ethernet port same ip address
Date: Sat, 19 Jul 2008 17:42:28 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807191739560.21244@fbirervta.pbzchgretzou.qr>
References: <48819901.6030604@unipex.it> <4881F3A3.3080502@solutti.com.br> <alpine.LNX.1.10.0807191613060.10846@fbirervta.pbzchgretzou.qr> <488204EB.3090902@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <488204EB.3090902@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Cc: netfilter@vger.kernel.org, =?UTF-8?Q?Leonardo_Rodrigues_Magalh=C3=A3es?= <leolistas@solutti.com.br>


On Saturday 2008-07-19 17:14, Michele Petrazzo - Unipex srl wrote:

> Jan Engelhardt wrote:
>> On Saturday 2008-07-19 16:01, Leonardo Rodrigues Magalh=C3=83=C2=A3e=
s wrote:
>> > Michele Petrazzo - Unipex srl escreveu:
>> > > Hi all, this is a very strange ask (I don't find any other on th=
e
>> > > net)...
>>=20
>> It's as simple as "first interface with same subnet wins".
>
> Ok. Thanks for the simple, but complete explain. But  where to say "g=
o
> out through the right one?"

The fact is, you do not know in advance which is the right one.

>> And depending on the situation you might also need to enforce routin=
g
>>  at the bridge border so as to not open security holes.
>
> Have you some more words about this? Where can I found problems? How =
to
> modify routing?

ebtables -t broute -P BROUTING DROP

which will force all packets being routed.
