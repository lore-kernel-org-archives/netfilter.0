Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CADCCDB47E
	for <netfilter@archiver.kernel.org>; Wed, 18 Oct 2023 09:23:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjJRJXP (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 18 Oct 2023 05:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjJRJXO (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 18 Oct 2023 05:23:14 -0400
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F247F7
        for <netfilter@vger.kernel.org>; Wed, 18 Oct 2023 02:23:11 -0700 (PDT)
Received: from [78.30.34.192] (port=45238 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1qt2lf-00BysA-9N; Wed, 18 Oct 2023 11:23:09 +0200
Date:   Wed, 18 Oct 2023 11:23:05 +0200
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     "U.Mutlu" <um@mutluit.com>
Cc:     Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org
Subject: Re: [nftables/nft] nft equivalent of "ipset test"
Message-ID: <ZS+j+fCU9vehzJqY@calendula>
References: <652EC034.7090501@mutluit.com>
 <20231017213507.GD5770@breakpoint.cc>
 <652F02EC.2050807@mutluit.com>
 <20231017220539.GE5770@breakpoint.cc>
 <652F0C75.8010006@mutluit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <652F0C75.8010006@mutluit.com>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Wed, Oct 18, 2023 at 12:36:37AM +0200, U.Mutlu wrote:
> Florian Westphal wrote on 10/18/23 00:05:
> > U.Mutlu <um@mutluit.com> wrote:
> > > Florian Westphal wrote on 10/17/23 23:35:
> > > > U.Mutlu <um@mutluit.com> wrote:
> > > > > The "ipset" commandline tool has the "test" command
> > > > > for testing whether a given item (ie. an IP) is in a given set.
> > > > > Is there an equivalent for the "nft" commandline tool of nftables?
> > > > > I unfortunately couldn't find the answer in the manpage of nft.
> > > > 
> > > > nft "get element inet tablename setname { 1.2.3.4 }"
> > > 
> > > But isn't that printing the whole item on stdout?
> > > I just need to quickly test it only,
> > > ie. need just a return code of 0 or 1, or so,
> > > for use in a shell script (bash).
> > 
> > ?
> > 
> > nft "get element inet t s { 1.2.3.4 }" > /dev/null 2>&1; echo $?
> > 1
> > nft "add element inet t s { 1.2.3.4 }"
> > nft "get element inet t s { 1.2.3.4 }" > /dev/null 2>&1; echo $?
> > 0
> 
> Actualy I need to do this monster:   :-)
> 
> IP="1.2.3.4"
> ! nft "get element inet mytable myset  { $IP }" > /dev/null 2>&1 && \
> ! nft "get element inet mytable myset2 { $IP }" > /dev/null 2>&1 && \
>   nft "add element inet mytable myset  { $IP }"

Use 'nft create element' if you want to fail if element already
exists.

> Ie. add it to the set myset only if it's not already present in any of myset
> and myset2.
> 
> A true "test" command w/o any output, much like in "ipset test", would be a
> better method, IMO.
> 
> I've not switched yet to nftables, just (dry-) evaluating it.
