From: Florian Westphal <fw@strlen.de>
Subject: Re: Raw payload matching beyond 2040 bits
Date: Fri, 19 Aug 2022 12:37:23 +0200
Message-ID: <20220819103723.GA14293@breakpoint.cc>
References: <20220819100738.63yvp7iggoilt2uc@sourcephile.fr>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20220819100738.63yvp7iggoilt2uc@sourcephile.fr>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julien Moutinho <julm+netfilter@sourcephile.fr>
Cc: netfilter@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>, netfilter-devel <netfilter-devel@vger.kernel.org>

Julien Moutinho <julm+netfilter@sourcephile.fr> wrote:

[ moving to nf-devel ]

> Hi netfilter@,
> 
> Apparently matching beyond 2040 bits (255 bytes) starts again at 0 or something like that.
> Not sure whether this is intended or not,
> but in this case a warning would be appreciated.

This is a kernel bug, the offset is truncated to u8 (modulo 256).
