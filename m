From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Help with compiling netfilter/iptables modules
Date: Tue, 21 Sep 2010 19:56:16 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009211956030.14251@obet.zrqbmnf.qr>
References: <AANLkTi=GnnAXvmO3JEwLtL6tw08OYRmr7JbsDwtYV1bU@mail.gmail.com> <alpine.LNX.2.01.1009202348280.11399@obet.zrqbmnf.qr> <AANLkTindq_A590+r3DXU5P9BTkst082iG0MyboKqSyXn@mail.gmail.com> <alpine.LNX.2.01.1009210124300.14400@obet.zrqbmnf.qr>
 <AANLkTimP7Zn3TXJWzX-M4PRnBNsZWg5=Xj44v65aRi5-@mail.gmail.com> <alpine.LNX.2.01.1009211227380.632@obet.zrqbmnf.qr> <AANLkTi=gBdmdk_=CYuDr+e095iYyO3QyCR_gNs_+6F6Y@mail.gmail.com> <alpine.LNX.2.01.1009211255410.1505@obet.zrqbmnf.qr>
 <AANLkTimhto26FusmAtW1NGjTGNMKkjA=-0CdasxZUS+O@mail.gmail.com> <alpine.LNX.2.01.1009211407110.3926@obet.zrqbmnf.qr> <AANLkTinCtC_bvAERw27E+q+TqNnt-KeMxFOteuK=LegP@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinCtC_bvAERw27E+q+TqNnt-KeMxFOteuK=LegP@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josu Gomez <jgomezp81@googlemail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-09-21 19:09, Josu Gomez wrote:

>I got compile .c module to .ko but when I try insmod :
>
>insmod: cannot insert `ipt_LOG.ko': Invalid module format (-1): Exec
>format error
>
>dmesg :
>
>version magic '2.6.9 gcc-3.4' should be '2.6.12 gcc-3.4'
>
>My CDK version has kernel 2.6.9 and the modules should be compiled
>with 2.6.12 , no ??
>Does this mean I have to compile kernel 2.6.12 ?? or there is another
>possibility ??

You should compile it against the proper kernel at least.

