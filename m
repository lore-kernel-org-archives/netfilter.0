From: =?UTF-8?Q?Fejes_J=C3=B3zsef?= <jozsef.fejes@gmail.com>
Subject: nftables&iptables coexistence
Date: Wed, 18 Jun 2014 21:49:01 +0200
Message-ID: <CALU-w99A94oGuedx=tr_5vASnYLHFLx1CF3_288dwMvcYi-M9w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=CiiYhvR5Oy+hq8di0imuGVI+9i1PAGZ5dOjP3WvQHXM=;
        b=RsIUHnk7DJx8YVPLomHkRgBAJbTrl8Iy5tBxOQAclI/fXYiUBpEb3OUUs18eSBL1PX
         Kxog73iGCL0slMmgRCk4uYs9YdrVj663K1sHANfIhixCq6PO6I/PFjaR00m6o40Bm6AF
         XCKZWRhtubtyW13OiAhEGCOfZRyBtjOahs90NAl9YcK/s6TNlfaR3ndvP+Vvf6riNvtf
         YwdtHv68Y1O8fAJ6x/tcSH3SuLCKt6RwYUsJi9YFKzo/WkUJ0/0FNabflQj7X+y/cGhc
         jxAFopvfj1JbqBGNU/c+HlmyHm51gVZjY4G6JTNqegTlyB+ytf5lvB4ArdP+j1Ew1vUU
         ClDw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I would like to start using nftables, but I'm playing with a headless
box and it would be too inconvenient if I locked myself out, so let me
ask this one safety question before I start experimenting. I have lots
of iptables rules. If I compile nftables into my kernel, and also
leave iptables there, and reboot, what will happen? Will packets go
through both iptables and nftables? In what order? Without any
configuration from user space, does nftables pass along each packet
without intervention?

Please CC me, I'm not on the list.

Thanks,
Jozsef
