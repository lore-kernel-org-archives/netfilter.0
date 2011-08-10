From: Benjamin <benjo11111@gmail.com>
Subject: Re: use of socket tag in iptables
Date: Wed, 10 Aug 2011 10:32:09 +0530
Message-ID: <4E4210D1.5060007@gmail.com>
References: <CAARrgqwjUWYRyuKL66ErnmnmnJ=1f1y2ZcmTH25-5yc0Pp9iqw@mail.gmail.com> <alpine.LNX.2.01.1108091849230.19560@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=pItcIGtP06/bQjHH/rIDmADLDoqynD8Rxkd2UfclwaI=;
        b=j/KJvP+gyIxQvO8M7sT3SkTbyFBDm1EHreWn1U5Gmq5WXFdLblWUb27Y9HXP2maGmN
         uas8y6yRY33C1jXaDCukrGC9bvizAccom+YGHTBrdU1DK7LAKWDaSVVK2JiDtbmW3eWk
         mXZKsl5CiMQzAltRnlmSzAHLKPzJrfM6qgdNM=
In-Reply-To: <alpine.LNX.2.01.1108091849230.19560@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

  Hi,

Thanks for your kind response.Actually i m looking for proxy with tproxy 
capability.So from squid wiki i got some iptabales rules that they used 
for tproxy in that rules they use socket and tproxy tags.So I am wonder 
that how it is happend means what's the exact role of socket options.

Regards,
Benjamin

> On Tuesday 2011-08-09 17:29, benjamin fernandis wrote:
>
>> Hi,
>>
>> What is the purpose of socket tag in iptables?
>>
>> Please share any document or examples of that
> Share any insighting detail on your question first.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

