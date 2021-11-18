From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnftnl 1.2.1 release
Date: Thu, 18 Nov 2021 11:45:55 +0100
Message-ID: <YZYu487P9hhbYtUS@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="CIeVzyNoEvK+XNBk"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--CIeVzyNoEvK+XNBk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnftnl 1.2.1

libnftnl is a userspace library providing a low-level netlink
programming interface (API) to the in-kernel nf_tables subsystem.
This library is currently used by nftables.

See ChangeLog that comes attached to this email for more details.

You can download it from:

https://www.netfilter.org/projects/libnftnl/downloads.html
https://www.netfilter.org/pub/libnftnl/

Happy firewalling.

--CIeVzyNoEvK+XNBk
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="changes-libnftnl-1.2.1.txt"

Pablo Neira Ayuso (8):
      include: update nf_tables.h
      expr: add last match time support
      expr: missing netlink attribute in last expression
      expr: last: add NFTNL_EXPR_LAST_SET
      set: expose nftnl_set_elem_nlmsg_build()
      set: use NFTNL_SET_ELEM_VERDICT to print verdict
      expr: payload: print inner header base offset
      build: libnftnl 1.2.1 release


--CIeVzyNoEvK+XNBk--
