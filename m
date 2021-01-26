From: Florian Westphal <fw@strlen.de>
Subject: Re: parser problem in range map?
Date: Tue, 26 Jan 2021 16:32:06 +0100
Message-ID: <20210126153206.GT19605@breakpoint.cc>
References: <CAC=ZbaS3H09px4EfJQx5gaWv9zthVxD3LQHjue9vfsjcfG_zOw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAC=ZbaS3H09px4EfJQx5gaWv9zthVxD3LQHjue9vfsjcfG_zOw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Schultz <andreas.schultz@travelping.com>
Cc: netfilter <netfilter@vger.kernel.org>

Andreas Schultz <andreas.schultz@travelping.com> wrote:
> The following simple ruleset fails to load on nftables 0.9.8 (from
> Ubuntu 21.04):
> 
> #!/usr/sbin/nft -f
> 
> flush ruleset
> 
> table inet nat {
>     chain prerouting {
>         type filter hook prerouting priority -100;
>         ip daddr set numgen inc mod 16 map { 0 - 7 : 10.0.1.1, 8 - 15
> : 10.0.1.2 }
>     }
> 
>     chain postrouting {
>         type filter hook postrouting priority 100;
>     }
> }
> 
> It throws this error:
> 
> # nft -f test.nft
> test.nft:12:40-42: Error: Value 100 exceeds valid range 0-15
> type filter hook postrouting priority 100;
>                                       ^^^
> test.nft:12:31-42: Error: invalid priority expression value in this context.
> type filter hook postrouting priority 100;
>                              ^^^^^^^^^^^^
> 
> Is there something wrong with my expression or is this a bug?

Bug.  This looks like the right fix:

diff --git a/src/evaluate.c b/src/evaluate.c
--- a/src/evaluate.c
+++ b/src/evaluate.c
@@ -3789,8 +3789,8 @@ static bool evaluate_priority(struct eval_ctx *ctx, struct prio_spec *prio,
        int prio_snd;
        char op;
 
-       ctx->ectx.dtype = &priority_type;
-       ctx->ectx.len = NFT_NAME_MAXLEN * BITS_PER_BYTE;
+       expr_set_context(&ctx->ectx, &priority_type, NFT_NAME_MAXLEN * BITS_PER_BYTE);
+
        if (expr_evaluate(ctx, &prio->expr) < 0)
                return false;

