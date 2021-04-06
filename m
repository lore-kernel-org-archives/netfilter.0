From: Florian Westphal <fw@strlen.de>
Subject: Re: List and reimport Ruleset fails with "Error: transport protocol
 mapping is only valid after transport protocol match"
Date: Tue, 6 Apr 2021 17:33:38 +0200
Message-ID: <20210406153338.GO13699@breakpoint.cc>
References: <CAOAVeL3bSQP8SoaS_SUgr7XVMDAhp9ZtE3tstOHDE4dZBN9AgA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOAVeL3bSQP8SoaS_SUgr7XVMDAhp9ZtE3tstOHDE4dZBN9AgA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henning Reich <henning.reich@gmail.com>
Cc: netfilter@vger.kernel.org

Henning Reich <henning.reich@gmail.com> wrote:
> I'm using some systemd-nspawn containers with exposed Port.
> Systemd creates automatically some masquerading rules and all works fine.
> But if I restart nft.service, these rules are gone (obviously). So I
> want to store and re-import them.
> 
> so this
> nft list table ip io.systemd.nat | tee systemd_nat_rules
> shows me:
> 
> table ip io.systemd.nat {
>        set masq_saddr {
>                type ipv4_addr
>                flags interval
>                elements = { 192.168.162.112/28 }
>        }
> 
>        map map_port_ipport {
>                type inet_proto . inet_service : ipv4_addr . inet_service
>                elements = { tcp . 8088 : 192.168.162.117 . 80 }
>        }
> 
>        chain prerouting {
>                type nat hook prerouting priority dstnat + 1; policy accept;
>                fib daddr type local dnat ip addr . port to meta
> l4proto . th dport map @map_port_ipport

> results in:
> ruleset:9:48-59: Error: transport protocol mapping is only valid after
> transport protocol match
>                type inet_proto . inet_service : ipv4_addr . inet_service

nft is too dumb and doesn't realize the protocol match is in the map
lookup.

I'll take a look.
