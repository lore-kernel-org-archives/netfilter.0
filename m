From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnftnl 1.1.9 release
Date: Fri, 15 Jan 2021 21:54:06 +0100
Message-ID: <20210115205406.GA19710@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="7AUc2qLy4jB3hD7Z"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnftnl 1.1.9

libnftnl is a userspace library providing a low-level netlink
programming interface (API) to the in-kernel nf_tables subsystem.
This library is currently used by nftables.

See ChangeLog that comes attached to this email for more details.

You can download it from:

https://www.netfilter.org/projects/libnftnl/downloads.html

Happy firewalling.


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="changes-libnftnl-1.1.9.txt"

Jeremy Sowden (1):
      bitwise: improve formatting of registers in bitwise dumps.

Pablo Neira Ayuso (5):
      src: add NFTNL_SET_ELEM_EXPRESSIONS
      src: add NFTNL_SET_EXPRESSIONS
      src: add NFTNL_EXPR_DYNSET_EXPRESSIONS
      dynset: add NFTNL_EXPR_DYNSET_FLAGS
      build: libnftnl 1.1.9 release

Phil Sutter (2):
      set_elem: Use nftnl_data_reg_snprintf()
      set_elem: Include key_end data reg in print output


--7AUc2qLy4jB3hD7Z--
