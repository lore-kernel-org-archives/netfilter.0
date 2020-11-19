From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: [ANNOUNCE] ipset 7.8 released
Date: Thu, 19 Nov 2020 21:48:32 +0100 (CET)
Message-ID: <alpine.DEB.2.23.453.2011192141150.19567@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I'm happy to announce ipset 7.8 which includes a couple of fixes, 
compatibility fixes. Small improvements like the new flags of the hash:* 
types make possible to optimize sets for speed or memory and to restore 
exactly the same set (from internal structure point of view) as the saved 
one.

Kernel part changes:
  - Complete backward compatibility fix for package copy of 
    <linux/jhash.h>
  - Compatibility: check for kvzalloc() and GFP_KERNEL_ACCOUNT
  - netfilter: ipset: enable memory accounting for ipset allocations
    (Vasily Averin)
  - netfilter: ipset: prevent uninit-value in hash_ip6_add (Eric Dumazet)
  - Compatibility: use skb_policy() from if_vlan.h if available
  - Compatibility: Check for the fourth arg of list_for_each_entry_rcu()
  - Backward compatibility fix for the package copy of <linux/jhash.h>

ipset 7.7 was released without announcement, so the changelogs are listed 
here for the sake of completeness:

Userspace changes:
  - Expose the initval hash parameter to userspace
  - Handle all variable header parts in helper scripts instead ot test 
    tasks
  - Add bucketsize parameter to all hash types
  - Support the -exist flag with the destroy command

Kernel part changes:
  - Expose the initval hash parameter to userspace
  - Add bucketsize parameter to all hash types
  - Use fallthrough pseudo-keyword in the package copy of <linux/jhash.h> 
    too
  - Support the -exist flag with the destroy command
  - netfilter: Use fallthrough pseudo-keyword (Gustavo A. R. Silva)
  - netfilter: Replace zero-length array with flexible-array member
    (Gustavo A. R. Silva)
  - netfilter: ipset: call ip_set_free() instead of kfree() (Eric Dumazet)
  - netfiler: ipset: fix unaligned atomic access (Russell King)
  - netfilter: ipset: Fix subcounter update skip (Phil Sutter)
  - ipset: Update byte and packet counters regardless of whether they 
    match (Stefano Brivio)
  - netfilter: ipset: Pass lockdep expression to RCU lists (Amol Grover)
  - ip_set: Fix compatibility with kernels between v3.3 and v4.5
    (Serhey Popovych)
  - ip_set: Fix build on kernels without INIT_DEFERRABLE_WORK
    (Serhey Popovych)
  - ipset: Support kernels with at least system_wq support
  - ip_set: Fix build on kernels without system_power_efficient_wq
    (Serhey Popovych)

You can download the source code of ipset from:
        http://ipset.netfilter.org
        ftp://ftp.netfilter.org/pub/ipset/
        git://git.netfilter.org/ipset.git

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
