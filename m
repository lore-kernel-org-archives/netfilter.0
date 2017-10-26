From: Zheng konia <konianet@gmail.com>
Subject: How to enable jhash for nftables v0.8
Date: Thu, 26 Oct 2017 16:48:55 +0800
Message-ID: <CAG1z+79Ed9-U4XbU3As1Yc6QVi61Wro0PA4eUVmx=RSdjvFj3w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=gPSbk85tldIRLIagAJZBghdl+09DXX9jVaM6KcSag8s=;
        b=j0kWw4+YhDt06YYDCfY7jfXJKYkxvtXYqQyhp+uN7DYCWaB+pJ+jReipkyaXCDn9Zf
         BE9LYmCMCtk0Vq10oHtGfR2uG1/BScyUoDbhuo1GiC5yaT3lvctOQn7pf/J5TuvZBFv2
         8V1bvi3sr6+lB4e/7tgegtPdALg43b5fvg6tzmS2tfTSvVZHlEcFTmDnFr5nQxceVrdh
         YdsR7O58+CvR69ts3yRHntsynGI/6vhjFL505Xu+uVnbZdIpsBmo26cImxuDU/REnwXq
         XDyeAFpMXkSagxgqlnBk3CokVtX0fCK1BTDXwAWgmfDX7F6Wa+Xl/tKCL3xROO2ABuo/
         aXjQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hi,

   I'm have some error with configureing nftables-nat with loading
balance when I trying `jhash`.

   # nft add rule nat prerouting mark set jhash ip saddr . tcp dport mod 2
         Error: Could not process rule: Invalid argument
         add rule nat prerouting mark set jhash ip saddr . tcp dport mod 2
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   My environment is Debian 9 with nftables v0.8 (Joe Btfsplk).

    How can I enable jhash for nftables? Do I missing some package?


   Thanks.
