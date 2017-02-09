From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: (whoops) Re: BUG: nft cannot "list ruleset" with interval maps
Date: Thu, 9 Feb 2017 11:46:02 +0100
Message-ID: <20170209104602.GA1810@salvia>
References: <f6c01a5c-33f4-0c90-96e1-8abf7777b4b8@pobox.com>
 <20170208172815.GA28759@salvia>
 <0b1028f0-e474-4938-6d3f-ae7f7ec0049a@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0b1028f0-e474-4938-6d3f-ae7f7ec0049a@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert White <rwhite@pobox.com>
Cc: netfilter@vger.kernel.org

On Thu, Feb 09, 2017 at 12:24:24AM +0000, Robert White wrote:
> On 02/08/17 17:28, Pablo Neira Ayuso wrote:
> >On Wed, Feb 08, 2017 at 05:00:18PM +0000, Robert White wrote:
> >>(please forgive stupid email word wrap)
> >>
> >># nft table ip nat
> >># nft map nat dnat_example { type inet_service: ipv4_addr\; flags interval
> >>\; }
> >># nft element nat dnat_example { 3476-3480 : 192.168.14.12 }
> >># nft list ruleset
> >>table ip nat {
> >>	map dnat_example {
> >>		type inet_service : ipv4_addr
> >>		flags interval
> >>nft: mini-gmp.c:4311: mpz_export: Assertion `size > 0 || u->_mp_size == 0'
> >>failed.
> >>		elements = { 3476-Aborted
> >>
> >>So the entry seems to have gotten in alright but it can't come back out
> >>normally. I can tell because a "export json" works
> >>
> >># nft export json
> >>{"nftables":[{"table":{"name":"nat","family":"ip","flags":0,"use":1}},{"set":{"name":"dnat_example","table":"nat","flags":12,"family":"ip","key_type":13,"key_len":2,"data_type":7,"data_len":4,"set_elem":[{"flags":1,"key":{"reg":{"type":"value","len":2,"data0":"0x0000990d"}}},{"key":{"reg":{"type":"value","len":2,"data0":"0x0000940d"}},"data":{"reg":{"type":"value","len":4,"data0":"0x0c0ea8c0"}}},{"flags":1,"key":{"reg":{"type":"value","len":2,"data0":"0x00000000"}}}]}}]}
> >>
> >>
> >>NOTE: interval sets work fine:
> >>
> >># nft list ruleset
> >>table ip nat {
> >>	set portrange {
> >>		type inet_service
> >>		flags interval
> >>		elements = { 3776-3780}
> >>	}
> >>}
> >
> >What nft version are you using? This works fine with nft git
> >snapshots. Please, give it a try and confirm.
> >
> >Thanks.
> >
> 
> Missed something.
> 
> With 0.7 and without --with-mini-gmp there's a "floating point exception"
> instead of the assert, so there was still some shenanigans happening behind
> the scenes.
> 
> Probably good to push a new release soon. 8-)

There will be a new release soon :)
