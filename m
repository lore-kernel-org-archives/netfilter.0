From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables typeof concatenation support for vmap?
Date: Sat, 30 Jan 2021 19:26:53 +0100
Message-ID: <20210130182653.GA12443@breakpoint.cc>
References: <96359217-05e8-53e7-5700-14484043506d@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <96359217-05e8-53e7-5700-14484043506d@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: netfilter@vger.kernel.org

Frank Myhr <fmyhr@fhmtech.com> wrote:
> So it appears that vmaps, unlike plain sets and maps, do not support typeof
> concatenation. I'm running Debian 10 with
> 
> kernel 5.9.15-1~bpo10+1 (2020-12-31) x86_64
> nftables v0.9.6 (Capital Idea #2)
> 
> Are there any plans to support typeof concatenation for vmap? (Or maybe it's
> already supported and I'm botching the syntax or otherwise doing something
> silly?)

Its not supported yet, nft is missing some glue code.
I will work on it next week.

Meanwhile you can use normal "type" as Laura suggested.
