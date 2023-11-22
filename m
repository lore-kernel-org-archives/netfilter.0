Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A23C61D9C
	for <netfilter@archiver.kernel.org>; Wed, 22 Nov 2023 09:26:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjKVJ0T (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 22 Nov 2023 04:26:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235229AbjKVJ0R (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 22 Nov 2023 04:26:17 -0500
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F061A4
        for <netfilter@vger.kernel.org>; Wed, 22 Nov 2023 01:26:05 -0800 (PST)
Received: from [78.30.43.141] (port=56768 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1r5jUd-00BzbP-Q0; Wed, 22 Nov 2023 10:26:02 +0100
Date:   Wed, 22 Nov 2023 10:25:58 +0100
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Martin Gignac <martin.gignac@gmail.com>
Cc:     netfilter@vger.kernel.org
Subject: Re: Getting error "Error: missing hook and priority in flowtable
 declaration" in nftables 1.0.9
Message-ID: <ZV3JJtLjIdLY54PD@calendula>
References: <CANf9dFNCeUf20yza=ika3YYGH1RjUwagWOkoCCg8=aGnNCQs3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANf9dFNCeUf20yza=ika3YYGH1RjUwagWOkoCCg8=aGnNCQs3Q@mail.gmail.com>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Sun, Nov 19, 2023 at 04:36:53PM -0500, Martin Gignac wrote:
> (resending because not sure the first time went through)
> 
> Hi,
> 
> I'm seeing a difference in behavior between nftables 1.0.7 and 1.0.9
> with regards to flowtables:
> 
>     # nft -v
>     nftables v1.0.7 (Old Doc Yak)
>     # ip link add dummy1 type dummy
>     # ip link set dummy1 up
>     # nft 'create flowtable inet filter f1 { hook ingress priority 0; counter }'
>     # nft 'add flowtable inet filter f1 { devices = { dummy1 } ; }'
>     (no output)
> 
> 
>     # nft -v
>     nftables v1.0.9 (Old Doc Yak #3)
>     # ip link add dummy1 type dummy
>     # ip link set dummy1 up
>     # nft 'create flowtable inet filter f1 { hook ingress priority 0; counter }'
>     # nft 'add flowtable inet filter f1 { devices = { dummy1 } ; }'
>     Error: missing hook and priority in flowtable declaration
>     add flowtable inet filter f1 { devices = { dummy1 } ; }
>                              ^^^^^^^^^^^^^^^^^^^^^^^^
> 
> I don't understand the error: "Error: missing hook and priority in
> flowtable declaration" since I HAVE indicated a hook and priority with
> the command "nft 'create flowtable inet filter f1 { hook ingress
> priority 0; counter }'", which worked before, but now doesn't.
> 
> What am I missing?

This is bug of mine, apologies.

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20231122085912.3098-1-pablo@netfilter.org/
