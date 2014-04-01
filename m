From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: cache coherency problem, why not happening ?
Date: Tue, 1 Apr 2014 09:49:53 +0530
Message-ID: <CAGZFCEFDM109559QWXMSoy7Cru5-2MQt-4FX_tk6uK1-u7M-7Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=mvSTq7JFtAxEzcTlG7WR7h2hEcOrOIE6osdOGMzdUyA=;
        b=B7tqrVdVCmZxh6Q4WVPhAljvflZTvwSJSb14Hyd8iyYzYp7Nl7zvLPgadFzmlYbwco
         Nwzx03mEP/AiKIJPTB5/ujUxDrvCs/fHh1rpamGGl6ZERWu7pNw8EOvDQGY8m6CYdJPa
         us9XkRCZGunXYTwGlhtwbHDBEVKCj3gVfq3wcOHVvHb10Tl5ktlnD5t0S/aovs58K003
         XqhzTjzYwxCEC/OiglMMRC031pkCe5UAVN05thnc9TcSqfjdg4AzAZsbGdAmiy0oag0q
         8wntzUv9HsqgvwS1f4FE2xeA3SsJyAfJnDlkjJCUugDq8vGDbBeWtrjm0s1Cwk8N/lBG
         oXKA==
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev <netdev@vger.kernel.org>, Netfilter mailing list <netfilter@vger.kernel.org>

I  could see     spin lock   (&sk->sk_receive_queue.lock)   is
acquired  before queing  sk_buff . This is done in interrupt context (
called from bottom half,
http://lxr.linux.no/#linux+v3.13.5/net/packet/af_packet.c#L1818 ).
userspace can receive the packet using  system call and system call
will acquire the same lock
( http://lxr.linux.no/#linux+v3.13.5/net/core/datagram.c#L191 ).


Suppose in smp machine,  if  bottom half is executed by  cpu #1  and
the  userspace process is pinned to cpu #2.  How can the  spin lock
acuquired info ( lock value ) will be reflected   to cpu #2 ( if cpu
#2 has already acquired and released the lock value and the lock value
is  stored in a cpu #2 data cache. so if cpu #1 acquire it , cpu#2
will read the cache value which says it is free). I could see that
spin_lock_t is not a volatile value also.


Thanks,
Ratheesh
