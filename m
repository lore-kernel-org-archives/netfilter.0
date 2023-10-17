Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B224CDB474
	for <netfilter@archiver.kernel.org>; Tue, 17 Oct 2023 21:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344121AbjJQVfK (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Tue, 17 Oct 2023 17:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjJQVfK (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Tue, 17 Oct 2023 17:35:10 -0400
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AAB4AB
        for <netfilter@vger.kernel.org>; Tue, 17 Oct 2023 14:35:08 -0700 (PDT)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1qsriV-0003EF-4i; Tue, 17 Oct 2023 23:35:07 +0200
Date:   Tue, 17 Oct 2023 23:35:07 +0200
From:   Florian Westphal <fw@strlen.de>
To:     "U.Mutlu" <um@mutluit.com>
Cc:     netfilter@vger.kernel.org
Subject: Re: [nftables/nft] nft equivalent of "ipset test"
Message-ID: <20231017213507.GD5770@breakpoint.cc>
References: <652EC034.7090501@mutluit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <652EC034.7090501@mutluit.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

U.Mutlu <um@mutluit.com> wrote:
> The "ipset" commandline tool has the "test" command
> for testing whether a given item (ie. an IP) is in a given set.
> Is there an equivalent for the "nft" commandline tool of nftables?
> I unfortunately couldn't find the answer in the manpage of nft.

nft "get element inet tablename setname { 1.2.3.4 }"
