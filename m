From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ct state vmap no longer works on 6.3 kernel
Date: Wed, 3 May 2023 08:19:43 +0200
Message-ID: <ZFH86op04R2rWPbi@calendula>
References: <a2c6386f-d339-9774-387a-f20fa8aa28e6@rvf6.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a2c6386f-d339-9774-387a-f20fa8aa28e6@rvf6.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rvfg <i@rvf6.com>
Cc: netfilter@vger.kernel.org

On Mon, May 01, 2023 at 09:58:52PM +0800, Rvfg wrote:
> Hi. I recently upgraded to 6.3 kernel and I noticed my nftables starts
> dropping incoming ipv6 router advertisement packets. Here is my input
> chains:
> 
> |chain input {||
> ||        type filter hook input priority filter; policy drop;||
> ||        iifname "lo" accept comment "trusted interfaces"||
> ||        ct state vmap { invalid : drop, established : accept, related :
> accept, * : jump input-allow }||
> ||}||
> ||
> ||chain input-allow {||
> ||        meta l4proto ipv6-icmp meta nftrace set 1||
> ||        tcp dport { 22, 22000 } accept||
> ||        udp dport { 21027, 22000 } accept||
> ||        icmp type echo-request limit rate 20/second accept comment "allow
> ping"||
> ||        icmpv6 type != { nd-redirect, 139 } accept||
> ||        ip6 daddr fe80::/64 udp dport 546 accept comment "DHCPv6 client"||
> ||}|
> 
> This setup used to work fine. But now RA packets never go through the
> input-allow chain (not show up in nftrace). Something must be wrong in the
> "ct state vmap" rule. I'm able to work around this by adding a "jump
> input-allow" rule at the ending of "chain input".
> 
> I found https://github.com/torvalds/linux/commit/d9e7891476057b24a1acbf10a491e5b9a1c4ae77
> might be relevant (not tested yet). I'm not very familiar with the kernel.
> But the return NFT_BREAK in nft_ct_fast.c caught my eye. Is this the cause?

I don't see anything bad with this patch.

Did you enable conntrack logging to understand why conntrack is
marking your packets as invalid?

# sh -c 'echo 58 > /proc/sys/net/netfilter/nf_conntrack_log_invalid'

where 58 is ICMPv6.
