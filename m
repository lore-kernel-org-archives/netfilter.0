From: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= 
	<scramatte@zensoluciones.com>
Subject: Re: ipp2 won't compile with lastest  iptables from  git
Date: Fri, 04 Jul 2008 21:29:06 +0200
Message-ID: <486E7A02.20107@zensoluciones.com>
References: <486E42BD.7090609@zensoluciones.com> <alpine.LNX.1.10.0807041846060.31959@fbirervta.pbzchgretzou.qr> <486E75CB.7060301@zensoluciones.com> <alpine.LNX.1.10.0807042120040.31959@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0807042120040.31959@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

This what I've done but ...

I can't compile xtables-addons with a 2.6.25.10 kernel
I get the latest sources from git  and  my setup my kernel before to=20
include CONFIG_NF_CONNTRACK modules and dependencies.


/usr/src/xtables-addons#./configure --with-kbuild=3D/usr/src/linux=20
--with-ksource=3D/usr/src/linux --with-xtables=3D/usr/src/xtables/
/usr/src/xtables-addons# make
make  all-recursive
make[1]: Entering directory `/usr/src/xtables-addons'
Making all in extensions
make[2]: Entering directory `/usr/src/xtables-addons/extensions'
make -C /usr/src/linux M=3D/usr/src/xtables-addons/extensions=20
XA_TOPSRCDIR=3D/usr/src/xtables-addons modules;
make[3]: Entering directory=20
`/usr/src/etch-router-0.5.1/linux/linux-2.6.25.10'
  CC [M]  /usr/src/xtables-addons/extensions/xt_LOGMARK.o
In file included from /usr/src/xtables-addons/extensions/xt_LOGMARK.c:1=
7:
/usr/src/xtables-addons/extensions/compat_xtables.h:14:4: warning:=20
#warning You have CONFIG_NF_CONNTRACK enabled, but=20
CONFIG_NF_CONNTRACK_MARK or CONFIG_NF_CONNTRACK_SECMARK are not (please=
=20
enable).
/usr/src/xtables-addons/extensions/xt_LOGMARK.c: In function 'logmark_t=
g':
/usr/src/xtables-addons/extensions/xt_LOGMARK.c:45: error: 'struct=20
sk_buff' has no member named 'secmark'
make[4]: *** [/usr/src/xtables-addons/extensions/xt_LOGMARK.o] Error 1
make[3]: *** [_module_/usr/src/xtables-addons/extensions] Error 2
make[3]: Leaving directory=20
`/usr/src/etch-router-0.5.1/linux/linux-2.6.25.10'
make[2]: *** [modules] Error 2
make[2]: Leaving directory `/usr/src/xtables-addons/extensions'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/usr/src/xtables-addons'
make: *** [all] Error 2

Jan Engelhardt escribi=C3=B3:
> On Friday 2008-07-04 21:11, S?=C3=A9bastien Cramatte wrote:
>  =20
>>>> I've applied the ipp2p patch from  patch-o-matic  git  ... When I =
open
>>>> libipt_ipp2.c it seems that the source already has the required ch=
ange for
>>>> iptables 1.4.x ... biut unfortuanteley doesn't works for me !
>>>>    =20
>>>>        =20
>>> Because pom-ng is old and not updated.
>>>  =20
>>>      =20
>> Yes ! But my problem is that I must package a kernel that use
>> initramfs with all included modules. As pom-ng patch the kernel
>> source was nice for me ...
>> Moreover I can't use Xtables-addons directly because I compile on  d=
edicaded
>> box that use another kernel than the target !
>>    =20
>
> If it's just that, then that's easy:
>
> 1. compile kernel with appropriate cross-compiler
> 2. compile xtables-addons, pointing it to the kernel dir
>    (you may need to specify the cross-compiler again if you did so in
>    step 1)
> 3. profit.
> 4. copy .ko files into initramfs image.
>
> Something missing?
>
>  =20
>> My target box boot from Compact Flash to memory and doesn't have  de=
velopment
>> tools installed !
>>    =20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  =20

