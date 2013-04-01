From: Lawrence Lee <lawrenceqli@gmail.com>
Subject: How to directly deliver packets to the L4 layer in the
 NF_IP_PRE_ROUTING hook
Date: Mon, 1 Apr 2013 18:01:08 +0200
Message-ID: <CAGXkBO-KcSZqK4v1BvCiGiCyT0pq5mHCK_-a5--myN6k+ZU4Jw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=8cj6bWHN2u2Ud5TedtRRiKLiZN/AF1X4ouFE3JBLUdw=;
        b=D2al+IAxnN27mMY6CWJqp5qLlSu2ZHXZWgfqoQ54RPfF8tKWzQZme5Z5c8GsIz/W88
         NWXAjwy4CNxh5wOTopWRdAAyXxqRg6nqbFg/5zj5p1z97DHS/jl+aCgsl2exM4qcNBf9
         54yjPNRADR+SotDwI8tFS8DiAs1CxgqGJYuNl+v1lA4PhISIweBq0E1jwd8srO9lNVOh
         di2NB710jyHuLmWN9kYnfs0xhzJBC3d2ld+FP88Kyz7BIPn5VhwK4HyTsREYRaX6fNQG
         m5qOS0t6I7q/xw/M6J2fBu4lVy5BON6zNQb88S0uUGLfww/xaLYJBxShys/oCDevoJzR
         xDdQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I  want to directly deliver some packets to the L4 layer when the
packets get to the hook of NF_IP_PRE_ROUTING. I use the use
ip_local_deliver() function. However, it does not work. May I know how
I can make it work. Thank you!

Best Regards,
Lawrence
