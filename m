From: Tom <tom@foscore.com>
Subject: Fwd: proper ICMPv6 syntax for specific daddr
Date: Wed, 7 Sep 2022 11:57:16 -0400
Message-ID: <22a53086-4479-c142-6415-06e1e42ebeca@foscore.com>
References: <dea61421-4ce1-bb68-2a74-88b6f42c299e@foscore.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foscore.com;
        s=deliv; t=1662566238;
        bh=WOaXigZBbNTqjEPUIjPmZbjRPcKEY5aqpeLt6MCLRec=;
        h=Date:Subject:References:To:From:In-Reply-To:From;
        b=jbwrCF3QDX4NKi/z/UgYzMVJDbYvLJRvvc6PEX7SPObWj3AjuulOmRXKCnd31Q8Wo
         VTBtLRQ4cl44VxXpU9DUvr5eExbNXavwUXzUNPnyw3DQeTcERwxMM/9nAz96OIkwLY
         GbNPOcoyBDkhqL9n7R039K3Q8Pk/wY4Q3Hy8beVo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foscore.com;
        s=deliv; t=1662566236;
        bh=WOaXigZBbNTqjEPUIjPmZbjRPcKEY5aqpeLt6MCLRec=;
        h=Date:Subject:References:To:From:In-Reply-To:From;
        b=A1/Cjo8Aap17hIpfrKAPE6hJFfDY90tJevun3KNRtOdFc0qGnioy4KJQYUPpIV3zr
         AgPfkvnAnw4R1A/FFLU54w1TMCPwy1Re6vxhXRjqkydfi2GAl21QQr271bPl8Ij8t6
         tm0n4kZH1KtuyrCnjZn+tTpHnPGCyQ+kUiX2FqF8=
Content-Language: en-US
In-Reply-To: <dea61421-4ce1-bb68-2a74-88b6f42c299e@foscore.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 2022-09-07 11:25, Pablo Neira Ayuso wrote:
> On Wed, Sep 07, 2022 at 11:22:24AM -0400, Tom wrote:
>> table ip6 filter {
>> 	set ping6 {
>> 		typeof ip6 daddr . meta l4proto
>> 		limit rate 5/second
>> 		elements = { xxxx:43:a:83::2 . ipv6-icmp limit rate 5/second,
>> 			     xxxx:43:a:83::3 . ipv6-icmp limit rate 5/second,
>> 			     xxxx:43:a:83::4 . ipv6-icmp limit rate 5/second }
>> 	}
>> 	chain input {
>> 		type filter hook input priority filter; policy drop;
>> 		ip6 daddr . meta l4proto @ping6 accept
>> 	}
>>
>> Is this OK?
> 
> My recommendation is to use concatenations and sets, not to ratelimit
> _all_ icmpv6 traffic ;-)

Now I'm confused. I'd like to avoid ping floods if possible, but I can't seem to get the syntax right, so:
table ip6 filter {
	set ping6 {
		typeof ip6 daddr . meta l4proto
		elements = { xxxx:43:a:83::2 . ipv6-icmp,
			     xxxx:43:a:83::3 . ipv6-icmp,
			     xxxx:43:a:83::4 . ipv6-icmp }
	}
	chain input {
		type filter hook input priority filter; policy drop;
		ip6 daddr . meta l4proto @ping6 accept
	}
}

... will work for now. If anyone can show me the correct syntax to enable ping6 rate limiting without crippling icmpv6, please do!
