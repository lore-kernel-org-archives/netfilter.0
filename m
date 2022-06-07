From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnftnl 1.2.2 release
Date: Tue, 7 Jun 2022 16:37:18 +0200
Message-ID: <Yp9intemtsFLlZWh@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="9dxThqyU9FsFkAsw"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--9dxThqyU9FsFkAsw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnftnl 1.2.2

libnftnl is a userspace library providing a low-level netlink
programming interface (API) to the in-kernel nf_tables subsystem.
This library is currently used by nftables.

See ChangeLog that comes attached to this email for more details.

You can download it from:

https://www.netfilter.org/projects/libnftnl/downloads.html

Happy firewalling.

--9dxThqyU9FsFkAsw
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="changes-libnftnl-1.2.2.txt"

Florian Westphal (1):
      exthdr: tcp option reset support

Pablo Neira Ayuso (2):
      set_elem: missing export symbol
      build: libnftnl 1.2.2 release


--9dxThqyU9FsFkAsw--
