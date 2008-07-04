From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ipp2 won't compile with lastest  iptables from  git
Date: Fri, 4 Jul 2008 21:25:52 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807042120040.31959@fbirervta.pbzchgretzou.qr>
References: <486E42BD.7090609@zensoluciones.com> <alpine.LNX.1.10.0807041846060.31959@fbirervta.pbzchgretzou.qr> <486E75CB.7060301@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <486E75CB.7060301@zensoluciones.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?S=C2=8E=C3=A9bastien_Cramatte?= <scramatte@zensoluciones.com>
Cc: netfilter@vger.kernel.org


On Friday 2008-07-04 21:11, S?=C3=A9bastien Cramatte wrote:
>> > I've applied the ipp2p patch from  patch-o-matic  git  ... When I =
open
>> > libipt_ipp2.c it seems that the source already has the required ch=
ange for
>> > iptables 1.4.x ... biut unfortuanteley doesn't works for me !
>> >    =20
>>
>> Because pom-ng is old and not updated.
>>  =20
> Yes ! But my problem is that I must package a kernel that use
> initramfs with all included modules. As pom-ng patch the kernel
> source was nice for me ...
> Moreover I can't use Xtables-addons directly because I compile on  de=
dicaded
> box that use another kernel than the target !

If it's just that, then that's easy:

1. compile kernel with appropriate cross-compiler
2. compile xtables-addons, pointing it to the kernel dir
   (you may need to specify the cross-compiler again if you did so in
   step 1)
3. profit.
4. copy .ko files into initramfs image.

Something missing?

> My target box boot from Compact Flash to memory and doesn't have  dev=
elopment
> tools installed !
