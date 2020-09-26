From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables] sets update concatenation?
Date: Sat, 26 Sep 2020 21:07:54 +0200
Message-ID: <20200926190754.GA3748@salvia>
References: <a629ba84-7c4e-3663-3516-9176d3223965@gmx.net>
 <20200926182145.GA3628@salvia>
 <3fcc0be7-b4f8-c17e-96bb-8cef53f375c5@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3fcc0be7-b4f8-c17e-96bb-8cef53f375c5@gmx.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sat, Sep 26, 2020 at 06:44:00PM +0000, ѽ҉ᶬḳ℠ wrote:
> 
> On 26/09/2020 20:21, Pablo Neira Ayuso wrote:
> > On Fri, Sep 25, 2020 at 07:10:00PM +0000, ѽ҉ᶬḳ℠ wrote:
> > > Been trying to concatenate sets update:
> > > 
> > > tcp dport @b_t update @b_sa4 { ip saddr } drop;
> > > tcp dport @b_t update @b_sa6 { ip6 saddr } drop;
> > > 
> > > with:
> > > 
> > > tcp dport @b_t update @b_sa4 . @b_sa4 { ip saddr . ip6 saddr } drop;
> > What's the intention here?
> > 
> > > but that did not work out. Is somehow possible to concatenate sets update?
> > Yes, you can do:
> > 
> > tcp dport @b_t update @b_sa4 { ip saddr . ip6 saddr } drop
> > 
> > You can update one single set at a time. Not sure what you expect from
> > this concatenating sets instead of keys.
> 
> The two mentioned sets are dynamic, learning ip | ip6 saddrs from hits on
> tcp dport.
> 
> The intended concatenation was to put it into one rule instead of two, like
> if ip saddr then update element in set @b_sa4 and if ip6 saddr then update
> element in set @b_sa6 respectively.

So you would like to consolidate:

 tcp dport @b_t update @b_sa4 { ip saddr } drop
 tcp dport @b_t update @b_sa6 { ip6 saddr } drop

In one single rule?

Something like (hypothetical syntax)

 tcp dport @b_t update @b_sa { inet saddr } drop

where b_sa is a set with something like type inet_addr.
