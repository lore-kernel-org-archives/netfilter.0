From: Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>
Subject: ulogd - ip_conntrack_netlink - how to get it working one
Date: Fri, 27 Jul 2012 19:26:17 -0700
Message-ID: <CAAJpzgb2ZEoRayuzvUVevvRvJ=oXA6=heQa98fKD_63QXVe4xg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=7EvFJb4Eewg6XwVtkBvTjpV0f42EUBZb6ZIZ47TUj3U=;
        b=N4EhhiTg2X1sy9D/aR4vbHUL9l0ote2Z3FZwzUbt9JkhG6t5ZF4/gfenagW4+rUX9j
         MRQqGnD0GCzqgBXt/pPG2JT3inyPsQ68GFJX8B/8JDW7XuA8IjxCh1+lPQ+rWi/O4wt5
         hTv2I6wdOcMf4JsI7PoEn/fR+5XDVZtMybGoho2d5BLj/yHR/OE9H4/D0iNOJgPUNUbt
         wZCVR3FJxNz2aeLQzkIimf3h4mdNO7UrcFexlg7hS81S/Q7sUby/EbD5zRE/bYiq/zht
         5PB7y/SQgjtAH1dY4h4T18XaqYmGfiuXIvlUWABMs1G8LhZkdDSqSPX6vdO42cNen78D
         OqNg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi,

I have a RHEL 5 os in my system. I have setup ulogd in my local
system. I=92m able to do packet capturing.
I=92m not able to capture flow based logging. What I have found was, in
my system I don=92t have nf_conntrack_netlink.
Instead I have ip_conntrack_netlink. Is that possible I can
incorporate nf_conntrack_netlink into RHEL5? And make ulogd to be
working one.

Your help would be much appreciated.

Thanks,


Thanks & Regards,
