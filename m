From: Ameen Al-Azzawi <ameen.azzawi@gmail.com>
Subject: Port pool of CentOS machine
Date: Sun, 6 Mar 2022 19:56:07 +0100
Message-ID: <CABcvXqKUqz=86zbwZDWbhLQSwgUUgYtG0UuocHtUX56qNLjUJA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=qYoX8jpons/Ya9B3LRVeMRpx0FaoecE6lqSfm/Vrlpg=;
        b=H/o+2xwZ+O5O3DxqYgtCcdyA0apwFWY8Az6Cg0DiZntsCvfaNvNLUZb+zvfzXT9RxK
         V1GPUaLpCUsMEfLM0f/sg5Jz1Ab8CWFfMzrLUNGw6Oy+tkA03Y1fg5NgOx7NeQ9HYNJt
         Rywl/5YLlH/uEO0dzekZIKdO4rEAEZoLfy3KmtYlRqUl7NEU5DOvHxgrgRQkGO17J5l/
         BSROSPQRMDkkFWImOvn9I8a6cg7IkMa6sAnA2DfIkls/JQRTJ9PDvmWSevHnB9Oivv1/
         PKz4JFMuiBkw0YH4YBM4fEwXmjjdchNTU52wX0+MNFwdgD8kX86PHENlCM06hjWsqhPw
         Juww==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello everyone,

I am trying to build an attacking scenario where I can exhaust the
port pool of my Linux machine (CentOS 7).
I am using a tool to send too many AAAA queries to my machine.
The question is, how can I monitor this process of exhausting my
source port pool using Netfilter ??

Regards
Ameen
