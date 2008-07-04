From: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= 
	<scramatte@zensoluciones.com>
Subject: Re: ipp2 won't compile with lastest  iptables from  git
Date: Fri, 04 Jul 2008 21:11:07 +0200
Message-ID: <486E75CB.7060301@zensoluciones.com>
References: <486E42BD.7090609@zensoluciones.com> <alpine.LNX.1.10.0807041846060.31959@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0807041846060.31959@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>

Jan Engelhardt escribi=C3=B3:
> On Friday 2008-07-04 17:33, S?=C3=A9bastien Cramatte wrote:
>
>  =20
>> Hi
>>
>> I can't compile ipp2p wit the latest iptables from git !
>>    =20
>
> The latest ipp2p version is included in Xtables-addons.
>
>  =20
>> I've applied the ipp2p patch from  patch-o-matic  git  ... When I op=
en
>> libipt_ipp2.c it seems that the source already has the required chan=
ge for
>> iptables 1.4.x ... biut unfortuanteley doesn't works for me !
>>    =20
>
> Because pom-ng is old and not updated.
>  =20
Yes ! But my problem is that I must package a kernel that use initramfs=
 =20
with all included modules.
As pom-ng patch the kernel source  was nice for me ...

Moreover I can't use Xtables-addons directly because I compile on =20
dedicaded box that use another kernel than the target !
My target box boot from Compact Flash to memory and doesn't have =20
development tools installed !

Any solutions ?

