Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34100C4332F
	for <netfilter@archiver.kernel.org>; Thu,  2 Nov 2023 03:28:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbjKBD2R (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Wed, 1 Nov 2023 23:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233032AbjKBD2Q (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Wed, 1 Nov 2023 23:28:16 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A60D7
        for <netfilter@vger.kernel.org>; Wed,  1 Nov 2023 20:28:04 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a82c2eb50cso6294887b3.2
        for <netfilter@vger.kernel.org>; Wed, 01 Nov 2023 20:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698895682; x=1699500482; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cCvv/+Q3lB1QPa1oPkPS+nUONOGQI4DyVa9SShzhijU=;
        b=N2SKWeeDeYPSF9wApCesW2NM919d0BeI3+nPEygqlGD1S/77mE/PmaBoxOMly/nSBL
         CxohWjlJ1d4YSD/FjeZ8Zx9fMa+0IDKcrDhZUpMFlrH0dUg5X+9YZfYssFcE37vSAWfY
         J9VMUq+b1lv4N3MkMQs42k8hY4ep2ohzC0xDbw8NjDJsZS22HhLtCdi8qFdct0zjmhQb
         U1UiJ0YSCK5ZHPMa0yV753t6CN3X8hokZkL1xqbBD81dGw/fNAwSdaae8r0mUpTsRAEw
         Fxuv6inWaYhUJDhKz4VweMpIS3f6WBq7F2a9VmkEMRjSC3a1To/IfAH9vsK2PR8eI+Pm
         E56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698895682; x=1699500482;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCvv/+Q3lB1QPa1oPkPS+nUONOGQI4DyVa9SShzhijU=;
        b=RCZkAXtbLd8TUB0o0JUmkTCj4PKLr165mw1SV75V7o4mVULmRljAh4GPI/MobR02ia
         HdKsrK04tbRxK5D8W1pLEkFQpE+zEmcz4i2nponUAEZ+KDqIaPQcLeb9WelmM6L1IWlB
         Phx0OaFy/JF9P1orhMnS7Sqh5nyR4tuMQjcwphIu7Iogyc3xiAuTCCxrgBo4dlD+wW17
         GRAh9ZdyotL8W/uaadT+To8ty2zrO3B1SmReKIOAcDkprcxNkMjGU0tVC3gTNwm+KOuy
         xbMTQIRgtX6s1HzjuH/wncgDjgyiNFI/ZuwraAsPdJTYkgwLXENwd0jG5erx6H2FzYSE
         ZVlg==
X-Gm-Message-State: AOJu0YyyiNvS695JfuIX5A9/mRX+9fnOtoezMADQx0MOR3h5djbYJrwz
        YzWoysMNjCzH7Y7UNewEkG/0VCzv2Ql9vKgnBTWyY0evADxDyrSd
X-Google-Smtp-Source: AGHT+IGYEi0dUKNMVZkx6G11iv5pzaoCgPgDwqck7TKA/pkNzG3u65nMefYc6Qk+m75mNpre7LtqCxEtTMQqKM+0yjM=
X-Received: by 2002:a81:e44d:0:b0:5af:617e:e8f5 with SMTP id
 t13-20020a81e44d000000b005af617ee8f5mr16003803ywl.9.1698895682525; Wed, 01
 Nov 2023 20:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <CALDEYCfdiRSxm1bG_Zz0qn+avm2gOD5nQk-ttCuxqug6RW-AyA@mail.gmail.com>
In-Reply-To: <CALDEYCfdiRSxm1bG_Zz0qn+avm2gOD5nQk-ttCuxqug6RW-AyA@mail.gmail.com>
From:   niconorsk <niconorsk@gmail.com>
Date:   Thu, 2 Nov 2023 13:27:51 +1000
Message-ID: <CALDEYCeVPZdCdDLhnPC92SGbcW46EamFvHbh8q5fwshjUa7ZYA@mail.gmail.com>
Subject: Re: Help with debugging combination of tproxy and policy based routing
To:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

Follow up on this after a lot of pouring through kernel source code.

In include/net/fib_rules.h we find this function:

static inline bool fib_rule_requires_fldissect(struct fib_rule *rule)
{
    return rule->iifindex != LOOPBACK_IFINDEX && (rule->ip_proto ||
       fib_rule_port_range_set(&rule->sport_range) ||
       fib_rule_port_range_set(&rule->dport_range));
}

This gets called in fib4_rules_early_flow_dissect in
include/net/ip_fib.h which seems to get called in various places in
the kernel routing logic.

On a hunch, I changed my ip rule to not rely on tcp port and
everything immediately started working as I wanted.  My plan as a
workaround is to make ip rule use packet marks and set the packet
marks in nftables.

This does still feel like a bug in kernel behaviour, but I am not at
all equipped to figure it out. Not even sure if this is the correct
mailing list for it, but maybe this information helps someone else.

Kind regards,
Nicolai Moore
