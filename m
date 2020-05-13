From: "" <kfm@plushkava.net>
Subject: Re: Dynamic list for net's
Date: Wed, 13 May 2020 19:39:03 +0100
Message-ID: <c5b80a94-21d8-b672-f9c4-3d99b95164fe@plushkava.net>
References: <CAPLRfGJXvrwpROcjAsxb-7=dASRO1j0h+UbwKUDhXi1zXV48_g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=M
        Czl2ltWnRd/LmrlcoLB4FGL057hBwfTB73yAEToXSA=; b=JJcoYsNQhrXXAxw1m
        cAuhdndGW6pvfRAKIU3qgY/dCopL+lYBsJw0QFrh6pR8DqBDvzIHF4fHJU0PUEfH
        06VPi9sFRH7wZthVuxe4qy3g2qt6fG+I4n2KMZchTwaFgw3bOIM4XRhmtTGxOLIs
        jjevYm6afXnKbiaq0G0dTc5QPwU2rcMFVtoyFQb5cXRSSRREg+vEFzwZc7VaqJuo
        MTX3V8QQiDd6V7iUU0ZM+EBes9t+S7VtjYeWN0Jxi814o5bsYMNj6bXqqiplLmWH
        lyL+woDlbpMYQb1K4Bm3+O5oRBzknPYCOsdhoPt2c0qt+Cd4+PeSy7f4+j9CTgNe
        wYizA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=MCzl2ltWnRd/LmrlcoLB4FGL057hBwfTB73yAEToX
        SA=; b=KMh79MF/0WTZCxrUXB2DyI/8G66WF6yZ17J4Xs8oclryuvFf8/25r5ZHU
        hqz1J4B6ZVsEdMeXPMw5Hq2GDS6ADr4QyKCZJVRxuhBfmx0dMShoVBWOgT7uauTI
        SKEFXzYWGKACC9qkR/4TxzSKX+TgeQ2FwMBB6nnLxH2w9dFH+4Dt+mz1tN52z20e
        EhaelPYOY4I4iaBFiKINEqDRj5rcxsceHo3moSBzYzo1Zqo08hxpE9JNmWXDsesC
        f40G0YPomPAwm7XKxZWFl0vdjo6KUDtwHXysSjmRBtBSLGrsh2ArPgvy5HYLU+7s
        aERXSHH27Ceu7eLi/FR9UOIFxNhEg==
In-Reply-To: <CAPLRfGJXvrwpROcjAsxb-7=dASRO1j0h+UbwKUDhXi1zXV48_g@mail.gmail.com>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?0IbQstCw0L0g0KnQtdGA0LHQtdC5?= <ivan@intraffic.ua>, netfilter@vger.kernel.org

On 13/05/2020 18:40, Іван Щербей wrote:
> Hi all
> 
> I have question about "SET"
> 
> I read this block on manpage:
>>
>> Using anonymous sets to accept particular subnets and ports.
>>
>>
>> nft add rule filter input ip saddr { 10.0.0.0/8, 192.168.0.0/16 } tcp dport { 22, 443 } accept
>>
>> Named sets are sets that need to be defined first before they can be referenced in rules. Unlike anonymous sets, elements can be added to or removed from a named set at any time. Sets are referenced from rules using an @ prefixed to the sets name.
>>
>> Using named sets to accept addresses and ports.
>>
>>
>> nft add rule filter input ip saddr @allowed_hosts tcp dport @allowed_ports accept
> 
> 
> But i can't use network how elements in set. because only ipv4_addr or
> ipv6_addr types are supported.

For named sets, ensure that the "interval" flag is present. See the 
discussion that occurred in the following bug:

https://bugzilla.netfilter.org/show_bug.cgi?id=1380

-- 
Kerin Millar
