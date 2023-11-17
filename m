Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9347EC197A0
	for <netfilter@archiver.kernel.org>; Fri, 17 Nov 2023 15:54:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbjKQPyz (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Fri, 17 Nov 2023 10:54:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbjKQPyy (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Fri, 17 Nov 2023 10:54:54 -0500
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E49B9
        for <netfilter@vger.kernel.org>; Fri, 17 Nov 2023 07:54:51 -0800 (PST)
Received: from [78.30.43.141] (port=40200 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1r41B9-005WOr-0Z; Fri, 17 Nov 2023 16:54:49 +0100
Date:   Fri, 17 Nov 2023 16:54:45 +0100
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Sixene <notsixene@gmail.com>
Cc:     netfilter@vger.kernel.org
Subject: Re: Optimize fails on a large ruleset
Message-ID: <ZVeMxYsNEgr7ZblO@calendula>
References: <CABGCCVc7Qb5U131xUL3mwGtok61=2mwMUOqpe7B_8D+S0VNngA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABGCCVc7Qb5U131xUL3mwGtok61=2mwMUOqpe7B_8D+S0VNngA@mail.gmail.com>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi,

On Fri, Nov 17, 2023 at 03:40:09PM +0100, Sixene wrote:
> Hi,
> I hope this is the right channel to reach out for support, the wiki
> mentioned this mailing list.
> I'm having trouble optimizing my large ruleset of 26000+ lines.
> When I run 'nft -c -o -f ruleset.nft', after the while processes, I
> get the following error:
> nft: optimize.c:423: merge_verdict_stmts: Assertion `0' failed.
> Aborted (core dumped)

Please, make sure you you run on latest nftables version.

> My ruleset mostly consists of just 'ip saddr x.x.x.x/xx counter
> packets 0 bytes 0 drop'
> Hope you can help, as I'm facing very bad performance with this list,
> however I have no choice because I need to block all of these
> addresses.

Please, send a simple reproducer.

Thanks.
