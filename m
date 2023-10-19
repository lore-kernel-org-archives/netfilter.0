Return-Path: <netfilter-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E245CDB465
	for <netfilter@archiver.kernel.org>; Thu, 19 Oct 2023 08:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232852AbjJSIfC (ORCPT <rfc822;netfilter@archiver.kernel.org>);
        Thu, 19 Oct 2023 04:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbjJSIfA (ORCPT
        <rfc822;netfilter@vger.kernel.org>); Thu, 19 Oct 2023 04:35:00 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0493211B
        for <netfilter@vger.kernel.org>; Thu, 19 Oct 2023 01:34:59 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a7dd65052aso103880347b3.0
        for <netfilter@vger.kernel.org>; Thu, 19 Oct 2023 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697704498; x=1698309298; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eZm+ZK4IHjrFy7mQyJ73UMwSVnsFlbnBM8nHpCD85q4=;
        b=WY5FoSLWNjtSNSWFaY88MLTJwc1zErnlBMiHJ1T+LoHSZYWg0BJGEyUXnKi8tJ/kAk
         VcBjYx7AduAJniqZQY+N7HnWyvR0Biq1nV4jC5elPYdtU6dp4dnCbrY9pkos+NXqL1XH
         BhyRUbzxj97YynBXMKKUcQW4iuhzuzA11dYgW9PXtfcmNiRmrZWE0Krr9/uWxkTEv5xh
         53szlVO4smA9oXi6s6YEvecatQROsmAOAqscqzeG/Dq6TCBjVUYAtGrMxrcBjMF8tjeh
         HiPTayNkcOMXLv8Cjt0znY0bjrjNyaOkl1AydII8LNDOxjsN+PigPoyZJs/g5MX4Ehyp
         bJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697704498; x=1698309298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZm+ZK4IHjrFy7mQyJ73UMwSVnsFlbnBM8nHpCD85q4=;
        b=NZF0W0rpunC/GGs5aZ4PDFDvA/rzhWIZP8gUgK3tPyGpQg659aXeAMRwph7abfvro0
         iQu6ztprDYoGGcq3L6IGMNp4CJumxBun/YkBaaedqkJHVn5UV7TI7E7jcusMkGqBmaj3
         zgoV2xorgVxp7MY9QJIUteS9yJ+atGkMPe3BX3DRm4fOdKHRGAE3q91dDBo7h6VVOaxF
         fr6Z3Pu6c1GdGiCvy1w9jzANh/mcTsMKAixFH1mq5KOrNTl6gmZiK1M39ZgKmBy7MW8w
         faUgdCvDOMLzWgFpK/QMKw+vnrKOgS/4LBkhq2S5WPLgLqqtU47iKHAe0JEUHB8Kccbz
         rZag==
X-Gm-Message-State: AOJu0YzSF8BukjVtAHeIIAZx6fHbd/YPubn9TZRnafU8sifqyNk/lpOk
        n+MOomqAb8ueV6QYj+E+5Ac0lH/Yz3V8oa6nuzIO9/seWPJQNw==
X-Google-Smtp-Source: AGHT+IH9zvJPoAQm/QGE74yDjLYvhUniE5fvi4JenqIMMIGr9Ruesad+eFalNEoVSQ4zXcuxRx6NvSuEnjBhiN2HTyE=
X-Received: by 2002:a0d:e851:0:b0:5a1:db6a:6459 with SMTP id
 r78-20020a0de851000000b005a1db6a6459mr1559682ywe.40.1697704498158; Thu, 19
 Oct 2023 01:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAPDoCBaxucyu2R_=UyHdr6L5wGno6qbYBbhnmxJDBH_7pbuFcg@mail.gmail.com>
 <20231017213135.GC5770@breakpoint.cc>
In-Reply-To: <20231017213135.GC5770@breakpoint.cc>
From:   sun miller <sunminlei@gmail.com>
Date:   Thu, 19 Oct 2023 16:34:46 +0800
Message-ID: <CAPDoCBYC61XDROuR4q7zX=MggF2nfG76_UxkrX5wVDXMxvoaXA@mail.gmail.com>
Subject: Re: nf_nat_icmp_reply_translation dropped icmp redirect packet
To:     Florian Westphal <fw@strlen.de>
Cc:     netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <netfilter.vger.kernel.org>
X-Mailing-List: netfilter@vger.kernel.org

I'm sorry, I forgot to cc netfilter in my previous reply, so I'm
sending it again. I apologize for my oversight. I hope I didn't
disturb you.

> For some reason the comment that explains this got dropped when
> code was moved around.  The original comment was:
>
> /* Redirects on non-null nats must be dropped, else they'll
>    start talking to each other without our translation, and be
>    confused... --RR */
>
> ... which is exactly what this does, it drops the redirect
> if it can't verify that no nat is in place in either direction.

Thank you for your reply and explanation.

I searched globally for ip_rt_send_redirect and icmp_send(skb,
ICMP_REDIRECT, ICMP_REDIR_HOST...), and it seems that the related code
paths do not meet ct->status & IPS_NAT_DONE_MASK == IPS_NAT_DONE_MASK.

Does this mean that icmp_redirect caused by the same subnet request
packet will be DROPPED when the firewall is enabled? Does this break
the correct functionality that the kernel should have originally? (Of
course, this functionality seems to be unimportant from my limited
work experience.)

Additionally, if it's convenient for you, would you provide an example
scenario for the code comment that mentions "they'll start talking to
each other without our translation, and be confused"?  I am unable to
think of any related issues.


I hope I'm not bothering you.

Looking forward to your reply. Best regards.
