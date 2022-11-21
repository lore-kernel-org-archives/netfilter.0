From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: [ANNOUNCE] ipset 7.16 released
Date: Mon, 21 Nov 2022 20:31:34 +0100 (CET)
Message-ID: <d65fe5d8-d5ea-ef7-102d-aa1d15bb4d69@netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="110363376-945108895-1669059094=:505418"
Return-path: <netfilter-devel-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110363376-945108895-1669059094=:505418
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I'm happy to announce ipset 7.16, which includes a few fixes,
compatibility patches to support recent kernels and a new "bitmask"
option for the hash:ip, hash:ipport, hash:netnet types to use
any kind of netmask, from Vishwanath Pai.

Userspace changes:
  - Add new ipset_parse_bitmask() function to the library interface
  - test: Make sure no more than 64 clashing elements can be added
    to hash:net,iface sets
  - Fix all debug mode warnings
  - netfilter: ipset: add tests for the new bitmask feature (Vishwanath=20
    Pai)
  - netfilter: ipset: Update the man page to include netmask/bitmask=20
    options (Vishwanath Pai)
  - netfilter: ipset: Add bitmask support to hash:netnet (Vishwanath Pai)
  - netfilter: ipset: Add bitmask support to hash:ipport (Vishwanath Pai)
  - netfilter: ipset: Add bitmask support to hash:ip (Vishwanath Pai)
  - netfilter: ipset: Add support for new bitmask parameter (Vishwanath=20
    Pai)
  - ipset-translate: allow invoking with a path name (Quentin Armitage)
  - Fix IPv6 sets nftables translation (Pablo Neira Ayuso)
  - Fix typo in ipset-translate man page (Bernhard M. Wiedemann)

Kernel part changes:
  - netfilter: ipset: restore allowing 64 clashing elements in=20
    hash:net,iface
  - netfilter: ipset: Add support for new bitmask parameter (Vishwanath=20
    Pai)
  - netfilter: ipset: regression in ip_set_hash_ip.c (Vishwanath Pai)
  - netfilter: move from strlcpy with unused retval to strscpy
    (Wolfram Sang)
  - compatibility: handle unsafe_memcpy()
  - netlink: Bounds-check struct nlmsgerr creation (Kees Cook)
  - compatibility: move to skb_protocol in the code from tc_skb_protocol
  - Compatibility: check kvcalloc, kvfree, kvzalloc in slab.h too
  - sched: consistently handle layer3 header accesses in the presence
    of VLANs (Toke H=C3=B8iland-J=C3=B8rgensen)
  - treewide: Replace GPLv2 boilerplate/reference with SPDX
    - rule 500 (Thomas Gleixner)
  - headers: Remove some left-over license text in=20
    include/uapi/linux/netfilter/ (Christophe JAILLET)
  - netfilter: ipset: enforce documented limit to prevent allocating
    huge memory
  - netfilter: ipset: Fix oversized kvmalloc() calls

You can download the source code of ipset from:
        https://ipset.netfilter.org
        git://git.netfilter.org/ipset.git

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110363376-945108895-1669059094=:505418--
