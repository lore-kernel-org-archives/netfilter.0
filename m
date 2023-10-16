Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B14CDB465
	for <netfilter@archiver.kernel.org>; Mon, 16 Oct 2023 21:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbjJPVYg (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 16 Oct 2023 17:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbjJPVYf (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 16 Oct 2023 17:24:35 -0400
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE378A7
        for <netfilter@vger.kernel.org>; Mon, 16 Oct 2023 14:24:33 -0700 (PDT)
Received: from [78.30.34.192] (port=34942 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1qsV4c-000cEt-VW; Mon, 16 Oct 2023 23:24:29 +0200
Date:   Mon, 16 Oct 2023 23:24:26 +0200
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Markus Wigge <wigge@bht-berlin.de>
Cc:     netfilter@vger.kernel.org
Subject: Re: commit to kernel fails since Debian 12 (bookworm)
Message-ID: <ZS2qCnq6c+mKyDa3@calendula>
References: <faf92623-95a9-4999-b02a-e40108f133ca@bht-berlin.de>
 <ZSlXJdqfKFxF0OcO@calendula>
 <6289ae8d-7d8e-40a5-a012-3e6e32251942@bht-berlin.de>
 <ZS0TvfCRySTWfdW6@calendula>
 <43708702-0f37-4ea6-9b3d-4dc8ac2913a1@bht-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <43708702-0f37-4ea6-9b3d-4dc8ac2913a1@bht-berlin.de>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi Markus,

On Mon, Oct 16, 2023 at 01:02:35PM +0000, Markus Wigge wrote:
> >> With each received message I got a "device or resource busy" when conntrackd
> >> tried to commit it to the kernel.
> >>
> >> When I try to commit the cache now I get all the same errors but at once ;-)
> >
> > That means there is already an entry in the kernel.
>
> Is there any known change between bullseye and bookworm that might
> explain this? Unfortunately I am not so deep inside the kernel mechanics
> involved here.

The only spots where EBUSY could reasonably happen in the kernel is here:

static int
ctnetlink_update_status(struct nf_conn *ct, const struct nlattr * const cda[])
{
        unsigned int status = ntohl(nla_get_be32(cda[CTA_STATUS]));
        unsigned long d = ct->status ^ status;

        if (d & IPS_SEEN_REPLY && !(status & IPS_SEEN_REPLY))
                /* SEEN_REPLY bit can only be set */
                return -EBUSY;

        if (d & IPS_ASSURED && !(status & IPS_ASSURED))
                /* ASSURED bit can only be set */
                return -EBUSY;

And this EBUSY can only happen if userspace (conntrackd) is losing
race to update an already existing entry in the kernel.

> >> The architecture is quite simple and used to work since several years. It
> >> started flooding the syslog with dist-upgrade to "bookworm".
> >> Two active-active nodes share a bunch of VLANs in two keepalived groups.
> >>
> >> Each node is primary for one of the groups and secondary for the other. The
> >> interfaces are configured correctly and traffic is flowing as expected.
> >
> > That is, flow-based distribution between the firewalls, correct?
>
> I am not sure about your definition of flow-based but it sounds
> plausible. Each node is responsible for its own dedicated VLANs they
> only failover on reboot or upgrades etc.

So VLAN interfaces are distributed between nodes and, on failover, one
node picks up the VLAN interfaces of the node that is failing? I am
trying to understand if, in your setup, one node is active but is is
also at the same time a backup for the flows that are handled by the
other node.

> >> bird and bird6 are announcing the routes correctly on each side.
> >> Shorewall is used to filter the passing traffic. Thats all.
> >>
> >>>
> >>> EBUSY can be triggered in nf_conntrack_netlink.c in a few spots, this
> >>> is most likely ct status flags and conntrackd losing race to update
> >>> and entry that is being picked up from packet path.
> >>>
> >>> Is your ruleset dropping invalid packets to disable lazy pick up?
> >>> That is, nf_conntrack_tcp_loose sysctl is set to zero.
> >>
> >> nope:
> >> # sysctl -a | grep loose
> >> net.netfilter.nf_conntrack_dccp_loose = 1
> >> net.netfilter.nf_conntrack_tcp_loose = 1
> >
> > If _loose is enabled, that means kernel conntrack can pick up entries
> > from the middle base from packet path.
>
> I don't understand this part. The kernel picks up connections
> automatically? But how when the flow started on the other node?

This is how it works with net.netfilter.nf_conntrack_tcp_loose = 1,
that toggle enables "poor man" connection pickup, that is, the kernel
infers from the middle of the connection the current state.

> > Is your ruleset dropping invalid packets?
>
> Only for smurfs as far as I can see:
> >  203M   19G smurfs     0    --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate INVALID,NEW,UNTRACKED
>
> > Chain smurfs (7 references)
> >  pkts bytes target     prot opt in     out     source               destination
> >   19M 6211M RETURN     0    --  *      *       0.0.0.0              0.0.0.0/0
> >     0     0 smurflog   0    --  *      *       0.0.0.0/0            0.0.0.0/0           [goto]  ADDRTYPE match src-type BROADCAST
> >     0     0 smurflog   0    --  *      *       224.0.0.0/4          0.0.0.0/0           [goto]

This RETURN means you take back invalid packets to the chain where the
jump to smurfs happen.

> > It looks like conntrackd is getting late to synchronize the states
> > for some flows because the packet path already created the entry via
> > _loose mechanism.
>
> Following the logs it appears to me that every single entry is getting
> late then. I doubt that and don't see where state should come from
> beforehand.

From datapath itself, from the _loose mechanism that is enabled.
