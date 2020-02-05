From: Florian Westphal <fw@strlen.de>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] logging protocols in inet
 family table require explicit protocol statement?
Date: Wed, 5 Feb 2020 15:29:35 +0100
Message-ID: <20200205142935.GG26952@breakpoint.cc>
References: <7f4e6968-d2c8-7b14-0d42-137c7f7d7f85@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7f4e6968-d2c8-7b14-0d42-137c7f7d7f85@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> Having perused the WIKI [1] I tried to get protocol specific logging going,
> but ended up with
> 
> * tcp log -> Error: syntax error, unexpected log
> * icmpv6 log -> Error: syntax error, unexpected log
> 
> Only with an explicit protocol statement logging works
> 
> * ip protocol tcp log
> * ip6 nexthdr  icmpv6 log

You mean "log" doesn't work?  (no "tcp" prefix).

> cat /proc/net/netfilter/nf_log
>  0 NONE (nfnetlink_log)
>  1 NONE (nfnetlink_log)
>  2 nf_log_ipv4 (nf_log_ipv4,nfnetlink_log)
>  3 NONE (nfnetlink_log)
>  4 NONE (nfnetlink_log)
>  5 NONE (nfnetlink_log)
>  6 NONE (nfnetlink_log)
>  7 NONE (nfnetlink_log)
>  8 NONE (nfnetlink_log)
>  9 NONE (nfnetlink_log)
> 10 nf_log_ipv6 (nf_log_ipv6,nfnetlink_log)
> 11 NONE (nfnetlink_log)
> 12 NONE (nfnetlink_log)

This means that ipv4 is logged by nf_log_ipv4 and ipv6 via
nf_log_ipv6.  Everything should be working for ipv4, ipv6 and inet
without any further action (provided you want to use printk-based
logging via dmesg rather than nfnetlink).

> Tried with
> 
> echo "nf_log_icmp" > /proc/sys/net/netfilter/nf_log/1

There is no layer 4 logger. nf_log_XXX, where XXX is a l3 protocol
family, i.e.  nf_log_{ipv4,ipv6,arp,bridge} or nfnetlink_log.
