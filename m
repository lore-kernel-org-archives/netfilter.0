From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Fwd: proper ICMPv6 syntax for specific daddr
Date: Thu, 8 Sep 2022 17:54:45 +0200
Message-ID: <YxoQRUnq2sA+hl0x@salvia>
References: <dea61421-4ce1-bb68-2a74-88b6f42c299e@foscore.com>
 <22a53086-4479-c142-6415-06e1e42ebeca@foscore.com>
 <YxoGhE3IGFzehyo0@salvia>
 <59f82048-3991-2c4e-515b-4bccb24cdb98@foscore.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <59f82048-3991-2c4e-515b-4bccb24cdb98@foscore.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom <tom@foscore.com>
Cc: netfilter@vger.kernel.org

On Thu, Sep 08, 2022 at 11:43:01AM -0400, Tom wrote:
> On 2022-09-08 11:13, Pablo Neira Ayuso wrote:
> > you removed the limit line in the set declaration ?
> 
> Yes, after I failed to get the right syntax to combine it with the ICMP type.
> 
> > If you would like to throttle icmpv6 echo-request, the::
> > 
> > table ip6 filter {
> >          set ping6 {
> >                  typeof ip6 daddr . icmpv6 type
> >                  limit rate 5/second
> >                  elements = { aaaa:43:a:83::2 . echo-request,
> >                               aaaa:43:a:83::3 . echo-request,
> >                               aaaa:43:a:83::4 . echo-request }
> >          }
> >          chain input {
> >                  type filter hook input priority filter; policy drop;
> >                  ip6 daddr . icmpv6 type @ping6 accept
> >          }
> > }
> 
> Thanks. I wouldn't have found that syntax in a quintillion years.

It was the same as the example I posted, I just replaced 'meta l4proto' by
'icmpv6 type' ;-)

> > Please, see the wiki for more examples on concatenations and sets/maps.
> 
> I've gone through it. As someone who's been programming and
> configuring computers for over forty years, I can tell you that the
> wiki documentation is not good. It seems to be written by and for
> nft developers.

Documentation can always be improved, it got better over time. We have
a good number of contributors that are not developers.
