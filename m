Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21C7C61D97
	for <netfilter@archiver.kernel.org>; Wed, 22 Nov 2023 18:37:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235379AbjKVShV (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 22 Nov 2023 13:37:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbjKVShN (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 22 Nov 2023 13:37:13 -0500
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 22 Nov 2023 10:37:07 PST
Received: from smtpa34.poczta.onet.pl (smtpa34.poczta.onet.pl [213.180.142.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D5E172D
        for <netfilter@vger.kernel.org>; Wed, 22 Nov 2023 10:37:07 -0800 (PST)
Received: from alfa.kjonca (178235054008.warszawa.vectranet.pl [178.235.54.8])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kjonca@op.pl)
        by smtp.poczta.onet.pl (Onet) with ESMTPSA id 4Sb91D4fKGz1smc
        for <netfilter@vger.kernel.org>; Wed, 22 Nov 2023 19:36:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1700678160; bh=0mI/MR5xetRv/s16UtFKFallrobwVrrdILruhgErz14=;
        h=From:To:Subject:Date:From;
        b=hP8XCoK2sVd/kfJpxGk1hFZy5gy1nWvssYj4jcbnuF+J12JfI63+sL3ALUR8JetxU
         SoeM17+PqyqNlMrv6GgWvulnpbwzn3NsCPdQkhsnaDaV8aD9mc41iSNjxXUKN55YxY
         SCFa27uZOvVj1Pr3Dpdp3Iada7PUOuDLemMMpuy0=
Received: by alfa.kjonca (Postfix, from userid 1000)
        id 4Sb91C1V5gzmc0K; Wed, 22 Nov 2023 19:35:59 +0100 (CET)
From:   =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>
To:     netfilter@vger.kernel.org
Subject: nft ends with error
Date:   Wed, 22 Nov 2023 19:35:59 +0100
Message-ID: <8734wxtz3k.fsf@alfa.kjonca>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-ONET_PL-MDA-SEGREGATION: 0
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

sudo nft --version
nftables v1.0.9 (Old Doc Yak #3)

Recently my nftables debian service started to ends with error:

--8<---------------cut here---------------start------------->8---
Nov 22 19:18:56 alfa systemd[1]: Starting nftables.service - nftables...
Nov 22 19:18:57 alfa nft[2242551]: nft: datatype.c:1264: datatype_free: Assertion `dtype->refcnt != 0' failed.
Nov 22 19:18:57 alfa systemd[1]: nftables.service: Failed with result 'signal'.
Nov 22 19:18:57 alfa systemd[1]: Failed to start nftables.service - nftables.

--8<---------------cut here---------------end--------------->8---

After some investigating I found that nft does not like definition;

--8<---------------cut here---------------start------------->8---
table ip filter {
...
        map ipsec_in {
                typeof ipsec in reqid . iif : verdict
                flags interval
        }
...

  chain INPUT {
        type filter hook input priority 0; policy drop
        ...
        ipsec in reqid . iif vmap @ipsec_in
        ...
    }
...
}
--8<---------------cut here---------------end--------------->8---

rules seems to be loaded entirely and works.


When I downgraded nftables from 1.0.9-1+b1  to 1.0.8-1 service starts
without problems.




KJ
