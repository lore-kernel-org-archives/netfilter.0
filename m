From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: [ANNOUNCE] ipset 7.10 released
Date: Sun, 20 Dec 2020 16:01:37 +0100 (CET)
Message-ID: <b56e4c5-cd49-272f-fd39-707442d86cd5@mail.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I'm happy to announce ipset 7.10. It comes with two fixes from Vasily 
Averin and a few backward compatibility patches. Please note, the support 
of older kernel trees was broken in 7.9 which is fixed in 7.10.

Kernel part changes:
  - Fix patch "Handle false warning from -Wstringop-overflow"
  - Backward compatibility: handle renaming nla_strlcpy to nla_strscpy
  - treewide: rename nla_strlcpy to nla_strscpy. (Francis Laniel)
  - netfilter: ipset: fix shift-out-of-bounds in htable_bits()
    (Vasily Averin)
  - netfilter: ipset: fixes possible oops in mtype_resize (Vasily Averin)
  - Handle false warning from -Wstringop-overflow
  - Backward compatibility: handle missing strscpy with a wrapper of 
    strlcpy.
  - Move compiler specific compatibility support to separated file (broken
    compatibility support reported by Ed W)

You can download the source code of ipset from:
        http://ipset.netfilter.org
        ftp://ftp.netfilter.org/pub/ipset/
        git://git.netfilter.org/ipset.git

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
