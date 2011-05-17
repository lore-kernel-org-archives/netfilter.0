From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset, IP6_NF_IPTABLES
Date: Tue, 17 May 2011 22:50:07 +0100
Message-ID: <4DD2ED8F.8060605@googlemail.com>
References: <ffc7edfebc6396f9754b6327b0523d27@visp.net.lb> <alpine.DEB.2.00.1105171831430.1545@blackhole.kfki.hu> <64614d657f8b9c38d783b2e2ecea1fc0@visp.net.lb> <alpine.DEB.2.00.1105171923540.1798@blackhole.kfki.hu> <4DD2BFCE.9040006@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=RZv7SuUtumUZZpqvk8FVi06nPDefC9PEU8IQAJPQ/AE=;
        b=ZqDjkXa/ACQEQXARTpdthnQX2cnOZozfQ4iOu191i4E66p8Srz0xvN9ndSBgfjztpd
         1UVylX4Ms7X+2Wh6Qe1w8gKG9lIwbzeGAidOnDVWvvLY1i73gYz+FrpfnRo7qgrEtCdH
         rXA4itliNR+miL0Gpjm8kkNKjD88zOQO6R1E4=
In-Reply-To: <4DD2BFCE.9040006@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Denys Fedoryshchenko <denys@visp.net.lb>, netfilter@vger.kernel.org


> Funny enough I looked at the same thing 5 minutes ago as I included 
> these checks (grumble) as part of ipset 4.5 configure.ac macros. :-[
Hm, I have just made an interesting observation: when I build SMP 
(x86_64-based) kernel I can compile the ipset kernel modules as part of 
the kernel itself (i.e. ...=y), but when I try this on UP machine I 
can't do that for some reason - I can only select to disable or ...=m? 
Am I missing something?
