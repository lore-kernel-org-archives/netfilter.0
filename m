From: "" <kfm@plushkava.net>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] ICMPv6 ingress dropped despite
 accept rule
Date: Mon, 3 Feb 2020 11:55:50 +0000
Message-ID: <a4085c80-4896-54b9-8373-3e51b8c0bce9@plushkava.net>
References: <f8914acf-6487-c9bd-e452-d253069aebe5@gmx.net>
 <df96258c-8bcb-4db4-6910-d96ef1caf990@plushkava.net>
 <77d49c07-70dd-7108-ea77-ee3f943ca765@plushkava.net>
 <900da355-fb50-2359-7cd9-50b9fe9fc1fc@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=W
        FxHmwgmZHTrRxhGsICiE/hvAXBiMCQB2oDkFmai3Tk=; b=jWKZL2X3Ry+kWfH+f
        LEE2R+LiO57ytker+UnuNz16RUdm4xqg1ErkEMzFBzRPY8piGmeUCBjY2eF3NcS2
        7NRyxaWhAs+ynIJ4VyZtWRHU0hpsgOH9POG4WStoOL8BNqycmMsu1PPpZX40Ewr8
        7BfVHfpFP4C4IqZhn45+/RjyBPNP0vKnsU+2NkZDdlVUiqCv86Ihuuy9Hla4m/Ve
        91fdo7/Au8YVUMVuF0HeSxzWZOIRLDQiWz73+O7tDeAM4uIG6dLjP/MCK0xwK3uO
        lE/v3hPDls4fzojaeKw5BwMpkzSzMUojVh/2q+FbroOvfYJ7jJCWBjlSBrIAHPx5
        CEU3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=WFxHmwgmZHTrRxhGsICiE/hvAXBiMCQB2oDkFmai3
        Tk=; b=SSPaTQBkID5wHBhAKn7/pMEP2hgUEeSQIOn6K5HG4IX13K8guMEdghEQ7
        sN4HuSnlQO6TNz8XB2yraPHYGA6wyroYJc18A/dVgGVQca3+XsiUZlkHI0QLeNjC
        IJUuRC1DnJtHJSMAHOhzY/FKysjuAbfSobcjWwgE2vcSVnf5r728UVfZQGDO5fte
        l/isZdc0Ojxc7HHMbaCtuu+GdZpaJ5JM4cRvFbR8GPhYIYvL5XySdNU8OQAgsT3h
        A2/AeUH0GCyovj2YUzY5mzLi4yd5UjAt7oRNPms5T0vEdTBZBSppBjqghTmZRjOs
        8KNurX4FHvJ/njdu3EiNhhatgk5jg==
In-Reply-To: <900da355-fb50-2359-7cd9-50b9fe9fc1fc@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 03/02/2020 11:20, ѽ҉ᶬḳ℠ wrote:
> On 03/02/2020 11:15, kfm@plushkava.net wrote:
>> On 03/02/2020 11:12, Kerin Millar wrote:
>>> On 03/02/2020 10:56, ѽ҉ᶬḳ℠ wrote:
>>>> Appreciate if someone could be obliged and have a look at the below 
>>>> ruleset and let me know where I am going wrong since ICMPv6 is being 
>>>> (policy) dropped:
>>>>
>>>> DROP_WAN_IN IN=pppoe-wan OUT= MAC= 
>>>> SRC=fe80:0000:0000:0000:e2ac:f1ff:fe65:51ba 
>>>> DST=ff02:0000:0000:0000:0000:0000:0000:0001 LEN=72 TC=224 
>>>> HOPLIMIT=255 FLOWLBL=0 PROTO=ICMPv6 TYPE=134 CODE=0
>>>>
>>>> despite an accept statement
>>>>
>>>> --- ruleset
>>>>
>>>> table arp filter { # handle 141
>>>>          chain input { # handle 1
>>>>                  type filter hook input priority filter; policy accept;
>>>>                  iif "eth2" drop # handle 3
>>>>          }
>>>>
>>>>          chain output { # handle 2
>>>>                  type filter hook output priority filter; policy 
>>>> accept;
>>>>                  oif "eth2" drop # handle 4
>>>>          }
>>>> }
>>>> table inet filter { # handle 142
>>>>          chain input { # handle 1
>>>>                  type filter hook input priority filter; policy drop;
>>>>                  ct state established,related accept # handle 4
>>>>                  ct state invalid drop # handle 5
>>>>                  iif "lo" accept # handle 6
>>>>                  iif "br-lan" accept # handle 7
>>>>                  iif "lan0" accept # handle 8
>>>>                  iif "lan1" accept # handle 9
>>>>                  iif "lan2" accept # handle 10
>>>>                  iif "lan3" accept # handle 11
>>>>                  iif "lan4" accept # handle 12
>>>>                  log prefix "DROP_WAN_IN " # handle 13
>>>>          }
>>>> }
>>>> table ip6 filter { # handle 145
>>>>          chain input { # handle 1
>>>
>>> This particular chain is not hooked.
>>>
>>
>> Re-posting the above as I accidentally replied off-list.
>>
> But it is through
> 
> table inet filter { # handle 142
>           chain input { # handle 1
>                   type filter hook input priority filter; policy drop;

This is not the chain in question. For a chain to be utilised, it must 
either be hooked or be referenced - whether directly or indirectly - by 
a rule within a chain that is hooked. Your "ip6 filter input" chain 
currently does not fulfil either of these requirements.

> 
> or is it not? inet applies to both families IPv4 and IPv6, least that is 
> my understanding. Or do the chains have to be defined again for ip and ip6?

Yes, the inet table covers both families. As such, you have the option 
of relocating your icmpv6-filtering rules from the ip6 to the inet 
table. Doing so would not obviate the aformentioned requirements, though.

-- 
Kerin Millar
