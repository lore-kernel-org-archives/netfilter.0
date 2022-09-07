From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: proper ICMPv6 syntax for specific daddr
Date: Wed, 7 Sep 2022 16:39:48 +0200
Message-ID: <YxitNE+Csp6f9n/N@salvia>
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

On Wed, Sep 07, 2022 at 10:10:41AM -0400, Tom wrote:
> I can successfully enable ping for IPv6 using this rule:
> 
> nft add rule ip6 filter input ip6 nexthdr icmpv6 counter limit rate 5/second accept
> 
> I have one physical ethernet card which is assigned five IPv6 addresses.
> What I want to do is enable it for only 2 of 5 IPv6 addresses, like so:
> 
> nft add rule ip6 filter input ip6 daddr xxxx:43:a:83::5 ip6 nexthdr icmpv6 counter limit rate 5/second accept
> nft add rule ip6 filter input ip6 daddr xxxx:43:a:83::6 ip6 nexthdr icmpv6 counter limit rate 5/second accept

Please, don't use "ip6 nexthdr", this strictly means "check for the
IPv6 nexthdr field of the IPv6 header", which is not what you might
need. See:

https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_headers#Matching_IPv6_headers

Instead, use "meta l4proto" which already parses the IPv6 extension
headers up to the layer 4 header.

> ...but what happens is that the first IPv6 will work, but not the second. If I reverse the order, sometimes the second
> rule still works but now the first doesn't.  I've tried using sets like so:
> 
> nft add rule ip6 filter input ip6 daddr @trusted ip6 nexthdr icmpv6 counter limit rate 5/second accept
> nft add rule ip6 filter input ip6 daddr @admin ip6 nexthdr icmpv6 counter limit rate 5/second accept

OK, this is using sets, but still looking like iptables+ipset.

Better use concatenations and sets:

table ip6 x {
        set y {
                typeof ip6 daddr . meta l4proto
                limit rate 5/second
                elements = { aaaa:43:a:83::5 . icmpv6 limit rate 5/second,
                             aaaa:43:a:83::6 . icmpv6 limit rate 5/second }
        }

        chain m {
                type filter hook prerouting priority filter; policy drop;
                ip6 daddr . meta l4proto @y accept
        }
}

Probably, nft -o/--optimize might offer more of these transformations
in the future.
