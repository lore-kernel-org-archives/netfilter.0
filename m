From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Does nft offers performance advantage over iptables?
Date: Wed, 26 Aug 2015 01:21:54 +0700
Message-ID: <CAA5aLPg6cRDE0qMn=2WE0EggXpmd725PhuUqgJTaRSWTMhFUsQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=6/TH+OSGt+54SsBgbVdvRDf6ZddmNhL80FZLaut13Z0=;
        b=IKZ9u4tJaOLtplyiyxqCT/baCb/alh5DpReGBSvCvXIShjQKC1UrwK44uN6EXwdF6T
         ogHzCAeXhCNuZMkfWHZpB7ne+O4mLbR13YtPe2tdHe3M3xgtx+NFWoD3GOOuaYcvFPkU
         ghfDXasBX8pNnzJcGHlsZQ0CHQBv57zTtvORmLWLw0iS0xzZ0lR5jDY0zRmU8VUYynwT
         IhW4npecVOT5xJNAG4MT9MW1FQmxsOtGxG56OwpgCPC2r8m2YXtBv924DARbtb9Hd3dP
         5QY0FPItNKUqlLPSUb72e8Q1yJOJjqdppxuqDsXWDvTHATMbAKebaIRcpHv8B4TUm6ug
         L9Cw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

The new bold change in linux is nftables.
It might be simpler in syntax, as compared to iptables, and that might
help a beginner. But for individuals already working comfortably with
iptables and ipsets, this feature of nft doesnt offer a motivation for
change.

So, what should be the motivation for changing from iptables to nft?

Does nft offers performance advantage over iptables?
