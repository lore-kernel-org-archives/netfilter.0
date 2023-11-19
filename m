Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A073BC54FB9
	for <netfilter@archiver.kernel.org>; Sun, 19 Nov 2023 21:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbjKSVhf (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sun, 19 Nov 2023 16:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbjKSVhe (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sun, 19 Nov 2023 16:37:34 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4095FE0
        for <netfilter@vger.kernel.org>; Sun, 19 Nov 2023 13:37:31 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso492383066b.1
        for <netfilter@vger.kernel.org>; Sun, 19 Nov 2023 13:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700429849; x=1701034649; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kaD6Oi0TXrbOHVlknI00X1UZSADUzcMnwhZsUk7xU1A=;
        b=iYmIsyKscIes3Es8RJNUFkQMVz14dqFwM4BDjkR4fbf5d5eD+D/ZJp8GUPfVqbmoIH
         /dYqLpyyXvVYCFgayyhu/P+xl9vGQSDD6dxvrwbeaYKklnjgzLYE9d+t+12eKYpVShK0
         wAcS/cvlBwcqV8Oux/kECbblmcMm3JxGQhVTXLIfURL50T8S14RQOPkjTADeTbKBCxcI
         i+WvGdcyYsXGwdLROhxjqF17NVGnkRR5ASPVDQt98/lVGohyasSvNLxZeqyatjcsUI5Z
         +XmHTRayKwY9rCjiTdPUm/P83tUz7/kPfDMbSmpvdc59bPtpSWaU+LN2lVhn0h/pSS3q
         edlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700429849; x=1701034649;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kaD6Oi0TXrbOHVlknI00X1UZSADUzcMnwhZsUk7xU1A=;
        b=VvC5pGhcJZb4cvepPADmZ60A9PlIa0D32mmOjSa7SsipMOlDKnxvMPO+/KwoBqVDoV
         hO/h/bXKvp6Dj5crMjC1RNu8Z38EP0VKcmspiCG/2TkI8vSByxR41+b2CvD2yxYL2/MT
         WeBFMHZLEVzZeOd3DqGGQP0I012Sym/r9WxsFQ9e2SvWW72ckTtJ/QLCy2LJCMAQ3OEc
         hEHJ3bytpSNJUOGOEPk2b5qNV6XhNE/SKcgDFvYIlAKrNSJ94cec5BqvTVY5qZfOpCyp
         Jjy5Je+7qmfB3jzGtr6F4TcAfTpvWghMk+L99jBJUdWm9bl6kFHWyiFLu2vd36hTYmOw
         DuyQ==
X-Gm-Message-State: AOJu0YzG7ME5xDL+eQB30COKHxZT8KjAY71aN+lOHiF938vgTeML5gYA
        xJx/9IGTfSjcgAv9UFwDtRIagb8fNGS9LqAu/2UcWcFuhdY=
X-Google-Smtp-Source: AGHT+IFn5f9fbWFYwq2Ske9e0n62Pgb95ROiqllEqFxDBNIpmnFBtJM22zVYuqdAazKfM45D35ZeIhiCWp4jWbX77ig=
X-Received: by 2002:a17:907:914d:b0:9e0:5dab:a0f6 with SMTP id
 l13-20020a170907914d00b009e05daba0f6mr4133063ejs.22.1700429849186; Sun, 19
 Nov 2023 13:37:29 -0800 (PST)
MIME-Version: 1.0
From:   Martin Gignac <martin.gignac@gmail.com>
Date:   Sun, 19 Nov 2023 16:36:53 -0500
Message-ID: <CANf9dFNCeUf20yza=ika3YYGH1RjUwagWOkoCCg8=aGnNCQs3Q@mail.gmail.com>
Subject: Getting error "Error: missing hook and priority in flowtable
 declaration" in nftables 1.0.9
To:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

(resending because not sure the first time went through)

Hi,

I'm seeing a difference in behavior between nftables 1.0.7 and 1.0.9
with regards to flowtables:

    # nft -v
    nftables v1.0.7 (Old Doc Yak)
    # ip link add dummy1 type dummy
    # ip link set dummy1 up
    # nft 'create flowtable inet filter f1 { hook ingress priority 0; counter }'
    # nft 'add flowtable inet filter f1 { devices = { dummy1 } ; }'
    (no output)


    # nft -v
    nftables v1.0.9 (Old Doc Yak #3)
    # ip link add dummy1 type dummy
    # ip link set dummy1 up
    # nft 'create flowtable inet filter f1 { hook ingress priority 0; counter }'
    # nft 'add flowtable inet filter f1 { devices = { dummy1 } ; }'
    Error: missing hook and priority in flowtable declaration
    add flowtable inet filter f1 { devices = { dummy1 } ; }
                             ^^^^^^^^^^^^^^^^^^^^^^^^

I don't understand the error: "Error: missing hook and priority in
flowtable declaration" since I HAVE indicated a hook and priority with
the command "nft 'create flowtable inet filter f1 { hook ingress
priority 0; counter }'", which worked before, but now doesn't.

What am I missing?

Thanks,
-Martin
