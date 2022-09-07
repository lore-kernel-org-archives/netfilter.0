From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: proper ICMPv6 syntax for specific daddr
Date: Wed, 7 Sep 2022 17:25:52 +0200
Message-ID: <Yxi4APuir2m1mxUG@salvia>
References: <dc512913-d28a-9224-ad5a-e68828975766@foscore.com>
 <20220907145837.GA20812@breakpoint.cc>
 <b812fc63-36ed-e6af-9c70-d9d75ff05f14@foscore.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b812fc63-36ed-e6af-9c70-d9d75ff05f14@foscore.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom <tom@foscore.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

On Wed, Sep 07, 2022 at 11:22:24AM -0400, Tom wrote:
> On 2022-09-07 10:58, Florian Westphal wrote:
> > Tom <tom@foscore.com> wrote:
> > > nft add rule ip6 filter input ip6 nexthdr icmpv6 counter limit rate 5/second accept
> > This is not related to ping, this ratelimits ALL of icmpv6.
> > Please use 'icmpv6 type { echo-request, echo-reply}'.
> > icmpv6 is integral part of ipv6, the above will ratelimit neighbour
> > solicitations, pmtu updates and so on as well.
> 
> Ooh, that's not good. What about this, recommended by Pablo:
> 
> table ip6 filter {
> 	set ping6 {
> 		typeof ip6 daddr . meta l4proto
> 		limit rate 5/second
> 		elements = { xxxx:43:a:83::2 . ipv6-icmp limit rate 5/second,
> 			     xxxx:43:a:83::3 . ipv6-icmp limit rate 5/second,
> 			     xxxx:43:a:83::4 . ipv6-icmp limit rate 5/second }
> 	}
> 	chain input {
> 		type filter hook input priority filter; policy drop;
> 		ip6 daddr . meta l4proto @ping6 accept
> 	}
> 
> Is this OK?

My recommendation is to use concatenations and sets, not to ratelimit
_all_ icmpv6 traffic ;-)
