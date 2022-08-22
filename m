From: Amish <anon.amish@gmail.com>
Subject: Re: Optimization works only on specific syntax? (was [ANNOUNCE]
 nftables 1.0.5 release)
Date: Mon, 22 Aug 2022 20:53:39 +0530
Message-ID: <71eda095-f021-3d00-7ad8-568b934ac194@gmail.com>
References: <YvK7fkPf6P52MV+w@salvia>
 <fff1fe66-9bad-a732-12ad-133bd9c40218@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=c1VQcKO19zDd4dLcQGMK2dWX2+6edh8we7um74ba2OI=;
        b=Tk2ouaHH1BcyvoMkRErkOiqa4uqGZueCNz6rPkcxZhqbkj8VNe34MUQnbqH9kDZlox
         40aBe3EJLiyZ9ggdhoov3hRJv36gUICpkLzk3NaalrD4QpyMrZrhxd0fplt8SOo+HaFP
         1Gex4Ts9ZhRayaHd9/Bt6EKhYUI1kNDs8Oo+NtpTdEix8C2cTuVqJxGgujsdxlE+RuaQ
         6E6J4jfUSVICss2yJV76D1JrdfXSAZIocmAMHUaCp7fs1SEZKd8q66SD6sif+FCw1522
         Jw2FZYR2BWA6SNC/eTnKkPzbaUegWZBSoruo55CLL0ceHwdnen61veKyk1ad3i4XHEuA
         6t0A==
Content-Language: en-US
In-Reply-To: <fff1fe66-9bad-a732-12ad-133bd9c40218@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>

Anyone has update regarding this?

Sorry for repeat noise.

Thank you

Amish.

On 15/08/22 06:30, Amish wrote:
> On 10/08/22 01:24, Pablo Neira Ayuso wrote:
>> - Fixes for the -o/--optimize, run this --optimize option to 
>> automagically
>>    compact your ruleset using sets, maps and concatenations, eg.
>>
>>       # cat ruleset.nft
>>       table ip x {
>>              chain y {
>>                      type nat hook postrouting priority srcnat; 
>> policy drop;
>>                      ip saddr 1.1.1.1 tcp dport 8000 snat to 4.4.4.4:80
>>                      ip saddr 2.2.2.2 tcp dport 8001 snat to 5.5.5.5:90
>>              }
>>       }
>>
>>       # nft -o -c -f ruleset.nft
>>       Merging:
>>       ruleset.nft:4:3-52:                ip saddr 1.1.1.1 tcp dport 
>> 8000 snat to 4.4.4.4:80
>>       ruleset.nft:5:3-52:                ip saddr 2.2.2.2 tcp dport 
>> 8001 snat to 5.5.5.5:90
>>       into:
>>              snat to ip saddr . tcp dport map { 1.1.1.1 . 8000 : 
>> 4.4.4.4 . 80, 2.2.2.2 . 8001 : 5.5.5.5 . 90 }
>
> This optimization seems to be working only on specific syntax.
>
> If I mention same thing with alternative syntax, there is no 
> suggestion to optimize.
>
> # cat ruleset.nft
> add table ip x
> add chain ip x y { type nat hook postrouting priority srcnat; policy 
> drop; }
> add rule ip x y ip saddr 1.1.1.1 tcp dport 8000 snat to 4.4.4.4:80
> add rule ip x y ip saddr 2.2.2.2 tcp dport 8001 snat to 5.5.5.5:90
>
> # nft -o -c -f ruleset.nft
> <no output with exit code 0>
>
> Which means that no optimization is suggested but check passed 
> successfully.
>
> I was expecting that it will reply with:
>
> Merging:
>  ...
> into:
>     add rule ip x y snat to ip saddr . tcp dport map { 1.1.1.1 . 8000 
> : 4.4.4.4 . 80, 2.2.2.2 . 8001 : 5.5.5.5 . 90 }
>
> OR if it can not translate to exact syntax then atleast it should 
> mention that there is possibility to optimize the rules.
>
> Is there any reason? Am I doing something wrong?
>
> Please suggest.
>
> Thank you and best regards,
>
> Amish
>
