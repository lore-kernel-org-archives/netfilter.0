From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: More ethernet port same ip address
Date: Sat, 19 Jul 2008 17:14:51 +0200
Message-ID: <488204EB.3090902@unipex.it>
References: <48819901.6030604@unipex.it> <4881F3A3.3080502@solutti.com.br> <alpine.LNX.1.10.0807191613060.10846@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0807191613060.10846@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>, =?UTF-8?B?TGVvbmFyZG8gUm9kcmlndWU=?= =?UTF-8?B?cyBNYWdhbGjDo2Vz?= <leolistas@solutti.com.br>

Jan Engelhardt wrote:
> On Saturday 2008-07-19 16:01, Leonardo Rodrigues Magalh=C3=83=C2=A3es=
 wrote:
>> Michele Petrazzo - Unipex srl escreveu:
>>> Hi all, this is a very strange ask (I don't find any other on the
>>> net)...
>=20
> It's as simple as "first interface with same subnet wins".
>=20

Ok. Thanks for the simple, but complete explain. But  where to say "go
out through the right one?"

>> have you tried setting a bridge interface ???
>>=20
>> do NOT give ip address to the real ethernet interfaces (ethX) .....
>> simply get them 'up' and them bring a bridge interface up, with the
>> ip address you need, and 'add' all the physical interfaces on the
>> bridge interface.
>=20
> And depending on the situation you might also need to enforce routing
>  at the bridge border so as to not open security holes.

Have you some more words about this? Where can I found problems? How to
modify routing?

Thanks,
Michele

