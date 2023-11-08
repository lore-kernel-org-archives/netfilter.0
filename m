Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF0FC4167B
	for <netfilter@archiver.kernel.org>; Wed,  8 Nov 2023 09:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbjKHJdF (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 8 Nov 2023 04:33:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjKHJdE (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 8 Nov 2023 04:33:04 -0500
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8BA1A6
        for <netfilter@vger.kernel.org>; Wed,  8 Nov 2023 01:33:02 -0800 (PST)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1r0evk-0005GI-RG; Wed, 08 Nov 2023 10:33:00 +0100
Date:   Wed, 8 Nov 2023 10:33:00 +0100
From:   Florian Westphal <fw@strlen.de>
To:     Tech <tech@tootai.net>
Cc:     Florian Westphal <fw@strlen.de>,
        Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Redirect doesn't do the job as dnat does
Message-ID: <20231108093300.GD5721@breakpoint.cc>
References: <71be06b8-6aa0-4cf9-9e0b-e2839b01b22f@tootai.net>
 <20231105152753.GA21055@breakpoint.cc>
 <a7f19ab3-5fc8-4816-a403-9ae2a4b51358@tootai.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7f19ab3-5fc8-4816-a403-9ae2a4b51358@tootai.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Tech <tech@tootai.net> wrote:
> Le 05/11/2023 à 16:27, Florian Westphal a écrit :
> 
> > Tech<tech@tootai.net>  wrote:
> > > in another terminal I run
> > > nc -vl :: 58198
> > > Listening on :: 58198
> > Please also spawn tcdump -n "tcp port 58198 or tcp port 58194"
> Sended per PM

The dump was very boring, shows SYNs without any replies.

redirect is the same as dnat, except that redirect just takes
the first address that it finds on the given interface.

So I'd guess that it picks an unusable one, e.g. link-local.

Can you post 'ip -6 addr show dev $dev" ?

