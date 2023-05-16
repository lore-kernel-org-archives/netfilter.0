From: Shane Wang <xwang4396@gmail.com>
Subject: How to configure "full cone" NAT using iptables
Date: Tue, 16 May 2023 17:58:00 +0800
Message-ID: <CAF_hPjN0pV9w+RmO8rkSnNwd-2+ep6vmy-7JaREvUFSyNzuGhg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684231090; x=1686823090;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uS+HytvysvIIrfqcmDReKcl3Kx5yYNsrAkxnA7bou20=;
        b=HQYZI6RhfS2a2FcEFTEKy/qMfplgvGiPxC+PyX80fV2QMPW2xPTEHUOT2a0Y2nUgWV
         C5mmnMgIZ7Jc/cuVRU8l72Fgv4xHLs+26LNbCYiOj2C1yYSC3G2vhFClG3L0goY1oMu2
         B3JarZshXsa4ru653QBKkKI5uLoBTu21rAqlqeCtMhOisxEFKwdPuF2HvVM9kT4Swn75
         pfx0a+QaBf8NHGXudHuSUOzN2Qz9+0eOrp7Vo4GIhXj1CBxTOBhUUgIJ8VB31+5G+l0a
         km7akV5TyONdAGXsHNHYawgYCkN0OuE711zl2g/L5ZwqzAVJ8P1l4HFXs+Dagzwoy8Kv
         JFfA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi folks,

I have found a solution on
https://www.joewein.net/info/sw-iptables-full-cone-nat.htm, which
works fine for a single internal IP address. However, I am struggling
to configure "full cone" NAT for multiple internal IP addresses using
iptables.

I have tried the following rules, but they do not seem to work:

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 192.168.2.170
iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.1
iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.2

Could you please advise me on how to configure "full cone" NAT for
multiple internal IP addresses using iptables? If this is impossible,
are there any alternative solutions to achieve this goal?
