From: Daniel <tech@tootai.net>
Subject: Re: Error: conflicting intervals specified - Bullseye 0.9.8
Date: Thu, 16 Sep 2021 15:33:10 +0200
Message-ID: <ba21fb74-2e97-7c86-685f-841abae7413f@tootai.net>
References: <ab060c71-e640-a67e-347f-60cd1d800932@tootai.net>
 <20210916092924.GB31336@salvia>
 <48e95c8a-2469-08dd-0620-55187252653c@tootai.net>
 <20210916125858.GA9451@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1631799191; bh=xrWtAmUZO0hnjMsPGy1cNq8LBP0EJ0EaQ6oZz6jd9x0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dKyGu7O8VBVoxtv1HfaMIBwzQ14P11s2EbxXxYtshtRVower5YEARwvsl3a/xduvk
         995O8Cb2u1MsVj2EESDEuyxTES2r29TvK6M2TBPuO+Hz4kV/J1ZzdnWn9WdkxeoNxy
         k2VlZFaZA2bxwM8rvC7N/RUEMrDJqrkF3BEjpTqU=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1631799190; bh=xrWtAmUZO0hnjMsPGy1cNq8LBP0EJ0EaQ6oZz6jd9x0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LAo5MBC6U83ffwUhu286D4vBnhPBCUHIRCJOL/Iy1tGTypGP4Xk8yHkf6JFkI17HY
         e7COL5VagUEZS+w8MjCRBaCjbAajCEtypsY+ogVhrfZfevD7zthkZ9QgomfmFc1E/8
         VrV6Ql74TH2VkecFvSi9omuFzmdEaaB6hI32B0Js=
In-Reply-To: <20210916125858.GA9451@salvia>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Netfilter list <netfilter@vger.kernel.org>

Le 16/09/2021 à 14:58, Pablo Neira Ayuso a écrit :

[...]
> Keys uniquely identify an entry in a map, if you define two entries
>>> with the same key, you hit this conflict interval error.
>> I see this like forward port:ip to port:anotherip
> so you want to redirect all ports except a few of them?
>
>    add map x mymap { type ipv4_addr : ipv4_addr ; }
>    add rule x y ip protocol { tcp, udp } th dport 1-65534 dnat to ip saddr map @mymap
>
> This allows you to dnat depending on the IP source address, skipping 0
> and 65535 for TCP and UDP.
>
> I'm not sure yet if this is what you need though
That's my goal,  thanks !

-- 
Daniel
