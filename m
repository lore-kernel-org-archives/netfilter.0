From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables] granular rule for combined tcp & udp sports?
Date: Tue, 6 Oct 2020 10:31:50 +0200
Message-ID: <20201006083150.GA14996@salvia>
References: <47b2582c-1f1e-4761-9be3-22018d7c87a2@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47b2582c-1f1e-4761-9be3-22018d7c87a2@gmx.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Mon, Oct 05, 2020 at 12:56:00PM +0000, ѽ҉ᶬḳ℠ wrote:
> I am trying to get a granular logging rule going, combining tcp and udp
> sports for ip6 saddr but somehow failing:
> 
> 
> tcp sport != { 80, 443, 993, 5228 } udp sport != 19302 ip6 saddr @g_6 log
> flags all prefix "G_C :" continue
> 
> -> Error: conflicting protocols specified: tcp vs. udp

I suggest you express things is less convoluted ways, ie. positive
logic and default action to drop in your ruleset.

nft add rule ip6 x y meta l4proto . th dport { tcp . 80, tcp . 443, tcp . 993, tcp . 5228, udp . 19302 } ip6 saddr @y accept

You can set default policy in the chain to drop.
