From: "" <kfm@plushkava.net>
Subject: Re: [nftables] frame rate limiting per day/minute not working (bug ?)
Date: Wed, 25 Nov 2020 10:48:26 +0000
Message-ID: <9d305192-a905-6b5f-1edc-344ce9812d00@plushkava.net>
References: <03028b1e-e7bb-d82a-3697-9783c5f57568@gmx.net>
 <5e427c03-0348-515e-4f35-94ad45faa444@plushkava.net>
 <11749704-064f-b8b6-bc93-e80f7b0a7ece@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=from:subject:to:references:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=m
        pLVz9Qi+v+ytAYFbTrjO/zhNPui6ebrl85FJlQx+bc=; b=RhefSXPqyK8x3BlgU
        LbReIHlF879muCevwTFo+h77NtpbhaBLl83HfR8qle6RJBjNu/UkdNNGIgGA9xSQ
        vyf1c9RAc0xHL1t+qbTh+LgAP3x1mkgd7Rnlkkrz1v0zBE2T30CuYxz4nKrt1HKL
        +Zh1CeZddl9UxlXlk9l9SXx9dpNwMV0l47COnh3PA31qEIelzbidzkaQNPiBnzYx
        z6oxReVGHopgYGj6JI5ngWFO+u3LfmtduH0kt3Q3zE+RdlIaCU8lIB0MzxE6/06I
        LWgRasOvfRrYfIEIAKAnxuucTZp8h+6hPxDwrPsriom7gjqBtkBVMD5LucIJdqtQ
        1F5LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=mpLVz9Qi+v+ytAYFbTrjO/zhNPui6ebrl85FJlQx+
        bc=; b=FCFIr1irYD3qSer7ry1C6zLE9JMArucoiVy8QN5w77ut6POKdCivZ9Ub2
        fnLj28zY2iqZS/A0JB+/DW9KSELanS9+3ChZRc2omGW0w18eIMgJPeVkqFC5OkDg
        83i7oPcU1lgWcdP/U7WXMFqbGjJ079DzoWQEcKK/OZRV2Gw7ByxEdfvojkjvwBIu
        PryOWVLekcRooM5sh8bGgjISaJbidOgQbrPOxYY5C4c/Mkb8HltASWFg9h2uSxso
        rdZ68uPaLNQFiimNqx8NE/vz5v9nMTCFTx24dgrUFX0YnQKYfQed3dHQ8cwIdG7j
        ngXQqSzFu717j8qg4bjD6lMKRW51Q==
In-Reply-To: <11749704-064f-b8b6-bc93-e80f7b0a7ece@gmx.net>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: vtol@gmx.net, netfilter@vger.kernel.org

On 24/11/2020 22:37, ѽ҉ᶬḳ℠ wrote:
> On 24/11/2020 23:08, kfm@plushkava.net wrote:
>> On 14/11/2020 12:29, ѽ҉ᶬḳ℠ wrote:
>>> host: armv7l GNU/Linux
>>> kernel: 5.10.0-rc3-next-20201113
>>> nftables: v0.9.6
>>> ______
>>>
>>> this rule in a > inet filter prerouting chain:
>>>
>>> icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over 2/day } 
>>> log flags all prefix "ping_ip4 from LAN > rate_limit_d DROP: " drop;
>>>
>>> Having tried different values, e.g.
>>>
>>> limit rate over 2/day
>>> limit rate over 44/day
>>> limit rate over 300/day
>>>
>>> frames # 1 -5 are always passing through but as of frame count # 6 
>>> the frames always being dropped, no matter the x/day value.
>>
>> That's probably because the default burst value is 5, not that anyone 
>> would know this by reading the nft documentation. The terse 
>> explanation of the limit module in iptables-extensions(8) applies but 
>> there is a better explanation to be found here:
>>
>> https://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWTO-7.html 
>>
>>
>> Given 2/day, the initial five tokens are being taken from the bucket, 
>> following which no token is added until 12 hours have elapsed. Try 
>> repeating your experiments with the burst value specified as 1.
>>
>> Documentation aside, it doesn't help that both iptables/xt_limit and 
>> nft/limit fail to report the burst value unless it was explicitly 
>> defined.
> 
> 
> Thank you for your valuable thoughts. I am not sure however that the 
> default bust limit is the cause here, for two reasons:

