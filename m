From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] ICMPv6 ingress dropped
 despite accept rule
Date: Mon, 3 Feb 2020 23:47:01 +1100
Message-ID: <20200203124701.GD32621@dimstar.local.net>
References: <f8914acf-6487-c9bd-e452-d253069aebe5@gmx.net>
 <20200203115603.GA32621@dimstar.local.net>
 <20200203121508.GB32621@dimstar.local.net>
 <343cb9ea-7cb7-e0cd-b2ad-ab4eb96ccee0@plushkava.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <343cb9ea-7cb7-e0cd-b2ad-ab4eb96ccee0@plushkava.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Mon, Feb 03, 2020 at 12:33:14PM +0000, kfm@plushkava.net wrote:
> On 03/02/2020 12:15, Duncan Roe wrote:
> > On Mon, Feb 03, 2020 at 10:56:03PM +1100, Duncan Roe wrote:
> > > On Mon, Feb 03, 2020 at 10:56:24AM +0000, ????????????? wrote:
[...]
> >
> > Simpler solution: rename table ip6 filter chain input (to input2, say), then
> > move that chain into table inet filter.
> >
> > Insert the rule "icmpv6 jump input2" into chain input somewhere before the log
> > rule.
>
> Apparently, we are thinking along the same lines but that's not a valid
> icmpv6 header expression. A rule such as "meta l4proto ipv6-icmp jump
> input2" should do the trick.
>
> --
> Kerin Millar
>
Yes indeed Kerin, I noticed that on checking the man page after I'd posted.
Was about to post something but then answered the OP's new question instead.
I now think it would be more efficient to replace the whole chain with 1 rule

> icmpv6 type { packet-too-big, time-exceeded, parameter-problem, echo-reply, nd-router-advert, nd-neighbor-advert, nd-redirect, 149, 151, 153 } meta nftrace set 1 accept

Cheers ... Duncan.
