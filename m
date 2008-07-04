From: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= 
	<scramatte@zensoluciones.com>
Subject: Re: ipp2 won't compile with lastest  iptables from  git
Date: Fri, 04 Jul 2008 22:26:56 +0200
Message-ID: <486E8790.6040002@zensoluciones.com>
References: <486E42BD.7090609@zensoluciones.com> <alpine.LNX.1.10.0807041846060.31959@fbirervta.pbzchgretzou.qr> <486E75CB.7060301@zensoluciones.com> <alpine.LNX.1.10.0807042120040.31959@fbirervta.pbzchgretzou.qr> <486E7A02.20107@zensoluciones.com> <alpine.LNX.1.10.0807042215410.31959@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0807042215410.31959@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Jan Engelhardt escribi=C3=B3:
> On Friday 2008-07-04 21:29, S?=C3=A9bastien Cramatte wrote:
>
>  =20
>> This what I've done but ...
>>
>> I can't compile xtables-addons with a 2.6.25.10 kernel
>> I get the latest sources from git  and  my setup my kernel before to=
 include
>> CONFIG_NF_CONNTRACK modules and dependencies.
>>    =20
>
> You can select what modules to build (or not) by editing
> the 'mconfig' file in the xtables-addons directory.
> Either you enable said options in the kernel, or disable LOGMARK
> in mconfig.
> Note however that some modules duly require NF_CONNTRACK.
>  =20
I've enabled all the NF_CONNTRACK modules available in the kernel ...
This is why I don't understand why xt_LOGMARK give this error ...

Please try it with a 2.6.25.10 ...

Regards
