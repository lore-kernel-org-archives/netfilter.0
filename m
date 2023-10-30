Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272E9C4332F
	for <netfilter@archiver.kernel.org>; Mon, 30 Oct 2023 17:23:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233838AbjJ3RXC (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 30 Oct 2023 13:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjJ3RXA (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 30 Oct 2023 13:23:00 -0400
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FEAEDF
        for <netfilter@vger.kernel.org>; Mon, 30 Oct 2023 10:22:53 -0700 (PDT)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
        (envelope-from <fw@strlen.de>)
        id 1qxVyU-00065e-MO; Mon, 30 Oct 2023 18:22:50 +0100
Date:   Mon, 30 Oct 2023 18:22:50 +0100
From:   Florian Westphal <fw@strlen.de>
To:     Florian Westphal <fw@strlen.de>
Cc:     Valentijn Sessink <valentijn@sessink.nl>, netfilter@vger.kernel.org
Subject: Re: arptables-nft and comments in nft output
Message-ID: <20231030172250.GC21160@breakpoint.cc>
References: <8108fd99-25f2-49a9-8ef8-18c2de253163@sessink.nl>
 <20231028100204.GA21160@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028100204.GA21160@breakpoint.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Florian Westphal <fw@strlen.de> wrote:
> Valentijn Sessink <valentijn@sessink.nl> wrote:
> > I'm using arptables (nft iptables version 1.8.7) with
> > arptables -A OUTPUT -d 10.21.22.129 -j mangle --mangle-ip-s 10.21.22.161
> > 
> > Now I'm a bit confused by the nft output:
> > 
> > table arp filter {
> > 	chain OUTPUT {
> > 		type filter hook output priority filter; policy accept;
> > 		arp htype 1 arp hlen 6 arp plen 4 arp daddr ip 10.21.22.129 counter
> > packets 1288 bytes 54096 # --mangle-ip-s 10.21.22.161	}
> > }
> > 
> > The nft wiki only says "In the case of some missing translation, you will
> > see a commented rule in nftables" - but it doesn't say what to do.
> > 
> > Now I'm confused. Does this mean that I cannot use "nft" to setup this very
> > rule? Should I use "arptables-nft" to set this rule? Or is there another
> > way?
> 
> It might just be a missing translation.

FWIW I've started to implement arptables-translate to provide the
needed translations.
