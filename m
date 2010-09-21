From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Help with compiling netfilter/iptables modules
Date: Tue, 21 Sep 2010 12:28:36 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009211227380.632@obet.zrqbmnf.qr>
References: <AANLkTi=GnnAXvmO3JEwLtL6tw08OYRmr7JbsDwtYV1bU@mail.gmail.com> <alpine.LNX.2.01.1009202348280.11399@obet.zrqbmnf.qr> <AANLkTindq_A590+r3DXU5P9BTkst082iG0MyboKqSyXn@mail.gmail.com> <alpine.LNX.2.01.1009210124300.14400@obet.zrqbmnf.qr>
 <AANLkTimP7Zn3TXJWzX-M4PRnBNsZWg5=Xj44v65aRi5-@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimP7Zn3TXJWzX-M4PRnBNsZWg5=Xj44v65aRi5-@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Josu Gomez <jgomezp81@googlemail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-09-21 10:43, Josu Gomez wrote:

>> I can't understand a thing you say.
>
> I want say that in this paths after compile iptables...
>
>/dream/root/cdkroot/lib/modules/2.6.9/build/net/ipv4/*
>/dream/root/cdkroot/lib/modules/2.6.9/source/net/ipv4/*
>
>...there are all the files but only with .c extension and not .ko

iptables does not touch these paths at all.

>> Except possibly for dccp and another I don't know offhand, all source
>> files are always compiled inside the iptables tarball.
>
>In the tarball there are all with .h extension not .ko

Of course not. Why should there be? We are not providing any kernel 
modules in the iptables tarball.
