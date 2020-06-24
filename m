From: Florian Westphal <fw@strlen.de>
Subject: Re: [nft 0.9.3 | kernel 5.4.48] cannot get NAT to work
Date: Wed, 24 Jun 2020 10:14:43 +0200
Message-ID: <20200624081443.GV26990@breakpoint.cc>
References: <87b5491f-dbd3-1f09-a9cb-303596da4e10@gmx.net>
 <20200623212323.GS26990@breakpoint.cc>
 <cf63c2f8-3aaf-9af6-739e-8928b803fb8c@gmx.net>
 <20200623215239.GT26990@breakpoint.cc>
 <6e919ed9-50d9-7a23-a581-2c6110af5108@gmx.net>
 <20200623224854.GU26990@breakpoint.cc>
 <f67206b8-aebc-47b5-a3e2-d2d07d2bb53e@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f67206b8-aebc-47b5-a3e2-d2d07d2bb53e@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Florian Westphal <fw@strlen.de>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> Afraid, neither variation works, each throwing
> 
> /etc/fw/test.conf:2:15-24: Error: Could not process rule: No such file or
> directory
>         chain prerouting {
>               ^^^^^^^^^^
> /etc/fw/test.conf:6:15-19: Error: Could not process rule: No such file or
> directory
>         chain input {
>               ^^^^^
> /etc/fw/test.conf:10:15-20: Error: Could not process rule: No such file or
> directory
>         chain output {
>               ^^^^^^
> /etc/fw/test.conf:14:15-25: Error: Could not process rule: No such file or
> directory
>         chain postrouting {
>               ^^^^^^^^^^^
> 
> Don't know whether txt attachments are accepted on this ML but enclosed full
> debug output (if its gets through), through it does not seem to reveal
> anything useful?

No.

> Could this be a bug in the kernel?

Its a kernel bug, or misconfiguration. Nat hook is provided via

 modinfo nft_chain_nat
 filename:
 /lib/modules/5.6.18/kernel/net/netfilter/nft_chain_nat.ko.gz
 alias:          nft-chain-1-nat
 alias:          nft-chain-10-nat
 alias:          nft-chain-2-nat
 license:        GPL
 srcversion:     45E82B99D3993871BD6131E
 depends:        nf_nat,nf_tables
 intree:         Y
 name:           nft_chain_nat
 vermagic:       5.6.18 SMP preempt mod_unload modversions 
