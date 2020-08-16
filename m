From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Nftables 2 WAN
Date: Sun, 16 Aug 2020 20:40:41 +0200
Message-ID: <20200816184041.GA1545@salvia>
References: <6bd2a7b2-4244-3695-4b62-64957bfd71c5@tootai.net>
 <f271e8e7-12c1-480f-0a06-3db5ebc5875a@tootai.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f271e8e7-12c1-480f-0a06-3db5ebc5875a@tootai.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel <tech@tootai.net>
Cc: Netfilter list <netfilter@vger.kernel.org>

On Fri, Aug 14, 2020 at 11:26:31PM +0200, Daniel wrote:
[...]
> UPDATE: I discover that the traffic I see on interface gretunnel is only the
> local generated one which is going out with the eth0 ipv6 address. I modify
> mangle table which now looks like
> 
> # nft table mangle ip6
> #
> $fwtables delete table ip6 mangle 2>/dev/null || true
> $fwtables add table ip6 mangle 2>/dev/null || true
> $fwtables add chain ip6 mangle output "{ type nat hook output priority -199
> ; policy accept ; }"

Why chain type 'nat' ? Probably you meant to specify here 'mangle'.
NAT chains only see the first packet of flows.

