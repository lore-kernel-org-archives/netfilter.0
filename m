From: Florian Westphal <fw@strlen.de>
Subject: Re: nft tproxy without iproute2 rule
Date: Thu, 10 Oct 2019 00:02:51 +0200
Message-ID: <20191009220251.GA15526@breakpoint.cc>
References: <CAGF1phaHKy_bb1ALmB+YpB27gYtN30U8=zViaJ181TaCEPd4sQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGF1phaHKy_bb1ALmB+YpB27gYtN30U8=zViaJ181TaCEPd4sQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Norman Rasmussen <norman@rasmussen.co.za>
Cc: netfilter@vger.kernel.org

Norman Rasmussen <norman@rasmussen.co.za> wrote:
> If there was a way to set the output interface in the prerouting and
> output hooks, would the meta mark action and ip rule & route still be
> required?

Yes.

> The netdev fwd statement can be used to transmit packets via a given
> interface, but is only supported in the ingress hook. Would supporting
> setting the output interface it for inet hooks just be a matter of
> supporting the oif and oifname keywords for the "meta set" statement?

No.

> For example (taking from Documentation/networking/tproxy.txt) the
> config becomes:
> 
> # nft add chain filter divert "{ type filter hook prerouting priority -150; }"
> # nft add rule filter divert meta l4proto tcp socket transparent 1 fwd
> to lo accept
> # nft add rule filter divert tcp dport 80 tproxy to :50080 meta set
> oif lo accept

The purpose of mark + rule + route is to influence the routing decision
made after the prerouting step, so packet gets passed to input path and
not forward.

skb->dev is the input device at this point.

The code that is being influenced by mark + route is
the call to ip_route_input_noref() in ip_rcv_finish_core which assigns
skb->dst, and the dst_entry describes how the packet will travel in the stack.

> and for local connections:
> # nft add chain filter local "{ type filter hook output priority -150; }"
> # nft add rule filter local tcp dport 80 tproxy to :50080 meta set oif
> to lo accept

> Is there a complication with supporting this in prerouting and output,
> or would this mostly just work as expected? I assume it wouldn't need
> to do the same as the netdev fwd path where the packet is immediately
> sent to egress and xmit, and just doing the far simpler set skb->dev
> and let the rest of the processing continue would work fine?

See above, skb->dev is still telling the stack where the packet is
coming from, not where its going.

Is this about ip rule scalability or keeping config 'private' to nftables,
i.e. bypass the FIB?

