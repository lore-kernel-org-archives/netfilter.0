Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270D9C4167B
	for <netfilter@archiver.kernel.org>; Mon, 30 Oct 2023 08:41:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbjJ3Ilr (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 30 Oct 2023 04:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjJ3Ilq (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 30 Oct 2023 04:41:46 -0400
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF92AA9
        for <netfilter@vger.kernel.org>; Mon, 30 Oct 2023 01:41:43 -0700 (PDT)
Received: from [78.30.35.151] (port=42478 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1qxNq6-007txM-NJ; Mon, 30 Oct 2023 09:41:40 +0100
Date:   Mon, 30 Oct 2023 09:41:37 +0100
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Volodymyr Litovka <doka@funlab.cc>
Cc:     netfilter@vger.kernel.org
Subject: Re: nftables / DHCP / NAT
Message-ID: <ZT9sQZw2hmkM5nh2@calendula>
References: <df94652d-d611-4713-963a-911d6b7ef986@funlab.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df94652d-d611-4713-963a-911d6b7ef986@funlab.cc>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Fri, Oct 27, 2023 at 06:32:45PM +0200, Volodymyr Litovka wrote:
> The question - what I'm doing wrong?

Description, ruleset and topology look a bit convoluted :-)

To start with:

        iifname "inspan" ...

is not really required, because you chain is already hooked at
"inspan" device see your chain declaration:

table netdev inspan {
    chain rewrit {
        # Drop everything except Radius Accounting and DHCP packets
        type filter hook ingress device "inspan" priority filter; policy drop;

Then, to forward packets to some other box from the 'netdev' family,
use the 'fwd' statement:

        udp dport 67 udp dport set 10067 counter fwd to 100.64.0.66 device "eth0"

This rule above is mangling your UDP destination port from 67 to
10067, then it send the packet to 100.64.0.66 and device "eth0". The
destination MAC address is updated by the neighbour layer so you do
not have to bother with "ether daddr set ...".
