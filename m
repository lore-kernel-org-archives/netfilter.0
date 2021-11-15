From: Kerin Millar <kfm@plushkava.net>
Subject: Re: nft named set address types
Date: Mon, 15 Nov 2021 19:00:52 +0000
Message-ID: <20211115190052.c5d7d394dad6225ad454ce45@plushkava.net>
References: <CAOLfK3UFmzPfaqZbB5z6kvRuvpmHrFptbf1_LLBfJdPPzVHwqQ@mail.gmail.com>
        <CAOLfK3XW28kgrBGpQvi9eO3h2oQD80kU6tqz0obgSfvkgbF5-A@mail.gmail.com>
        <YYGeTgBAZfM76k4h@salvia>
        <CAOLfK3XJHhm5z6b1MOaMFjK2P2V9jyPgOtSOFZUswPSxuEZLEA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
        W+QIr3hJS46xd+uIGENCT7RwnwkQZU+mUvyl4WYbM1Y=; b=XWNq8yn0Az4IOsxT
        AD8qYM7bMT7FxVgFEihRXOm1kC8fFM8UnP0nCN4Hj9iJ+RSHPjamiKUfRNTYGYm3
        HqT+Q21W+VBvYLXRO41YK17KLMTYyeiw8BALIYZSsc5rzFK6HPjnEZ5Z4nNfBdel
        cpMxgFDMbbjgJ6YgAErEt9RlrjTOUYE6HP9m3qmI12errVSNehVOiMX5TJn1X9Vw
        Pw348LzxYaaV6AeQ+Ne/aQaw9IrrEsSrdheakvWsawpPMt0xSGJ2yhN8dWNL+hFr
        0gI0oqjIoZgR97qtPDZGqjJD/jfGIHSXGAEd8JmSQrdmydVyNPKf9b7DNKKNvaKh
        66y7aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=W+QIr3hJS46xd+uIGENCT7RwnwkQZU+mUvyl4WYbM
        1Y=; b=iVNGGqM7wc6lQhpTbLr2xjLQuXwlU/iAkAawlYVC9c5MY4cQBaPb4euH8
        a3PfxSQNd3TTcWceM0b/RYCG3B8FRmHd6hOcDIDNr7rSr19xyI5mBKyac0PKXE43
        phPa71jiEunCG4rIp8gL1F32gJoCBZQHit7aYIl5S9h12Y2kiNzZ0w3U36fQ1Yf0
        R4QebBzIuXldpaWBrtKVkn4dQOW7pUDyJo+HoX0xcBz0Gq8f7kCwtMivxWzytjU+
        zUykWmVem0vgI8quzEvv1/6Y3cZ7M6RogVGGreJaG/S36CR34wsZ7vLSqEHkYOyY
        JCZ/QvaI3PA97w4SLrECtk5uVATeA==
In-Reply-To: <CAOLfK3XJHhm5z6b1MOaMFjK2P2V9jyPgOtSOFZUswPSxuEZLEA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter <netfilter@vger.kernel.org>

On Mon, 15 Nov 2021 11:40:43 -0600
Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:

> I see there is an icmpx for reject packets. Is there something
> equivalent for destination packets?
> 
> I've tried:
> 
> table inet filter {
>     chain icmp_ipv4 {
>         ip  saddr $icmp_networks_ipv4 accept
>     }
> 
>     chain icmp_ipv6 {
>         ip6 saddr $icmp_networks_ipv6 accept
>     }
> 
>     chain input {
>         meta protocol {icmp, icmpv6} vmap {
>             icmp: jump icmp_ipv4,
>             icmpv6: jump icmp_ipv6,
>         }
>     }
> }

This is definitely nonsensical syntax. Try "meta protocol vmap" instead.

-- 
Kerin Millar
