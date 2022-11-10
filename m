From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnftnl 1.2.4 release
Date: Thu, 10 Nov 2022 16:21:28 +0100
Message-ID: <Y20W+LT/+sq/i2rz@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="RdtRELJTBSCF7X6r"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--RdtRELJTBSCF7X6r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnftnl 1.2.4

libnftnl is a userspace library providing a low-level netlink
programming interface (API) to the in-kernel nf_tables subsystem.
This library is currently used by nftables.

This release includes two fixes for the printing of the set element
user data area and the removal of an internal function without any
clients.

This release also includes a fix for the nfnetlink .res_id incorrect
endianess. Note that there is a workaround in the kernel that has been
available for a while which is present in -stable releases:

 commit a9de9777d613500b089a7416f936bf3ae5f070d2
 Author: Pablo Neira Ayuso <pablo@netfilter.org>
 Date:   Fri Aug 28 21:01:43 2015 +0200

    netfilter: nfnetlink: work around wrong endianess in res_id field

Old Linux kernel versions <= 4.9 might break without the above
kernel patch since libnftnl >= 1.2.4.

See ChangeLog that comes attached to this email for more details on
the updates.

You can download it from:

https://www.netfilter.org/projects/libnftnl/downloads.html

Happy firewalling.

--RdtRELJTBSCF7X6r
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="changes-libnftnl-1.2.4.txt"

Ian Pilcher (1):
      libnftnl: Fix res_id byte order

Jeremy Sowden (1):
      rule, set_elem: fix printing of user data

Pablo Neira Ayuso (3):
      rule, set_elem: remove trailing \n in userdata snprintf
      expr: payload: remove unused function
      build: libnftnl 1.2.4 release


--RdtRELJTBSCF7X6r--
