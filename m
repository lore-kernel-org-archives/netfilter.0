From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.7 released
Date: Tue, 31 May 2011 22:46:07 +0100
Message-ID: <4DE5619F.5040408@googlemail.com>
References: <alpine.DEB.2.00.1105312155260.29607@blackhole.kfki.hu> <1306878128.3171.4.camel@edumazet-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=o/CnKNgbAh71jOhcH2jx360IL+pEaP6Rc27gR5bYBl0=;
        b=ROoJzK+1UK0X+7YVeDxXuwbueKE3pr2MHMm8PcIWqjS9RsABsiU2KKruQzU1/u2k4Z
         kfnsN6vqtwzFdNKmWTR5Ldgp0f679Dxl825fKdrGUbe6aiBjQ5jLNftj9UED3Yqbr2o0
         MKrr4hv6PmM8RNm6eNcMIO76tEe5T7MK7tMf0=
In-Reply-To: <1306878128.3171.4.camel@edumazet-laptop>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org


> tc filter add dev ifb0 protocol ip parent 10: handle 2 \
> 	flow ipset ipset keys src \
> 	flowid 1:40
>
> Any plan on this side ?
>   
++1!

I have been waiting for this for quite some time and am currently 
"hardcoding" a lot of stuff in tc, which I was very reluctant to do as I 
have everything tied to ipset these days. So, in other words, I'll be 
glad if that would be possible!

