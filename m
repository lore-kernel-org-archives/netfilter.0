Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEC3E95A8F
	for <netfilter@archiver.kernel.org>; Sun,  8 Oct 2023 15:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344829AbjJHPpO (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sun, 8 Oct 2023 11:45:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232334AbjJHPpN (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sun, 8 Oct 2023 11:45:13 -0400
X-Greylist: delayed 314 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 08 Oct 2023 08:45:11 PDT
Received: from mx1.levonet.sk (mx1.levonet.sk [IPv6:2a02:6ca3:0:1::6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28DB8A6
        for <netfilter@vger.kernel.org>; Sun,  8 Oct 2023 08:45:11 -0700 (PDT)
Received: from smtpclient.apple (unknown [10.202.115.195])
        by mx1.levonet.sk (Postfix) with ESMTPSA id 62336E2817
        for <netfilter@vger.kernel.org>; Sun,  8 Oct 2023 17:39:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=levonet.sk; s=lvnt02;
        t=1696779594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=05aja/2NurgoIMYMiHJDeXFDvI8QEKZCCKxk52PqXO8=;
        b=Xrg0bnQZjpy4FjY/iIN9ovpEK+zATUZHRLxmQSwLVSDd4V1fpHUODdJoAgRB+pPnaPropf
        PhdxsbpHSRX0j9gR8ncJbIBD6NQopwGNF22Lp2tIQXZt1smFvtbj8Obp2sVil5t1Lhs4TM
        U2pei+Es7K3X7ujmUQRWRz0N8HlQ8m0vxQpwWiZ4wHIAR81d/mNauj45NDUKIetWB3klYm
        3xD32JDRF7x70vrQqsRVEv1L4jYEF2BAYOCypuuMreOcQbyfwGLbAmGLqO5JAabRLDuLwf
        U7oIsOMSElgbhASzcs0qx3NPticMVtQFIbpOdyY+L0OGDJ08eQHJnVQ+YFhfuw==
From:   =?utf-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <krajnak@levonet.sk>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Nftables matches IGMP packets as non-IP traffic
Message-Id: <7E750C75-70FF-4078-8462-11387E1F1324@levonet.sk>
Date:   Sun, 8 Oct 2023 17:39:43 +0200
To:     netfilter@vger.kernel.org
X-Mailer: Apple Mail (2.3774.100.2.1.4)
X-Rspamd-Server: srv-le-mail
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 62336E2817
X-Spamd-Result: default: False [-0.62 / 15.00];
        BAYES_HAM(-1.05)[87.69%];
        MV_CASE(0.50)[];
        MIME_GOOD(-0.10)[text/plain];
        R_MIXED_CHARSET(0.03)[subject];
        FROM_EQ_ENVFROM(0.00)[];
        MIME_TRACE(0.00)[0:+];
        RCVD_COUNT_ZERO(0.00)[0];
        NEURAL_HAM(-0.00)[-0.997];
        DKIM_SIGNED(0.00)[levonet.sk:s=lvnt02];
        RCPT_COUNT_ONE(0.00)[1];
        FROM_HAS_DN(0.00)[];
        MID_RHS_MATCH_FROM(0.00)[];
        TO_MATCH_ENVRCPT_ALL(0.00)[];
        TO_DN_NONE(0.00)[];
        ARC_NA(0.00)[]
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi there,

I hit an interesting behaviour of nftables filter.

The rule:
ether type !=3D { ip,ip6,arp } log drop;

is matching IGMP messages. Why?

Oct 7 20:58:34 srv01 kernel: [21461564.156507] IN=3Dens256 OUT=3D MAC=3D =
SRC=3D192.168.1.10 DST=3D224.1.5.1 LEN=3D32 TOS=3D0x00 PREC=3D0xC0 TTL=3D1=
 ID=3D0 DF PROTO=3D2

chain type filter hook prerouting priority -450, interface ens256 is =
outgoing interface for that machine (the IGMP message is generated =
locally, it=E2=80=99s membership report).

Is it a bug or am I missing something?



Thanks,
Blazej=
