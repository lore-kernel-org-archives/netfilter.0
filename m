From: Florian Westphal <fw@strlen.de>
Subject: Re: Consolidating rules
Date: Mon, 3 Jan 2022 15:56:03 +0100
Message-ID: <20220103145603.GB22312@breakpoint.cc>
References: <CAF1QswjecENZyrGsCtot4dH1xPmDKyG6csk00O7+A6stPP_Lrg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAF1QswjecENZyrGsCtot4dH1xPmDKyG6csk00O7+A6stPP_Lrg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yves baumes <ybaumes@gmail.com>
Cc: netfilter@vger.kernel.org

yves baumes <ybaumes@gmail.com> wrote:
> Here is my problem: when I create a table to let DHCP and DNS requests
> pass through, my packets are still getting dropped.
> ```
> # nft list ruleset
> table inet mytable {
> chain inbound {
> ip protocol . th dport vmap { tcp . 22 : accept, tcp . 53 : accept,
> udp . 53 : accept, udp . 67 : accept }
> }
> 
> chain ssh_inbound {
> tcp dport 22 accept
> }
> 
> chain input {
> type filter hook input priority filter - 1; policy drop;
> ct state vmap { invalid : drop, established : accept, related : accept }
> iifname vmap { "eth2" : jump inbound, "eth2.103" : jump inbound,
> "eth2.3163" : jump inbound }
> iifname vmap { "eth0" : jump ssh_inbound }
> iifname "lo" accept
> iifname "tun0" tcp dport 22 accept
> }
> [...]
> ```
> 
> So I read about that issue in the wiki:
> https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Base_chain_priority
> . Which states that the default filter/INPUT chain will be run either
> before or after my own chain (depending on the priority I set) and
> will drop the packets silently, since its default policy is DROP and
> no rules match the packets in this filter/INPUT chain.
> Indeed if I change the default policy of filter/INPUT to ACCEPT, my
> DHCP/DNS packets are getting accepted.

They are accepted regardless, the policy is not relevant for them.

[..]

> Second solution would be to let the default filter/INPUT policy to
> DROP and centralize my configuration into the filter/INPUT chain,

Thats what you are doing?
In the ruleset you provided there is only on base chain (input),
so 'chain inbound' is called in the context of the input base chain.

> So how would you tackle this issue, that is: letting the packets go
> through while still having a default policy to DROP? Is there a
> simpler way that I did not find?

If the 'accept policy' solves your problem, your ruleset is tossing
packets that it should not be dropping.

For example, your ruleset breaks ipv6 since it discards icmpv6
neighbour solicitiation packets.
