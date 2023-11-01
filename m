Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5BD7C4332F
	for <netfilter@archiver.kernel.org>; Wed,  1 Nov 2023 08:32:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbjKAIc3 (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 1 Nov 2023 04:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjKAIc2 (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 1 Nov 2023 04:32:28 -0400
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9C8DF
        for <netfilter@vger.kernel.org>; Wed,  1 Nov 2023 01:32:26 -0700 (PDT)
Received: from [78.30.35.151] (port=54986 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1qy6eE-002Cwf-Ev; Wed, 01 Nov 2023 09:32:24 +0100
Date:   Wed, 1 Nov 2023 09:32:21 +0100
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Daniel <tech@tootai.net>
Cc:     Netfilter list <netfilter@vger.kernel.org>
Subject: Re: map problem with port range
Message-ID: <ZUINFUf9id6w7YUI@calendula>
References: <c0f8e0aa-93dd-46c6-9eda-7cb7934bf1c6@tootai.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c0f8e0aa-93dd-46c6-9eda-7cb7934bf1c6@tootai.net>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Tue, Oct 31, 2023 at 07:38:30PM +0100, Daniel wrote:
> Hi list
> 
> nft 1.02 I have following map configuration:
> 
> map forward_udp.lan {
>     type ipv6_addr . inet_service : interval ipv6_addr . inet_service
>     flags interval
>     elements = { 2001:db8::1 . 20000-24999 : 2001:db8:16e:10::ffee .
> 20000-24999 }
> }
> 
> ip6 chain prerouting
> 
> add rule ip6 nat prerouting ip6 daddr . udp dport map @forward_udp.lan

What is your intention with this rule?

Are you looking up for a matching packet in this map using

        ip6 daddr . udp dport

as key?
