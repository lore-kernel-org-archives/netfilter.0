From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnetfilter_conntrack 1.0.8 release
Date: Wed, 1 Apr 2020 19:41:36 +0200
Message-ID: <20200401174136.t7m4jdh5e2a74otf@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="de6u6t7tf7fshjok"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--de6u6t7tf7fshjok
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnetfilter_conntrack 1.0.8

libnetfilter_conntrack is a userspace library providing a programming
interface (API) to the in-kernel connection tracking state table. This
library is currently used by conntrack-tools among many other
applications.

See ChangeLog that comes attached to this email for more details.

You can download it from:

http://www.netfilter.org/projects/libnftnl/downloads.html
ftp://ftp.netfilter.org/pub/libnftnl/

Happy firewalling.

--de6u6t7tf7fshjok
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="changes-libnetfilter_conntrack-1.0.8.txt"

Pablo Neira Ayuso (9):
      qa: test_api: skip synproxy attributes in comparator
      src: introduce abi_breakage()
      expect: add missing handling for CTA_EXPECT_* attributes
      src: replace old libnfnetlink parser
      src: replace old libnfnetlink builder
      conntrack: api: use libmnl API to build the netlink headers
      conntrack: support for IPS_OFFLOAD
      expect: parse_mnl: fix gcc compile warning
      libnetfilter_conntrack: bump version to 1.0.8

Phil Sutter (1):
      Rename 'qa' directory to 'tests'


--de6u6t7tf7fshjok--
