Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7517BC54FB9
	for <netfilter@archiver.kernel.org>; Tue, 21 Nov 2023 08:57:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbjKUI5V (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Tue, 21 Nov 2023 03:57:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjKUI5U (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Tue, 21 Nov 2023 03:57:20 -0500
X-Greylist: delayed 267 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 21 Nov 2023 00:57:15 PST
Received: from mx1.levonet.sk (mx1.levonet.sk [109.236.119.6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66516CA
        for <netfilter@vger.kernel.org>; Tue, 21 Nov 2023 00:57:15 -0800 (PST)
Received: from smtpclient.apple (unknown [10.202.115.195])
        by mx1.levonet.sk (Postfix) with ESMTPSA id 07503E3058
        for <netfilter@vger.kernel.org>; Tue, 21 Nov 2023 09:52:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=levonet.sk; s=lvnt02;
        t=1700556764;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=qxfhPs51zTDx2i8pPKVbZKSTT/hWKvTu+5SOOiltwdg=;
        b=duEHSHXbgfNXrJA/qf9aOFuVs/2Wuv01ozCo9DQNcRg9QrZaT5lbZ4I0QRUF2ma9i6nCCz
        ehQCbFHeV5fSegORZ8d0wgVYO9MI/LUkTjtuhSPazHMv/8EmlQmAl/u7Dw6yiJezUv8IC4
        UsB6uE5I8URozIp/Oy2tDI5R85CrM2frYSF2Lbv1x66uSYZUCJJ9lB8b1FClG65jEamJzs
        2hpN5d378S9RfpTnmznRK2h1nSOJfrrwb4HkqkKj8AgBpT1tuN+Tc7Ut5KCKPw8hvdXNav
        4YQUZ6Zjod7kgr03tykhXoihCyjMMSpmdYX6kGNZpjjFCYYzo2QCxH1FQf9rRg==
From:   =?utf-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <krajnak@levonet.sk>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Performing NAT 1:1 without connection tracking
Message-Id: <860A059C-354B-45F3-9BCA-5387927F1D1E@levonet.sk>
Date:   Tue, 21 Nov 2023 09:52:33 +0100
To:     netfilter@vger.kernel.org
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-Rspamd-Server: srv-le-mail
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 07503E3058
X-Spamd-Result: default: False [0.10 / 15.00];
        MV_CASE(0.50)[];
        BAYES_HAM(-0.33)[75.77%];
        MIME_GOOD(-0.10)[text/plain];
        R_MIXED_CHARSET(0.03)[subject];
        FROM_EQ_ENVFROM(0.00)[];
        MIME_TRACE(0.00)[0:+];
        RCVD_COUNT_ZERO(0.00)[0];
        NEURAL_HAM(-0.00)[-0.990];
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


Hello everyone,

I=E2=80=99m wondering if is it possible to perform NAT 1:1 without using =
conntrack table/module at all?
Of course using nftables / iptables. Because for now I see xdp/bpf as =
the only way.=20



Thanks
Bla=C5=BEej=
