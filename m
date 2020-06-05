From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnftnl 1.1.7 release
Date: Fri, 5 Jun 2020 13:39:50 +0200
Message-ID: <20200605113950.GA8489@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="9amGYk9869ThD9tj"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnftnl 1.1.7

libnftnl is a userspace library providing a low-level netlink
programming interface (API) to the in-kernel nf_tables subsystem.
This library is currently used by nftables.

See ChangeLog that comes attached to this email for more details.

You can download it from:

http://www.netfilter.org/projects/libnftnl/downloads.html
ftp://ftp.netfilter.org/pub/libnftnl/

Have fun.

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="changes-libnftnl-1.1.7.txt"

Pablo Neira Ayuso (5):
      udata: add NFTNL_UDATA_SET_DATA_INTERVAL
      expr: objref: add nftnl_expr_objref_free() to release object name
      expr: dynset: release stateful expression from .free path
      flowtable: relax logic to build NFTA_FLOWTABLE_HOOK
      build: libnftnl 1.1.7 release


--9amGYk9869ThD9tj--
