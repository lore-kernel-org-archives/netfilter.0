From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Fwd: proper ICMPv6 syntax for specific daddr
Date: Thu, 8 Sep 2022 17:13:08 +0200
Message-ID: <YxoGhE3IGFzehyo0@salvia>
References: <dea61421-4ce1-bb68-2a74-88b6f42c299e@foscore.com>
 <22a53086-4479-c142-6415-06e1e42ebeca@foscore.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <22a53086-4479-c142-6415-06e1e42ebeca@foscore.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom <tom@foscore.com>
Cc: netfilter@vger.kernel.org

On Wed, Sep 07, 2022 at 11:57:16AM -0400, Tom wrote:
> On 2022-09-07 11:25, Pablo Neira Ayuso wrote:
> > On Wed, Sep 07, 2022 at 11:22:24AM -0400, Tom wrote:
> > > table ip6 filter {
> > > 	set ping6 {
> > > 		typeof ip6 daddr . meta l4proto
> > > 		limit rate 5/second
> > > 		elements = { xxxx:43:a:83::2 . ipv6-icmp limit rate 5/second,
> > > 			     xxxx:43:a:83::3 . ipv6-icmp limit rate 5/second,
> > > 			     xxxx:43:a:83::4 . ipv6-icmp limit rate 5/second }
> > > 	}
> > > 	chain input {
> > > 		type filter hook input priority filter; policy drop;
> > > 		ip6 daddr . meta l4proto @ping6 accept
> > > 	}
> > > 
> > > Is this OK?
> > 
> > My recommendation is to use concatenations and sets, not to ratelimit
> > _all_ icmpv6 traffic ;-)
> 
> Now I'm confused. I'd like to avoid ping floods if possible, but I can't seem to get the syntax right, so:
> table ip6 filter {
> 	set ping6 {
> 		typeof ip6 daddr . meta l4proto

you removed the limit line in the set declaration ?

> 		elements = { xxxx:43:a:83::2 . ipv6-icmp,
> 			     xxxx:43:a:83::3 . ipv6-icmp,
> 			     xxxx:43:a:83::4 . ipv6-icmp }
> 	}
> 	chain input {
> 		type filter hook input priority filter; policy drop;
> 		ip6 daddr . meta l4proto @ping6 accept
> 	}
> }

If you would like to throttle icmpv6 echo-request, the::

table ip6 filter {
        set ping6 {
                typeof ip6 daddr . icmpv6 type
                limit rate 5/second
                elements = { aaaa:43:a:83::2 . echo-request,
                             aaaa:43:a:83::3 . echo-request,
                             aaaa:43:a:83::4 . echo-request }
        }
        chain input {
                type filter hook input priority filter; policy drop;
                ip6 daddr . icmpv6 type @ping6 accept
        }
}

Please, see the wiki for more examples on concatenations and sets/maps.
