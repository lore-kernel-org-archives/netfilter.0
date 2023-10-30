Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9B7C4332F
	for <netfilter@archiver.kernel.org>; Mon, 30 Oct 2023 16:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233890AbjJ3QkX (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 30 Oct 2023 12:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbjJ3QkW (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 30 Oct 2023 12:40:22 -0400
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616D498
        for <netfilter@vger.kernel.org>; Mon, 30 Oct 2023 09:40:18 -0700 (PDT)
Received: from [78.30.35.151] (port=43492 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1qxVJF-009sm9-6n; Mon, 30 Oct 2023 17:40:15 +0100
Date:   Mon, 30 Oct 2023 17:40:11 +0100
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Volodymyr Litovka <doka@funlab.cc>
Cc:     netfilter@vger.kernel.org
Subject: Re: nftables / DHCP / NAT
Message-ID: <ZT/ca933Lkqlakx1@calendula>
References: <df94652d-d611-4713-963a-911d6b7ef986@funlab.cc>
 <ZT9sQZw2hmkM5nh2@calendula>
 <54fda956-92bd-4c14-b0e5-29445b53f04a@funlab.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <54fda956-92bd-4c14-b0e5-29445b53f04a@funlab.cc>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Mon, Oct 30, 2023 at 12:57:52PM +0100, Volodymyr Litovka wrote:
[...]
> the basic idea of this construction is to use later load balancing
> (https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing) between
> multiple destinations
>
[...]
>
> so on the first step (netdev) I'm setting dst mac to local (so packet will
> not be dropped as "alien", because I receive on this box mirrored (SPAN)
> traffic, where dst mac is not this box) and then load-balance it between
> multiple destinations using NAT/LB. As far as I understand, 'fwd' is for
> forwarding to a single destination.

You do not need to pass up packets to the IP stack for this purpose
and use stateful NAT, it makes things complicated.

You can combine the fwd statement with the numgen expression:

           ... fwd ip to numgen inc mod 2 map { \
                               0 : 192.168.10.100, \
                               1 : 192.168.10.110 } device "enp0s25"

this performs round-robin packet distribution over the two destination
IP addresses.

So the example in the wiki above also works fine for the fwd
statement.

If you would like to perform flow-based load balancing, you need to
create a dynamic set and store what destination IP address is used for
a given IP source for persistency.
