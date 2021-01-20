From: "" <kfm@plushkava.net>
Subject: Re: How to edit nftables wiki pages?
Date: Wed, 20 Jan 2021 21:42:06 +0000
Message-ID: <bc59ca4e-7a58-6dff-712b-dc087358482c@plushkava.net>
References: <176bd68f88a.29be878823110.2520411253379674480@tuckey.email>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=U
        54OtpVsMgnJryWwAfXsSW206EE0udi3+c9NzzLPMp0=; b=X7EL/usOzCE32nnFp
        77qG5UAWRuPpkvzl1aFAqcarXhdP6yliVmVEVZtQq3AqDAVW9Ix4NssZcq17JQJl
        7tlNiST902i4UKRhAfMrhjuaTwpIFvE9QGYt2s5LHrqootEkB7J3FDpCrpdqDB7k
        gVqPN/XG+ChbNVQ1dzGXwd/oMqX44qW6+8VKmXxMUPCMfOpzl4WOanqpfZsrpjKn
        O44mV4EX14P3fNDHzlt1MCHXbjUbLR0P5EnisyckwtknghlYS3Rm2mYmfEHRqvH3
        oXwwIcU4ZOet5NPH6Jwm643pFDLgSDS6mTuWKqS5jGBIESt0lDVPyH6yL5hNkChA
        Fffiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=U54OtpVsMgnJryWwAfXsSW206EE0udi3+c9NzzLPM
        p0=; b=Zzth5IcTn80lPvzu756QGU6evZ5UZF+7hTSR7YIFTpes/X0D0iIc3pmQZ
        1uHjNkx5s1Uo2sI92A7bgQ6jpoO5so6SBEXAUiPA5+Y4NUUGBNB3g8NbFo9XynaU
        TFj3GQcw8PPawcQSIva8uy1iVOBIgvw/C7dVnGACGDPVN6V8kYOVYr+Avv9sJYUk
        ZU1d5fTXm9Wdyao8AoSy9WUf3v7iBEtwfq6eLtgxljfQbq0EbTtkZQcaOLSdHBax
        TGVflgrJIM94Y89uVmR8orsiQp9hFf8wdQoAZEB487DOU8V9poyBSauCaci+M1QR
        W8I0vdOPlsGYNqJHEh5q4pKaNq2Yg==
In-Reply-To: <176bd68f88a.29be878823110.2520411253379674480@tuckey.email>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jay Tuckey <jay@tuckey.email>, netfilter <netfilter@vger.kernel.org>

Hi Jay,

On 01/01/2021 10:05, Jay Tuckey wrote:
> Hi, I was trying to make an edit to this page:
> https://wiki.nftables.org/wiki-nftables/index.php/Queueing_to_userspace
> 
> I found that on my machine the commands didn't quite work as they are on the page, so I was going to add corrected commands, but I can't work out how to edit the page. Is this possible?
> 
> Regards, Jay Tuckey
> 
> 

Anonymous edits are not permitted. You would need to either request a 
wiki account from the Netfilter Core Team or for someone with an account 
to apply the changes that you have in mind.

-- 
Kerin Millar
