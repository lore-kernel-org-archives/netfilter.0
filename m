From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables] icmp type rate limiting - cumulative for the daddr or
 selectively per saddr?
Date: Tue, 29 Sep 2020 16:52:15 +0200
Message-ID: <20200929145215.GA12225@salvia>
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

On Tue, Sep 29, 2020 at 01:39:00PM +0000, ѽ҉ᶬḳ℠ wrote:
> https://wiki.nftables.org/wiki-nftables/index.php/Rate_limiting_matchings is
> not clear whether the 'limit rate' stanza applies as:
>
> * cummulutive limit (from any/all saddr) for the daddr within the given
> period
> 
> or
> 
> * assumes/implies limit selectively for each saddr within the given period
> 
> If it is a cummulutive limit how to go about a limit per saddr? For example:
> 
> icmpv6 type 128 ip6 saddr limit rate over 15/second burst 3 packets drop
> 
> or
> 
> icmpv6 type 128 { ip6 saddr limit rate over 15/second burst 3 packets } drop

This syntax is not correct.

Yesterday, you posted an example to combine limit rate with dynamic
sets which might be what you need.

Additionally, if you know how to use iptables, please have a look at
iptables -m limit, it's equivalent.
