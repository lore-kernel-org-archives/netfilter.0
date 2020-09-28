From: Devin Bayer <dev@doubly.so>
Subject: Re: meter directive
Date: Mon, 28 Sep 2020 18:12:21 +0200
Message-ID: <dcece986-3760-ddab-a726-213ac103e4d8@doubly.so>
References: <2781f10c-a5e5-0bdc-b701-617f9476c57b@doubly.so>
 <aaa67cc8-c8c0-465b-3fa5-10f62e67795e@doubly.so>
 <20200928021034.GB20886@dimstar.local.net>
 <b3d4b568-3d53-a9cf-6730-a47b35132b5f@doubly.so>
 <20200928123213.GF20886@dimstar.local.net>
 <dc380b6d-4085-13c7-9687-405825585823@doubly.so>
 <20200928160809.GB2605@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=doubly.so; s=MBO0001;
        t=1601309546;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q7Dd6JTSiXOd/jSmxm/lKEJn9yCiE++13/TL24iIOqw=;
        b=S7iOoGQO7fZ1eiZSfLvmMTpdzaGeq5eH7KNYBv9lvW2kCtgwpLBRu/DbuLe+cK6OIBmKo6
        HZbtNvtFi+zVjj7A2F6KYex+6dDXl6j7e9i0BdmQD6G3jdkFqxX+/P6lQ1NFH62jfxv8o9
        AzvHxDaCXb/7p1vlvju+q+oR89QU0lZpx2jOLqSPwH8WL6cpVJuzi3PVhU5RQ2nDuaLYjG
        R1jR9tIZM5gQe8Is4BEzFIg78ZcoXGad7/Eg/ZX2VgrRMW4VEEF/XWtbB1bowY4sYHEo2g
        Da8qJAbuiMc/uaQxh2pRWYtMcrLHL1OGyB/NnMvBoJXeljX8bMQWx/zW7G1mcg==
In-Reply-To: <20200928160809.GB2605@salvia>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: duncan_roe@optusnet.com.au, "netminder (Eric Peterson)" <netminder@gmail.com>, netfilter@vger.kernel.org

On 28/09/2020 18.08, Pablo Neira Ayuso wrote:
 >
> Something like this:
> 
> table ip x {
>          set flood2 {
>                  type ipv4_addr
>                  size 100000
>                  flags dynamic,timeout
>                  timeout 1m
>                  elements = { 150.214.188.80 expires 54s752ms limit rate 1/minute burst 1 packets }
>          }
> 
>          chain output {
>                  type filter hook output priority filter; policy drop;
>                  ct state new tcp dport 80 add @flood2 { ip daddr limit rate 1/minute burst 1 packets } log prefix "test: " accept
>                  ct state established,related accept
>          }
> }
> 
> Only one stateful expression is supported a this stage, either you
> have ratelimit or you have counters per elements.

Thank you; I see how the set syntax works now.

How do I get the behavior like in the wiki, which uses maps?
