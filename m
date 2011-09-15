From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.9.1 released
Date: Thu, 15 Sep 2011 16:19:13 +0100
Message-ID: <4E721771.1030900@googlemail.com>
References: <alpine.DEB.2.00.1109062143300.9388@blackhole.kfki.hu> <4E713E0F.1050403@googlemail.com> <alpine.DEB.2.00.1109150846290.5001@blackhole.kfki.hu> <4E71CA91.5080402@googlemail.com> <alpine.DEB.2.00.1109151246320.5790@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=message-id:disposition-notification-to:date:from:user-agent
         :mime-version:to:cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=7J0faJbb4LEq6y+99Y35gn9KRGxBhPKwAPXohwxUPQ0=;
        b=NL5SlH5UEAoRg2BBdSCj9L0i5bdQ4ph1Oh3ipUDgnxcDJqqWqNPRux/K0zLiPernDy
         xJnmKA1z9L6HbHNY/5ods7QXShawEYw8jRhWVGO/H08Sz5NDv1imb0gvX/dp/QjcGOzZ
         PWJr6P+gs48U+TfNjqjpwg+v499z8eTTx6AKk=
In-Reply-To: <alpine.DEB.2.00.1109151246320.5790@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


> The source tree is not supposed to be copied to the kernel tree.
>   
Right, I take it this is something new introduced with 6.9.1 as with 6.8 
I had no such problems.

> At the moment you have to hand-edit ip_set_core.c: delete
> the #ifdef .. #endif part around
>
> #ifdef IPSET_EXTERNAL_MODULE
> #include <linux/version.h>
> #endif
>
> In the next release I'll invert the logic of the condition and then it'll 
> work even when copied into the kernel tree.
>   
I'll do that, thanks Jozsef!

