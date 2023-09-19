From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: [ANNOUNCE] ipset 7.18 released
Date: Tue, 19 Sep 2023 20:26:38 +0200 (CEST)
Message-ID: <55c2bf9d-ec58-8db-e457-8a36ebbbc4c0@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I'm happy to announce ipset 7.18, which brings a few fixes, backports, 
tests suite fixes and json output support.

Userspace changes:
  - Add json output to list command (Thomas Oberhammer)
  - tests: hash:ip,port.t: Replace VRRP by GRE protocol (Phil Sutter)
  - tests: hash:ip,port.t: 'vrrp' is printed as 'carp' (Phil Sutter)
  - tests: cidr.sh: Add ipcalc fallback (Phil Sutter)
  - tests: xlate: Make test input valid (Phil Sutter)
  - tests: xlate: Test built binary by default (Phil Sutter)
  - xlate: Drop dead code (Phil Sutter)
  - xlate: Fix for fd leak in error path (Phil Sutter)
  - configure.ac: fix bashisms (Sam James)
  - lib/Makefile.am: fix pkgconfig dir (Sam James)

Kernel part changes:
 - netfilter: ipset: Fix race between IPSET_CMD_CREATE and IPSET_CMD_SWAP
    (reported by Kyle Zeng)
  - netfilter: ipset: add the missing IP_SET_HASH_WITH_NET0 macro for
    ip_set_hash_netportnet.c (Kyle Zeng)
  - compatibility: handle strscpy_pad()
  - netfilter: ipset: refactor deprecated strncpy (Justin Stitt)
  - netfilter: ipset: remove rcu_read_lock_bh pair from ip_set_test
    (Florian Westphal)
  - netfilter: ipset: Replace strlcpy with strscpy (Azeem Shaikh)
  - netfilter: ipset: Add schedule point in call_ad(). (Kuniyuki Iwashima)
  - net: Kconfig: fix spellos (Randy Dunlap)
  - netfilter: ipset: Fix overflow before widen in the bitmap_ip_create()
    function. (Gavrilov Ilia)

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
