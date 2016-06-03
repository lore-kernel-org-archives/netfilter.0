From: Georgios Amanakis <gamanakis@gmail.com>
Subject: ip6tables --set-mark drops/distorts link-local packets
Date: Fri, 3 Jun 2016 12:09:05 -0400
Message-ID: <CACvFP_jMmuDPkN+ynW3vrZecdTPFGB6g=s9q5ZX1T_C8rL=3nQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=WcT1uyNV/63ChYoWGXV8E8FhBGEztv73Fa0cMs28Jpc=;
        b=MBoauA/UnrzXqzkCDj/bM9X9bhVKdrbggQN8Wsv4AZ0h4nZXWsG9tm0dlHkv5zIEgi
         +joM3usNNdGMfGfCRshmbFvqqiwBGMdiTO7YTuWEmEGpzqFglPVVxDC80BSUut+0+853
         IU8UvZOgjdXg9MBzDtRfIy7x1iroarKqZ9VDNIz3sBaX37N5yIOR3EZ7qcoRW4amEeMA
         RmUom8yfOQeXj/P9Lfxurzgw/yDJnLwCMYuHBEdPVhjife1tnx/pUA0nuFUvO+3RqDKK
         rwCvrz3SSYc3HHuIas/cXUUqH15oPUFaPmgMjY7YGasAFVm1ui0BWLWsSulHf8N9L+P7
         QeUQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I have already posted this in the lartc mailing list but I think the
netfilter one is more suitable.

I discovered that marking IPv6 packets with ip6tables results in link-
local traffic being dropped/distorted. Specifically link-local UDP
traffic on ports 546-547 (necessary for DHCPv6) fails in this
situation. I provide a script for testing purposes:

-----------8<------------
#!/usr/bin/sh

ip6tables -t mangle -F
ip6tables -t mangle -A OUTPUT -o $oif -j MARK --set-mark 3

exit 0
-----------8<------------

Is this behavior known/expected? My search didn't reveal any relevant
results on the web.
I am running Archlinux, uname -a:
"Linux a-router 4.4.11-1-lts #1 SMP Thu May 19 21:03:24 CEST 2016
x86_64 GNU/Linux"

George
