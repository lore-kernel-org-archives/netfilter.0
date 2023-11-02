Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07080C4332F
	for <netfilter@archiver.kernel.org>; Thu,  2 Nov 2023 10:26:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346102AbjKBK00 (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Thu, 2 Nov 2023 06:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345942AbjKBK0Z (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Thu, 2 Nov 2023 06:26:25 -0400
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F1C128
        for <netfilter@vger.kernel.org>; Thu,  2 Nov 2023 03:26:22 -0700 (PDT)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1qyUu3-0006qL-T6; Thu, 02 Nov 2023 11:26:19 +0100
Date:   Thu, 2 Nov 2023 11:26:19 +0100
From:   Florian Westphal <fw@strlen.de>
To:     Brian Davidson <davidson.brian@gmail.com>
Cc:     netfilter@vger.kernel.org
Subject: Re: meta time rules display after 00:00 UTC
Message-ID: <20231102102619.GD6174@breakpoint.cc>
References: <CAOoaxdFXq6aJJMrFC40PRqd7ZTJDroRVh-BpH8Vz7H618V5GYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOoaxdFXq6aJJMrFC40PRqd7ZTJDroRVh-BpH8Vz7H618V5GYQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Brian Davidson <davidson.brian@gmail.com> wrote:
> meta hour rules don't display properly after being created when the
> hour is on or after 00:00 UTC. The netlink debug looks correct for
> seconds past midnight UTC, but displaying the rules looks like an
> overflow or a byte order problem. I am in UTC-0400, so today, 20:00
> and later exhibits the problem, while 19:00 and earlier hours are
> fine.
> 
> nft add table ip t
> nft add chain ip t c
> nft add rule ip t c meta hour "19:00"-"19:59" counter
> nft add rule ip t c meta hour "20:00"-"20:59" counter
> nft list table ip t
> table ip t {
>         chain c {
>                 meta hour "19:00"-"19:59" counter packets 0 bytes 0
>                 meta hour "1193042:28:16"-"1193043:27:16" counter

Right, existing code is broken for negative offsets.

I'll post a fix later today.
