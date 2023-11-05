Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E792C4332F
	for <netfilter@archiver.kernel.org>; Sun,  5 Nov 2023 15:27:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjKEP2A (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sun, 5 Nov 2023 10:28:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjKEP17 (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sun, 5 Nov 2023 10:27:59 -0500
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736A5A7
        for <netfilter@vger.kernel.org>; Sun,  5 Nov 2023 07:27:55 -0800 (PST)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1qzf2X-0001mw-4N; Sun, 05 Nov 2023 16:27:53 +0100
Date:   Sun, 5 Nov 2023 16:27:53 +0100
From:   Florian Westphal <fw@strlen.de>
To:     Tech <tech@tootai.net>
Cc:     Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Redirect doesn't do the job as dnat does
Message-ID: <20231105152753.GA21055@breakpoint.cc>
References: <71be06b8-6aa0-4cf9-9e0b-e2839b01b22f@tootai.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71be06b8-6aa0-4cf9-9e0b-e2839b01b22f@tootai.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Tech <tech@tootai.net> wrote:
> in another terminal I run
> nc -vl :: 58198
> Listening on :: 58198

Please also spawn tcdump -n "tcp port 58198 or tcp port 58194"
