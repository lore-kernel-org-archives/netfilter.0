Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C70CDB482
	for <netfilter@archiver.kernel.org>; Wed, 18 Oct 2023 12:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjJRMFa (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 18 Oct 2023 08:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjJRMF2 (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 18 Oct 2023 08:05:28 -0400
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64657112
        for <netfilter@vger.kernel.org>; Wed, 18 Oct 2023 05:05:26 -0700 (PDT)
Received: from [78.30.34.192] (port=45014 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1qt5Ig-00Cp0w-Df; Wed, 18 Oct 2023 14:05:24 +0200
Date:   Wed, 18 Oct 2023 14:05:21 +0200
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Markus Wigge <wigge@bht-berlin.de>
Cc:     netfilter@vger.kernel.org
Subject: Re: commit to kernel fails since Debian 12 (bookworm)
Message-ID: <ZS/KAY6Jss8TbOr/@calendula>
References: <faf92623-95a9-4999-b02a-e40108f133ca@bht-berlin.de>
 <ZSlXJdqfKFxF0OcO@calendula>
 <6289ae8d-7d8e-40a5-a012-3e6e32251942@bht-berlin.de>
 <ZS0TvfCRySTWfdW6@calendula>
 <43708702-0f37-4ea6-9b3d-4dc8ac2913a1@bht-berlin.de>
 <ZS2qCnq6c+mKyDa3@calendula>
 <0f294468-d7c5-477c-b95f-6a5ce68fd79e@bht-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0f294468-d7c5-477c-b95f-6a5ce68fd79e@bht-berlin.de>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

On Wed, Oct 18, 2023 at 01:31:26PM +0200, Markus Wigge wrote:
> Hello,
> 
> > So VLAN interfaces are distributed between nodes and, on failover, one
> > node picks up the VLAN interfaces of the node that is failing? I am
> > trying to understand if, in your setup, one node is active but is is
> > also at the same time a backup for the flows that are handled by the
> > other node.
>
> Yes, the VLAN interfaces are available on both nodes but only one nodes has
> configured IP addresses on the interface. The other nodes only takes over
> the address with keepalived if necessary.
> 
> So could it be possible, that the kernel notices flows on the passive VLAN
> interface?

Then, I assume there is HA daemon that sets this IP on the VLAN
interface. From what you describe, disabling _loose connection pickup
should be safe.

> > This is how it works with net.netfilter.nf_conntrack_tcp_loose = 1,
> > that toggle enables "poor man" connection pickup, that is, the kernel
> > infers from the middle of the connection the current state.
>
> But why does the kernel see this connection at all when it flow over the
> other node?
> 
> > > > Is your ruleset dropping invalid packets?
> > > 
> > > Only for smurfs as far as I can see:
> > > >   203M   19G smurfs     0    --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID,NEW,UNTRACKED
> > > 
> > > > Chain smurfs (7 references)
> > > >   pkts bytes target     prot opt in     out     source               destination
> > > >    19M 6211M RETURN     0    --  *      *       0.0.0.0              0.0.0.0/0
> > > >      0     0 smurflog   0    --  *      *       0.0.0.0/0            0.0.0.0/0           [goto]  ADDRTYPE match src-type BROADCAST
> > > >      0     0 smurflog   0    --  *      *       224.0.0.0/4          0.0.0.0/0           [goto]
> > 
> > This RETURN means you take back invalid packets to the chain where the
> > jump to smurfs happen.
>
> Yes and there are dedicated chains for the configured zones which each drop
> INVALID packets.

Yes, but _loose is disabled. And I suspect _be_liberal is disabled
too, invalid packets are unlikely with this configuration.

> > > Following the logs it appears to me that every single entry is getting
> > > late then. I doubt that and don't see where state should come from
> > > beforehand.
> > 
> >  From datapath itself, from the _loose mechanism that is enabled.
>
> What datapath? The passive node should not be involved with the flows of the
> other node?

As said, EBUSY means conntrackd is trying to update an existing entry
in the kernel.

How is all this going on, you have to diagnose in your setup.

There is `conntrack -E` which shows the tag [USERSPACE] for entries
that are created by conntrackd.

    [NEW] tcp      6 10 ESTABLISHED src=1.1.1.1 dst=2.2.2.2 sport=10 dport=20 [UNREPLIED] src=2.2.2.2 dst=1.1.1.1 sport=20 dport=10 mark=0 [USERSPACE] portid=2149
