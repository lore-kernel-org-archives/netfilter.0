From: BENNY <BENNY130@GMAIL.COM>
Subject: =?utf-8?b?bmZxX2Rlc3Ryb3lfcXVldWU=?= never returns
Date: Wed, 9 Apr 2014 08:16:21 +0000 (UTC)
Message-ID: <loom.20140409T100909-758@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
When destroying the nfq sometimes the nfq_destroy_queue call is stuck:

#0  0x00007fac92fa09c3 in recvfrom () from /lib64/libpthread.so.0
#1  0x00007fac931b1c9e in nfnl_recv () from /usr/lib64/libnfnetlink.so.0
#2  0x00007fac931b1db5 in nfnl_catch () from /usr/lib64/libnfnetlink.so.0
#3  0x00007fac933b822f in ?? () from /usr/lib64/libnetfilter_queue.so.1
#4  0x00007fac933b82ac in nfq_destroy_queue () from 
/usr/lib64/libnetfilter_queue.so.1
#5  0x0000000000404b1b in CSpooferManager::stopNfQ (this=0x7fac91d8c010) at 
nfqueue_out.cpp:757


I'm using libnetfilter_queue-1.0.2-1cnt6.x86_64.

Any idea why this is happening and how I can work around it?

Thanks


