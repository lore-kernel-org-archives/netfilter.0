Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46699C072A2
	for <netfilter@archiver.kernel.org>; Fri, 17 Nov 2023 14:43:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbjKQOna (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Fri, 17 Nov 2023 09:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbjKQOna (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Fri, 17 Nov 2023 09:43:30 -0500
X-Greylist: delayed 488 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 17 Nov 2023 06:43:27 PST
Received: from box.jizzmail.com (box.jizzmail.com [165.232.137.228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22DE3A0
        for <netfilter@vger.kernel.org>; Fri, 17 Nov 2023 06:43:27 -0800 (PST)
Received: from authenticated-user (box.jizzmail.com [165.232.137.228])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by box.jizzmail.com (Postfix) with ESMTPSA id A18587EBAA
        for <netfilter@vger.kernel.org>; Fri, 17 Nov 2023 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jizzmail.com; s=mail;
        t=1700231718; bh=69tg5t3cgVLvIGuk4w7Cnjd4OFZpNYWGAyJmhh8GbbE=;
        h=Date:From:To:Subject:From;
        b=KRKYGQr5DnCfdm/uaCI3/GOORBk2UKeRxIUlRwrX7nPXajgDxjON8sclW0Pl/Bs4Z
         3qDfHQFOOA6v3hx6Ysv8y0qQ9mUZQc/U0f5pIncZsBsUzkgt8jjXAmkuA3jKu1zloF
         TONeH7UULnivjrqTewLSkqIhsHuh2hEHfEjeXDMQBe1a9GoqIxiJetWo0qf/9ggSVu
         nHPbXsSQbHBs36+CxI8Af8DsP1feohce00xoR57Iq7UtIVajBxIPzNsv+qad/b4G3H
         Eq1CExfT6TGqOnBgSqCK3zl6EXDVqI39mM6GsMLzDvh+JLdFV/T4/7e7vFnmgYTQfo
         8d01YwtogEG/Q==
MIME-Version: 1.0
Date:   Fri, 17 Nov 2023 15:35:18 +0100
From:   sixene@jizzmail.com
To:     netfilter@vger.kernel.org
Subject: Optimize fails on a large ruleset
Message-ID: <a3ced44ae902d4077c976fd6f1dc883c@jizzmail.com>
X-Sender: sixene@jizzmail.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi,
I hope this is the right channel to reach out for support, the wiki 
mentioned this mailing list.
I'm having trouble optimizing my large ruleset of 26000+ lines.
When I run 'nft -c -o -f ruleset.nft', after the while processes, I get 
the following error:
nft: optimize.c:423: merge_verdict_stmts: Assertion `0' failed.
Aborted (core dumped)

My ruleset mostly consists of just 'ip saddr x.x.x.x/xx counter packets 
0 bytes 0 drop'
Hope you can help, as I'm facing very bad performance with this list, 
however I have no choice because I need to block all of these addresses.
Thanks!

(i could not attach the file due to your service's policies, however i 
am using x4bnet's lists_vpn on github)
