From: Jesper Dybdal <netfilter@dybdal.dk>
Subject: Re: Conditional inclusion of parts of nft file?
Date: Sun, 1 May 2022 18:42:39 +0200
Message-ID: <4c415208-f13b-86c4-0126-44abb53c99b1@dybdal.dk>
References: <950f8e47-fba0-33d9-786e-a48c31c3c775@dybdal.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dybdal.dk; h=
        content-transfer-encoding:content-type:content-type:in-reply-to
        :references:from:from:content-language:subject:subject
        :user-agent:mime-version:date:date:message-id:received; s=
        dybdal-20171111; t=1651423359; x=1653237760; bh=YTsw8kQWDTCDAcav
        OVM73NmyaTaTQIvvz7yEXFih9DQ=; b=BGs+Tx1Vik0TAzug2IYhvUOdlN+Stn7F
        pRL0JnlTQP61O6mOAo7aB474PH3uEosweciJJXPWnkBkt/ooI4t5c66Birz6rUyR
        3+6jiYuLmB4ma1ACY66QL7HnIGUQK7ZUI3dbc1TEvVnL/X5CFYTh56nVy0fCfP1W
        d45SceH4LeA7SbvFMhJrrnmdZz4mnls+mjyl0xkmjoQ5sMf44utOCCg430CIBWZ+
        oGiIoLIdjcenIgFNNaNlz/vGW8lD1LZ9ksK/UZmIjJhuQd+xGCn5k7IohB5A+2N/
        mUbbbvk240eliN30h3x0Qh3CAGs5ZNsnHnk+KLavzyCXlFxED3i1FA==
Content-Language: en-US
In-Reply-To: <950f8e47-fba0-33d9-786e-a48c31c3c775@dybdal.dk>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

I wrote the question quoted below some days ago.

There have been no answers, which surprises mu - I would have thought 
that just about everybody would want a way to conditionally in- or 
exclude rules.

I have now chosen to assume that there is no such possibility in nft, 
and I am now writing a simple preprocessor that will solve my problem.

Another and somewhat related thing I miss is empty anonymous sets. If I 
have an nft file containing.
     define AllowedIps = { 1.2.3.4, 5.6.7.8 }
     ...
     ... daddr $AllowedIps accept

then it might happen that some day both ip addresses are no longer 
allowed, and I would then expect that when I changed the "define" 
statement to
     define AllowedIps = {  }
then the rule further below would become a NOP.  But nft does not accept 
an empty set.

Regards,
Jesper

On 2022-04-27 12:24, Jesper Dybdal wrote:
> I am beginning to plan my change from iptables to native nft.
>
> My iptables shell script has some conditionals where rules are 
> included or not depending on environment variables or other conditions 
> that are known beforehand.  Example: whether or not all interfaces, or 
> only some, are up.
>
> Is this possible with nft?  I.e., something like:
>
>    define externalinterfaceready = 1
>    ...
>    if ( externalinterfaceready) {
>         ... add rules depending on the external interface being up
>    }
>
> And even better if it could query environment variables.
>
> I haven't seen any description of something like this being possible 
> in a less clumsy way than dynamically building an include file for 
> every "if" and include them in the ruleset at suitable points.
>
> Have I overlooked something?
>
> Thanks,
> Jesper
>

-- 
Jesper Dybdal
https://www.dybdal.dk

