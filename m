From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables] netdev rate limiting | timeouts rfq
Date: Mon, 28 Sep 2020 19:56:11 +0200
Message-ID: <20200928175611.GA23901@salvia>
References: <20200928115210.GA21841@salvia>
 <f536fd2e-a9f2-730a-d2ae-0579ccb3b48d@gmx.net>
 <20200928122443.GA24572@salvia>
 <c9a8646f-69b6-7333-b7ed-74f3d9747665@gmx.net>
 <20200928154339.GA2605@salvia>
 <aca6a166-d5be-3d3c-536e-116f1aa65249@gmx.net>
 <20200928162307.GA3343@salvia>
 <1d252cae-37cc-f457-932c-2c1ada59e2a0@gmx.net>
 <20200928170136.GA4278@salvia>
 <0989cfd6-7966-d1eb-8103-b9d6902b40c0@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0989cfd6-7966-d1eb-8103-b9d6902b40c0@gmx.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: netfilter@vger.kernel.org

On Mon, Sep 28, 2020 at 05:38:00PM +0000, ѽ҉ᶬḳ℠ wrote:
> On 28/09/2020 19:01, Pablo Neira Ayuso wrote:
> > On Mon, Sep 28, 2020 at 04:47:00PM +0000, ѽ҉ᶬḳ℠ wrote:
> > > To get a flexible evaluation period for the count value:
> > > 
> > > * ct state { new , invalid } update @glv4 { ip saddr ct count over 50
> > > timeout 1s } log flags all prefix "glv4 DROP: " drop
> > > 
> > > update set element for any saddr that exceeds the count of 50 within 1 s for
> > > ct state new | invalid
> > > 
> > > 
> > > * ct state { new , invalid } update @glv4 { ip saddr ct count over 75
> > > timeout 1s } log flags all prefix "glv4 DROP: " drop
> > > 
> > > update set element for any saddr that exceeds the count of 75 within 1 h for
> > > ct state new | invalid
> > > 
> > > 
> > > * ct state { new , invalid } update @glv4 { ip saddr ct count over 75
> > > timeout 1s } log flags all prefix "glv4 DROP: " drop
> > > 
> > > update set element for any saddr that exceeds the count of 150 within 1 d
> > > for ct state new | invalid
> > Thanks, these are looking better, although still not correct.
> > 
> > Two issues:
> > 
> > * 'ct count' relies on the connection tracking table. This is counting
> >    the number of existing connections in this table according to your
> >    key, ie. ip saddr. You do not have to specify timeouts here because
> >    it is the connection tracking time that governs when the conntrack
> >    entries expire.
> 
> suppose those are stipulated in net.netfilter.nf_conntrack_[proto]_timeout ?
> 
> This is a bit inflexible though, an offender might not probe within such
> conntrack stipulated timeout but say in infrequent intervals, one would have
> to stipulate a count of 1 to catch such saddr at any given time (conntrack 
> timeout), which would be fine for ct state new but could lead to some false
> positive with ct state invalid.
> 
> Moreover, if not specifying a timeout for the set then how is the saddr
> element going to be removed ever? As far as I comprehend there are two
> parameters (whichever yields first) for elements being purged (save for
> manual purging)  from a set:
> 
> * size - if exceeded oldest elements being purged first
> 
> or
> 
> * timeout - if counted down to zero element being purged.
> 
> With no timeout in the set elements may live forever, which is not really
> wanted for a dynamic sort of set.

That's not how it works: ct count implements a garbage collector to
purge old list of connections whose key is ip saddr.

http://workshop.netfilter.org/2018/wiki/images/2/23/Connlimit.pdf

The connection tracking table entries are released once they expire.
Connection in TIME_WAIT and CLOSE state are already assumed to be
close, hence not being counted.

> > * You have to use 'add' instead of 'update'. Update makes sense to
> >    refresh timeouts when they are in place, but there is no timeouts in
> >    this case.
> > 
> > Therefore, make sure you define the dynamic set with not timeouts at
> > all when combining this with ct count.
> > 
> > Using 'update' in your rule with ct count and/or 'timeout' in your set
> > definition will make you hit "Operation not supported".
> 
> Having the set then as:
> 
>   set glv4 {
>     type ipv4_addr
>     size 65535
>     flags dynamic
>     counter
>   }
> 
> and the rule in pre-routing chain
> 
> ct state new add @glv4 { ip saddr ct count over 25 }
> 
> and still been hitting:
> 
>  Error: Could not process rule: Not supported
> 
> until removed 'counter' from the set, then reading
> 
>   set glv4 {
>     type ipv4_addr
>     size 65535
>     flags dynamic
>   }

The counter is a stateful expression and ct count is also a stateful
expression too.

You can only use one single stateful expression per set set element at
this stage.
