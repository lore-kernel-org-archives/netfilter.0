Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FB4CDB474
	for <netfilter@archiver.kernel.org>; Tue, 17 Oct 2023 22:05:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbjJQWFn (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Tue, 17 Oct 2023 18:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbjJQWFn (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Tue, 17 Oct 2023 18:05:43 -0400
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151F695
        for <netfilter@vger.kernel.org>; Tue, 17 Oct 2023 15:05:41 -0700 (PDT)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1qssC3-0003M3-Nc; Wed, 18 Oct 2023 00:05:39 +0200
Date:   Wed, 18 Oct 2023 00:05:39 +0200
From:   Florian Westphal <fw@strlen.de>
To:     "U.Mutlu" <um@mutluit.com>
Cc:     Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: [nftables/nft] nft equivalent of "ipset test"
Message-ID: <20231017220539.GE5770@breakpoint.cc>
References: <652EC034.7090501@mutluit.com>
 <20231017213507.GD5770@breakpoint.cc>
 <652F02EC.2050807@mutluit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <652F02EC.2050807@mutluit.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

U.Mutlu <um@mutluit.com> wrote:
> Florian Westphal wrote on 10/17/23 23:35:
> > U.Mutlu <um@mutluit.com> wrote:
> > > The "ipset" commandline tool has the "test" command
> > > for testing whether a given item (ie. an IP) is in a given set.
> > > Is there an equivalent for the "nft" commandline tool of nftables?
> > > I unfortunately couldn't find the answer in the manpage of nft.
> > 
> > nft "get element inet tablename setname { 1.2.3.4 }"
> 
> But isn't that printing the whole item on stdout?
> I just need to quickly test it only,
> ie. need just a return code of 0 or 1, or so,
> for use in a shell script (bash).

?

nft "get element inet t s { 1.2.3.4 }" > /dev/null 2>&1; echo $?
1
nft "add element inet t s { 1.2.3.4 }"
nft "get element inet t s { 1.2.3.4 }" > /dev/null 2>&1; echo $?
0
