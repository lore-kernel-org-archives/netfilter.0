From: "" <kfm@plushkava.net>
Subject: Re: [nftables] frame rate limiting per day/minute not working (bug ?)
Date: Tue, 24 Nov 2020 22:08:22 +0000
Message-ID: <5e427c03-0348-515e-4f35-94ad45faa444@plushkava.net>
References: <03028b1e-e7bb-d82a-3697-9783c5f57568@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=7
        iBOETdcSCtC8F4wsCgTDmRuyc/4urvUTSEFweGiOlA=; b=schiRdLk4aMjEMlhF
        x+EqHimpck9nplFnVmXGOE59s+ib7qB7oufnmnseYbfE7tWozu/iyqz170i+TOni
        jQo9aDIvQNK5kGY3tj3qeGav3mYF7LWQ0vElzomNUKTjqQ1VgUSaThz/QWiOskVj
        nddcp6n8lOE7rxZIoWTWBLWF4KNS0OA+c5E4JvxNfI7HOHOENi8ZmvSUVDHWDZcR
        buxMt5RVv585Gxks2gUJsG7xPJ1F2kWJcbFag8MOxlcDmdhlw/7L6wPsOZK3r9ho
        /FxhlWhrGGOV1BKELx8c1ckVK0ixXNzhlWngqsQDM2pt5D1YWWZKJyD+8OE6wXnf
        OUGxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=7iBOETdcSCtC8F4wsCgTDmRuyc/4urvUTSEFweGiO
        lA=; b=r1dVx/e4d8986sVUeAwnyFGnEpKlhJLnnofw6BULFQ8m7Akx19uslthoX
        JGhzSzs/xXuxAGXLdTtjkQ9oqlHZQF5hzQjWYV03pRwLmz4irlvCYrn1C4AneD6m
        pvT69JTq+w0Q4pAdnr3KYXxipl443lUIO4q1ohrB8iovNaIeyhTTwwGb1faJw2PW
        qAbkKXVMO6u0TZ1Z97W+wFIpuvXqB6hrIxydqQ+Vds019jWfmE+UpPuxRhll8B3w
        yiHlWqJZTbPul6WKBqPrWgGYzZ9cxtCw9AwGmZZXDDsiKxWbHauujmKBa7OPqLdb
        iDlQWBmwVqS1x+OEa/o0VAxL2aapg==
In-Reply-To: <03028b1e-e7bb-d82a-3697-9783c5f57568@gmx.net>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: vtol@gmx.net, netfilter@vger.kernel.org

On 14/11/2020 12:29, ѽ҉ᶬḳ℠ wrote:
> host: armv7l GNU/Linux
> kernel: 5.10.0-rc3-next-20201113
> nftables: v0.9.6
> ______
> 
> this rule in a > inet filter prerouting chain:
> 
> icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over 2/day } log 
> flags all prefix "ping_ip4 from LAN > rate_limit_d DROP: " drop;
> 
> Having tried different values, e.g.
> 
> limit rate over 2/day
> limit rate over 44/day
> limit rate over 300/day
> 
> frames # 1 -5 are always passing through but as of frame count # 6 the 
> frames always being dropped, no matter the x/day value.

That's probably because the default burst value is 5, not that anyone 
would know this by reading the nft documentation. The terse explanation 
of the limit module in iptables-extensions(8) applies but there is a 
better explanation to be found here:

https://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWTO-7.html

Given 2/day, the initial five tokens are being taken from the bucket, 
following which no token is added until 12 hours have elapsed. Try 
repeating your experiments with the burst value specified as 1.

Documentation aside, it doesn't help that both iptables/xt_limit and 
nft/limit fail to report the burst value unless it was explicitly defined.

> 
> 
> A somewhat inconsistent behaviour with x/minute value, e.g.
> 
> icmp type 8 add @b_sa4_lan_pinger { ip saddr limit rate over 13/minute } 
> log flags all prefix "ping_ip4 from LAN > rate_limit_d DROP: " drop;
> 
> produces on the client side:
> 
> ping -4 -n 20 google.com
> 
> Pinging google.com [216.58.208.110] with 32 bytes of data:
> Reply from 216.58.208.110: bytes=32 time=14ms TTL=114
> Reply from 216.58.208.110: bytes=32 time=15ms TTL=114
> Reply from 216.58.208.110: bytes=32 time=14ms TTL=114
> Reply from 216.58.208.110: bytes=32 time=18ms TTL=114
> Reply from 216.58.208.110: bytes=32 time=18ms TTL=114
> Reply from 216.58.208.110: bytes=32 time=13ms TTL=114
> Request timed out.
> Reply from 216.58.208.110: bytes=32 time=14ms TTL=114
> Request timed out.
> Reply from 216.58.208.110: bytes=32 time=16ms TTL=114
> Request timed out.
> Reply from 216.58.208.110: bytes=32 time=16ms TTL=114
> Reply from 216.58.208.110: bytes=32 time=13ms TTL=114
> Request timed out.
> Reply from 216.58.208.110: bytes=32 time=154ms TTL=114
> Request timed out.
> Reply from 216.58.208.110: bytes=32 time=32ms TTL=114
> Reply from 216.58.208.110: bytes=32 time=13ms TTL=114
> Request timed out.
> Reply from 216.58.208.110: bytes=32 time=14ms TTL=114
> 
> Ping statistics for 216.58.208.110:
>      Packets: Sent = 20, Received = 14, Lost = 6 (30% loss),
> Approximate round trip times in milli-seconds:
>      Minimum = 13ms, Maximum = 154ms, Average = 26ms
> 
> 
> Whilst the count is matching the rule it is not clear why not all 13 
> initial frames are passing through consistently and the excess being 
> dropped consistently but instead the first being dropped is earlier?
> 
> 

-- 
Kerin Millar
