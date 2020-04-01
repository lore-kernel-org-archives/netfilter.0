From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnftnl 1.1.6 release
Date: Wed, 1 Apr 2020 16:34:19 +0200
Message-ID: <20200401143419.a3kjyv6jds63zmoz@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="ewrmvbtdxalrojej"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--ewrmvbtdxalrojej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnftnl 1.1.6

libnftnl is a userspace library providing a low-level netlink
programming interface (API) to the in-kernel nf_tables subsystem.
This library is currently used by nftables.

See ChangeLog that comes attached to this email for more details.

You can download it from:

http://www.netfilter.org/projects/libnftnl/downloads.html
ftp://ftp.netfilter.org/pub/libnftnl/

Happy firewalling.


--ewrmvbtdxalrojej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="changes-libnftnl-1.1.6.txt"

Brett Mastbergen (1):
      include: Remove buffer.h

Florian Westphal (1):
      expr: meta: add slave device matching

Jeremy Sowden (9):
      Update gitignore.
      bitwise: fix some incorrect indentation.
      bitwise: add helper to print boolean expressions.
      include: update nf_tables.h.
      bitwise: add support for new netlink attributes.
      bitwise: add support for left- and right-shifts.
      tests: bitwise: fix error message.
      include: update nf_tables.h.
      bitwise: add support for passing mask and xor via registers.

Pablo Neira Ayuso (12):
      include: typo in object.h C++ wrapper
      udata: add NFTNL_UDATA_SET_*TYPEOF* definitions
      udata: support for TLV attribute nesting
      src: add nftnl_*_{get,set}_array()
      chain: add NFTNL_CHAIN_FLAGS
      set_elem: missing set and build for NFTNL_SET_ELEM_EXPR
      set: support for NFTNL_SET_EXPR
      expr: masq: revisit _snprintf()
      expr: nat: snprint flags in hexadecimal
      Revert "bitwise: add support for passing mask and xor via registers."
      include: update nf_tables.h.
      build: libnftnl 1.1.6 release

Phil Sutter (7):
      tests: flowtable: Don't check NFTNL_FLOWTABLE_SIZE
      flowtable: Fix memleak in error path of nftnl_flowtable_parse_devs()
      chain: Fix memleak in error path of nftnl_chain_parse_devs()
      flowtable: Correctly check realloc() call
      chain: Correctly check realloc() call
      examples: Replace use of deprecated symbols
      src: Fix for reading garbage in nftnl_chain getters

Stefano Brivio (3):
      include: resync nf_tables.h cache copy
      set: Add support for NFTA_SET_DESC_CONCAT attributes
      set_elem: Introduce support for NFTNL_SET_ELEM_KEY_END


--ewrmvbtdxalrojej--
