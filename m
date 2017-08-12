From: "Moh'd Reza Abbasi" <mr.mrabbasi@gmail.com>
Subject: How to Filtering and Queue the Packets of a Process using Iptable
Date: Sat, 12 Aug 2017 12:32:52 +0530
Message-ID: <CANOabFJhmHytdO9tD0a4bXcxj=rOfH=t2E=ODN1YDLV=s3R+Dg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=9kOhlZRlS8ZIJbN02lq/1bk9iGtF2kkWJG/vRqHX+0U=;
        b=uBqEcXe0Arv0GLMdM4oJ0CNGS5ivlbgwvIwDAa7hHIY01rj1zId1z3sTiybpkuS/0b
         98qDytzRvyyzMmreIcLplhXBBhsKjrP4uURuyeFDdT1Li5/nHqL0jo1W9fYznPjdKVt4
         llpg2XGhpjyJwhuapjnHz92QssS5FrdEzLHIfZts8NpUqaj/0YS3G/KOPgWpFw8xAZPG
         NcRdBLSpoVKGHQEnt8AMg75HU3ZlEwUwdWRJNMnwXkTIk5bV/vwH6zvoXLalk/Q2uHJQ
         6XRSUhG/Sd33XvF2rpeMBZ+D6n+4r2weKA0ywDg1R+wyZpKIYCXMTUdQcqDfL5z9CwZd
         LDqw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am trying to queue the packets of a process so I can use
libnetfilter_queue to modify them.

I read in the documentation that I should use --pid-owner processid to
filter packets of a process and iptables -I <table or chain> <match
specification> -j NFQUEUE --queue-num <queue number> to add them to
the queue.

I read the documentation but I am still confused how to do this. If
any one can help me to understand this command I would appreciate it a
lot.
