From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnftnl 1.2.6 release
Date: Tue, 11 Jul 2023 18:58:58 +0200
Message-ID: <ZK2KUlzZzlQ8/mKa@calendula>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="mSGEbGQnIBDK8HSy"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--mSGEbGQnIBDK8HSy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnftnl 1.2.6

libnftnl is a userspace library providing a low-level netlink
programming interface (API) to the in-kernel nf_tables subsystem.
This library is currently used by nftables.

This release includes meta broute support.

See ChangeLog that comes attached to this email for more details on
the updates.

You can download it from:

https://www.netfilter.org/projects/libnftnl/downloads.html

Happy firewalling.

--mSGEbGQnIBDK8HSy
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="changes-libnftnl-1.2.6.txt"

Pablo Neira Ayuso (1):
      build: libnftnl 1.2.6 release

Sriram Yagnaraman (1):
      expr: meta: introduce broute meta expression

shixuantong (2):
      tests: nft-table-test: fix typo
      tests: nft-rule-test: Add test cases to improve code coverage


--mSGEbGQnIBDK8HSy--
