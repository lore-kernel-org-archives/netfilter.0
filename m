From: Florian Westphal <fw@strlen.de>
Subject: Re: proper ICMPv6 syntax for specific daddr
Date: Wed, 7 Sep 2022 16:58:37 +0200
Message-ID: <20220907145837.GA20812@breakpoint.cc>
References: <dc512913-d28a-9224-ad5a-e68828975766@foscore.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dc512913-d28a-9224-ad5a-e68828975766@foscore.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom <tom@foscore.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Tom <tom@foscore.com> wrote:
> I can successfully enable ping for IPv6 using this rule:
> 
> nft add rule ip6 filter input ip6 nexthdr icmpv6 counter limit rate 5/second accept

This is not related to ping, this ratelimits ALL of icmpv6.

Please use 'icmpv6 type { echo-request, echo-reply}'.

> nft add rule ip6 filter input ip6 daddr xxxx:43:a:83::5 ip6 nexthdr icmpv6 counter limit rate 5/second accept
> nft add rule ip6 filter input ip6 daddr xxxx:43:a:83::6 ip6 nexthdr icmpv6 counter limit rate 5/second accept
> 
> ...but what happens is that the first IPv6 will work, but not the second. If I reverse the order, sometimes the second
> rule still works but now the first doesn't.  I've tried using sets like so:

icmpv6 is integral part of ipv6, the above will ratelimit neighbour
solicitations, pmtu updates and so on as well.
