From: Florian Westphal <fw@strlen.de>
Subject: Re: [nftables 0.9.2 | kernel 4.19.93] dropping ct state untracked
 stops ipv6 connectivity
Date: Wed, 18 Mar 2020 13:28:37 +0100
Message-ID: <20200318122837.GC13921@breakpoint.cc>
References: <9a55ac25-719e-49fb-c414-7467e67cb686@gmx.net>
 <20200318120726.GA13921@breakpoint.cc>
 <1ef6eb05-1f82-fc88-8d1f-8bb5b98ae67a@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1ef6eb05-1f82-fc88-8d1f-8bb5b98ae67a@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: Florian Westphal <fw@strlen.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> That is one protocol (icmpv6 neigh resolution) being untracked but that
> implies that NFT is then subsequently blocking the source ipv6 entirely?

Its the same effect as dropping ipv4 arp packets with arptables,
stack won't be able to figure out which ethernet address to use to send
the packet to.
