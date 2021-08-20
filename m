From: Amish <anon.amish@gmail.com>
Subject: Re: [ANNOUNCE] nftables 1.0.0 release
Date: Fri, 20 Aug 2021 06:14:24 +0530
Message-ID: <ffc4dd4e-bbb1-0380-2cf2-7053fc3ab39c@gmail.com>
References: <20210819173626.GA1776@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=mru2aAZhlzaUY/DrSDbPFG1xG59cnFQ9kByAf+CKxao=;
        b=TKF5VEjfsBL3RlYuiD3YFQZ84YGaYuZwzQGc2O3VCtQM6x6sv8PnRJG2huU0LKAL4y
         qAlxyadFiAmSDI9PNzsgT0CbjSuWJDMh7WMmSD/iXgHLGS0wqimRt+azoywk3rQABSjv
         nbyYTsD/DRngXuIAZhQDo4S3Qr8fSDU1FYVUJRGMjy2q0Me+ELf5FRibSThFH//b9xmI
         0eqtrJPd7jRDRf0F/h2KI5f0snzOipE2rDSluKwKqwsH2RWwLDkjqkvW97/O1hz6/NpW
         W20qTWjgm+TC+2clPntXE+dXzdta1DEloNczyqR/OzNLeJCkjhXF3wrNvxKMh280ci89
         wlSQ==
In-Reply-To: <20210819173626.GA1776@salvia>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>
Cc: lwn@lwn.net


On 19/08/21 11:06 pm, Pablo Neira Ayuso wrote:
> * Allow to combine jhash, symhash and numgen expressions with the
>    queue statement, to fan out packets to userspace queues via
>    nfnetlink_queue.
>
>    ... queue to symhash mod 65536
>    ... queue flags bypass to numgen inc mod 65536
>    ... queue to jhash oif . meta mark mod 32
>
>    You can also combine it with maps, to select the userspace queue
>    based on any other singleton key or concatenations:
>
>    ... queue flags bypass to oifname map { "eth0" : 0, "ppp0" : 2, "eth1" : 2 }

I upgraded from nftables 0.9.9 to 1.0.0 (Arch Linux).

Earlier I had this statement which used to work in nftables 0.9.9:

define ips_queue = 0
add rule ip foo snortips queue num $ips_queue bypass

And it gave error in nftables 1.0.0:

Aug 20 05:51:00 amish nft[3540]: /etc/nftables4.conf:19:49-54: Error: 
syntax error, unexpected bypass, expecting -
Aug 20 05:51:00 amish nft[3540]: add rule ip foo snortips queue num 
$ips_queue bypass

So I changed the rule to:
define ips_queue = 0
add rule ip foo snortips queue flags bypass num $ips_queue

But it still gave me error:

Aug 20 05:54:51 amish nft[3649]: /etc/nftables4.conf:19:61-61: Error: 
syntax error, unexpected newline, expecting -
Aug 20 05:54:51 amish nft[3649]: add rule ip foo snortips queue flags 
bypass num $ips_queue


Then I replaced $ips_queue directly with 0 (zero), and it worked.

add rule ip foo snortips queue flags bypass num 0

So why isn't nftables allowing defined variable?

It used to work till nft 0.9.9

Regards,

Amish

