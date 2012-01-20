From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [xtables-addons] memory usage in module geoip (probably)
Date: Fri, 20 Jan 2012 22:00:23 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201202156410.13241@frira.zrqbmnf.qr>
References: <4F19928A.7050005@mejor.pl> <alpine.LNX.2.01.1201201800150.29700@frira.zrqbmnf.qr> <8b53c851c9391f9bc9ce3427acdbab4c@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8b53c851c9391f9bc9ce3427acdbab4c@mejor.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?Marcin_Miros=C5=82aw?= <marcin@mejor.pl>
Cc: netfilter@vger.kernel.org

On Friday 2012-01-20 21:18, Marcin Miros=C5=82aw wrote:

> W dniu 2012-01-20 18:05, Jan Engelhardt napisa=C5=82(a):
>> geoip uses vmalloc for its huge allocations, so that can't be it. Th=
e
>> massive size of skbuff_head_cache would point towards there being a =
lot
>> of dead skbs being held, which - in my nose - would smell of tarpit.=
 Did
>> you properly feed all packets that you tarpited also to -j CT --notr=
ack?
>
>Surely i didn't use notrack;) I has problem how to use it, i'd like to=
 tarpit
>packets
>at the end of INPUT at filter table, notrack i can use only in raw tab=
le.

TARPIT does not have much of a use for random ports without any service=
s=20
because it is specific to clients sending data. You should use DELUDE a=
t=20
the end of the chain, also because it does not keep any connections=20
around like tarpit.
