From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: [ANNOUNCE] ipset 7.14 released
Date: Wed, 28 Jul 2021 16:38:22 +0200 (CEST)
Message-ID: <8c12d23-4fcb-cfb9-4759-5496c597492f@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

Ipset 7.14 released to fix the dynamic library issue and also a kernel 
compiling problem on 32bit systems:

Userspace changes:
  - Add missing function to libipset.map and bump library version
    (reported by Jan Engelhardt)

Kernel part changes:
  - 64bit division isn't allowed on 32bit, replace it with shift

You can download the source code of ipset from:
        https://ipset.netfilter.org
        ftp://ftp.netfilter.org/pub/ipset/
        git://git.netfilter.org/ipset.git

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
