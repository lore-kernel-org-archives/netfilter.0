From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: monitoring data transfer stats of current connections
Date: Fri, 16 Nov 2012 02:11:35 +0200
Message-ID: <CAAo+KFnKuwCCF3Wfb3vPHZw3gSSTLGyfSPvbE5whxDPrrRHKVg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=VoslBaC1cd1vjTx4WVcjDIVpQaZhq7XIq7u+605aKEs=;
        b=MhvJiW91d+8OHqC0rowAWv4lkbPos4ZILLm4P2E4ccLaoznhXTc0v7jyE4DrDoO18w
         hB/4amCVyxDjVpk/yIUHTXpDmpJpR4m+rgGwpg2+068AY1or05j1qvyT7tGu7HdgAwyV
         1vwgDkHh/qBRCDX478ocH/i/62jynCvl4bMspflrSfpg4OJG0DqQj11+j9BCMbFAxXgy
         VJV7JYe47PYgx5PU8aQAeyf3i7AEgrStGa2yasu1jRC/KHq3Z+mTP9gx65HC+p905p8U
         kc4Lzw+RgLMVoMEnTz8cptOugz4vpD6Wc2OD9gE5w8mp7r5DvnqDXocKn3t9idS7lExr
         4fnw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Is it possible to reach current rx/tx information for each connection
without having to listen with pcap or redirecting to a user space
daemon?

Regards,

note: from freebsd session table:

all tcp 31.160.60.10:443 <- 91.10.177.169:53315       ESTABLISHED:ESTABLISHED
   [231786895 + 65535](+2304119762)  [2922147009 + 65535](+2119412158)
   age 00:01:38, expires in 24:00:00, 1307:1619 pkts, 60892:1696057
bytes, rule 2
   id: 50535525b07ac0c0 creatorid: 21eda4d4


--
Oguz YILMAZ
