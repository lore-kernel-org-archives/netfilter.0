From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Wed, 06 Oct 2010 15:23:41 +0100
Message-ID: <4CAC866D.7060101@googlemail.com>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu> <4CA70B3B.90001@googlemail.com> <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu> <4CA7978B.9020900@googlemail.com> <alpine.DEB.2.00.1010032106460.26617@blackhole.kfki.hu> <4CA8FDE1.8090809@googlemail.com> <alpine.DEB.2.00.1010041134130.28881@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=2uNeOibYUIlD7cw6bULdlLiRCQH++ae9jUbJanHgFqI=;
        b=hvpmmFWM02fcMCvtvmJ8D/PAVn3ZkmmMpeyeRI1fCG2whg8I1eJ9DfgpeywoNypzmY
         ZRdcXPZFAKLfu1zdfZ0rYB/qugPRkdupP+ykA8eX4GkaJw4OjtUZt9ZEt5d37H47TUli
         SvzlAWOJCYQC7dTLsgUs51fd8j7aBuzAFCEKc=
In-Reply-To: <alpine.DEB.2.00.1010041134130.28881@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


>> So I should not use IP_NF_SET_HASHSIZE for the time being until it is fixed,
>> right?
>>     
>
> Yes, because currently it's ignored. In this week I'm going to fix it in 
> the git repository but won't release a new version just for this.
>   
There is another issue I found when using ipmap sets: when I execute, 
for example, "ipset -N port-map ipmap --from 10 --to 30000" and then add 
an element "ipset -A port-map 20" the two statements are accepted 
without any error given (they shouldn't be as the map defined is an IP 
map, not a port map and the values submitted are numbers, not IP 
addresses)!

When I issue "ipset -L port-map" I get:

Header: from: 0.0.0.10 to: 0.0.117.48
members:
0.0.0.20

Is this deliberate or a bug?
