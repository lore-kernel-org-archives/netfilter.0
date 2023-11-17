Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CA0C072A2
	for <netfilter@archiver.kernel.org>; Fri, 17 Nov 2023 16:53:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346091AbjKQQxB convert rfc822-to-8bit (ORCPT
        <rfc822;netfilter@archiver.kernel.org>);
        Fri, 17 Nov 2023 11:53:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235340AbjKQQxA (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Fri, 17 Nov 2023 11:53:00 -0500
X-Greylist: delayed 483 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 17 Nov 2023 08:52:53 PST
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se [213.80.101.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B523DD56
        for <netfilter@vger.kernel.org>; Fri, 17 Nov 2023 08:52:53 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 3127B3F84C;
        Fri, 17 Nov 2023 17:44:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id bnvZ_DVXWYhP; Fri, 17 Nov 2023 17:44:47 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 0B0B13F83C;
        Fri, 17 Nov 2023 17:44:46 +0100 (CET)
Received: from [192.168.0.132] (port=45240)
        by tnonline.net with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.96.2)
        (envelope-from <mail@lechevalier.se>)
        id 1r41xV-000N7U-0F;
        Fri, 17 Nov 2023 17:44:46 +0100
Date:   Fri, 17 Nov 2023 17:44:44 +0100 (GMT+01:00)
From:   A L <mail@lechevalier.se>
To:     Sixene <notsixene@gmail.com>, netfilter@vger.kernel.org
Message-ID: <fd4f5a.99940919.18bde2ba570@lechevalier.se>
In-Reply-To: <CABGCCVc7Qb5U131xUL3mwGtok61=2mwMUOqpe7B_8D+S0VNngA@mail.gmail.com>
References: <CABGCCVc7Qb5U131xUL3mwGtok61=2mwMUOqpe7B_8D+S0VNngA@mail.gmail.com>
Subject: Re: Optimize fails on a large ruleset
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
X-Mailer: R2Mail2
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org



---- From: Sixene <notsixene@gmail.com> -- Sent: 2023-11-17 - 15:40 ----

> Hi,
> I hope this is the right channel to reach out for support, the wiki
> mentioned this mailing list.
> I'm having trouble optimizing my large ruleset of 26000+ lines.
> When I run 'nft -c -o -f ruleset.nft', after the while processes, I
> get the following error:
> nft: optimize.c:423: merge_verdict_stmts: Assertion `0' failed.
> Aborted (core dumped)
> 
> My ruleset mostly consists of just 'ip saddr x.x.x.x/xx counter
> packets 0 bytes 0 drop'
> Hope you can help, as I'm facing very bad performance with this list,
> however I have no choice because I need to block all of these
> addresses.
> Thanks!

A workaround would be to use ipset. But it only works with the iptables version netfilter, AFAIK. Ipset is optimised to handle large sets of addresses. 

https://ipset.netfilter.org/


> 
> (i could not attach the file due to your service's policies, however i
> am using x4bnet's lists_vpn on github)


