From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset, IP6_NF_IPTABLES
Date: Tue, 17 May 2011 19:34:54 +0100
Message-ID: <4DD2BFCE.9040006@googlemail.com>
References: <ffc7edfebc6396f9754b6327b0523d27@visp.net.lb> <alpine.DEB.2.00.1105171831430.1545@blackhole.kfki.hu> <64614d657f8b9c38d783b2e2ecea1fc0@visp.net.lb> <alpine.DEB.2.00.1105171923540.1798@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=+9U/Y/8GmM4ShQbjRWjAUmJviywy0wHYDcsaeiSL+m0=;
        b=lQlP4GQ1IuGWJr+tILXPot6XDFR8mVxh396IAcllDs7Oy61B0AyH+yRY4/VYEpGyME
         R7ji8Mqoo6ZFM1doAuovPbuivGMrqNBr6WwOu/k5irYe60J6SnFPWN10LGG3u6uXQxFF
         fU5SN+n/q0fWYJhcC56VW/OUTyHN6CRHBuV7U=
In-Reply-To: <alpine.DEB.2.00.1105171923540.1798@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Denys Fedoryshchenko <denys@visp.net.lb>, netfilter@vger.kernel.org


> Ahh, thanks. That's an outdated checking in configure, I remove it.
>   
Funny enough I looked at the same thing 5 minutes ago as I included 
these checks (grumble) as part of ipset 4.5 configure.ac macros. :-[

