From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: More ethernet port same ip address
Date: Sat, 19 Jul 2008 16:13:55 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807191613060.10846@fbirervta.pbzchgretzou.qr>
References: <48819901.6030604@unipex.it> <4881F3A3.3080502@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4881F3A3.3080502@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Leonardo_Rodrigues_Magalh=C3=A3es?= <leolistas@solutti.com.br>
Cc: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>, netfilter@vger.kernel.org


On Saturday 2008-07-19 16:01, Leonardo Rodrigues Magalh=C3=A3es wrote:
> Michele Petrazzo - Unipex srl escreveu:
>> Hi all,
>> this is a very strange ask (I don't find any other on the net)...

It's as simple as "first interface with same subnet wins".

>   have you tried setting a bridge interface ???
>
>   do NOT give ip address to the real ethernet interfaces (ethX) .....=
 simply
> get them 'up' and them bring a bridge interface up, with the ip addre=
ss you
> need, and 'add' all the physical interfaces on the bridge interface.

And depending on the situation you might also need to enforce routing
at the bridge border so as to not open security holes.