It explains the cause of the initial five packets being permitted before 
running up against any limit. Given 2 as a numerator, try with lower 
burst values.

Take "2/min burst 1 packets" as an example. The bucket will have a 
capacity of just one token and will be initialised with one upon loading 
the ruleset. The bucket will be topped up with one token every 30 
seconds, but never beyond its capacity. The result should be that one 
packet is allowed to pass at rigid 30 second intervals.

Specifying "2/min burst 2 packets" will result in the bucket being 
initialised with - and having a capacity of - two tokens. Within the 
first 30 second delta, it will be possible for two packets to pass 
before the limit applies. Still, the bucket is topped up at the same 
rate of one token every 30 seconds.

> 
> the outcome is the same with:
> 
> limit rate over 44/day

On average, this should allow for 44 a day by recharging the bucket at a 
rate of one token every 24/44*60 = 32.73 minutes.

> limit rate over 300/day

In this case, by recharging the bucket at a rate of one token every 4.8 
minutes. You would need to run your test case for at least that long to 
observe a difference and for at least 24 hours to prove whether or not 
the overall rate is maintained.

> 
> and should not be however. The other reason is that it should be the 
> same outcome with limit rate over X/minute but it is not

For the benefit of anyone investigating, could you define a test case 
that concretely demonstrates the problem?

> 
>>
>>>
>>>
>>> A somewhat inconsistent behaviour with x/minute value, e.g.
>>>
>>> icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over 
>>> 13/minute } log flags all prefix "ping_ip4 from LAN > rate_limit_d 
>>> DROP: " drop;
>>>
>>> produces on the client side:
>>>
>>> ping -4 -n 20 google.com
>>>
>>> Pinging google.com [216.58.208.110] with 32 bytes of data:
>>> Reply from 216.58.208.110: bytes=32 time=14ms TTL=114
>>> Reply from 216.58.208.110: bytes=32 time=15ms TTL=114
>>> Reply from 216.58.208.110: bytes=32 time=14ms TTL=114
>>> Reply from 216.58.208.110: bytes=32 time=18ms TTL=114
>>> Reply from 216.58.208.110: bytes=32 time=18ms TTL=114
>>> Reply from 216.58.208.110: bytes=32 time=13ms TTL=114
>>> Request timed out.
>>> Reply from 216.58.208.110: bytes=32 time=14ms TTL=114
>>> Request timed out.
>>> Reply from 216.58.208.110: bytes=32 time=16ms TTL=114
>>> Request timed out.
>>> Reply from 216.58.208.110: bytes=32 time=16ms TTL=114
>>> Reply from 216.58.208.110: bytes=32 time=13ms TTL=114
>>> Request timed out.
>>> Reply from 216.58.208.110: bytes=32 time=154ms TTL=114
>>> Request timed out.
>>> Reply from 216.58.208.110: bytes=32 time=32ms TTL=114
>>> Reply from 216.58.208.110: bytes=32 time=13ms TTL=114
>>> Request timed out.
>>> Reply from 216.58.208.110: bytes=32 time=14ms TTL=114
>>>
>>> Ping statistics for 216.58.208.110:
>>>      Packets: Sent = 20, Received = 14, Lost = 6 (30% loss),
>>> Approximate round trip times in milli-seconds:
>>>      Minimum = 13ms, Maximum = 154ms, Average = 26ms
>>>
>>>
>>> Whilst the count is matching the rule it is not clear why not all 13 
>>> initial frames are passing through consistently and the excess being 
>>> dropped consistently but instead the first being dropped is earlier?
>>>
>>>
>>
> 
> 

-- 
Kerin Millar
