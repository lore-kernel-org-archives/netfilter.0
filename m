From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables] packet (filtering) flow NIC vs. PPPoE?
Date: Tue, 29 Sep 2020 17:06:22 +0200
Message-ID: <20200929150622.GA30270@salvia>
References: <dd201d62-d014-e9e3-254b-f7644bc759d7@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dd201d62-d014-e9e3-254b-f7644bc759d7@gmx.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Mon, Sep 28, 2020 at 09:35:00PM +0000, ѽ҉ᶬḳ℠ wrote:
> Whilst testing NFTables's flow offload on a node with a PPPoE subscriber
> line it turned out that the flow offload happens with the NIC netdev and not
> (as I expected) the virtual PPPoE netdev.
> 
> Just for reference this being the NFT config (eth2 being the NIC)
> 
> flowtable fte    {
>   hook ingress priority -100
>   devices = { eth2 }
>   counter
> }

Could you describe your testbed?

> ip protocol { 6, 17 } flow add @fte;
> ip6 nexthdr { 6, 17 } flow add @fte;

You can consolidate this rule with:

  meta l4proto { tcp, udp } flow add @fte;

You might also want to use the existing protocol definitions, instead
of numeric protocols to make your ruleset more readable.

> Why would the packet filtering have to take place on the PPPoE netdev but
> the flowatable happens with the NIC instead?

What would you like to achieve with the flowtable?
