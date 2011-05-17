From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: [ANNOUNCE] ipset 6.5 released
Date: Tue, 17 May 2011 16:23:40 +0100
Message-ID: <4DD292FC.2020609@googlemail.com>
References: <alpine.DEB.2.00.1105151540340.25248@blackhole.kfki.hu> <4DD145C0.4060705@googlemail.com> <alpine.DEB.2.00.1105170941590.31848@blackhole.kfki.hu> <4DD255EF.1040209@googlemail.com> <alpine.DEB.2.00.1105171346350.31927@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=2oApLos2xOwshFbd+hnwt+J20F4jn/x5KlDhc59gmf0=;
        b=RLTlz3a546WPJGZIYp2uyIuk7HI/4b7GgRgPlqwOAHqs+sS3HGXE8bZM/9ziMZHs/u
         YKuRtn4Jjq9XQMczBPdX7WhhKfqcT72lT3ALnYRFJID/jEqb8XAXVj2TWZt2fNtC1GJJ
         pClgjQns6KA8XZklhE3gXJc529T49OG9XQLRE=
In-Reply-To: <alpine.DEB.2.00.1105171346350.31927@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> Just send me the errors. The "treemap" backward compatibility support did 
> not change between 6.4 and 6.5.
>   
I'll prepare a test case and include the errors I get when I am back 
home later tonight. I'll do that then.

> More control over the building process is good, so I'm interested in your 
> patches.
>   
Will attach these together with the above. I was quite pleased with it 
as it enabled me to streamline the whole process (ipset 4.5 wasn't the 
only thing I was building), so you may find this quite useful if you 
decide to update v4.5.

