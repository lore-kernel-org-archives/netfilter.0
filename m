From: Florian Westphal <fw@strlen.de>
Subject: Re: [nftables 0.9.2 | kernel 4.19.93] dropping ct state untracked
 stops ipv6 connectivity
Date: Wed, 18 Mar 2020 13:07:26 +0100
Message-ID: <20200318120726.GA13921@breakpoint.cc>
References: <9a55ac25-719e-49fb-c414-7467e67cb686@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9a55ac25-719e-49fb-c414-7467e67cb686@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> This works (i.e. ipv4 and ipv6 connectivity)
> 
> table inet filter {
>         chain input {
>                 type filter hook input priority filter; policy drop;
>                 ct state established,related accept
>                 ct state invalid drop
>         }
> 
> }
> 
> This cuts ipv6 connectivity entirely (ipv4 connectivity works)
> 
> table inet filter {
>         chain input {
>                 type filter hook input priority filter; policy drop;
>                 ct state established,related accept
>                 ct state invalid,untracked drop

Yes.

> It reproduces on each toggle: ct state invalid,untracked drop <-> ct state
> invalid drop (ct db/cache needs to clear in between toggling).
> Enabled logging but nothing been printed that would provide a hint.
> 
> Is this something to be expected, and if so why, or is it a bug in kernel /
> nft?

Expected, conntrack marks icmpv6 neigh resolution as untracked.
