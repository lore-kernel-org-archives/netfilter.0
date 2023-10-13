Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E05CDB482
	for <netfilter@archiver.kernel.org>; Fri, 13 Oct 2023 14:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbjJMOlu (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Fri, 13 Oct 2023 10:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjJMOlt (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Fri, 13 Oct 2023 10:41:49 -0400
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D0195
        for <netfilter@vger.kernel.org>; Fri, 13 Oct 2023 07:41:46 -0700 (PDT)
Received: from [78.30.34.192] (port=37220 helo=gnumonks.org)
        by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <pablo@gnumonks.org>)
        id 1qrJME-00AbcN-5i; Fri, 13 Oct 2023 16:41:44 +0200
Date:   Fri, 13 Oct 2023 16:41:41 +0200
From:   Pablo Neira Ayuso <pablo@netfilter.org>
To:     Markus Wigge <wigge@bht-berlin.de>
Cc:     netfilter@vger.kernel.org
Subject: Re: commit to kernel fails since Debian 12 (bookworm)
Message-ID: <ZSlXJdqfKFxF0OcO@calendula>
References: <faf92623-95a9-4999-b02a-e40108f133ca@bht-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <faf92623-95a9-4999-b02a-e40108f133ca@bht-berlin.de>
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi,

On Fri, Oct 13, 2023 at 04:02:01PM +0200, Markus Wigge wrote:
> Hello,
> 
> we are encountering a strange problem with conntrackd after upgrading to
> Debian 12 (bookworm).
> First the logs were flooded with errors like this:
> > 2023-10-13T12:49:06.724542+02:00 fw-dc-c conntrackd[421008]: [Fri Oct 13
> > 12:49:06 2023] (pid=421008) [warning] could not add new ct entry: Device
> > or resource busy
> > 2023-10-13T12:49:06.724690+02:00 fw-dc-c conntrackd[421008]: [Fri Oct 13
> > 12:49:06 2023] (pid=421008) [warning] could not add new ct entry: Device
> > or resource busy
> > 2023-10-13T12:49:06.724847+02:00 fw-dc-c conntrackd[421008]: [Fri Oct 13
> > 12:49:06 2023] (pid=421008) [warning] could not add new ct entry: Device
> > or resource busy
> > 2023-10-13T12:49:06.725048+02:00 fw-dc-c conntrackd[421008]: [Fri Oct 13
> > 12:49:06 2023] (pid=421008) [warning] could not update ct entry, even if
> > creating it instead: Device or resource busy
> > 2023-10-13T12:49:06.725182+02:00 fw-dc-c conntrackd[421008]: [Fri Oct 13 12:49:06 2023] (pid=421008) [warning] could not update ct entry, even if creating it instead: Device or resource busy
> > 2023-10-13T12:49:06.725271+02:00 fw-dc-c conntrackd[421008]: [Fri Oct 13 12:49:06 2023] (pid=421008) [warning] could not update ct entry, even if creating it instead: Device or resource busy
> > 2023-10-13T12:49:06.725406+02:00 fw-dc-c conntrackd[421008]: [Fri Oct 13 12:49:06 2023] (pid=421008) [warning] could not update ct entry, even if creating it instead: Device or resource busy

Could you describe your setup? From your report, I can see you are
using:

        DisableExternalCache Off

Is this an active-active asymmetric path cluster?

EBUSY can be triggered in nf_conntrack_netlink.c in a few spots, this
is most likely ct status flags and conntrackd losing race to update
and entry that is being picked up from packet path.

Is your ruleset dropping invalid packets to disable lazy pick up?
That is, nf_conntrack_tcp_loose sysctl is set to zero.
