From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: Multithreading with libnetfilter_queue?
Date: Mon, 11 Feb 2013 12:48:10 +0800
Message-ID: <CAJZVxRm0ivU2O429rEYOKhB14F2d3mqZ11yYS90s5Hj47Xv2=Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=G4AzsVHeTlRXnnyIcprf9fJI6qz6u+9XDuM2YkezapI=;
        b=PRfXwTaysfXEgNdDOndGw9VRZv8CXrr7k5vqxzBZf0Ax7Ynd9/i7UW/RB493CFvJn/
         uYt5gu8Pt1vEhVuU4zGJk1stkKxzAZ+v8/oAIpsQmUxf33oZXNO6t57f6h/+yMk7TMi7
         37e96iLzy2qhjWg2XUTJ8x6/xNhW8mgPLHcQ9bh17zI3Ltvvxh8oivr7M2mXeVHp5YbT
         gLlruQJdsAp69vfF301jSDAbSAJdCKZwmicyvNjkAA9Vpxr7WNxNM6vdfLlVLCA2m2Et
         GkXcpbCE+u1tMjOCaWGz70ZrBL42ekVIu8j8eO1yGYM/LnlObFN8ABv5NGIlldLBeFz5
         cuGA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@vger.kernel.org>

Hi,

Looks like libnetfilter_queue is single threaded, am I wrong?

-- 
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://keyserver.veridis.com )
Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
