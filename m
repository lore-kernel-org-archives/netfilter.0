From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables: origin sport after dstnat
Date: Thu, 8 Dec 2022 08:48:33 +0100
Message-ID: <20221208074833.GB28507@breakpoint.cc>
References: <20221206230347.205a59c1@deskFu>
 <20221207112900.GA28507@breakpoint.cc>
 <20221208003159.3bc95cfc@deskFu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20221208003159.3bc95cfc@deskFu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aaron Fischer <mail@aaron-fischer.net>
Cc: netfilter@vger.kernel.org

Aaron Fischer <mail@aaron-fischer.net> wrote:
>     chain FORWARD {
>         type filter hook forward priority filter
>         policy drop
>         ct original proto-src 8448 accept

You need to prepend the l4 protocol that needs to be matched.

meta l4proto tcp ct original proto-src 8448 accept

> Why is 8448 an "invalid" type?

Because nft can't infer it from the available info.
