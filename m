From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnftnl 1.2.5 release
Date: Thu, 9 Mar 2023 20:54:43 +0100
Message-ID: <ZAo5g2gfD8z4OEs0@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="wwWqwfWRtgetfK/F"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--wwWqwfWRtgetfK/F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnftnl 1.2.5

libnftnl is a userspace library providing a low-level netlink
programming interface (API) to the in-kernel nf_tables subsystem.
This library is currently used by nftables.

This release includes two fixes for the printing of the set element
user data area and the removal of an internal function without any
clients.

See ChangeLog that comes attached to this email for more details on
the updates.

You can download it from:

https://www.netfilter.org/projects/libnftnl/downloads.html

Happy firewalling.

--wwWqwfWRtgetfK/F
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="changes-libnftnl-1.2.5.txt"

Pablo Neira Ayuso (5):
      examples: remove nftnl_batch_is_supported() call
      src: replace nftnl_*_nlmsg_build_hdr() by nftnl_nlmsg_build_hdr()
      expr: add inner support
      chain: relax logic to build NFTA_CHAIN_HOOK
      build: libnftnl 1.2.5 release

Phil Sutter (1):
      Makefile: Create LZMA-compressed dist-files


--wwWqwfWRtgetfK/F--
