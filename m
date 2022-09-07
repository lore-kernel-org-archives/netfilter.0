From: Tom <tom@foscore.com>
Subject: Re: proper ICMPv6 syntax for specific daddr
Date: Wed, 7 Sep 2022 11:22:24 -0400
Message-ID: <b812fc63-36ed-e6af-9c70-d9d75ff05f14@foscore.com>
References: <dc512913-d28a-9224-ad5a-e68828975766@foscore.com>
 <20220907145837.GA20812@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foscore.com;
        s=deliv; t=1662564146;
        bh=LlNKPOV6gNHUM5Y6w3CnfqjhYkUtQT8TyiWSvZHG028=;
        h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
        b=IgAxE0bGwUM3c8EcoaBsQK1A8D0MRYDqJmGcdftk1CNft0FiLXAMn+OWOLCI0Qwlm
         3rMaCfeDNVFBbrQZTjamYBcTiVvIKAwv+FjZ6NkHedHSD8jE/aQR9LoOF8PhwJ+5mU
         aBZByZ9d3M5ccLfzwleTx4Jmi+8tApcF1TQOXLic=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foscore.com;
        s=deliv; t=1662564144;
        bh=LlNKPOV6gNHUM5Y6w3CnfqjhYkUtQT8TyiWSvZHG028=;
        h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
        b=u9he0Be1RQTQNknHq/OB2wc+xKNFMCNdhlukimgsgUEXpC1T2ovK33SmSdmcJ6Vmu
         bEwx7BICHSxsVCSvMxzj83s47fdCjXCl04Ux+gb/Qo2VY+3LlSZu0HhL9qEmpqyBqc
         VYszFQCRwYwOoPfogLp2eYmBAJVMs86UxgA5r3YA=
Content-Language: en-US
In-Reply-To: <20220907145837.GA20812@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

On 2022-09-07 10:58, Florian Westphal wrote:
> Tom <tom@foscore.com> wrote:
>> nft add rule ip6 filter input ip6 nexthdr icmpv6 counter limit rate 5/second accept
> This is not related to ping, this ratelimits ALL of icmpv6.
> Please use 'icmpv6 type { echo-request, echo-reply}'.
> icmpv6 is integral part of ipv6, the above will ratelimit neighbour
> solicitations, pmtu updates and so on as well.

Ooh, that's not good. What about this, recommended by Pablo:

table ip6 filter {
	set ping6 {
		typeof ip6 daddr . meta l4proto
		limit rate 5/second
		elements = { xxxx:43:a:83::2 . ipv6-icmp limit rate 5/second,
			     xxxx:43:a:83::3 . ipv6-icmp limit rate 5/second,
			     xxxx:43:a:83::4 . ipv6-icmp limit rate 5/second }
	}
	chain input {
		type filter hook input priority filter; policy drop;
		ip6 daddr . meta l4proto @ping6 accept
	}

Is this OK?
