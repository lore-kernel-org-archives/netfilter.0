From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnftnl 1.2.0 release
Date: Tue, 25 May 2021 13:56:05 +0200
Message-ID: <20210525115605.GA16518@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="GvXjxJ+pjyke8COw"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org
Cc: netdev@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnftnl 1.2.0

libnftnl is a userspace library providing a low-level netlink
programming interface (API) to the in-kernel nf_tables subsystem.
This library is currently used by nftables.

See ChangeLog that comes attached to this email for more details.

You can download it from:

http://www.netfilter.org/projects/libnftnl/downloads.html
https://www.netfilter.org/pub/libnftnl/

Have fun!

--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="changes-libnftnl-1.2.0.txt"

Pablo Neira Ayuso (4):
      table: add table owner support
      src: incorrect header refers to GPLv2 only
      expr: socket: add cgroups v2 support
      build: libnftnl 1.2.0 release

Phil Sutter (16):
      expr/socket: Kill dead code
      expr/tunnel: Kill dead code
      expr/xfrm: Kill dead code
      rule: Avoid printing trailing spaces
      expr/{masq,nat}: Don't print unused regs
      set_elem: Fix printing of verdict map elements
      expr: Fix snprintf buffer length updates
      obj/ct_expect: Fix snprintf buffer length updates
      obj/ct_timeout: Fix snprintf buffer length updates
      object: Fix for wrong parameter passed to snprintf callback
      expr: Check output type once and for all
      expr/data_reg: Drop output_format parameter
      obj: Drop type parameter from snprintf callback
      Drop pointless local variable in snprintf callbacks
      Get rid of single option switch statements
      ruleset: Eliminate tag and separator helpers


--GvXjxJ+pjyke8COw--
