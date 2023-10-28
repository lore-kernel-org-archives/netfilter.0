Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B796BC27C47
	for <netfilter@archiver.kernel.org>; Sat, 28 Oct 2023 10:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjJ1KCK (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sat, 28 Oct 2023 06:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjJ1KCJ (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sat, 28 Oct 2023 06:02:09 -0400
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 042E9E0
        for <netfilter@vger.kernel.org>; Sat, 28 Oct 2023 03:02:06 -0700 (PDT)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1qwg8q-0002LY-KV; Sat, 28 Oct 2023 12:02:04 +0200
Date:   Sat, 28 Oct 2023 12:02:04 +0200
From:   Florian Westphal <fw@strlen.de>
To:     Valentijn Sessink <valentijn@sessink.nl>
Cc:     netfilter@vger.kernel.org
Subject: Re: arptables-nft and comments in nft output
Message-ID: <20231028100204.GA21160@breakpoint.cc>
References: <8108fd99-25f2-49a9-8ef8-18c2de253163@sessink.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8108fd99-25f2-49a9-8ef8-18c2de253163@sessink.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Valentijn Sessink <valentijn@sessink.nl> wrote:
> I'm using arptables (nft iptables version 1.8.7) with
> arptables -A OUTPUT -d 10.21.22.129 -j mangle --mangle-ip-s 10.21.22.161
> 
> Now I'm a bit confused by the nft output:
> 
> table arp filter {
> 	chain OUTPUT {
> 		type filter hook output priority filter; policy accept;
> 		arp htype 1 arp hlen 6 arp plen 4 arp daddr ip 10.21.22.129 counter
> packets 1288 bytes 54096 # --mangle-ip-s 10.21.22.161	}
> }
> 
> The nft wiki only says "In the case of some missing translation, you will
> see a commented rule in nftables" - but it doesn't say what to do.
> 
> Now I'm confused. Does this mean that I cannot use "nft" to setup this very
> rule? Should I use "arptables-nft" to set this rule? Or is there another
> way?

It might just be a missing translation.

You could try to see if this works:

nft add rule arp filter OUTPUT \
  arp htype 1 arp hlen 6 arp plen 4 arp daddr ip 10.21.22.129 \
  arp saddr ip set 10.21.22.161 counter
