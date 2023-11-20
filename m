Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52AEC5AD4C
	for <netfilter@archiver.kernel.org>; Mon, 20 Nov 2023 18:18:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233795AbjKTSSI (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Mon, 20 Nov 2023 13:18:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232609AbjKTSSH (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Mon, 20 Nov 2023 13:18:07 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81516B9
        for <netfilter@vger.kernel.org>; Mon, 20 Nov 2023 10:18:03 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c6b30aca06so57866261fa.3
        for <netfilter@vger.kernel.org>; Mon, 20 Nov 2023 10:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700504281; x=1701109081; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rqhkpdkfwo7tLOPNlcgZfcUveNiGXYCC2HhVsrGPzOM=;
        b=f0Mo1Ec3D6WNJsRoZSvf2OLTryxV2hlm5mBk8abHCWW0cEyxkPL/RjhfgFUTBrbMhM
         TaUPhrvqPCh4sZsA9A4p3R5UM/AindxOhTFt/7KlbV83cnF3GRkRkJmo10Riahe9Z/+x
         Ybu0zFBzSn/zcEfG+ZEDgJjJ5U+iwNJfq2va/77elc2+dWSvskEUMzmhf3eMpA/8IMrk
         RmTx+x34cL8r9758f7+1DJP2oMo1TkBSchHueK8YCb/OlIDT8b5JVHUEl3F8wYpQLKv+
         t7cRydAlgznH9Yum/tZ+SGXHIYtIGqbMpJ6QuzO4SKG9nDZsluxVzHBdU/h96CarXVGh
         KZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700504281; x=1701109081;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rqhkpdkfwo7tLOPNlcgZfcUveNiGXYCC2HhVsrGPzOM=;
        b=DybrUPcF0A/4W9TV0SRLEpKLc15OOTr8zfVc2D5T3k5NwpyaFO+rDZfv+f9WXHUFb/
         UoBRu29UTiV2+M5WD8T+RwlJU5SwqHdfMffwwqkVu9w2DYmKA6GRj+KnxYhRXHqSFedS
         8ffXevbFlph3t2MOjAvUAEU6DJBCt/SvzZOSBJZ7Jsyc9nii35gwV+Su+XAprgtcIUT1
         2CBgG9jWDnJikcG1Bl0xuc4GGP4krJcVHbAEAfk0vv20vVsz9le4FUMZYGPTeO7quAW4
         UdwZbNJKzpaqNDLJYMF+TEQMlHjbkjOuIrK4PgMOC/Odo3kt+dQkcEFOyIpoclK+7LAn
         hMVw==
X-Gm-Message-State: AOJu0YycfZwP8o428xaDTuSAUD8Yh/Mc7KoGJs6kerwhLtRHpXKymScw
        wjDliRx5Yugi553ZgzSQq7t8Y821ey9mzFrihQDJAC3l48nEtg==
X-Google-Smtp-Source: AGHT+IG34kHbV8OCthKMJGA1NgwajxrEfC1UpjKAsHLkPIPr9MtBWD0JHWRuZY73rpk9k37O/23rz2AGsYzBgkI3uuE=
X-Received: by 2002:a2e:2a43:0:b0:2c5:3b1:c084 with SMTP id
 q64-20020a2e2a43000000b002c503b1c084mr5346085ljq.42.1700504281197; Mon, 20
 Nov 2023 10:18:01 -0800 (PST)
MIME-Version: 1.0
From:   Nayan Gadre <beejoy.nayan@gmail.com>
Date:   Mon, 20 Nov 2023 23:47:50 +0530
Message-ID: <CABTgHBtq5LGLoERAXzhNsoQCjsQSHrLq5Zn+1=U5Gukxc+qWMg@mail.gmail.com>
Subject: nfqueue at postrouting hook does not work
To:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Hi,

I am trying to send packets to a user space application using nfqueue.
I added the following chain and rule.
table ip hotspot {
        chain nchain { # handle 3
                type filter hook postrouting priority 400; policy accept;
                udp sport 53 counter packets 71 bytes 38194 queue num
43 bypass # handle
                udp dport 53 counter packets 73 bytes 5184 queue num
43 bypass # handle 33
        }
}

The counter increments but the application does not receive the packets.

If I try at a different hook position then the application receives it.
table ip hotspot {
        chain dns-snoop-forward { # handle 2
                type filter hook forward priority raw; policy accept;
                udp sport 53 counter packets 23 bytes 12951 queue num
43 bypass #
                udp dport 53 counter packets 28 bytes 2031 queue num
43 bypass # handle
        }
}

1. Does post routing hook not allow nfqueue ?
2. Also Is it possible to send packets to userspace after the
_nf_conntrack_confirm() has confirmed the ct. I tried to change the
static priority of NF_IP_PRI_CONNTRACK_CONFIRM to 350 and added my
hook at 400, but packets were not received by userspace. Anything I am
missing.

Kindly suggest.

Thanks
ngadre
