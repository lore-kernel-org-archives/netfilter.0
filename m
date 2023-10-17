Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB925CDB474
	for <netfilter@archiver.kernel.org>; Tue, 17 Oct 2023 17:11:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343976AbjJQRLX (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Tue, 17 Oct 2023 13:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343950AbjJQRLU (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Tue, 17 Oct 2023 13:11:20 -0400
Received: from mail.mutluit.com (mail.mutluit.com [195.201.130.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BE949FF
        for <netfilter@vger.kernel.org>; Tue, 17 Oct 2023 10:11:18 -0700 (PDT)
Received: from [127.0.0.1] (mail.mutluit.com [195.201.130.20]:60076)
        by mail.mutluit.com (mail.mutluit.com [195.201.130.20]:50025) with ESMTP ([XMail 1.27 ESMTP Server])
        id <S1723100> for <netfilter@vger.kernel.org> from <um@mutluit.com>;
        Tue, 17 Oct 2023 19:11:17 +0200
To:     netfilter@vger.kernel.org
From:   "U.Mutlu" <um@mutluit.com>
Subject: [nftables/nft] nft equivalent of "ipset test"
Organization: mutluit.com
Message-ID: <652EC034.7090501@mutluit.com>
Date:   Tue, 17 Oct 2023 19:11:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:40.0) Gecko/20100101
 Firefox/40.0 SeaMonkey/2.37a1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

The "ipset" commandline tool has the "test" command
for testing whether a given item (ie. an IP) is in a given set.
Is there an equivalent for the "nft" commandline tool of nftables?
I unfortunately couldn't find the answer in the manpage of nft.

Thx
