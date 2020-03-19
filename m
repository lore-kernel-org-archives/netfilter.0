From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables 0.9.2] NETDEV packet drop vs. packet capture visibility
Date: Thu, 19 Mar 2020 20:43:47 +0100
Message-ID: <20200319194347.sqppl54l43istjco@salvia>
References: <076ce710-b294-7360-77ff-204d1848603a@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <076ce710-b294-7360-77ff-204d1848603a@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, Mar 19, 2020 at 04:11:01PM +0000, ѽ҉ᶬḳ℠ wrote:
> With
> 
> table netdev filter {
>         chain input {
>                 type filter hook ingress device "eth2" priority filter;
> policy accept;
>                 ether type arp drop
>                 ether type vlan drop
>                 ether type 0x9000 drop
>         }
> }
> 
> in place those package types are visible (showing) during a packet capture
> (wirehshark ssh remote) on that interface. Is this to be expected as the
> packet is being captured prior being dropped by NFT or does indicate that
> the packages are not being dropped?

The ingress packet filtering happens right after the "taps", ie.
packet capture, e.g. wireshark.

The packet is captured before nft ingress drops them.

This is where the nf_ingress() hook is invoked:

https://elixir.bootlin.com/linux/v5.6-rc6/source/net/core/dev.c#L5056

Just a few lines before, you can see the routines for the packet
captures ("taps"):

https://elixir.bootlin.com/linux/v5.6-rc6/source/net/core/dev.c#L5043
