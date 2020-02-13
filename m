From: "" <kfm@plushkava.net>
Subject: Re: [nftables 0.9.2] does jump require a kconf to be set to get it
 working?
Date: Thu, 13 Feb 2020 14:22:00 +0000
Message-ID: <31ba7413-9e8c-8b40-5317-81e6414c0b0e@plushkava.net>
References: <a581ac40-f8ad-c009-4c83-40f1833b6ddb@gmx.net>
 <c81185d7-ff7c-9df7-c61d-29ed7c541e31@plushkava.net>
 <c88a5ed6-abcf-3318-363c-2e187d4bf533@gmx.net>
 <82365710-b3eb-e738-a181-9b18219cbbfe@plushkava.net>
 <452a8200-536c-4457-d6b5-4591c7781e48@gmx.net>
 <7cd325dd-e028-9b98-9b15-ddfdad3845bf@plushkava.net>
 <17defc0c-6d30-f098-99ca-7594cc63071d@gmx.net>
 <da48838e-d67d-13a0-c349-b51ca3c050a7@plushkava.net>
 <a27d6244-60a5-7b32-fcd9-bb0364f69224@gmx.net>
 <44ce1f43-7bc4-4f1c-c5d1-566a34483036@plushkava.net>
 <a12c778a-9c4a-bcea-e588-25db496f6bde@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=u
        CnNedIGFcIk7UumP03jrK0qDstn5MsuGDBF3eOzBl0=; b=HOi+ofXxc0mt8H7XG
        otSAI4UNL4wqbbZ6vaaaS/G4kMxF882AjFxJwI138CoDOp3vnf1/sxNBKewUTcrX
        m//Nt8BjhI62GObdHAdXfRs1eYNBDHhUxngWpAzVwHRbvgyYwd6zKdikbzWMH6N+
        LY5opJ3T+bP8e/PswjGMmFabRt8DwbgMLPqzw7+Z+nWEi2/AoyEWI4dz7WpDa9NO
        cg/ETaFi9wbMGMzYpoPQ/7Ea/2mxZqQKxNprUX2fl8h8cjX5faH8Yq4gMqAf3VrE
        P1mjLUG2Y7oJs2OzPaArdRWuurYkAMM5BumIacs6XMvoKyOflMLkvtjNmfhHlQ9y
        4ACFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=uCnNedIGFcIk7UumP03jrK0qDstn5MsuGDBF3eOzB
        l0=; b=Db2o8FPChCxmk9HQMOPjGnpi3u1iTqFCInRyRtdWU/xfhyxMnipL9HVrn
        lS3jws1YDhBqpm8bCDqZQpuMj+NhpikHlVf/3+7srJdhzC6zaum0twx4UmarAUxa
        ME+FUQlMwM3G1tXxZ1NDAywyGni/kZ7od9lr1E+ZITbpuYHwjNojHlzItWsNx9hT
        o69G+dl1DV1P210eUXHydbukXtQ3FCqmyubRWcEnv7IFdMAB8KsgaLV7Wav1nIEz
        O8LWX465FNKRe34vIECHtXvu8upsfmS00BhqkLlNNSY8usaQA1IpZVeUDU6GKd3t
        C48j+Hio0nveIUyTgyhkK02+xi4qg==
In-Reply-To: <a12c778a-9c4a-bcea-e588-25db496f6bde@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 13/02/2020 12:09, ѽ҉ᶬḳ℠ wrote:
> On 13/02/2020 11:59, kfm@plushkava.net wrote:
>> On 13/02/2020 11:41, ѽ҉ᶬḳ℠ wrote:
>>
>> <snip>
>>
>>> The current kernel deployed, which kconf is beyond my control, is 
>>> missing the flag to support sets and thus vmap. But that aside 
>>> something like this seems to work
>>>
>>> table inet filter {
>>>      chain input                { type filter hook input priority 0; 
>>> policy drop; iifname pppoe-wan jump wan_i; }
>>>      chain wan_i                { ip saddr 0.0.0.0/32 udp sport 67 ip 
>>> daddr 255.255.255.255/32 udp dport 68 accept; }
>>> }
>>
>> Indeed, vmap is by no means required. This is equivalent to the 
>> previously suggested input chain, only marginally less efficient:
>>
>> chain input {
>>   type filter hook input priority 0; policy drop;
>>   ct state established,related accept
>>   ct state invalid,untracked drop
>>   iifname "lo" accept
>>   iifname "pppoe-wan" goto wan_i
>>   iifname "eth0-lan" goto lan_i
>> }
>>
>> Note that goto is an optimisation. It would still be appropriate to 
>> use jump in the case that you need for the packet to be able to fall 
>> through one of the user-defined chains and return to the input chain 
>> in order to be subjected to other rules there. In this particular 
>> example, it is not possible for iifname to match "eth0-lan" if it did 
>> not already match "pppoe-wan" and, because there are no further rules 
>> in the input chain, the use of goto is fine.
> 
> Thanks for the hint/tip (and other input) - goto makes sense in this 
> case, saves CPU cycles (even if just a tiny bit - but why waste it anyway).

You are welcome. Also, mea culpa; "if it did not already match" should 
have been "if it already matched".

-- 
Kerin Millar
