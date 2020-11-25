From: "" <kfm@plushkava.net>
Subject: Re: [nftables] frame rate limiting per day/minute not working (bug ?)
Date: Wed, 25 Nov 2020 12:49:04 +0000
Message-ID: <b3ebe64c-00a4-13c9-6303-d39c678a0e71@plushkava.net>
References: <03028b1e-e7bb-d82a-3697-9783c5f57568@gmx.net>
 <5e427c03-0348-515e-4f35-94ad45faa444@plushkava.net>
 <11749704-064f-b8b6-bc93-e80f7b0a7ece@gmx.net>
 <9d305192-a905-6b5f-1edc-344ce9812d00@plushkava.net>
 <f2ebc34a-1e3d-b826-52cc-7eea79f0fe43@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=t
        uWLyvPJ+UBcGEsoLxIKQg67zrVY36GdDzOucfJ1hIM=; b=Bie0wabZ4ILU6VtaI
        jOR3ZAyUCQHDVwLerAoqEBcMAgPuzU4IJRfOjmC8QRJMcF4AXvx/inzCRDlccUBe
        1T3ZSNYgvxcSrhsUK2lpuCfjsOxNP7r2t6oZDg5wZ68FNZEpfWOH1Bt1LGAERvo4
        yxmZ6poJPfbG/XgSQ4q0YtNSxmBcI2nfblTZale9dSmYJ2zuNU183XsPwsM0Kx5Y
        H3S6juz9A0IXWO/DlisD3PySl88QTJK3Bmuk7QUi7tERI341RGH1Vw3MRIUphQ4W
        iLbpXo3u6DlWJxN+3DMnWko+iW3F4STM0R70lp7T/pj7Z2hNju0H7OfmZaTjFj4F
        2eiyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=tuWLyvPJ+UBcGEsoLxIKQg67zrVY36GdDzOucfJ1h
        IM=; b=qGGfGIdo4y9QN5wXCELrA/9jLXtkQ5e0/h2t/GbuQTXVmxUxbYsfDCJJC
        eB9FnmjwanJIOpRcuv86BvocO/xYEPbMg5Rvpv3v8p9YCTWWL0mtUTIOhbti6aCz
        JNF8IEtI7yfXAY8FiCp+8IznfnQL5pzl4eIzlaWJ+Wq6VoUoXwxYmXEzMd7qgcVf
        PYEP5kA9QFVvA++mJeOYOShmPdRJTD7ZeSbapGnvHqpFtqtVZG7BuvI3+7X14c99
        gpLxZZOPC0YfQewvQdz110izapCJ643/AW+mj0QBTUgK9lJelHu6J20T7500dJ3z
        2MIcB6oUgym0WkSaayAdo+L/fCj/Q==
In-Reply-To: <f2ebc34a-1e3d-b826-52cc-7eea79f0fe43@gmx.net>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: vtol@gmx.net, netfilter@vger.kernel.org

On 25/11/2020 11:23, ѽ҉ᶬḳ℠ wrote:
> 
> On 25/11/2020 11:48, kfm@plushkava.net wrote:
>> On 24/11/2020 22:37, ѽ҉ᶬḳ℠ wrote:
>>> On 24/11/2020 23:08, kfm@plushkava.net wrote:
>>>> On 14/11/2020 12:29, ѽ҉ᶬḳ℠ wrote:
>>>>> host: armv7l GNU/Linux
>>>>> kernel: 5.10.0-rc3-next-20201113
>>>>> nftables: v0.9.6
>>>>> ______
>>>>>
>>>>> this rule in a > inet filter prerouting chain:
>>>>>
>>>>> icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over 2/day 
>>>>> } log flags all prefix "ping_ip4 from LAN > rate_limit_d DROP: " drop;
>>>>>
>>>>> Having tried different values, e.g.
>>>>>
>>>>> limit rate over 2/day
>>>>> limit rate over 44/day
>>>>> limit rate over 300/day
>>>>>
>>>>> frames # 1 -5 are always passing through but as of frame count # 6 
>>>>> the frames always being dropped, no matter the x/day value.
>>>>
>>>> That's probably because the default burst value is 5, not that 
>>>> anyone would know this by reading the nft documentation. The terse 
>>>> explanation of the limit module in iptables-extensions(8) applies 
>>>> but there is a better explanation to be found here:
>>>>
>>>> https://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWTO-7.html 
>>>>
>>>>
>>>> Given 2/day, the initial five tokens are being taken from the 
>>>> bucket, following which no token is added until 12 hours have 
>>>> elapsed. Try repeating your experiments with the burst value 
>>>> specified as 1.
>>>>
>>>> Documentation aside, it doesn't help that both iptables/xt_limit and 
>>>> nft/limit fail to report the burst value unless it was explicitly 
>>>> defined.
>>>
>>>
>>> Thank you for your valuable thoughts. I am not sure however that the 
>>> default bust limit is the cause here, for two reasons:
>>
>> It explains the cause of the initial five packets being permitted 
>> before running up against any limit. Given 2 as a numerator, try with 
>> lower burst values.
>>
>> Take "2/min burst 1 packets" as an example. The bucket will have a 
>> capacity of just one token and will be initialised with one upon 
>> loading the ruleset. The bucket will be topped up with one token every 
>> 30 seconds, but never beyond its capacity. The result should be that 
>> one packet is allowed to pass at rigid 30 second intervals.
>>
>> Specifying "2/min burst 2 packets" will result in the bucket being 
>> initialised with - and having a capacity of - two tokens. Within the 
>> first 30 second delta, it will be possible for two packets to pass 
>> before the limit applies. Still, the bucket is topped up at the same 
>> rate of one token every 30 seconds.
>>
>>>
>>> the outcome is the same with:
>>>
>>> limit rate over 44/day
>>
>> On average, this should allow for 44 a day by recharging the bucket at 
>> a rate of one token every 24/44*60 = 32.73 minutes.
>>
>>> limit rate over 300/day
>>
>> In this case, by recharging the bucket at a rate of one token every 
>> 4.8 minutes. You would need to run your test case for at least that 
>> long to observe a difference and for at least 24 hours to prove 
>> whether or not the overall rate is maintained.
> 
> Thank you for the extensive explanation(s). To test your theory I 
> removed the default burst of 5 packets from the equation with:
> 
> limit rate over 300/day burst 0 packets

