From: Andrew Clark <andrewclarkii@gmail.com>
Subject: exclude named sets
Date: Fri, 20 May 2022 06:49:10 +0300
Message-ID: <CAMsxNkSkjBkwS=AhJpG+GPTfz1nYsH4YjLVJ56DxvW9hAVeoCg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=YL5DK+4gGTIOWwdvPilP2c5whpuYF2cwnaRe2QM/+cs=;
        b=Dt/V3c+2qxx0c4BzYSt+XWm6Ncs4/6CPoeo0FJ7/zYoZVuKoJp6gY6ityvLQ2SchFZ
         V8Ou00XsiB3vmTF5KxQu14qo7LUlRK0fBHF30j7yKyITuCgys+XoiPK6tN6Tunqvg7xE
         OVf662Nac8+eNZakpLq6EcAL7hYG1fK7bpGSXKWCBwHm/E/ZOvjGxW4Dy/UdnXdj63Z7
         RCeTbXecp1QLtTtBkSX0H5hlOmC9JfcLJsAI8hzYrdiMJHzNxCUP3f/yURN/Vzwzq+FZ
         YAP2jEXyz0eSwOo8dCObSDrZe9JDavi6KUmZfY+gYko86RNGRyLxMiRyGiP0Yp/8o7VW
         zOog==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I use Debian 11 as my home router, and I have a script for workaround
blocked addresses. Alas Roskomnadzor lists are getting bigger, so I
came to the simple thought that it would be much easier to route all
traffic in the TOR network, but I have a bunch of addresses which
should be passed directly, without using TOR.

This is valid rule: iifname $int_ifs ip daddr @rkn meta l4proto tcp
redirect to :9051
But this one is not: iifname $int_ifs ip daddr != { @akamai,
@stormwall } meta l4proto tcp redirect to :9051

How to exclude couple of named sets properly?

-- 
Talk is cheap, show me the code (c) Linus Torvalds
