From: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= 
	<scramatte@zensoluciones.com>
Subject: Re: ipp2p segfault with kernel 2.6.24.7
Date: Sat, 07 Jun 2008 00:33:02 +0200
Message-ID: <4849BB1E.7060704@zensoluciones.com>
References: <4849A942.9030204@zensoluciones.com> <alpine.LNX.1.10.0806062322340.20733@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0806062322340.20733@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Jan Engelhardt escribi=C3=B3:
> On Friday 2008-06-06 23:16, S?=C3=A9bastien Cramatte wrote:
>
>  =20
>> Hello
>>
>> I've build latest IPP2P with  kernel 2.6.24.7 and iptables 4.0
>> When I try to use it I have a "segmentation fault" :
>>    =20
>
> What steps did you take to compile it?
>
>  =20
Hello

I'm use  set of patches from http://linuxbox.pl/index.php?go=3Dkernel
These patches are quite up to date ...

I've just do  a  "make menuconfig"  and I  use debian  make-kpkg  tools=
=20
to build the kernel package.
Note that I use  Debian Lenny  (testing) with gcc version 4.2.4

I customised the kernel for a traffic manager with minimal required=20
hardware drivers and all available netfilter modules.
I haven't test in depth all others plugins but l7filter works well

If you need any other kind of informations please tell me !
Regards

