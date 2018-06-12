From: Florian Westphal <fw@strlen.de>
Subject: Re: ct helper ipv6
Date: Tue, 12 Jun 2018 11:02:32 +0200
Message-ID: <20180612090232.rnri3rf4nlnjrrqn@breakpoint.cc>
References: <2c145015821e6e830beddf376e0f563dac2d1867.camel@tin.it>
Mime-Version: 1.0
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2c145015821e6e830beddf376e0f563dac2d1867.camel@tin.it>
Sender: stable-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ale <mystic@tin.it>
Cc: netfilter@vger.kernel.org, stable@vger.kernel.org

Ale <mystic@tin.it> wrote:

[ cc stable, could you please queue below fix?  ]

> When I try to use CT HELPER for the ipv6, nft it dies and I have to
> restart the pc. But it works well for ip and inet.
> 
> nft add ct helper ip6 filter ftp-std { type \"ftp\" protocol tcp\; }
> nft add rule ip6 filter WAN-IN iifname $IF_WAN_1 tcp sport $UP_PORTS
> tcp dport $UP_PORTS ct helper set \"ftp-std\" counter accept
> 
> Kernel: RIP: strlen+0x0/0x20 RSP: ffffae1b4c67f980
> kernel: Code: f8 48 89 f9 74 09 48 83 c1 01 80 39 00 75 f7 31 d2 44 0f
> b6 04 16 44 88 04 11 48 83 c2 01 45 84 c0 75 ee c3 0f 1f 80 00 00 00 00
> <80> 3f 00 74 10 48 89 f8 48 >

This is most likely fixed in 4.17 by

commit b71534583f22d08c3e3563bf5100aeb5f5c9fbe5
netfilter: nf_tables: fix NULL pointer dereference on nft_ct_helper_obj_dump

The bug was added in Linux 4.12.
