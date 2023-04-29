From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Translating iptables rules with TTL, HL and physdev to nftables
Date: Sat, 29 Apr 2023 09:55:31 +0100
Message-ID: <20230429095531.ac463360ea4cc19902cd94a6@plushkava.net>
References: <hqPvtHzm3I0cxzrsj43wW11hd31Sxw36pN25SObh8dvW-0HotwJyND64l-aj9I4hR-yZyxxAnQabaueZNKo2haeejKFSI8AkB4Jgh0UG8i8=@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm1; t=1682758533; x=1682844933; bh=7iskC0igMNlbLQN1JtONMtAje
        D8YJfXEf7w94k2VWEA=; b=Gdc8Q/Buu2Pzw2xDiEXkX/2W59yXcG9Tg5bfERnqo
        x6x8I+DZC5zZmdfrcdCpUzq5XOlsxHHJI5b3oCiCILm9rnGlKDAt3vdd65K//grj
        5ISJlHw0F5ZSCT+WdJ0Pcjy5VW8KSSWINMgSwE5ZAKWFTaZiIXnHf71I7MMO7SLh
        zCuJypkozai9YQaBn7H/Pm4RZw/ZYpfNhDlISUPMEqhyv0gFoWK+HhrcCVTdFEuq
        XQGbaMfOmG/v1RNfLW/YKabxY+a0c9DN6C7NVNIkaEQ6T+sI2YqqSUmDtWeCKPBc
        /X+ngOmK/X42JjBX4e9zcIA0fgUdW8wTBcUTUu/G5xstA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1682758533; x=1682844933; bh=7iskC0igMNlbLQN1JtONMtAjeD8YJfXEf7w
        94k2VWEA=; b=DrSO/dp4ZWA7BolCCOxZfGIfGACvMtcsAf7vymkbk1q04PCFppr
        artEsf4lROVyo6/Q/j7B3tE4dRkUgw3VEipJFPSl1uiNJkvkRw8eZHWJJSFXh27f
        U2nCpEVtaA65zTXK0cw8qsEogHX1NmvcnB/+oK3kC48C368+taKJrzy215/lJqOp
        //vy+sm5gyq50Vak7+SSBYaczHqErleoMBiXXsDnmRb31GbTIVwoXe1pBO8eYHYd
        QOhV/lybwQjd+MGu/5EyKK2+Xg0Ua7VHLZbkkPeIeI1slq6a1V0xcYcGW1xQ6A4s
        kX3NVmcJmZlU3CEokEHFfIHy2vCpwYdS9Eg==
In-Reply-To: <hqPvtHzm3I0cxzrsj43wW11hd31Sxw36pN25SObh8dvW-0HotwJyND64l-aj9I4hR-yZyxxAnQabaueZNKo2haeejKFSI8AkB4Jgh0UG8i8=@protonmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gaaimen1997 <gaaimen1997@protonmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sat, 04 Mar 2023 07:46:10 +0000
gaaimen1997 <gaaimen1997@protonmail.com> wrote:

> Hi, 
> I am translating iptables and ip6tables rules to nftables rules to set up my portable router. However, the following commands did not translate correctly when I used iptables-translate (ip6tables-translate)
>  
> iptables -t mangle -A POSTROUTING -o eth0 -j TTL --ttl-inc 1
> ip6tables -t mangle -A POSTROUTING -o eth0 -j HL --hl-inc 1
>  
> iptables -t mangle -I POSTROUTING -m physdev --physdev-out usb0 -j TTL --ttl-inc 1
> ip6tables -t mangle -I POSTROUTING -m physdev --physdev-out usb0 -j HL --hl-inc 1
>  
> For the ttl and hl modules, I tried "ip ttl set 88" and "ip6 hoplimit set 99" on my own, and they worked fine. However, I am unable to increase or decrease ttl (or hoplimit) as --ttl-inc or --ttl-dec.

As far as I am aware, there is no equivalent feature implemented by nftables, though it is possible to match a specific TTL value and set a specific TTL value in turn. Here is a previous thread in which the matter was raised: https://marc.info/?l=netfilter&m=158000104630533&w=2.

-- 
Kerin Millar
