Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0316FC001B5
	for <netfilter@archiver.kernel.org>; Mon,  6 Nov 2023 13:28:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbjKFN2e (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 6 Nov 2023 08:28:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232609AbjKFN2c (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 6 Nov 2023 08:28:32 -0500
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10B4F1
        for <netfilter@vger.kernel.org>; Mon,  6 Nov 2023 05:28:28 -0800 (PST)
Received: from [78.30.35.151] (port=54976 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1qzzeS-00FDnR-4c; Mon, 06 Nov 2023 14:28:26 +0100
Date:   Mon, 6 Nov 2023 14:28:22 +0100
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Aurel Wisse <nf@awisse.ca>
Cc:     netfilter@vger.kernel.org
Subject: Re: nftables expressions and operators
Message-ID: <ZUjp9jAAPYgOAIDq@calendula>
References: <74e3c950-e623-4b46-9186-8fe2230c9f9a@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <74e3c950-e623-4b46-9186-8fe2230c9f9a@app.fastmail.com>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Mon, Nov 06, 2023 at 08:11:09AM -0500, Aurel Wisse wrote:
> Hi,
> 
> I am starting to learn nftables (only superficial previous experience with iptables) and I can't find certain syntax rules for expressions and operators in the wiki or the man page.
> 
> I am learning by listing the rulesets of certain predefined firewalls (fw4/OpenWRT, UFW) and I notice that certain listed rules contain operators which I can guess (hopefully correctly) from context and the original syntax in the imported file, but I would like to be sure in order not to make mistakes while building my own firewall.
> 
> Examples:
> 
> tcp flags & (fin|syn|rst|ack) != syn jump syn_flood
> 
> becomes
> 
> tcp flags syn / fin,syn,rst,ack jump syn_flood 

That is a bug in nftables v1.0.2, here with recent version it shows:

tcp flags != syn / fin,syn,rst,ack

> So, from context, commas without spaces around them are equivalent to logical or with precedence over "/", and "/" is somehow "!=" ?? . Where did the & (logical AND?) operator go?
> 
> This is just one example. I would like to learn the full operator syntax rules in nftables. Any ideas where I should look ? Do I have to dig into the source code ?
> 
> Thanks
> 
> Aurel
> 
> nftables v1.0.2 (Lester Gooch)
> Pop-OS (6.5.6-76060506-generic)
