From: Josu Gomez <jgomezp81@googlemail.com>
Subject: Re: Help with compiling netfilter/iptables modules
Date: Tue, 21 Sep 2010 10:43:40 +0200
Message-ID: <AANLkTimP7Zn3TXJWzX-M4PRnBNsZWg5=Xj44v65aRi5-@mail.gmail.com>
References: <AANLkTi=GnnAXvmO3JEwLtL6tw08OYRmr7JbsDwtYV1bU@mail.gmail.com>
	<alpine.LNX.2.01.1009202348280.11399@obet.zrqbmnf.qr>
	<AANLkTindq_A590+r3DXU5P9BTkst082iG0MyboKqSyXn@mail.gmail.com>
	<alpine.LNX.2.01.1009210124300.14400@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=OWl/6K+GtGY46AyrRCvB/g2RON5iGNrG6WBoDRIRytQ=;
        b=t/k9mJb502/X18b2iY1aBS1koW9msuEh5E/USf7KOO8QoMOZU4sGi8REQyBEUCQLYU
         jUS4JKOsVNqSfAzp2MZOLY1pPu8asa/xO8clbtW23W4/oELErHrCMyF5wXmLpY9d+t6I
         rOfCszIjHM9F6CIEikcndFKfTTMHZXYWcDky4=
In-Reply-To: <alpine.LNX.2.01.1009210124300.14400@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

> I can't understand a thing you say.

 I want say that in this paths after compile iptables...

/dream/root/cdkroot/lib/modules/2.6.9/build/net/ipv4/*
/dream/root/cdkroot/lib/modules/2.6.9/source/net/ipv4/*

...there are all the files but only with .c extension and not .ko

> Except possibly for dccp and another I don't know offhand, all source
> files are always compiled inside the iptables tarball.

In the tarball there are all with .h extension not .ko

I would like to modprobe modules like ip_conntrack.ko, ip_tables.ko,
ipt_conntrack.ko, ipt_state.ko, iptable_filter.ko,  ipt_REJECT.ko
..etc...etc...

Thanks a lot,
Regards,


2010/9/21 Jan Engelhardt <jengelh@medozas.de>:
> On Tuesday 2010-09-21 00:19, Josu Gomez wrote:
>
>>
>>In the source and build tree there are the same files, all the modules name
>>but only with .c extension (not .o sorry , not .ko) Is this normal ?
>
> I can't understand a thing you say.
>
>>I would like to compile all the modules posible.
>
> Except possibly for dccp and another I don't know offhand, all source
> files are always compiled inside the iptables tarball.
>
