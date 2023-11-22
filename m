Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865DBC61D9B
	for <netfilter@archiver.kernel.org>; Wed, 22 Nov 2023 12:37:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235112AbjKVMhU (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 22 Nov 2023 07:37:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjKVMhT (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 22 Nov 2023 07:37:19 -0500
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C88312A
        for <netfilter@vger.kernel.org>; Wed, 22 Nov 2023 04:37:15 -0800 (PST)
Received: from [78.30.43.141] (port=46126 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1r5mTe-00CeEs-Ko; Wed, 22 Nov 2023 13:37:13 +0100
Date:   Wed, 22 Nov 2023 13:37:09 +0100
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Martin Gignac <martin.gignac@gmail.com>
Cc:     netfilter@vger.kernel.org
Subject: Re: Getting error "Error: missing hook and priority in flowtable
 declaration" in nftables 1.0.9
Message-ID: <ZV319SBesJtqB7dj@calendula>
References: <CANf9dFNCeUf20yza=ika3YYGH1RjUwagWOkoCCg8=aGnNCQs3Q@mail.gmail.com>
 <ZV3JJtLjIdLY54PD@calendula>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZV3JJtLjIdLY54PD@calendula>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Wed, Nov 22, 2023 at 10:26:02AM +0100, Pablo Neira Ayuso wrote:
[...]
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20231122085912.3098-1-pablo@netfilter.org/

For the record, patch is applied:

http://git.netfilter.org/nftables/commit/?id=59d304f47a121afda867d792c709bc2c81946979
