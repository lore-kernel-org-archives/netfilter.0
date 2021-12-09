From: Amish <anon.amish@gmail.com>
Subject: Re: delete matching rule like it can be done in case of iptables
Date: Thu, 9 Dec 2021 14:05:50 +0530
Message-ID: <b57982b8-36ff-05b8-8697-3b3e61875831@gmail.com>
References: <5e5887f6-69f4-7aca-175c-d4b6faf90eb1@gmail.com>
 <Ya4L/rS/mCwzqt25@salvia> <af021a3d-b4d4-28d4-df66-12a16f7977f2@gmail.com>
 <4bc86df1-3971-7729-6a41-477262879b90@tootai.net>
 <742f7f1d-a182-c1a1-7f7e-788f51fb03fb@gmail.com>
 <72cffe4b-aee3-abd4-042b-83f576f4be13@tootai.net>
 <a3b6fdcb-daca-53f4-2640-aef7d3258f77@jubileegroup.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pDelQHE6zB+QYgE5N21sZ5VGGJCnluNtfRvd1UsTWYI=;
        b=PZr0zO6eSDVZofHd010ciqtAvVWwC5rQZxnJWdUPMo1r7HrZAxbc9qpUjMmCKT4SyO
         5819Dy/TwYSUgsJvzrTXr2rTD3lWQraUnzakxdrMZJuMLiBBTH6f1NoLQC+NWKmK9dRc
         eW5EYnFlhWZLKwV/dT2Ioj8DEd9CquHzGMof/dtYwwT4/EubKqC3Km7yfo0zVOyoapIr
         tPTf6rozq77YArB4PP2LRNVLVDYSKpL2hNoj144ZXnDRBtwZjnqV5vsgAFNdJKHttrJo
         vymUYlhXfD1jndunbzoMc5Rc7v9JdTS89RxXKSMlO+deDvdJ3yB5BUeIu0h2v7Gceko3
         dCMg==
Content-Language: en-US
In-Reply-To: <a3b6fdcb-daca-53f4-2640-aef7d3258f77@jubileegroup.co.uk>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "G.W. Haywood" <netfilter@jubileegroup.co.uk>
Cc: Netfilter list <netfilter@vger.kernel.org>


On 08/12/21 15:25, G.W. Haywood wrote:
> Hi there,
>
> On Tue, 7 Dec 2021, Daniel wrote:
>
>> myhandle=$(echo `$nft -sa list chain $1 $2 $3 |grep -F $4|grep -oP 
>> '(# handle ).*'`|cut -d " " -f 3)
>
> To me, quite apart from the reliance on a bunch of system utilities
> which I'd really prefer to avoid in an operation of this kind, that
> looks unnecessarily complex and rather fragile.
>
> This whole discussion suggests that something is missing from nft.

Yes, its a blocker for me.

As a workaround I switched from iptables-legacy to iptables-nft. (So 
atleast I am using nft backend)

Irony is that iptables (nft backend) can actually delete the matching 
rule (via -D option) but native nft itself can not delete a matching rule.

Regards

Amish.

