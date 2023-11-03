Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052E1C4332F
	for <netfilter@archiver.kernel.org>; Fri,  3 Nov 2023 19:37:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376857AbjKCThN (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Fri, 3 Nov 2023 15:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234454AbjKCThL (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Fri, 3 Nov 2023 15:37:11 -0400
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193AAD6F
        for <netfilter@vger.kernel.org>; Fri,  3 Nov 2023 12:37:07 -0700 (PDT)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1qyzya-0007lK-PZ; Fri, 03 Nov 2023 20:37:04 +0100
Date:   Fri, 3 Nov 2023 20:37:04 +0100
From:   Florian Westphal <fw@strlen.de>
To:     Brian Davidson <davidson.brian@gmail.com>
Cc:     netfilter@vger.kernel.org, pablo@netfilter.org
Subject: Re: ip6 dscp fails map lookup
Message-ID: <20231103193704.GI8035@breakpoint.cc>
References: <CAOoaxdEpJDAQMYxRCC6rUVc=sMY=YXxF42LSeDvMQUPC5sahLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOoaxdEpJDAQMYxRCC6rUVc=sMY=YXxF42LSeDvMQUPC5sahLA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Brian Davidson <davidson.brian@gmail.com> wrote:
> Using 'ip6 dscp' in a map lookup does not give expected results. It
> seems to always match the zero value (cs0). It appears in the first
> rule that the byteorder is not being converted between the two bitwise
> operations, which is what happens when using ip6 dscp directly in the
> second rule.
> 
> # nft -f - <<EOF
> add table ip6 t
> add chain ip6 t c
> add map ip6 t mapv6 { typeof ip6 dscp : meta mark; }
> EOF
> 
> # nft -d netlink add rule ip6 t c meta mark set ip6 dscp map @mapv6
> ip6 t c
>   [ payload load 2b @ network header + 0 => reg 1 ]
>   [ bitwise reg 1 = ( reg 1 & 0x0000c00f ) ^ 0x00000000 ]
>   [ bitwise reg 1 = ( reg 1 >> 0x00000006 ) ]
>   [ lookup reg 1 set mapv6 dreg 1 ]
>   [ meta set mark with reg 1 ]
> 
> # nft -d netlink add rule ip6 t c meta mark set ip6 dscp
> ip6 t c
>   [ payload load 2b @ network header + 0 => reg 1 ]
>   [ bitwise reg 1 = ( reg 1 & 0x0000c00f ) ^ 0x00000000 ]
>   [ byteorder reg 1 = ntoh(reg 1, 2, 2) ]
>   [ bitwise reg 1 = ( reg 1 >> 0x00000006 ) ]
>   [ meta set mark with reg 1 ]

Uhm.  Pablo, any idea why the byte-swap-or-not logic depends
on something *other* than if the mask length is > 8 bit or not?

diff --git a/src/evaluate.c b/src/evaluate.c
--- a/src/evaluate.c
+++ b/src/evaluate.c
@@ -545,7 +545,7 @@ static void expr_evaluate_bits(struct eval_ctx *ctx, struct expr **exprp)
 	and->len	= masklen;
 
 	if (shift) {
-		if (ctx->stmt_len > 0 && div_round_up(masklen, BITS_PER_BYTE) > 1) {
+		if (masklen > BITS_PER_BYTE) {
 			int op = byteorder_conversion_op(expr, BYTEORDER_HOST_ENDIAN);
 			and = unary_expr_alloc(&expr->location, op, and);
 			and->len = masklen;
