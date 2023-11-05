Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAA7C4332F
	for <netfilter@archiver.kernel.org>; Sun,  5 Nov 2023 17:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjKERlq (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sun, 5 Nov 2023 12:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjKERlp (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sun, 5 Nov 2023 12:41:45 -0500
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B805CA
        for <netfilter@vger.kernel.org>; Sun,  5 Nov 2023 09:41:42 -0800 (PST)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1qzh7z-0002YJ-KJ; Sun, 05 Nov 2023 18:41:39 +0100
Date:   Sun, 5 Nov 2023 18:41:39 +0100
From:   Florian Westphal <fw@strlen.de>
To:     Pablo Neira Ayuso <pablo@netfilter.org>
Cc:     Florian Westphal <fw@strlen.de>,
        Brian Davidson <davidson.brian@gmail.com>,
        netfilter@vger.kernel.org
Subject: Re: ip6 dscp fails map lookup
Message-ID: <20231105174139.GA3861@breakpoint.cc>
References: <CAOoaxdEpJDAQMYxRCC6rUVc=sMY=YXxF42LSeDvMQUPC5sahLA@mail.gmail.com>
 <20231103193704.GI8035@breakpoint.cc>
 <20231103215904.GA23268@breakpoint.cc>
 <ZUfNomFiLekkhB+P@calendula>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZUfNomFiLekkhB+P@calendula>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > >  	if (shift) {
> > > -		if (ctx->stmt_len > 0 && div_round_up(masklen, BITS_PER_BYTE) > 1) {
> > > +		if (masklen > BITS_PER_BYTE) {
> > 
> > I think this is right but binop xfer
> > won't remove the inserted byteorder conversion
> > in case the shift is to be removed by adjusting
> > a constant right hand side value.
> 
> ctx->stmt_len > 0 is also set from stmt_evaluate_{ct,meta}() so this
> transformation is restricted to statements.
> 
> I was conservative edecd58755a8 with ("evaluate: support shifts larger than
> the width of the left operand") to restrict this transformation to
> statements only.
> 
> Do you think think this applies to other cases too?
> 
> BTW, whatever the final fix is, Fixes: tag for this should be:
> 
> Fixes: 668c18f67203 ("evaluate: place byteorder conversion before rshift in payload statement")

I don't think this is a regression, I do not think it has worked before.

table ip6 t {
	map mapv6 {
		typeof ip6 dscp : meta mark
		elements = { cs1 : 0x0000002a }
	}

	chain output {
		type filter hook output priority filter; policy accept;
		meta mark set ip6 dscp map @mapv6
		meta mark 0x0000002a counter
		ip6 dscp @mapv6 counter
		ip6 dscp cs1 counter
	}
}

A "ping6 -q -Q 0x20 ::1 -c1" should cause all counters
in above ruleset to increment, but that is not the case.

Even before above commit.
