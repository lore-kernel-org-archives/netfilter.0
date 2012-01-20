From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [xtables-addons] memory usage in module geoip (probably)
Date: Fri, 20 Jan 2012 18:05:33 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201201800150.29700@frira.zrqbmnf.qr>
References: <4F19928A.7050005@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F19928A.7050005@mejor.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?UTF-8?Q?Marcin_Miros=C5=82aw?= <marcin@mejor.pl>
Cc: netfilter@vger.kernel.org

On Friday 2012-01-20 17:12, Marcin Miros=C5=82aw wrote:

>Hello!
>I've noticed high size of kmalloc-512/2048 on my vps after a one, two
>weeks of work. Example:
>  OBJS ACTIVE  USE OBJ SIZE  SLABS OBJ/SLAB CACHE SIZE NAME
> 83440  83411  99%    0.57K   5960       14     47680K kmalloc-512
> 21615  21604  99%    2.07K   1441       15     46112K kmalloc-2048
>103776 103765  99%    0.31K   8648       12     34592K skbuff_head_cac=
he
>
>I've done a little investigation (trial by error method) to discover
>which process keep data in kmalloc. It looks those kmalloc are used by
>modules from xtables-addons-1.39. I'm using ipset6, geoip, sysrq,
>tarpit. I greped sources for string "kmalloc", kmalloc is used by sysr=
q
>and geoip (in some other modules too but i don't use them).

geoip uses vmalloc for its huge allocations, so that can't be it. The=20
massive size of skbuff_head_cache would point towards there being a lot=
=20
of dead skbs being held, which - in my nose - would smell of tarpit. Di=
d=20
you properly feed all packets that you tarpited also to -j CT --notrack=
?

>I'd like to ask is such usage of memory ok? Which module could take so
>much precious ram?:) (I suspect geoip). How much memory geoip can use =
in
>worse case (db with ipv4 and ipv6)?

The on-disk files for geoip are loaded verbatim into the kernel, so tha=
t=20
would be only ~6 MB at worst for geoip, not 40+.
