From: =?UTF-8?B?UmVtemkgQUtZw5xa?= <linuxliste@gmail.com>
Subject: Re: conntrack table limits
Date: Tue, 25 Jan 2011 15:49:10 +0200
Message-ID: <4D3ED4D6.6000601@gmail.com>
References: <4D3EB7F0.5020702@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=bMQ6+2x5YelP8afLoKI+WV4sC8Z6liqy8NYHJE/ki00=;
        b=J1uDogi/HWkdixsuxxs/4O/1kUcxu71vWaQ8vIa4OhBXs+rST+k6NDNF/V8BeW6Urq
         WWK64W6w7y66CAgMLMwKiX8tIIzPQ/p2XtSLhUJet8sBs7AZqUp6ONCRipgiqxFn2awC
         7vw2BieAriqcKsCY2GVfkd0AKuZ4ue3Uw1XnE=
In-Reply-To: <4D3EB7F0.5020702@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dennis Jacobfeuerborn <dennisml@conversis.de>
Cc: netfilter@vger.kernel.org

/etc/modules
nf_conntrack acct=1 hashsize=1048576

Hashsize calc;

HASHSIZE = CONNTRACK_MAX / 8 = RAMSIZE (in bytes) / 131072 = RAMSIZE (in MegaBytes) * 8
HASHSIZE = CONNTRACK_MAX / 8 = RAMSIZE (in bytes) / 131072 / (x / 32)
x= 32 or 64

CONNTRACK_MAX = HASHSIZE * 8


you can see this
http://antmeetspenguin.blogspot.com/2011/01/high-performance-linux-router.html
page.

On 01/25/2011 01:45 PM, Dennis Jacobfeuerborn wrote:
> Hi,
> I'm trying to find out how high I can set conntrack_max on a 2GB 64 
> bit system. On the net I found different ways of calculating this but 
> they seem to end up with different results. One forumla tells me that 
> I can fit a maximum of 65535 connections into 2GB of RAM but the other 
> says that with 304 bytes per connection (plus a bit of slab allocation 
> overhead) I can easily fit more than a million connections into the 
> table.
> Also even with the current limit 65535 and the table having ca. 30.000 
> entries I've almost 1.8GB ram free/cached which leads me to believe 
> the second way of calculating this is more accurate.
> What is the proper way to calculate this?
>
> Regards,
>   Dennis
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

