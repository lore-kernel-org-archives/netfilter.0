Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBEDC001DF
	for <netfilter@archiver.kernel.org>; Fri, 20 Oct 2023 14:02:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377504AbjJTOCa (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Fri, 20 Oct 2023 10:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377419AbjJTOC3 (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Fri, 20 Oct 2023 10:02:29 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600C191
        for <netfilter@vger.kernel.org>; Fri, 20 Oct 2023 07:02:27 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-59b5484fbe6so9449947b3.1
        for <netfilter@vger.kernel.org>; Fri, 20 Oct 2023 07:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697810546; x=1698415346; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pgh7ybEThPvJYPTFbEZad0mrD+3px7yxT6S9a4OjTls=;
        b=bnc3nc0Ba3hPDX4hjqgViG9jyIp0aQrm2ua8oFo9XJAEmbpSp2duEOUAvgKoGK0xyj
         yWreaWte5Xzs3e4fK53U+q2vO/UKxDZb9pguyLfHtt28yqap5HjphjdKSYF7CbqxyQyU
         7P1euG+H1qqGPo1he0RL+bYb1+sn/ROar/3BTw1E0KOwc9BOurp7yoOkd89rduXb++lC
         UGj3LP93GHQfnHmn2Y9nOmVod10qk7vnDPpeXdijEKurfxW3nzwhRi50dYgCI8TwPVqh
         NBr7VUbAK8gDckc9syE8xz6EDNharptWW9OLqpj+xXk2tOD+Ji5x7MBq+IskUs0igIHc
         aFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697810546; x=1698415346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgh7ybEThPvJYPTFbEZad0mrD+3px7yxT6S9a4OjTls=;
        b=AJkc9ACfKxR81dVcAXalMH8SNpz71/xNXMY0kkuu5qbhHNfS5Nqriboqn0xHrXuqaW
         Vw/NU8QKMV1qpQ0nr17/bHfK6zTVZYhqOeU7p1nJKAGjr8KFuI26W1zoyd1brOX6SKHg
         /Lp/qpaldoVSdj7DQhkz1+FByavZMMvso/Ezc4q1kHg78X4k+hk/t4Drq/f3ZCmudvU/
         Idov5cEOZzVdGBU1U4U0N8vG988aXl0cl4NG/L9SLMkhRQl1UGsw8a0NjPE/+o9c+FU/
         qH7n96jkvDgwlSm76Nh7TplTUz/c8bPqbMTFbj0uKHNAM3C1XsNtgh7yldWVcgs94jUF
         Hjdw==
X-Gm-Message-State: AOJu0YxR5UpQTqcBgLjKgX1GscaG6PuskEZcC3XUmKimtol4tN2aY2ta
        0G5Z7cosOs2FYNOH1Trt83jgwcgOJUoHbfwAO501x71VXwQg4A==
X-Google-Smtp-Source: AGHT+IEKv9iEjxGT8B0VHtgvePcTKc8jaGkMlujuKa6XFSmZUJGOtnteuZH172OT0iMu0sE1LTPzIUJvhZJzdsgoY/Y=
X-Received: by 2002:a0d:e80c:0:b0:5a7:af97:c787 with SMTP id
 r12-20020a0de80c000000b005a7af97c787mr2136192ywe.11.1697810546266; Fri, 20
 Oct 2023 07:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAPDoCBaxucyu2R_=UyHdr6L5wGno6qbYBbhnmxJDBH_7pbuFcg@mail.gmail.com>
 <20231017213135.GC5770@breakpoint.cc> <CAPDoCBYC61XDROuR4q7zX=MggF2nfG76_UxkrX5wVDXMxvoaXA@mail.gmail.com>
 <20231019084740.GB12544@breakpoint.cc>
In-Reply-To: <20231019084740.GB12544@breakpoint.cc>
From:   sun miller <sunminlei@gmail.com>
Date:   Fri, 20 Oct 2023 22:02:14 +0800
Message-ID: <CAPDoCBZ=MCunJTEvvaWe-vQNsWE4NE3giFp7rky5s1ORA4HyWA@mail.gmail.com>
Subject: Re: nf_nat_icmp_reply_translation dropped icmp redirect packet
To:     Florian Westphal <fw@strlen.de>
Cc:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

> A -> B, A sends packet to R.  R has a DNAT rule to redirect to C
> (or redirect to R).
>
> If we let icmp redirect through, this won't work.

Thank you very much for your response.

I had previously encountered an issue with the correctness of the
ip_rt_send_redirect function when the firewall was disabled. I
overlooked the fact that the packet goes through DNAT in the
PREROUTING chain before entering the ip_rt_send_redirect function. In
my test environment, there were no DNAT policies, so I overlooked this
scenario.

Indeed, with the firewall enabled, DNAT rules will modify the
destination IP address, and sending ICMP redirects in such cases can
cause confusion. However, when the firewall is disabled, both SRC and
DST remain unchanged, so the kernel can safely send ICMP redirects.

Once again, thank you for your response.

Best regards.
