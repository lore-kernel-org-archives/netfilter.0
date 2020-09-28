From: Devin Bayer <dev@doubly.so>
Subject: Re: meter directive
Date: Mon, 28 Sep 2020 12:01:52 +0200
Message-ID: <b3d4b568-3d53-a9cf-6730-a47b35132b5f@doubly.so>
References: <2781f10c-a5e5-0bdc-b701-617f9476c57b@doubly.so>
 <aaa67cc8-c8c0-465b-3fa5-10f62e67795e@doubly.so>
 <20200928021034.GB20886@dimstar.local.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=doubly.so; s=MBO0001;
        t=1601287320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8KSaFpUr91Eemebo8i+YN491UzxOgjtGlCWQLaihYLE=;
        b=s3Q4EFQ2VPA6R0feyIvxQrVMCf8FpvjOtcQRiSOC8yO5xHeVg/n9uQz2bgkewsF6e1h7vQ
        dL+x4lcwEQBDNY4ecoRmIjoDB+nbNDibq86+J9qON0GxrKMycZJVTOaqwDyjQ4+Ok2Ctn9
        y7tl5BBOP5nPS9vUXGJHb64FhESrLpCqZ8xhpbmuMGYY45XgbH9Wdq4zUeh0fXOSdHYkYL
        tvUc/lV31weUvat3YG6M6+yK8hU/TDfwTioWj1095FfZM1jFb3hgvgEHiEhtlwhWbITmWO
        i+Zn+KFba1z+utQ6OmYAo5W1ixOifwvBozUNdGGkM9hY1X9ud9k4NSLIfnSuBw==
In-Reply-To: <20200928021034.GB20886@dimstar.local.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Duncan Roe <duncan_roe@optusnet.com.au>
Cc: "netminder (Eric Peterson)" <netminder@gmail.com>, netfilter@vger.kernel.org

On 28/09/2020 04.10, Duncan Roe wrote:
> 
> Hi Davin,

Thanks for the reply Duncan.

> a) from b):
>> Note that the meter keyword is obsolete, the dynamic set and map syntax is now preferred for consistency.

I see. In that case, I would like to update the man page to use the new 
syntax. The examples there use meter, but without any explanation.


For example the blacklist example:



	nft add rule ip filter input tcp flags syn tcp dport ssh meter flood 
size 128000 { ip saddr timeout 10s limit rate over 10/second} add 
@blackhole { ip saddr timeout 1m } drop

So would this be the set equivalent?

     set flood {
         type ipv4_addr;
         size 128000;
         flags dynamic, timeout;
         timeout 1m;
     }
     ...
     tcp flags syn tcp dport ssh \
         add @flood { ip saddr limit rate over 10/second } \
         add @blackhole { ip saddr timeout 1m } drop


Is there a map equivalent? I couldn't get anything to work.

> b) Still documented at https://wiki.nftables.org/wiki-nftables/index.php/Meters,
>     but the examples are updated to use dynamic sets.

It's quite confusing and doesn't work as described though.

> c) counters in dynamic sets are special: you get a counter for each set member.

Right - but how can I see the counters? If you look at my example I just 
see this:

	3.10.95.11 . 22 expires 14s492ms limit rate 10/second,

~ Devin
