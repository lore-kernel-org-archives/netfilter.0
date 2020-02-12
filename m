From: "" <kfm@plushkava.net>
Subject: Re: [nftables 0.9.2] does jump require a kconf to be set to get it
 working?
Date: Wed, 12 Feb 2020 18:40:26 +0000
Message-ID: <c81185d7-ff7c-9df7-c61d-29ed7c541e31@plushkava.net>
References: <a581ac40-f8ad-c009-4c83-40f1833b6ddb@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=f
        0XMNhlhwnFrP/xDfTsFetiGh+bVVWIFTuuZiY5BpbE=; b=nGjk+uDhA3ByAIxM7
        9pgSl7iIj+Ts0V4CiQ/xr528kKvs5fDsl5aE/jPUdl4haZ8RmdkG8CiA8vsS7ir/
        zSSf8RqFzH0kGiwCCVxHewxk6c5AfRiaEb+8QYKA7WtatvKjvBrL+YkdIhCFIP2f
        FNlDXRGjQ6f6sjmUth8dyZe+RjoCUpwOIstsc9NrhD0Llj/p17RmlLhf7ykbEKj3
        mhDndd0SKpcPaPneSAmCOHeSIAXVLev97LFEUkgknOpNZ057AOMbG2fgiRv/CcM3
        nlmrQH7Q/H+YKiNtv565iVEsT7WIUf0OsGtk92me80wZbaQgk6mPAYE0nr9yxdXx
        zYWKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=f0XMNhlhwnFrP/xDfTsFetiGh+bVVWIFTuuZiY5Bp
        bE=; b=MsYpcMaGLni25PrGP+ipl0ELXN80NupZOUowcG+x7GZfVl4LU0T8uDOwT
        iCPAnK/N9iRLWWKn87oLyPXOSHCrCm//890NYfK9zCeh9eJx8QIX8EmkzAHWOLXW
        4xKDcAfGr8Iy7vAgOHyViSdSD8Mlv92zHXch4l7kzAe5d8ikWvt4PbyKFourlQ9G
        O6TYuVjsQBlofRvnfyBNqtUcogKeq4XTJx7EiI/VJamdc3vH0rVHTKLDu0VqxIl1
        Xc36ml7jZfgZZIPYvnPuX4tt3qS3FvQNKUQ5y/uA+oEf5m1VKcapRr7CWjQiw/O5
        gVeA+aTFibEEmVF1w6JQWucWiNT3Q==
In-Reply-To: <a581ac40-f8ad-c009-4c83-40f1833b6ddb@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 12/02/2020 16:41, ѽ҉ᶬḳ℠ wrote:
> Have tried to some online guidance which NFT features require which 
> kernel config to be set to get them working and whether jump is among 
> such feature set.
> 
> Because hitting:
> 
> Error: Could not process rule: Not supported
> 
> with:
> 
> table inet filter  {
>   chain input  { type filter hook input priority 0; iifname pppoe-wan 
> jump wan_i }
> }

As shown, this isn't quite valid nft syntax. Please post a minimal - but 
complete - ruleset that reproduces your issue in a form that is 
verbatim. Include the wan_i definition, even if it merely an empty chain.

That aside, you would definitely need CONFIG_NF_TABLES_INET for "inet" 
support.

-- 
Kerin Millar
