From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables] netdev rate limiting | timeouts rfq
Date: Mon, 28 Sep 2020 19:01:36 +0200
Message-ID: <20200928170136.GA4278@salvia>
References: <20200923083042.GB10267@salvia>
 <cd739cba-9f79-2669-b5cb-e504e851c49d@gmx.net>
 <20200928115210.GA21841@salvia>
 <f536fd2e-a9f2-730a-d2ae-0579ccb3b48d@gmx.net>
 <20200928122443.GA24572@salvia>
 <c9a8646f-69b6-7333-b7ed-74f3d9747665@gmx.net>
 <20200928154339.GA2605@salvia>
 <aca6a166-d5be-3d3c-536e-116f1aa65249@gmx.net>
 <20200928162307.GA3343@salvia>
 <1d252cae-37cc-f457-932c-2c1ada59e2a0@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1d252cae-37cc-f457-932c-2c1ada59e2a0@gmx.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: netfilter@vger.kernel.org

On Mon, Sep 28, 2020 at 04:47:00PM +0000, ѽ҉ᶬḳ℠ wrote:
> To get a flexible evaluation period for the count value:
> 
> * ct state { new , invalid } update @glv4 { ip saddr ct count over 50 
> timeout 1s } log flags all prefix "glv4 DROP: " drop
> 
> update set element for any saddr that exceeds the count of 50 within 1 s for
> ct state new | invalid
> 
> 
> * ct state { new , invalid } update @glv4 { ip saddr ct count over 75 
> timeout 1s } log flags all prefix "glv4 DROP: " drop
> 
> update set element for any saddr that exceeds the count of 75 within 1 h for
> ct state new | invalid
> 
> 
> * ct state { new , invalid } update @glv4 { ip saddr ct count over 75 
> timeout 1s } log flags all prefix "glv4 DROP: " drop
> 
> update set element for any saddr that exceeds the count of 150 within 1 d
> for ct state new | invalid

Thanks, these are looking better, although still not correct.

Two issues:

* 'ct count' relies on the connection tracking table. This is counting
  the number of existing connections in this table according to your
  key, ie. ip saddr. You do not have to specify timeouts here because
  it is the connection tracking time that governs when the conntrack
  entries expire.

* You have to use 'add' instead of 'update'. Update makes sense to
  refresh timeouts when they are in place, but there is no timeouts in
  this case.

Therefore, make sure you define the dynamic set with not timeouts at
all when combining this with ct count.

Using 'update' in your rule with ct count and/or 'timeout' in your set
definition will make you hit "Operation not supported".

Error reporting will get better sooner or later to provide more hints
on why this makes no sense, meanwhile, documentation will probably
help fill the gap.
