From: Devin Bayer <dev@doubly.so>
Subject: Re: meter directive
Date: Mon, 28 Sep 2020 15:00:59 +0200
Message-ID: <dc380b6d-4085-13c7-9687-405825585823@doubly.so>
References: <2781f10c-a5e5-0bdc-b701-617f9476c57b@doubly.so>
 <aaa67cc8-c8c0-465b-3fa5-10f62e67795e@doubly.so>
 <20200928021034.GB20886@dimstar.local.net>
 <b3d4b568-3d53-a9cf-6730-a47b35132b5f@doubly.so>
 <20200928123213.GF20886@dimstar.local.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=doubly.so; s=MBO0001;
        t=1601298063;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BwGPjaS0vPmrz7DjK/8Z3fzUHFXphbz4pxsTtUMv8yk=;
        b=JTi/VE3RsHlQrz9pVDvXsSeU8bmD/meqncQ2mX2h53+IfN30RGlsvPIDggIYUDQz9f4hEv
        oG6AMyD3vlqDo+/QsICK6k71A0dX5sXF/ThPMh4YSZ7NGBiXCiHVm4AZtIYbUBkWIS9NmD
        27Sf61uIZ23QTlr/yYOr5Lshe8PdnVSiL9IiwyS9/fNU358+EmMybO7L70phVJIn/V7F4R
        +q/KjFncfq/v6MZNOlB5FCRuM/fApPFJKoV39oU22yn9brwgbDCTVdIzWwldniXFfxCGJp
        NN3ZLnZpCG1mzuV+iZ9wCP2s8BxrWqmucCC7GuHqCewTkcKGZ8ZiStlq3Httcw==
In-Reply-To: <20200928123213.GF20886@dimstar.local.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: duncan_roe@optusnet.com.au
Cc: "netminder (Eric Peterson)" <netminder@gmail.com>, netfilter@vger.kernel.org

On 28/09/2020 14.32, Duncan Roe wrote:
> 
> It used to be the case with meters that you could have limit or counter but not
> both.
> 
> I don't know if that is still the case with dynamic sets. If it is, you will
> have to have 2 sets: 1 with limits and 1 with counters.
> 
> (counter with limit is ambiguous: do you want to count packets received or
> packets accepted? Both are do-able with 2 sets).
> 
> Please post your rules that add set members if you have further questions.

I think it's clear enough in regards to sets in the manpage - I will 
submit a patch for that.



However the situation on the wiki is still unclear. It does show 
counters with limits, but for maps. However, it doesn't show how to 
create the maps or add to them.
  I try something like this:

     map flood2 {
         type ipv4_addr : counter;
         size 100000;
         flags dynamic, timeout;
         timeout 1m;
     }

     chain prerouting {
         tcp flags syn tcp dport 80 \
             add @flood2 { ip saddr limit rate over 3/minute } \
             log prefix "MAP "
     }

But no luck:


   /etc/nftables.conf:49:9-14: Error: Could not process rule: Operation 
not supported
     map flood2 {

Basically, I would like to update the wiki page so it provides workable 
examples.

~ Devin
