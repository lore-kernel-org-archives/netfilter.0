From: Josu Gomez <jgomezp81@googlemail.com>
Subject: Re: Help with compiling netfilter/iptables modules
Date: Tue, 21 Sep 2010 19:09:11 +0200
Message-ID: <AANLkTinCtC_bvAERw27E+q+TqNnt-KeMxFOteuK=LegP@mail.gmail.com>
References: <AANLkTi=GnnAXvmO3JEwLtL6tw08OYRmr7JbsDwtYV1bU@mail.gmail.com>
	<alpine.LNX.2.01.1009202348280.11399@obet.zrqbmnf.qr>
	<AANLkTindq_A590+r3DXU5P9BTkst082iG0MyboKqSyXn@mail.gmail.com>
	<alpine.LNX.2.01.1009210124300.14400@obet.zrqbmnf.qr>
	<AANLkTimP7Zn3TXJWzX-M4PRnBNsZWg5=Xj44v65aRi5-@mail.gmail.com>
	<alpine.LNX.2.01.1009211227380.632@obet.zrqbmnf.qr>
	<AANLkTi=gBdmdk_=CYuDr+e095iYyO3QyCR_gNs_+6F6Y@mail.gmail.com>
	<alpine.LNX.2.01.1009211255410.1505@obet.zrqbmnf.qr>
	<AANLkTimhto26FusmAtW1NGjTGNMKkjA=-0CdasxZUS+O@mail.gmail.com>
	<alpine.LNX.2.01.1009211407110.3926@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=ID+5RhuLyGFtAeia1HgGbQJ7aX9Vi9SFC27NUzm2ob0=;
        b=VgVGyh86XV9aL71EFzz+SOJkHWXxZ1qZPRqjhiv0fSi8zDiT6CBWpRDy5+YLZvfAb9
         uwpWWe/spfyuDkaJO32GitUep9USltL4n4rayRfgVat+KRIQQ3by4agppCJ1kdNqlDvG
         oMm3iEC2fBs0CrtkNXsuV7SxpuENBH10iwD1w=
In-Reply-To: <alpine.LNX.2.01.1009211407110.3926@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

I got compile .c module to .ko but when I try insmod :

insmod: cannot insert `ipt_LOG.ko': Invalid module format (-1): Exec
format error

dmesg :

version magic '2.6.9 gcc-3.4' should be '2.6.12 gcc-3.4'

My CDK version has kernel 2.6.9 and the modules should be compiled
with 2.6.12 , no ??
Does this mean I have to compile kernel 2.6.12 ?? or there is another
possibility ??

Thanks again,
Regards,


2010/9/21 Jan Engelhardt <jengelh@medozas.de>:
> On Tuesday 2010-09-21 13:09, Josu Gomez wrote:
>
>>It's possible to create from .c (source) a .ko (module) without
>>compile a kernel ??
>
> It is.
>
