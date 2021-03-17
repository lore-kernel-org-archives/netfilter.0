From: ilker <ilkery@gmail.com>
Subject: nfqueue ethernet packet frame capture
Date: Wed, 17 Mar 2021 15:35:56 +0300
Message-ID: <CADtAAp7ReZoa1kLSm4oc7um9-vQ_XUnq9t80mN4T8igZQjyxUA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=QwsAjQLxUD72ITp6Yoik/DTr4IvxLHd3h3K1Js+v8Kw=;
        b=Rf2+mcTsrDt3pjREcXDqvEdi+2ZixEJkFh4EkS5b12lKKc2qp/fNbtOFsbOhGfRRDl
         V3SAeMJFZ0oDA3BGHwd31bwWBT1LQmLFKdAsvBnql+a1tBvb9atqRFHzfHVlW07PJ9mK
         /omZUyupMhM6m9dH7WNZ7STs6JAJfp3By+oNvrMc2qLCM3sjMTipIR/CrvFe7U9jvpUz
         27jegOxkZvPXmQk5VGyFHo4IRTvQMKLMkdsmpYpjb56A9f0Jp1I/GOnbbuWccHu9iFS/
         OC+HYDFb5Je4DF1mTX88/bYFT8TZSvV1BX8zW0tc62EQNkN+VPKSa13gYxs7MhYCXcJr
         5iaQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

I am working on nfqueue to capture packets from networks.
I am not able to capture destination MAC addresses using NFQUEUE.
Is there a way to capture a full ethernet frame (especially
destination MAC address) using NFQUEUE library?

Thanks for your help
Regards,
