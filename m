From: Kesava Srinivas <vunnavafuture@gmail.com>
Subject: Query in understanding skb_pull !!!
Date: Tue, 3 Apr 2012 07:20:24 +0530
Message-ID: <CADWUQZ5Opw9-1gzCDvJ6i66k_JPt89jcLem5TAEj5ACyh8SS6Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=A9IYblPUWOBrowk7HODmIuOKRKgwvG3PzMXRNebtPdM=;
        b=eO5BFwiJYTvhUggimqYYEv/iQ6137buUWuYdS2d1KEOmv7P3YXr0paYSPQLLWJGvFh
         s6Jb7sQUjumsI4OsjITG2KgdABulyryJVCmShnOudu9z7d+WgdWkRrEunqa0eHYi2GoK
         VVVA3sROxKd092wuzHhlUnLbTgp3Gl6RESsi6BOrNKPSMmV7N4S2F+BuMnwIroagUM1n
         FmpoCPeEZIBNJQkV6GG9JXTWJMZduqZ+zjoDepRzxWVhkcpwHRioNw49NAYLP50UprLx
         Kg+8KFZDaCJC8v8Qy97a6/dQtmh3vk2raqN1krNuY9+FNwa5u1q71qSacYGXrZSwAA+c
         8f2w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

HI ,
Looking for a Confirmation on this !

Once after Capturing the Socket Buffer in PRE_ROUTING Hook; Manipulated the
Socket Buffer by using the "skb_pull" Kernel Function. Using skb_pull;
stripped 28 bytes (IP+UDP) which are the Part of outer UDP/IP Header. Now;
My intention was to route the skb based on the Inner IP Header which is
sitting after stripping 28 bytes. At the END of the Program; returned NF_ACCEPT.

Even though; skb_pull worked Fine., Kernel's Stack is still looking in to
Outer Header only for Routing the Packet.I expected ;Kernel will look the
Inner Header (As data Pointer was incremented by 28 bytes via skb_pull) and
Take decision based on the Inner one. But; that didn't  happened. It looks
to me like; we need to always use NF_STOLEN & should write our own code to
route based on the INNER HEADER. Was my conclusion correct ??

-Thanks in Advance,
VKS
