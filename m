From: JM <jeevhi@gmail.com>
Subject: inserting rule at the top of the chain using libnftnl
Date: Mon, 31 Aug 2020 22:26:20 +0530
Message-ID: <CALiWujK6y-dnKywJ+4H5bhKV4T=Qee9oP6KbDaJt3c1dJh1wkw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=R1FHPQyRLzDGu5mnlpbw1u4cdJD49fOdIJlDZK2XX+8=;
        b=QLtoJNeyVwoPVJS4EFyaeKZqEnoJ64tVL6J19M4XHScHpylu5y8VjZqfYmhFVwZF4G
         4FxOyUMhpsheteGCRIU1KdzOPwdVMXTjAnzS0LGlKH1xTi6KF24WjkWio3jjsPgIuppb
         /Zfw5hC5lfI+9JSqCQSoRSaRIDto3eCEtcv9SG9cwZmnOTbucDufpnDpVQcSFNWc3RFc
         cMsg8C7fqJR1eTGQggOQG+f5WMQxOOHVHA+VvzeNczIT6bixGLYEcDnTnG2WIKF2a2zC
         9xpWYbWIM4ileaL1+mNyJ30C8E0G6JxSwvlwA8jy879u1v6YSRf0gkUl8TuQ3+fcVoOq
         Z2bA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I use libnftnl to manage our firewall and adding rules to the chain. I
am using libnftnl-1.1.7/examples/nft-rule-add.c as the reference.

I have no issues appending a rule or inserting AFTER a certain rule
using NFTNL_RULE_POSITION or NFTNL_RULE_POSITION.

However, I am struggling to insert a rule at the top of the chain. I
am unable to find a way to insert a rule BEFORE another rule or top of
the chain so that the rule is the first rule.

Can someone help, please

Jim
