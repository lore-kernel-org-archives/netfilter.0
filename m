Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83490C27C40
	for <netfilter@archiver.kernel.org>; Wed, 22 Nov 2023 21:04:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbjKVVEP (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 22 Nov 2023 16:04:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbjKVVEO (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 22 Nov 2023 16:04:14 -0500
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 581471A4
        for <netfilter@vger.kernel.org>; Wed, 22 Nov 2023 13:04:10 -0800 (PST)
Received: from [78.30.43.141] (port=34120 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1r5uOD-00EPuQ-Ul; Wed, 22 Nov 2023 22:04:08 +0100
Date:   Wed, 22 Nov 2023 22:04:04 +0100
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Kamil =?utf-8?B?Sm/FhGNh?= <kjonca@op.pl>
Cc:     netfilter@vger.kernel.org
Subject: Re: nft ends with error
Message-ID: <ZV5sxC/YNUDeFgcE@calendula>
References: <8734wxtz3k.fsf@alfa.kjonca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8734wxtz3k.fsf@alfa.kjonca>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Wed, Nov 22, 2023 at 07:35:59PM +0100, Kamil Jońca wrote:
> sudo nft --version
> nftables v1.0.9 (Old Doc Yak #3)
> 
> Recently my nftables debian service started to ends with error:
> 
> --8<---------------cut here---------------start------------->8---
> Nov 22 19:18:56 alfa systemd[1]: Starting nftables.service - nftables...
> Nov 22 19:18:57 alfa nft[2242551]: nft: datatype.c:1264: datatype_free: Assertion `dtype->refcnt != 0' failed.
> Nov 22 19:18:57 alfa systemd[1]: nftables.service: Failed with result 'signal'.
> Nov 22 19:18:57 alfa systemd[1]: Failed to start nftables.service - nftables.
> 
> --8<---------------cut here---------------end--------------->8---
> 
> After some investigating I found that nft does not like definition;
> 
> --8<---------------cut here---------------start------------->8---
> table ip filter {
> ...
>         map ipsec_in {
>                 typeof ipsec in reqid . iif : verdict
>                 flags interval
>         }
> ...
> 
>   chain INPUT {
>         type filter hook input priority 0; policy drop
>         ...
>         ipsec in reqid . iif vmap @ipsec_in
>         ...
>     }
> ...
> }
> --8<---------------cut here---------------end--------------->8---
> 
> rules seems to be loaded entirely and works.

Thanks for this reproducer. Proposed fix:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20231122210106.183932-1-pablo@netfilter.org/
