From: =?UTF-8?B?WXVjb25nIFN1biAo5Y+26Zuo6aOeKQ==?= <sunyucong@gmail.com>
Subject: per host accounting
Date: Sun, 22 Jul 2012 20:22:26 -0700
Message-ID: <CAJygYd3B1rReg_-cLX599CScd7u2SBcO7_7uU1gb83knS4MM3w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=mE2obgEAP1RoKRb67zXI5m5o8aWN167fyRDxJ3fvr5o=;
        b=PucihSwvtnVNvRlGln2qVcHAxhHxrzxGdfUKk7ch7Xm1TyHWytfYB6Otuagafl5SCB
         5fgb5z3t6SCMdZVKu4hmCXinJNaa+bfZQdyNFaNWNL1cGzLjH44l1lbmeEAwCmwRRygV
         VoSOp8qqTRKM1jK6E4Ka8sK1ThzY5IDyHzLB2VzN1XOaFxCA9o62KnvOnmNB/VzCy5Jf
         YAzsP/Oyci/Iah9uUlypUOdRKRbGpWwbAGlSEdnF1tgm/MuhD1dYtKS06guRoYcPnOgz
         3fxoDI4t6G6Nun8S3SlJSG5JP7B2T4a138OXIELcgNLHFOWex9451y5l5Lmc9R0KYQGg
         yZjw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I need a way to account traffic (bytes) for ~500 ips (fixed),  and it
seems creating a plain 500 rules will affect the performance a lot.
Without implement layered rule (like a binary search?) , is there
something existing to do automatic hashing?
Things like hashlimit is great, but I don't need limit matching
function, just a way to create a hashtable and count bytes and
packets.

If there's none, I suppose it would easy enough to fork some hashlimit
code to do this.

Cheers.
