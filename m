From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: [ANNOUNCE] ipset 7.19 released
Date: Thu, 21 Sep 2023 09:02:50 +0200 (CEST)
Message-ID: <c2818bd0-257c-6eb5-7a85-a1a0f0a7629d@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

The installation of the pkgconfig file of libipset was broken in 7.18, 
thus a new release was needed. The only modification in the new package is 
the fixed install path.

Userspace changes:
  - build: Fix the double-prefix in pkgconfig (Sam James)

Kernel part changes:
  none

You can download the source code of ipset from:
        https://ipset.netfilter.org
        git://git.netfilter.org/ipset.git

Best regards,
Jozsef
-
E-mail:  kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key: https://wigner.hu/~kadlec/pgp_public_key.txt
Address: Wigner Research Centre for Physics
         H-1525 Budapest 114, POB. 49, Hungary
