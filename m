From: Florian Westphal <fw@strlen.de>
Subject: Re: ct state module issue
Date: Tue, 25 Jul 2023 21:33:46 +0200
Message-ID: <20230725193346.GA5720@breakpoint.cc>
References: <CAOLfK3WzBo=dPJ0WEvpO4wFPnSp1uEkBXRWpxRSz7Guou3z7kw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOLfK3WzBo=dPJ0WEvpO4wFPnSp1uEkBXRWpxRSz7Guou3z7kw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter <netfilter@vger.kernel.org>, bpf <bpf@vger.kernel.org>

Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:

[ CCing bpf/btf experts ]

> I'm running kernel: 6.1.0-10-amd64
> and
> nftables v1.0.6 (Lester Gooch #5)
> 
> I have a set of nftables rules that have served me well for Debian 11
> - thanks in large part to the netfilter mailing list, so...thank you!
> nftables on Debian 11 is: 0.9.8-3.1+deb11u1
> 
> I have recently installed Debian 12 and tried my nftables rules and
> have hit a snag with the connection tracking and a verdict map.
> nftables on Debian 12 is: 1.0.6-2+deb12u1
> 
> When I run the offending snippet:
> 
> # nft -f /etc/nftables.conf.d/300-common.d/200-connection-tracking.nft
> /etc/nftables.conf.d/300-common.d/200-connection-tracking.nft:4:9-16:
> Error: Could not process rule: No such file or directory
>         ct state vmap {

[..]
  	^^^^^^^^
> When I watch the kernel logs (journalctl), I see:
> 
> Jul 25 13:44:04 localhost kernel: BPF: [99725] STRUCT
> Jul 25 13:44:04 localhost kernel: BPF: size=104 vlen=12
> Jul 25 13:44:04 localhost kernel: BPF:
> Jul 25 13:44:04 localhost kernel: BPF: Invalid name
> Jul 25 13:44:04 localhost kernel: BPF:
> Jul 25 13:44:04 localhost kernel: failed to validate module
> [nf_conntrack] BTF: -22
> Jul 25 13:44:04 localhost kernel: missing module BTF, cannot register kfuncs

So nf_conntrack.ko fails to load because of a btf issue.

My question to bpf folks is:

Should we make register_nf_conntrack_bpf() return 'void'?

This way normal conntrack would still work.  bpf programs using
conntrack kfuncs would fail, but above dmesg splat already gives
a clue as to why conntrack kfuncs aren't there.

No idea about the actual problem or how to debug that, but bpf
people should know.
