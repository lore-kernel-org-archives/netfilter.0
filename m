From: Josu Gomez <jgomezp81@googlemail.com>
Subject: Re: Help with compiling netfilter/iptables modules
Date: Tue, 21 Sep 2010 13:09:39 +0200
Message-ID: <AANLkTimhto26FusmAtW1NGjTGNMKkjA=-0CdasxZUS+O@mail.gmail.com>
References: <AANLkTi=GnnAXvmO3JEwLtL6tw08OYRmr7JbsDwtYV1bU@mail.gmail.com>
	<alpine.LNX.2.01.1009202348280.11399@obet.zrqbmnf.qr>
	<AANLkTindq_A590+r3DXU5P9BTkst082iG0MyboKqSyXn@mail.gmail.com>
	<alpine.LNX.2.01.1009210124300.14400@obet.zrqbmnf.qr>
	<AANLkTimP7Zn3TXJWzX-M4PRnBNsZWg5=Xj44v65aRi5-@mail.gmail.com>
	<alpine.LNX.2.01.1009211227380.632@obet.zrqbmnf.qr>
	<AANLkTi=gBdmdk_=CYuDr+e095iYyO3QyCR_gNs_+6F6Y@mail.gmail.com>
	<alpine.LNX.2.01.1009211255410.1505@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=aXTxsKTIYsrqTYvyLUGUf4eCgDXved0+17+Fdo3OOrA=;
        b=Vca6k7yZOwfvVAvi1Pgzx4hz2sNRnEZJOqK+SHw/hg3F9F5qxTrNoeyooxa7Nuci51
         EAZV7YvRoBFCRa0xjs5lmrQKapn97bot6obSRtl9HJY+m9L/cpUmofUy/2YSyCsM5MJK
         ooyGWxFbR0gplNMtP5ZWcCt/lwnObyAixbniA=
In-Reply-To: <alpine.LNX.2.01.1009211255410.1505@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

It's possible to create from .c (source) a .ko (module) without
compile a kernel ??

2010/9/21 Jan Engelhardt <jengelh@medozas.de>:
> On Tuesday 2010-09-21 12:52, Josu Gomez wrote:
>
>>Ok.
>>
>>My question now is. What is the way to create the modules (.ko) for iptables ??
>
> You compile a linux kernel.
>
