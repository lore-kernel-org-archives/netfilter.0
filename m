From: Kevin Wilson <wkevils@gmail.com>
Subject: xt_SECMARK: unable to map security context 'httpcontext (error)
Date: Mon, 3 Jun 2013 20:12:53 +0300
Message-ID: <CAGXs5wVYPa4k_fM1CtGG9VFstgeAAvX+F4Mq8wf_yrTM2Opp5Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=JJPjxFuVqTPQu3Ve2rCeWVKm43cLn8i+llFb+3+HfDg=;
        b=LagQrqggSONlKgmjt+lZW2rJtMJ2Vv+Tu4bR1j/kKBySejVjcu3F4ZVMlcCy4g2jhZ
         vl2KruN2Twwh4sidqFWGkex0C+/F8D+hbjgkeLQavapuxitRNOnEPIxxmzyPDrBJE+wc
         pJUxLzlHvYlGxkMinBlkzRwDIkBQfN7YcCdAmfZcOTVtrwHANMVpk1q8zVSDK/LlDv82
         N0CKznhwSFff7X0wpGkpH8RZGUlU5fKZXIvyj3lkh0iQLrcsgeV1A1dvL5ssHRyhzO4I
         OxQtxpXKkxUp1hXE0g+GXmGht1eRdg1PiglY/8tg7daSOKAm9HukP0lHwXoTRGOJVw12
         VM0g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I am trying in Ubuntu 13.04 to run this:

 -
modprobe xt_SECMARK
than:
iptables -t mangle -A PREROUTING -p tcp --dport 80 -j SECMARK --selctx httpconte

And I get:
iptables: No chain/target/match by that name.

syslog says:
Jun  3 20:09:48 amd kernel: [ 3269.413962] xt_SECMARK: unable to map
security context 'httpcontext

what should I do ?

Kernel:
3.8.0-19-generic
iptables v1.4.12


regards,
Kevin
