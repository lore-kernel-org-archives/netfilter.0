From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnftnl 1.2.3 release
Date: Tue, 9 Aug 2022 20:37:28 +0200
Message-ID: <YvKpaFTOlsXWtS68@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="fa4xOUHTKoNpPHhp"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--fa4xOUHTKoNpPHhp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnftnl 1.2.3

libnftnl is a userspace library providing a low-level netlink
programming interface (API) to the in-kernel nf_tables subsystem.
This library is currently used by nftables.

This release includes a compile time bugfix with clang and
-D_FORTIFY_SOURCE=2. This bug can be emulated using GCC by undefining
the __va_arg_pack macro before stdio.h

See ChangeLog that comes attached to this email for more details.

You can download it from:

https://www.netfilter.org/projects/libnftnl/downloads.html

Happy firewalling.


--fa4xOUHTKoNpPHhp
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="changes-libnftnl-1.2.3.txt"

Nicholas Vinson (1):
      build: fix clang+glibc snprintf substitution error

Pablo Neira Ayuso (1):
      build: libnftnl 1.2.3 release


--fa4xOUHTKoNpPHhp--
