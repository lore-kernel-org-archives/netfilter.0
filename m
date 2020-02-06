From: "" <kfm@plushkava.net>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] does redirect accept daddr?
Date: Thu, 6 Feb 2020 15:23:56 +0000
Message-ID: <325b66b7-ae3a-dd64-c1d6-a65f7c929562@plushkava.net>
References: <d7f31893-feaa-e138-ad80-95a37d275e7b@gmx.net>
 <235762f1-4d73-1b5d-6e5d-eaf59cb8e916@plushkava.net>
 <6f2040c1-f7cb-589d-fefd-743af3988703@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=P
        zKk6ECMp8mmmlVLDMCKSUTKQPBdX9tHEWxbXTDIH4g=; b=Mhll01TsKPchS+u2e
        MnBObIN4WYjUZQgDMULoDFyZFsMld8l4x1NfXanOt5SnegeqiC/ghz9x6ceWNLRC
        +y7/ZzKPemjRKo1xcgVpMu6H9L5IUIXzpvn7FXLOsYNmitu5XpRto6PFNlJUpSFM
        7eRYGFBEp2QFecMl99YL+NK9vfs/liVPeE9z5P2ijvuO5QfP9FIO58V7mb/X6Ryk
        LrWQTap7rXYspJHELMLLP5MNH+Su/udoQPgVPtET1MOv+wD4SzRxhPtniW5KyOkd
        KL7rtvUXiEq134a1H5AgKPFS3kxZ8zlg4EpWNcxTndTz/VhfvQC4JzDXPkVUXggU
        +C/UA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=PzKk6ECMp8mmmlVLDMCKSUTKQPBdX9tHEWxbXTDIH
        4g=; b=YK56DmgEbQ/matp5O8oZUKT6WLNHj7krv/jHhyTLaH2nGlX44c04CDwfa
        bYYvy7yN7F+kOzV3bnnjrx/pZJ4Yai+cpj+1n6u25ngOvWguauMl2PCx2KuH1RSB
        DlAlrNH5P0ioNTH8LJGFVKokq8Y6IG/2ctr5zeDh/GTL+8xiIAjNGE8Jd4RARB8/
        CU4RhjAqHTxeeLZxzY/ACqCt8GyNvOgh9YS+CHd7CQDlKgVL96DUWkX4swgCXElK
        AyGGPUCYaxhMk+RdBWQJ5+yjZoSAUzhRHm5iqZX6gpGpN3w64xeraacqmHNmKREn
        ujlK7xdeLxxYlaeCD+ecgaRczzH4A==
In-Reply-To: <6f2040c1-f7cb-589d-fefd-743af3988703@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 06/02/2020 12:32, ѽ҉ᶬḳ℠ wrote:
> On 06/02/2020 07:29, kfm@plushkava.net wrote:
>> On 06/02/2020 02:01, ѽ҉ᶬḳ℠ wrote:
>>
>> The "redirect" statement results in the packet being directed to the 
>> primary address of the interface on which it was received. That's 
>> non-negotiable. As such, "ip daddr" is not supported as an aspect of 
>> its grammar. Indeed, that's not even how it works for the "dnat" 
>> statement.
>>
>> For instance, these are valid:
>>
>>    redirect
>>    redirect to :8080
>>
>> This is invalid:
>>
>>    redirect to 1.2.3.4:8080
> 
> Suppose that can/should be inferred from the WIKI
> 
> "Is a special case of DNAT where the destination is the current machine."
> 
>>
>> However, these are valid:
>>
>>    dnat to 1.2.3.4
>>    dnat to 1.2.3.4:8080
>>
>> Once you address this, any remaining errors should begin to make more 
>> sense.
> 
> Right, no error being printed with:
> 
> table ip nat { # handle 7
>          chain input { # handle 1
>                  type nat hook input priority 100; policy accept;
>          }
> 
>          chain output { # handle 2
>                  type nat hook output priority -100; policy accept;
>          }
> 
>          chain prerouting { # handle 3
>                  type nat hook prerouting priority -100; policy accept;
>                  iif "br-lan" udp dport 53 dnat to 192.168.112.12 # 
> handle 5
>                  iif "br-lan" tcp dport 53 dnat to 192.168.112.12 # 
> handle 6
>          }
> 
>          chain postrouting { # handle 4
>                  type nat hook postrouting priority 100; policy accept;
>                  oif "pppoe-wan" masquerade # handle 7
>          }
> }
> 
> 
> Yet when packet dumping on the downstream client the capture shows no 
> sign of the rule taking effect but instead the client communicating 
> (egress and ingress) unabated with the DNS server set by the client. 
> Since this being pre-routing tracing/logging seems not applicable in 
> order to figure out what is (not) happening.

It is applicable. The use of dnat (or redirect) amounts to a mostly 
transparent form of interception at Layer 4. The client's resolver will 
send packets to whichever nameserver it is configured to use. These 
packets should be duly intercepted and redirected by the rules you've 
shown. Responses will appear to the client as originating from said 
nameserver, owing to the effect of dnat along the inverse path.

I'd suggest taking a closer look at what's happening at the intercepting 
host with the likes of counter, log, nftrace set 1, tcpdump etc. You 
could also use the conntrack userspace tool to observe and monitor the 
relevant state entries in your connection tracking table.

-- 
Kerin Millar
