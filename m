From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables] sets update concatenation?
Date: Sat, 26 Sep 2020 20:21:45 +0200
Message-ID: <20200926182145.GA3628@salvia>
References: <a629ba84-7c4e-3663-3516-9176d3223965@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a629ba84-7c4e-3663-3516-9176d3223965@gmx.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, Sep 25, 2020 at 07:10:00PM +0000, ѽ҉ᶬḳ℠ wrote:
> Been trying to concatenate sets update:
> 
> tcp dport @b_t update @b_sa4 { ip saddr } drop;
> tcp dport @b_t update @b_sa6 { ip6 saddr } drop;
> 
> with:
> 
> tcp dport @b_t update @b_sa4 . @b_sa4 { ip saddr . ip6 saddr } drop;

What's the intention here?

> but that did not work out. Is somehow possible to concatenate sets update?

Yes, you can do:

tcp dport @b_t update @b_sa4 { ip saddr . ip6 saddr } drop

You can update one single set at a time. Not sure what you expect from
this concatenating sets instead of keys.
