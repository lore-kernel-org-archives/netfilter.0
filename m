From: =?UTF-8?Q?=C4=B0brahim_Ercan?= <ibrahim.metu@gmail.com>
Subject: Why I can not use physdev module on iptables POSTROUTING chain?
Date: Fri, 6 Oct 2017 11:25:38 +0300
Message-ID: <CAK6Qs9=1tbQJ2ds2QTTt0SfSNX6_OvFX_S=2S41kHgO=xim3=w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ttLZefX/fw23MlV/PufY1bfYNEXoM326j99eEheFpHM=;
        b=CRSpVwtG0xXgb1GAulemJIj2u9X50hn/YtW+VHv21488sLb3WkSkUBgUK3Bj8SSFuW
         cHfbG2Eklvv4bLRs0ToiVVdAQgrNvq0ooP3ipvWe64lt61XnhNefzsmLgfr3O5yL2ENV
         mP2uMYPDEUVj7w1Zufqi6hbll21Itpfxv/v/5m5VdmciP7wlM5tl7bZYhQV7zdqnxqVv
         xBR6Up8t8Irq1xgqOLIMWziZx/gRpT8v4P9OYi0cM7S8r6q/0n4+rpdTI0d10G475yvj
         YKtSmeAN4++2+m11sKwyLs+23pu8bZQjPuBBmmkUxZocAySQTEUrRUd0Zfvd8HW3v/os
         7RhQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi.
I have a bridged topology and want to match bridge interface on
mangle/POSTROUTING chain.

I can add a rule like this.

iptables -A POSTROUTING -t mangle -m physdev --physdev-in enp0s3

Then I figured out packets aren't matching and I saw this warning on dmesg.

xt_physdev: using --physdev-out in the OUTPUT, FORWARD and POSTROUTING
chains for non-bridged traffic is not supported anymore

Then I just tried "-o enp0s3" and that didnt work either.

I wonder why this feature isnt suported anymore?
And Is there a way that I can match by interface on POSTROUTING if I
have a bridged topology?

Regards

Ibrahim Ercan
