Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EF6C54E76
	for <netfilter@archiver.kernel.org>; Sat, 18 Nov 2023 18:35:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjKRSfS (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sat, 18 Nov 2023 13:35:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjKRSfS (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sat, 18 Nov 2023 13:35:18 -0500
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 912D0A4
        for <netfilter@vger.kernel.org>; Sat, 18 Nov 2023 10:35:12 -0800 (PST)
Received: from [78.30.43.141] (port=43970 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1r4Q9r-00BGpg-7P; Sat, 18 Nov 2023 19:35:09 +0100
Date:   Sat, 18 Nov 2023 19:35:05 +0100
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Sixene <notsixene@gmail.com>
Cc:     netfilter@vger.kernel.org
Subject: Re: Optimize fails on a large ruleset
Message-ID: <ZVkD2Yu9oKoyilC0@calendula>
References: <CABGCCVc7Qb5U131xUL3mwGtok61=2mwMUOqpe7B_8D+S0VNngA@mail.gmail.com>
 <ZVeMxYsNEgr7ZblO@calendula>
 <CABGCCVeMFcQvetiSLUhjOudvz3mLeo7quPLtHDkVQQobLHwfAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="QL+4ZueWO0qU0k1H"
Content-Disposition: inline
In-Reply-To: <CABGCCVeMFcQvetiSLUhjOudvz3mLeo7quPLtHDkVQQobLHwfAA@mail.gmail.com>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org


--QL+4ZueWO0qU0k1H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Nov 17, 2023 at 05:42:59PM +0100, Sixene wrote:
> Hi,
> After checking via dnf, it seems I'm running the latest version already.
> After some investigation I found out I had a lot of duplicate entries,
> after fixing this, I now get the error "Segmentation fault (core
> dumped)" with the same command.

No crash with nftables 1.0.9, what nftables version are you using?

I am attaching the output with your ruleset, running:

nft -c -o -f notsixene.nft

--QL+4ZueWO0qU0k1H
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="output.txt"

Merging:
notsixene.nft:4:9-60:         ip saddr 1.12.32.0/23 counter packets 0 bytes 0 drop
notsixene.nft:5:9-59:         ip saddr 1.14.0.0/15 counter packets 0 bytes 0 drop
notsixene.nft:6:9-60:         ip saddr 1.44.96.0/24 counter packets 0 bytes 0 drop
notsixene.nft:7:9-60:         ip saddr 1.116.0.0/15 counter packets 0 bytes 0 drop
notsixene.nft:8:9-61:         ip saddr 1.178.32.0/19 counter packets 0 bytes 0 drop
notsixene.nft:9:9-60:         ip saddr 1.247.4.0/24 counter packets 0 bytes 0 drop
notsixene.nft:10:9-61:         ip saddr 1.255.30.0/24 counter packets 0 bytes 0 drop
into:
	ip saddr { 1.12.32.0/23, 1.14.0.0/15, 1.44.96.0/24, 1.116.0.0/15, 1.178.32.0/19, 1.247.4.0/24, 1.255.30.0/24 } counter drop
Merging:
notsixene.nft:172:9-57:         tcp dport 9090 ct state { new, untracked } accept
notsixene.nft:173:9-55:         tcp dport 80 ct state { new, untracked } accept
notsixene.nft:174:9-58:         tcp dport 25565 ct state { new, untracked } accept
notsixene.nft:175:9-58:         tcp dport 25566 ct state { new, untracked } accept
into:
	tcp dport . ct state { 9090 . new, 9090 . untracked, 80 . new, 80 . untracked, 25565 . new, 25565 . untracked, 25566 . new, 25566 . untracked } accept
Merging:
notsixene.nft:176:9-58:         udp dport 25565 ct state { new, untracked } accept
notsixene.nft:177:9-58:         udp dport 25566 ct state { new, untracked } accept
into:
	ct state . udp dport { new . 25565, untracked . 25565, new . 25566, untracked . 25566 } accept
Merging:
notsixene.nft:178:9-58:         tcp dport 27015 ct state { new, untracked } accept
notsixene.nft:179:9-56:         tcp dport 443 ct state { new, untracked } accept
notsixene.nft:180:9-57:         tcp dport 8092 ct state { new, untracked } accept
notsixene.nft:181:9-57:         tcp dport 8093 ct state { new, untracked } accept
into:
	tcp dport . ct state { 27015 . new, 27015 . untracked, 443 . new, 443 . untracked, 8092 . new, 8092 . untracked, 8093 . new, 8093 . untracked } accept
Merging:
notsixene.nft:182:9-57:         udp dport 8092 ct state { new, untracked } accept
notsixene.nft:183:9-57:         udp dport 8093 ct state { new, untracked } accept
into:
	ct state . udp dport { new . 8092, untracked . 8092, new . 8093, untracked . 8093 } accept
Merging:
notsixene.nft:184:9-57:         tcp dport 8080 ct state { new, untracked } accept
notsixene.nft:185:9-57:         tcp dport 8181 ct state { new, untracked } accept
notsixene.nft:186:9-57:         tcp dport 4430 ct state { new, untracked } accept
notsixene.nft:187:9-58:         tcp dport 34523 ct state { new, untracked } accept
notsixene.nft:188:9-57:         tcp dport 8000 ct state { new, untracked } accept
notsixene.nft:189:9-57:         tcp dport 8010 ct state { new, untracked } accept
into:
	tcp dport . ct state { 8080 . new, 8080 . untracked, 8181 . new, 8181 . untracked, 4430 . new, 4430 . untracked, 34523 . new, 34523 . untracked, 8000 . new, 8000 . untracked, 8010 . new, 8010 . untracked } accept
Merging:
notsixene.nft:314:9-45:         icmpv6 type nd-neighbor-advert accept
notsixene.nft:315:9-46:         icmpv6 type nd-neighbor-solicit accept
notsixene.nft:316:9-43:         icmpv6 type nd-router-advert accept
notsixene.nft:317:9-38:         icmpv6 type nd-redirect accept
into:
	icmpv6 type { nd-neighbor-advert, nd-neighbor-solicit, nd-router-advert, nd-redirect } accept

--QL+4ZueWO0qU0k1H--
