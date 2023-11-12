Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372A6C4167D
	for <netfilter@archiver.kernel.org>; Sun, 12 Nov 2023 17:32:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbjKLRcO (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Sun, 12 Nov 2023 12:32:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjKLRcO (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Sun, 12 Nov 2023 12:32:14 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5B51BFF
        for <netfilter@vger.kernel.org>; Sun, 12 Nov 2023 09:32:10 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9d10972e63eso553218866b.2
        for <netfilter@vger.kernel.org>; Sun, 12 Nov 2023 09:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ies-sabadell-cat.20230601.gappssmtp.com; s=20230601; t=1699810329; x=1700415129; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tr06MBYaYxZn6EiCBjV1YT/ZVYg4cG9l7zSjSaAh/1w=;
        b=Ju5QF29BeG7L1hDQ4foZBr2HPn8OixENjiTO6RuK3HCgbSceYMXYZYtXnOPngtFCbY
         exQpbfn6NUPuMKvdGHRB/6h4FZMFvBNMDnFy1fxsdJ8VBHm4fiziUM+n/mme0kCeuuNQ
         ryhVPI37V7JOtlgbhXbEV4q6aJ5RMsEti8bVHR6vZQ+oZtPAUV/9RjMZJx8/IUhR4cZZ
         vmAwd86SzkYiexyURI5INsEOE75QiXNM6GlxI4K7S4jOcaTztVzg29dYjXsDg6SWicPq
         +YXIa4+qeJQ9reuDwz99Qxv0zbrPj7Ww1dMAb7lb+uQ9/zuQZ1aCUt4xLg5pE0cj4K3w
         7HiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699810329; x=1700415129;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tr06MBYaYxZn6EiCBjV1YT/ZVYg4cG9l7zSjSaAh/1w=;
        b=s/a+qA4xZtQWra67EA1qOkQc3umRhVLHhVk5in9DRwJpq2LpnulPZPx1ZKPVNCMVLf
         7CU8eiAP860/8wVBUK/3aTxo5e7Tx8d0v81zMpDC7kSms/onAm/sdzHYKCqH6Z7sGwRj
         3C0uAjZre3nq/LwgbgoWEIOoPdKDmj4cICEkNaURjCxYuufOm5D1fO9+L2akLu5DXVMf
         R+VuPDc3ENRuIyPku5PEJgIMrompUFlS4mNA+MEJ20VaXCvGezpIlJTGQcoMGb1LuSVG
         gi+/CJ9f+uAbktKefGX7I40KA6+h78ZCGACdf74d1EJbl1ryL13tEa3cOYSIi1Pv9B2C
         zTxw==
X-Gm-Message-State: AOJu0Yy6JMd1DwTIF8vZHPrDKFm98jqIfuDgYhyLgOtwnz0Va0YT/aN5
        My2KMjChgaVKDmgCW/8LhKVmYpZUxEVOlfaRDOmnMb7PVwv8kVkSsYc=
X-Google-Smtp-Source: AGHT+IHpgJTTTes6ZG18Fd8M7UJJVKqVBYuEtu+CmcKtPjtmTQ9d4BdwJsV8HSbGXStP8EYDGJyImbgJ2y6PIT7CWJY=
X-Received: by 2002:a17:906:494b:b0:9dd:c54d:1ee9 with SMTP id
 f11-20020a170906494b00b009ddc54d1ee9mr3056158ejt.53.1699810329214; Sun, 12
 Nov 2023 09:32:09 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?B?UnViw6luIE3DqW5kZXogSGVybsOhbmRleg==?= 
        <rmendezh@ies-sabadell.cat>
Date:   Sun, 12 Nov 2023 18:31:58 +0100
Message-ID: <CAHpzd2o47vs=yA28FzMMjYvYfU1iPsDM_9fopXrwk9pWfLcHnw@mail.gmail.com>
Subject: Problems getting started with dnat and port forwarding
To:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Dear netfilter team.
I'm starting with nftables and trying to set an ssh port forwarding
from my firewall IP 192.168.1.252 to my dmz IP 10.0.0.2. But I get
this error:
-------
nft -cf nft/test.nft
nft/test.nft:30:62-65: Error: ip or ip6 must be specified with address
for inet tables.
add rule inet nat prerouting iifname $int_ext tcp dport 2222 dnat to 10.0.0.2:22
                                                             ^^^^
-------

I let you a piece of my nftables script.
-------
table inet nat {
  chain prerouting { type nat hook prerouting priority -400; policy accept; }
  chain postrouting { type nat hook postrouting priority srcnat;
policy accept; }
}
#--------------PREROUTING-----------------
add rule inet nat prerouting iifname $int_ext tcp dport 2222 dnat to 10.0.0.2:22
#--------------FORWARD----------------- #
add rule inet filter FORWARD iifname $int_ext oifname $int_dmz ip
daddr 10.0.0.2/24 tcp dport 22 accept
add rule inet filter FORWARD iifname $int_dmz oifname $int_ext ip
saddr 10.0.0.2/24 tcp sport 22 accept
-------

Thank you for your time.
