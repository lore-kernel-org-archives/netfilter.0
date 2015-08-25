From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: ipset memory usage
Date: Tue, 25 Aug 2015 17:35:50 +0530
Message-ID: <CAA5aLPgxW=-hJcBLxagCKTgX26mHg9XAmsr-UVoS3s0n50oEDA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=btX+7/4Me4Tg8JZ3Ro/t4QLYlHuA0JpN6zsCHCDWHNQ=;
        b=qnJ6Guuo+e+sMVtxT+hkUszLCdT9HAqm4MIPsZBb/WnUO5Xh/7DU0IYrwFwWLu4z88
         06Dt4NVwSxXSCCl/FCKDrO3jTQ78uGArrTjeiIwgiB728hKm4rrpziIPKCTYLp6oV3r3
         jfutvnhZTFJPT4rv2GsH8YXgcz76wcYB0Lgpx1s1mkU+Lx/M7d87Nea+a7HTQrWHj5YF
         4IuACU676hRasrhPkSP17eqC5EZG25eZog7cq7aX7Hx2wE+ZO813vn+eQqXN3pqBBkBH
         t/Ty/4tQljqC/glKr/8pvMpxK4ThiBMOhaPRCgp8AzqqWsHP8z93T2uZWsRNXSMjT9Gs
         Y0LQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

As per info in http://lists.netfilter.org/pipermail/netfilter/2005-September/062859.html,
ipset of iphash of 20Million IPs, takes around only 80MB. I understand
that this might be simply multiplication of 20Million with 4 bytes
which IP takes if stored normally.

But when I try to replicate this I am getting size in memory as
506,481,176 (around 483MB) for number of entries 16,581,375.

This comes to around 30Bytes per IP.

I have got this values from ipset -L command

Is this much size anticipated?
