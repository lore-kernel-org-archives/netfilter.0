Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CD4C4167B
	for <netfilter@archiver.kernel.org>; Wed,  8 Nov 2023 10:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235460AbjKHKSR (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 8 Nov 2023 05:18:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231674AbjKHKSQ (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 8 Nov 2023 05:18:16 -0500
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C869B
        for <netfilter@vger.kernel.org>; Wed,  8 Nov 2023 02:18:14 -0800 (PST)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1r0fdT-0005h7-P5; Wed, 08 Nov 2023 11:18:11 +0100
Date:   Wed, 8 Nov 2023 11:18:11 +0100
From:   Florian Westphal <fw@strlen.de>
To:     Tech <tech@tootai.net>
Cc:     Florian Westphal <fw@strlen.de>,
        Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Redirect doesn't do the job as dnat does
Message-ID: <20231108101811.GE5721@breakpoint.cc>
References: <71be06b8-6aa0-4cf9-9e0b-e2839b01b22f@tootai.net>
 <20231105152753.GA21055@breakpoint.cc>
 <a7f19ab3-5fc8-4816-a403-9ae2a4b51358@tootai.net>
 <20231108093300.GD5721@breakpoint.cc>
 <fde3f97b-c58b-400f-978a-7b4810507da3@tootai.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fde3f97b-c58b-400f-978a-7b4810507da3@tootai.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Tech <tech@tootai.net> wrote:
> > The dump was very boring, shows SYNs without any replies. redirect is
> > the same as dnat, except that redirect just takes the first address that
> > it finds on the given interface. So I'd guess that it picks an unusable
> > one, e.g. link-local. Can you post 'ip -6 addr show dev $dev" ?
> 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP
> group default qlen 1000
>     altname enp0s3
>     altname ens3
>     inet6 ::ffff:100.64.229.29/96 scope global
>        valid_lft forever preferred_lft forever
>     inet6 2a01:4f8:c0c:9e5b::1/64 scope global
>        valid_lft forever preferred_lft forever

Thanks.  Its probably pulling he mapped address
from the list.

I think we'll need to try harder.  Can you test a patch?
