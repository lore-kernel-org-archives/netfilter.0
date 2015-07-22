From: Donald Schlicht <dschlic1@gmail.com>
Subject: Help with routing ping requests
Date: Wed, 22 Jul 2015 11:59:21 -0400
Message-ID: <CAA0NJifxj+g70uXUit=N-EvbdtgbPxMhXCqJVvx7Zz2a5U_s9Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=3huQhXQ7ZxFjIhw8dqJVBgvDY3H+ki1GkBZf0oUH+c4=;
        b=1EF5jEyQBPhuqEA04UWloP6UV591k+cGCDWUIDYoeLmCfJfVNmJ0tnce2lU+bzbBk4
         C/SCK/m1lxQh73odClPoos4AzE3xThfj2vPOiGsqBoKwmy6ANyoqbb5P1hLJKNkLotek
         dUKq5a0FeXz0mU38vGEjWWAvpC///ODoVkP8udzJZPvGkPgjznw91z392r0xHaCXOM3s
         63J7NMIYVP4wDvYSj1aQCY7Iq98FaNEQFxMPL4KYSHyGxhm2F16eOSM5p2SaeW3Nfy6+
         AYdjWnsQdUI3daBzHt1sOqGxbh28svgmqkjJWHADLqyJ54JfeOhlwC2X6WzxVOjHbRSN
         uwVg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have found a solution to this issue. For some reason I have to put a
SNAT in the POSTROUTING table to change the source IP address to the
LAN gateway address. Once I did that, the system started working
correctly.

Thanks for all of your help
