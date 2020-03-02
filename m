From: "" <kfm@plushkava.net>
Subject: Re: Demystifying sets
Date: Mon, 2 Mar 2020 20:58:28 +0000
Message-ID: <fb8152e5-68b7-c508-b1cc-2bbbfb7eed53@plushkava.net>
References: <b125461d-57f9-cdc4-0eab-2332fc53b287@negentropy.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=from:subject:to:references:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=Y
        7ZLjj87PIjbKOWdVfNFRGW5VKqyDNberXs+gO3UE74=; b=XkQahFS97DIiERaJu
        jA4zKdWKNJN0XXziUKOXjes0O6LnWGP5Rmj9R9ELLEe1Uk5R6d/kJNfgGHopnhbN
        1tvk7K4AgStIqCh3834/8RFOnNbG/IMoEr9TFnCqdlXnlbYiXdN5EWEf6g16EMsf
        swDonQ9NjK7HklQMDZcl+hyPYFQm7eJmUT97gRp2FG0afzZRJEGFIPTu6I0XQoUa
        XhyuhC5KFnhPu6eP3f1rMDkRTPZcur+kUWahxzHKfpGCUKeNUiSq2GfEdmdJbCMB
        suzxgTjm3uX/JfaEt56PB1m+/XBU6VuWmI8flvDPgxJoTRRVl4GNryhfaqB0quGd
        H4JlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=Y7ZLjj87PIjbKOWdVfNFRGW5VKqyDNberXs+gO3UE
        74=; b=2j22u1Tsx5apl8FhASz3uQVTdlfcKa3v8Yyd1UKKYFPbtI19X+rs0l6Mp
        dUXmbecjA320fNais1yHGJDHcmFf38NRZl6HIayO7Wuyc0OaVBQ5lrd+RSIAKums
        SPzpYrLxbDtWiQO0cOWZKtiJ5t/5zCHlqtoDivomuPJZ///cyjLCvvMxKeGgEys1
        0RoLRMiwjMKk1sY38FtmBNqZltMjxQ+KRWUNAZDPM9G2Fwb91+2Ni4y2sfctzTLQ
        eQmsDkWk9KKcASaRlh9muy7IUYMTaOrCM0PRHBquj5MghM3+nkPgKe3oKotd2Hy3
        wbLccV2nZyawhxRGcijJTJ/pXmxBA==
In-Reply-To: <b125461d-57f9-cdc4-0eab-2332fc53b287@negentropy.io>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 01/03/2020 16:33, jon_netfilter@use.startmail.com wrote:
> Hi everyone!
> 
> I have been trying to transition to nftables from iptables, and I have 
> some questions regarding the syntax and usage of sets and their nature, 
> to which I could find no answers in the documentation on the nftables 
> wiki or the man page of my distribution (debian sid). Thanks in advance 
> for those reading!

I think that I can help with the first two questions, at least.

> 
> My versions:
> 
> - nftables v0.9.3 (Topsy)
> - kernel 5.4.13
> 
> 1) what is the most up-to-date documentation or version of the man page?
> 
> For instance, the man page at netfilter.org says it was updated on march 
> 21 2018, and doesn't mention things like the dynamic flag for sets. I 
> see that there's been a commit adding an explanation for the "ct count" 
> expression at [1], but I don't see it included in any man page I could 
> find.

The asciidoc sources are here:

https://git.netfilter.org/nftables/tree/doc.

> 2) what does the dynamic flag for sets actually do?
> 
> In debian sid's nft man page, it says this:
> 
>  > The set statement is used to dynamically add or update elements in a 
> set from the packet path. The set setname must already exist in the 
> given table and **must have been created with the dynamic flag**.

As you have deduced, this isn't true. The following commit has occured 
since:

https://git.netfilter.org/nftables/commit/doc?id=dacab91

> 
> Note my emphasis. However, I've tried this, and rules which modify set 
> contents from "the packet path" work without having to set the dynamic 
> flag for the set that is used (see [2]). After some more 
> experimentation, it seems that the dynamic flag *is* required for using 
> the limit and conntrack expressions. Which brings me to my next question.

Yes, it is confusing. The general definition would be that it allows for 
sets (and maps) to contain elements that are stateful objects in and as 
of themselves. For instance, an element that has a timeout policy 
attached would be stateful in nature.

-- 
Kerin Millar
