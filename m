From: "Oliver O'Boyle" <oliver.oboyle@gmail.com>
Subject: IPSET persistence on Ubuntu 16.04
Date: Fri, 12 Jan 2018 16:20:21 -0500
Message-ID: <CAMOPTEwan+tog9RwsuDFGWGGyHbv9cq_qmua6gmdjr4XoGM7HA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=rO1BZQtnl5EMV1BVgHpnBM0ulSLQfjEGrchtxBgubls=;
        b=cb3N2L4nvPM8E9zpzjK89Wgxk3+vrpr1FBF8mOXtbJSqf3u/xhQ6ZVi8l0tAdA55w5
         ZimVUSvkWh42SzCGZxD7+7OUccus+MtkdULKC7+55C/ViTXZAV/LMJaY1ENPIRM+f5XB
         IeB48J40kKq6pqqomc8stAaZHtFIUyxljKxzZVqpSU30adBrMhgXgjEkIvdqPlqB0/+4
         kHr/6watiNiEnLs4VKBzEIZj3/zDD1s8jFFQf+aGcbCiooSIKrME5XELx/AfWssjSmFC
         GlDBHf2VznHPsOBho+Yf+mUl/SFPEf4aV2smTcXHaB1zeMbViJenaNYR+WOYFn1wGUWm
         IGIw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Just started using IPSet on Ubuntu 16.04. After reboot, my set
disappeared and my ip6tables config vanished, leaving my fw wide open
with default rules. OUCH.

What's the proper way to do IPSet persistence on Ubuntu 16.04?

Oliver

-- 
:o@>
