From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset v6.latest bugs?
Date: Wed, 27 Apr 2011 22:40:02 +0100
Message-ID: <4DB88D32.60207@googlemail.com>
References: <4DB5614C.3040808@googlemail.com> <alpine.DEB.2.00.1104252144230.31185@blackhole.kfki.hu> <4DB5DB3A.8000708@googlemail.com> <alpine.DEB.2.00.1104252248090.31417@blackhole.kfki.hu> <4DB61410.4070202@googlemail.com> <alpine.DEB.2.00.1104261542470.1834@blackhole.kfki.hu> <4DB6DEFD.6020101@googlemail.com> <4DB752D9.9010807@googlemail.com> <alpine.DEB.2.00.1104270905450.5222@blackhole.kfki.hu> <4DB80579.7090208@googlemail.com> <alpine.DEB.2.00.1104272323570.7833@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=MSBZ8KCv/ik1e60dwQFBFrVvlxwegMRk3ESCUE319Ig=;
        b=k66e8QybPBmkU23CYY+9aZv+B+TvMxqT9RVvkzHnQdiyu50ZeqCSwYzPQ1Sx8+i3o7
         58j7SCwCjc5z51Y8PflKWxKN4xNdIZiFhdSMHElVQDS4VyUlD9QEB61NnTFRGshcCZog
         jCpEwqLu134ef4QrCIEC+oc9D8wAJp8MOkD2Y=
In-Reply-To: <alpine.DEB.2.00.1104272323570.7833@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


>> I think I understand it now, thanks for the explanation. I hope that you would
>> be able to fix this bug.
>>     
>
> I'm attending an annual conference this week, so it seems I won't have 
> time to work on the bugfix before the weekend, sorry.
>   
No worries, I will be using 4.5 for the time being particularly as I was 
finally able to integrate it into the kernel (your "patch_kernel" script 
did the donkey work though :-) ) and I was also able to "convert" ipset 
4.5 to use pkgconfig (still testing it though), so when I am more or 
less done I will be in a position to build (and use!) both generation 
packages as a standalone software.

> I don't really see why you have to split ipset from xtables-addons. What's 
> wrong with the standalone ipset package, what forces you to do so?
>   
I don't actually need xtables-addons for 80% of my boxes, so just 
building the ipset package was perfect! On those machines I used to 
compile xtables-addons just because I needed ipset, so it made more 
sense to use ipset as standalone and save myself the hassle (and some 
resources too).

I planned to do this for months, but wasn't able to due to time 
constraints. I can now afford more time and I am glad I was able to 
finally split it up. I am particularly pleased that I was able to 
integrate it into the kernel, which saved me another headache of having 
to deal with the bl**dy buildsys packages on Fedora which were needed to 
build the kernel modules.

