From: Amish <anon.amish@gmail.com>
Subject: Optimization works only on specific syntax? (was [ANNOUNCE] nftables
 1.0.5 release)
Date: Mon, 15 Aug 2022 06:30:22 +0530
Message-ID: <fff1fe66-9bad-a732-12ad-133bd9c40218@gmail.com>
References: <YvK7fkPf6P52MV+w@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=WenmcpC3sVVnxR1zLL1wLdsp83TtT0xVcnU5htrVtb4=;
        b=MsDNHNB+fYsCnWpl4EgaH/LZA/cqRXtl2SGZzPEmTgfaFXz5NHIsGB/gizQAQNDttz
         NrkQcs9ffLQgB4rzsdQrw8LW5tOynvKetwx8LY1dDufMc/F8Z7nA48v6mHpiPevlRCi5
         KkbP4d66lE5e21luK3Dd6dcBO9jzpKsqkd26XKjQ3PKJ/eiIDVtCeN5YvMXjdQn0pW/0
         4KojwjGmkElaiGPVPZ32w/KSKufrQ+yeYCqYX7Hdivu3GC0c6fzAhEA61wxg070M7Chu
         CnaVZm+0H6weF+ZRK4YOHjf7AlqhCxjHeSnU8nFsrLOP2kYGL0g3DUxpbo63qqmuQVtk
         uRzw==
Content-Language: en-US
In-Reply-To: <YvK7fkPf6P52MV+w@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>

On 10/08/22 01:24, Pablo Neira Ayuso wrote:
> - Fixes for the -o/--optimize, run this --optimize option to automagically
>    compact your ruleset using sets, maps and concatenations, eg.
>
>       # cat ruleset.nft
>       table ip x {
>              chain y {
>                      type nat hook postrouting priority srcnat; policy drop;
>                      ip saddr 1.1.1.1 tcp dport 8000 snat to 4.4.4.4:80
>                      ip saddr 2.2.2.2 tcp dport 8001 snat to 5.5.5.5:90
>              }
>       }
>
>       # nft -o -c -f ruleset.nft
>       Merging:
>       ruleset.nft:4:3-52:                ip saddr 1.1.1.1 tcp dport 8000 snat to 4.4.4.4:80
>       ruleset.nft:5:3-52:                ip saddr 2.2.2.2 tcp dport 8001 snat to 5.5.5.5:90
>       into:
>              snat to ip saddr . tcp dport map { 1.1.1.1 . 8000 : 4.4.4.4 . 80, 2.2.2.2 . 8001 : 5.5.5.5 . 90 }

This optimization seems to be working only on specific syntax.

If I mention same thing with alternative syntax, there is no suggestion 
to optimize.

# cat ruleset.nft
add table ip x
add chain ip x y { type nat hook postrouting priority srcnat; policy drop; }
add rule ip x y ip saddr 1.1.1.1 tcp dport 8000 snat to 4.4.4.4:80
add rule ip x y ip saddr 2.2.2.2 tcp dport 8001 snat to 5.5.5.5:90

# nft -o -c -f ruleset.nft
<no output with exit code 0>

Which means that no optimization is suggested but check passed successfully.

I was expecting that it will reply with:

Merging:
  ...
into:
     add rule ip x y snat to ip saddr . tcp dport map { 1.1.1.1 . 8000 : 
4.4.4.4 . 80, 2.2.2.2 . 8001 : 5.5.5.5 . 90 }

OR if it can not translate to exact syntax then atleast it should 
mention that there is possibility to optimize the rules.

Is there any reason? Am I doing something wrong?

Please suggest.

Thank you and best regards,

Amish