0 isn't a legal value. A token bucket must have a capacity of at least 
1. A bucket with no capacity would be no bucket at all. I would prefer 
for the parser to reject this. Instead, the value is disregarded, 
resulting in the default of 5.

> 
> In which case I would expect the bucket credit of 300 to be burned prior 

The credit is 5, not 300, and will never be any higher, unless you 
define a legal burst value to that end. Effectively, 300/day defines the 
top-up rate. Keep in mind that 300/day is the very definition of a rate. 
It is not merely an upper bound, unlike the burst value.

> rejecting frame #301 from the source, however the frames are being

To be able to burn through as many as 300 before even the first 4.8 
minutes has elapsed, you would have to define a burst value of 300 packets.

> dropped as of frame count #6:

This is the point at which the initial five tokens have been drained. It 
does not prove that the defined rate isn't maintained over the course of 
one day (your chosen denominator).

> 
> # ping -6 -n 20 fd30:d64c:1eed:4c3a::12
> 
> Pinging fd30:d64c:1eed:4c3a::12 with 32 bytes of data:
> Reply from fd30:d64c:1eed:4c3a::12: time=1ms
> Reply from fd30:d64c:1eed:4c3a::12: time=2ms
> Reply from fd30:d64c:1eed:4c3a::12: time=1ms
> Reply from fd30:d64c:1eed:4c3a::12: time=1ms
> Reply from fd30:d64c:1eed:4c3a::12: time=1ms
> Request timed out > Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> 
> Ping statistics for fd30:d64c:1eed:4c3a::12:
>      Packets: Sent = 20, Received = 5, Lost = 15 (75% loss),
> Approximate round trip times in milli-seconds:
>      Minimum = 1ms, Maximum = 2ms, Average = 1ms


> 
> ---------------
> 
> Then adjusted to:
> 
> limit rate over 300/day burst 10 packets:
> 
> # ping -6 -n 20 fd30:d64c:1eed:4c3a::12
> 
> Pinging fd30:d64c:1eed:4c3a::12 with 32 bytes of data:
> Reply from fd30:d64c:1eed:4c3a::12: time=4ms
> Reply from fd30:d64c:1eed:4c3a::12: time=1ms
> Reply from fd30:d64c:1eed:4c3a::12: time=1ms
> Reply from fd30:d64c:1eed:4c3a::12: time=2ms
> Reply from fd30:d64c:1eed:4c3a::12: time=2ms
> Reply from fd30:d64c:1eed:4c3a::12: time=1ms
> Reply from fd30:d64c:1eed:4c3a::12: time=1ms
> Reply from fd30:d64c:1eed:4c3a::12: time=3ms
> Reply from fd30:d64c:1eed:4c3a::12: time=2ms
> Reply from fd30:d64c:1eed:4c3a::12: time=2ms
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.
> Request timed out.

To burn through as many as 20 before the first 4.8 minutes has elapsed, 
you would have to define a burst value of 20 packets.

> 
> Ping statistics for fd30:d64c:1eed:4c3a::12:
>      Packets: Sent = 20, Received = 10, Lost = 10 (50% loss),
> Approximate round trip times in milli-seconds:
>      Minimum = 1ms, Maximum = 4ms, Average = 1ms
> 
> 
> Now 10 frames being passed through (matching the burst value) but as of 
> count # 11 being dropped.
> 
> 
> This seems to be indicative of:
> 
> * burst value below the default (of 5) being disregarded entirely

Only 0, because it would be impossible to honour. I'll file a bug 
requesting that it be treated as fatal by the parser.

> * limit rate over X/day being disregarded and only the burst token applied.

It doesn't prove any such thing. Your test case ran for little more than 
20 seconds, which is not enough time for the bucket to have acquired a 
new token having been drained. At the very least, please conduct your 
test for 2 x 4.8 minutes.

-- 
Kerin Millar

