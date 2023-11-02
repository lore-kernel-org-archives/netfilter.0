Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA58C4332F
	for <netfilter@archiver.kernel.org>; Thu,  2 Nov 2023 10:15:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346256AbjKBKP4 (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Thu, 2 Nov 2023 06:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345946AbjKBKPy (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Thu, 2 Nov 2023 06:15:54 -0400
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD104128
        for <netfilter@vger.kernel.org>; Thu,  2 Nov 2023 03:15:51 -0700 (PDT)
Received: from [78.30.35.151] (port=33576 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1qyUjo-008L0X-3S; Thu, 02 Nov 2023 11:15:46 +0100
Date:   Thu, 2 Nov 2023 11:15:42 +0100
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Daniel <tech@tootai.net>
Cc:     Netfilter list <netfilter@vger.kernel.org>, fw@strlen.de
Subject: Re: map problem with port range
Message-ID: <ZUN2zmoKfXYpBrcx@calendula>
References: <c0f8e0aa-93dd-46c6-9eda-7cb7934bf1c6@tootai.net>
 <ZUINFUf9id6w7YUI@calendula>
 <906a00d3-8d3c-4ea5-9bda-40ae905856a3@tootai.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <906a00d3-8d3c-4ea5-9bda-40ae905856a3@tootai.net>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Then, this:

  table inet filter {
        map forward_udp.lan {
             type ipv6_addr . inet_service : interval ipv6_addr . inet_service
             flags interval
             elements = { 2001:db8::1 . 20000-24999 : 2001:db8:16e:10::ffee . 20000-24999 }
        }

        chain y {
                ip6 daddr . udp dport @forward_udp.lan
        }
  }

Note that you require a Linux kernel >= 6.4 which contains this fix:

commit a4878eeae39048e6abe85891c714b49dc13fc08c
Author: Florian Westphal <fw@strlen.de>
Date:   Fri May 12 14:19:47 2023 +0200

    netfilter: nf_tables: relax set/map validation checks

Probably there is a chance to request to enqueue this for -stable,
because a simple look up on a map is something that should be working
since day 0.


No 'map' keyword, such keyword is only required when you want to make a
map lookup, e.g.

        dnat ip6 to ip6 daddr . udp dport map @forward_udp.lan
                    ^^^^^^^^^^^^^^^^^^^^^

then you make a map lookup using the key above.
