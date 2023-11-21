Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8AB2C5ACB3
	for <netfilter@archiver.kernel.org>; Tue, 21 Nov 2023 09:21:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbjKUJWB (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Tue, 21 Nov 2023 04:22:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjKUJWA (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Tue, 21 Nov 2023 04:22:00 -0500
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBC210E
        for <netfilter@vger.kernel.org>; Tue, 21 Nov 2023 01:21:56 -0800 (PST)
Received: from [78.30.43.141] (port=49764 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1r5Mx4-0072a4-L1; Tue, 21 Nov 2023 10:21:52 +0100
Date:   Tue, 21 Nov 2023 10:21:49 +0100
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     =?utf-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <krajnak@levonet.sk>
Cc:     netfilter@vger.kernel.org
Subject: Re: Performing NAT 1:1 without connection tracking
Message-ID: <ZVx2rV3XcNZPy1wf@calendula>
References: <860A059C-354B-45F3-9BCA-5387927F1D1E@levonet.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <860A059C-354B-45F3-9BCA-5387927F1D1E@levonet.sk>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Tue, Nov 21, 2023 at 09:52:33AM +0100, Blažej Krajňák wrote:
> 
> Hello everyone,
> 
> I’m wondering if is it possible to perform NAT 1:1 without using conntrack table/module at all?
> Of course using nftables / iptables.

There is stateless NAT, if that is what you are searching for.

https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)#Stateless_NAT

> Because for now I see xdp/bpf as the only way. 
> 
> 
> 
> Thanks
> Blažej
