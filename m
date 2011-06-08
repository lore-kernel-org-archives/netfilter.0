From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipset 6.6 bug: subnet (mis)matching
Date: Wed, 08 Jun 2011 13:12:19 +0100
Message-ID: <4DEF6723.1030902@googlemail.com>
References: <alpine.DEB.2.00.1105241039080.1846@blackhole.kfki.hu> <4DEECD8C.6050302@googlemail.com> <alpine.DEB.2.00.1106080859230.31443@blackhole.kfki.hu> <4DEF49FE.4080708@googlemail.com> <alpine.DEB.2.00.1106081214130.31592@blackhole.kfki.hu> <4DEF5B3B.3050609@googlemail.com> <alpine.DEB.2.00.1106081327030.31592@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=zrmXNmRSVuHxJjH4/Ha3NuqSKSyYMDvFYmKNLhkedqw=;
        b=lalmWxcVCgAH2XYmzMJnIRVeH9P6/3dZkgSeggIvZYm8NrtJ4uN3QWsBuO2ckid+RY
         /KjOc6h5tyzQ3UTnF5eQ4V2hxhtahOKbvL+/EjMgC/Zvi/StLKahn39Vm+EiazZ48kIk
         r0KwndfeWkCfzMfJ5g0ofrYqy3QaJiMygutY4=
In-Reply-To: <alpine.DEB.2.00.1106081327030.31592@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>


> Current behaviour cannot be modified easily. There's no overlap checking 
> (and aggregation/breaking up) in ipset, so it can't be prevented that 
> someone adds overlapping elements to a set:
>
> add 10.16.0.0/16
> add 10.16.1.0/24
>
> Now if 10.16.1.0/24 is tested as you suggest, one cannot tell whether the 
> explicit network 10.16.1.0/24 is added to the set or the tested elements 
> are just the members of a larger network.
>
> Currently:
>     test 10.16.1.1	=> test explicit and implicit membership
>     test 10.16.1.0/24	=> test explicit membership only
>
> What you propose is to test explicit and implicit membership in all cases.
>   
The way I see it, you can take the base of a set member (10.16.0.0 in my 
case), build up a mask with the range (16), do the same with the range 
being tested and then match them with logical "and". If you get the same 
result as the set member - you have a match, if you don't there isn't a 
(complete) match.

Alternatively, you could loop through the members of the specified range 
to be tested and compare against the set members, but that would be a 
bit slower, though since this is done in userspace (i.e. interactively) 
speed wouldn't be that important compared to the kernel matching where 
good performance is needed.

> My top priority now is to get the kernel in sync with ipset 6.7. It's just 
> a much higher problem, because a lot of features and fixes are missing, 
> even from the newest kernel version.
>   
I am not asking or demanding anything to be implemented/corrected 
immediately - I am simply making you aware of a bug in ipset I found 
last night. If/When you are going to fix it it is for you to decide - 
you are the author of ipset, not me - I am just a user.

