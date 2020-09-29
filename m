From: Florian Westphal <fw@strlen.de>
Subject: Re: [nftables] icmp type rate limiting - cumulative for the daddr or
 selectively per saddr?
Date: Tue, 29 Sep 2020 16:46:27 +0200
Message-ID: <20200929144627.GB20140@breakpoint.cc>
References: <407b6fc3-1986-6453-9f68-a066b3ad1974@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <407b6fc3-1986-6453-9f68-a066b3ad1974@gmx.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> https://wiki.nftables.org/wiki-nftables/index.php/Rate_limiting_matchings is
> not clear whether the 'limit rate' stanza applies as:
> 
> * cummulutive limit (from any/all saddr) for the daddr within the given
> period

Its always the same, limit has no internal state other than the rate
bucket.

In all these examples the limit applies for every packet that makes
it to the limit expression.

So, f.e.:
nft add rule filter input icmp type echo-request limit rate 10/second
accept

applies the limit to each icmp echo request.

> If it is a cummulutive limit how to go about a limit per saddr? For example:
> 
> icmpv6 type 128 ip6 saddr limit rate over 15/second burst 3 packets drop
> 
> or
> 
> icmpv6 type 128 { ip6 saddr limit rate over 15/second burst 3 packets } drop
> 
> producing:
> 
> Error: syntax error, unexpected saddr, expecting comma or '}'

Yes, you need to use a dynamic set for this, because the 'limit'
expression has the be kept per set entry.

Example (using older meter syntax):
nft add rule ip6 filter input icmpv6 type 128 meter icmp6limit '{ ip6 saddr limit rate over 15/second burst 3 packets } drop'

This adds a set, adds a 'limit rate' object for every ip6 saddr that
gets added to the set.

Since this needs to insert new entries, you might want to limit size and
forget old entries:

nft add rule ip6 filter input icmpv6 type 128 meter icmp6limit size 8192 '{ ip6 saddr timeout 1m limit rate over 15/second burst 3 packets } drop'

