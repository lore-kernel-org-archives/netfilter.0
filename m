Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BE0C4332F
	for <netfilter@archiver.kernel.org>; Sun,  5 Nov 2023 17:58:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjKER6r (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sun, 5 Nov 2023 12:58:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjKER6q (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sun, 5 Nov 2023 12:58:46 -0500
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3267DDB
        for <netfilter@vger.kernel.org>; Sun,  5 Nov 2023 09:58:43 -0800 (PST)
Received: from [78.30.35.151] (port=38748 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1qzhOQ-00AQ9Y-N5; Sun, 05 Nov 2023 18:58:41 +0100
Date:   Sun, 5 Nov 2023 18:58:36 +0100
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Florian Westphal <fw@strlen.de>
Cc:     Brian Davidson <davidson.brian@gmail.com>,
        netfilter@vger.kernel.org
Subject: Re: ip6 dscp fails map lookup
Message-ID: <ZUfXzKKTNwgxYqSP@calendula>
References: <CAOoaxdEpJDAQMYxRCC6rUVc=sMY=YXxF42LSeDvMQUPC5sahLA@mail.gmail.com>
 <20231103193704.GI8035@breakpoint.cc>
 <20231103215904.GA23268@breakpoint.cc>
 <ZUfNomFiLekkhB+P@calendula>
 <20231105174139.GA3861@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231105174139.GA3861@breakpoint.cc>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Sun, Nov 05, 2023 at 06:41:39PM +0100, Florian Westphal wrote:
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> > > >  	if (shift) {
> > > > -		if (ctx->stmt_len > 0 && div_round_up(masklen, BITS_PER_BYTE) > 1) {
> > > > +		if (masklen > BITS_PER_BYTE) {
> > > 
> > > I think this is right but binop xfer
> > > won't remove the inserted byteorder conversion
> > > in case the shift is to be removed by adjusting
> > > a constant right hand side value.
> > 
> > ctx->stmt_len > 0 is also set from stmt_evaluate_{ct,meta}() so this
> > transformation is restricted to statements.
> > 
> > I was conservative edecd58755a8 with ("evaluate: support shifts larger than
> > the width of the left operand") to restrict this transformation to
> > statements only.
> > 
> > Do you think think this applies to other cases too?
> > 
> > BTW, whatever the final fix is, Fixes: tag for this should be:
> > 
> > Fixes: 668c18f67203 ("evaluate: place byteorder conversion before rshift in payload statement")
> 
> I don't think this is a regression, I do not think it has worked before.
>
> table ip6 t {
> 	map mapv6 {
> 		typeof ip6 dscp : meta mark
> 		elements = { cs1 : 0x0000002a }
> 	}
> 
> 	chain output {
> 		type filter hook output priority filter; policy accept;
> 		meta mark set ip6 dscp map @mapv6
> 		meta mark 0x0000002a counter
> 		ip6 dscp @mapv6 counter
> 		ip6 dscp cs1 counter
> 	}
> }
> 
> A "ping6 -q -Q 0x20 ::1 -c1" should cause all counters
> in above ruleset to increment, but that is not the case.
> 
> Even before above commit.

After my patch:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20231105174148.160390-1-pablo@netfilter.org/

        chain output {
                type filter hook output priority filter; policy accept;
                meta mark set ip6 dscp map @mapv6
                meta mark 0x0000002a counter packets 2 bytes 208
                ip6 dscp @mapv6 counter packets 0 bytes 0
                ip6 dscp cs1 counter packets 2 bytes 208
        }

So 'ip6 dscp @mapv6' is still broken.

With your patch, simple 'ip6 dscp cs1' breaks:

        @nh,0,16 & 0xfc0 & 0xfc0 == 0x2 counter packets 0 bytes 0
