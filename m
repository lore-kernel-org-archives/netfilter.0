From: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= 
	<scramatte@zensoluciones.com>
Subject: Re: ipp2p segfault with kernel 2.6.24.7
Date: Sat, 07 Jun 2008 09:30:32 +0200
Message-ID: <484A3918.1080806@zensoluciones.com>
References: <4849A942.9030204@zensoluciones.com> <alpine.LNX.1.10.0806062322340.20733@fbirervta.pbzchgretzou.qr> <4849BB1E.7060704@zensoluciones.com> <alpine.LNX.1.10.0806070131140.20733@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0806070131140.20733@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Jan Engelhardt escribi=C3=B3:
> On Saturday 2008-06-07 00:33, S?=C3=A9bastien Cramatte wrote:
>  =20
>>>> I've build latest IPP2P with  kernel 2.6.24.7 and iptables 4.0
>>>> When I try to use it I have a "segmentation fault" :
>>>>        =20
>>> What steps did you take to compile it?
>>>      =20
>> I'm use  set of patches from http://linuxbox.pl/index.php?go=3Dkerne=
l
>> These patches are quite up to date ...
>>    =20
>
> That page has not been updated in a long time. Not only does it use
> the legacy patchomatic, which is largely superseded now, but also
> references "projekty subversion"; a few things have gone into
> mainline, many others into Xtables-addons, including ipp2p:
> http://lwn.net/Articles/277804/
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  =20
Thank your for your answer

I've downloaded the lastest 2.6.25.5 kernel  and applied  l7-filter pat=
ch.
I must build a debian kernel package  and  xtables-addons  seems doesn'=
t=20
act  as a patch ...=20
so  I  don't know how can I  include it  in my main kernel package.=20

I will take a look in depth to see how can I achieve this.

Regards
