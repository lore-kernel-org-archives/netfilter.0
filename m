Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6EDC4332F
	for <netfilter@archiver.kernel.org>; Sun,  5 Nov 2023 17:25:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjKERPW (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sun, 5 Nov 2023 12:15:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjKERPW (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sun, 5 Nov 2023 12:15:22 -0500
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A4ECB6
        for <netfilter@vger.kernel.org>; Sun,  5 Nov 2023 09:15:19 -0800 (PST)
Received: from [78.30.35.151] (port=44830 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1qzgiR-00AFVP-HA; Sun, 05 Nov 2023 18:15:17 +0100
Date:   Sun, 5 Nov 2023 18:15:14 +0100
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Florian Westphal <fw@strlen.de>
Cc:     Brian Davidson <davidson.brian@gmail.com>,
        netfilter@vger.kernel.org
Subject: Re: ip6 dscp fails map lookup
Message-ID: <ZUfNomFiLekkhB+P@calendula>
References: <CAOoaxdEpJDAQMYxRCC6rUVc=sMY=YXxF42LSeDvMQUPC5sahLA@mail.gmail.com>
 <20231103193704.GI8035@breakpoint.cc>
 <20231103215904.GA23268@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231103215904.GA23268@breakpoint.cc>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Fri, Nov 03, 2023 at 10:59:04PM +0100, Florian Westphal wrote:
> Florian Westphal <fw@strlen.de> wrote:
> > Brian Davidson <davidson.brian@gmail.com> wrote:
> > > Using 'ip6 dscp' in a map lookup does not give expected results. It
> > > seems to always match the zero value (cs0). It appears in the first
> > > rule that the byteorder is not being converted between the two bitwise
> > > operations, which is what happens when using ip6 dscp directly in the
> > > second rule.
> > > 
> > > # nft -f - <<EOF
> > > add table ip6 t
> > > add chain ip6 t c
> > > add map ip6 t mapv6 { typeof ip6 dscp : meta mark; }
> > > EOF
> > > 
> > > # nft -d netlink add rule ip6 t c meta mark set ip6 dscp map @mapv6
> > > ip6 t c
> > >   [ payload load 2b @ network header + 0 => reg 1 ]
> > >   [ bitwise reg 1 = ( reg 1 & 0x0000c00f ) ^ 0x00000000 ]
> > >   [ bitwise reg 1 = ( reg 1 >> 0x00000006 ) ]
> > >   [ lookup reg 1 set mapv6 dreg 1 ]
> > >   [ meta set mark with reg 1 ]
> > > 
> > > # nft -d netlink add rule ip6 t c meta mark set ip6 dscp
> > > ip6 t c
> > >   [ payload load 2b @ network header + 0 => reg 1 ]
> > >   [ bitwise reg 1 = ( reg 1 & 0x0000c00f ) ^ 0x00000000 ]
> > >   [ byteorder reg 1 = ntoh(reg 1, 2, 2) ]
> > >   [ bitwise reg 1 = ( reg 1 >> 0x00000006 ) ]
> > >   [ meta set mark with reg 1 ]
> > 
> > Uhm.  Pablo, any idea why the byte-swap-or-not logic depends
> > on something *other* than if the mask length is > 8 bit or not?
> > 
> > diff --git a/src/evaluate.c b/src/evaluate.c
> > --- a/src/evaluate.c
> > +++ b/src/evaluate.c
> > @@ -545,7 +545,7 @@ static void expr_evaluate_bits(struct eval_ctx *ctx, struct expr **exprp)
> >  	and->len	= masklen;
> >  
> >  	if (shift) {
> > -		if (ctx->stmt_len > 0 && div_round_up(masklen, BITS_PER_BYTE) > 1) {
> > +		if (masklen > BITS_PER_BYTE) {
> 
> I think this is right but binop xfer
> won't remove the inserted byteorder conversion
> in case the shift is to be removed by adjusting
> a constant right hand side value.

ctx->stmt_len > 0 is also set from stmt_evaluate_{ct,meta}() so this
transformation is restricted to statements.

I was conservative edecd58755a8 with ("evaluate: support shifts larger than
the width of the left operand") to restrict this transformation to
statements only.

Do you think think this applies to other cases too?

BTW, whatever the final fix is, Fixes: tag for this should be:

Fixes: 668c18f67203 ("evaluate: place byteorder conversion before rshift in payload statement")
