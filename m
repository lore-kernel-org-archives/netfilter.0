From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] nftables 0.9.6 release
Date: Mon, 15 Jun 2020 22:43:16 +0200
Message-ID: <20200615204316.GA24277@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="6c2NcOVqGQ03X4Wi"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>
Cc: netdev@vger.kernel.org, netfilter-announce@lists.netfilter.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        nftables 0.9.6

This release fixes vmap support which broke in 0.9.5.

You can download this new release from:

https://www.netfilter.org/projects/nftables/downloads.html#nftables-0.9.6
https://www.netfilter.org/pub/nftables/

To build the code, libnftnl 1.1.7 and libmnl >= 1.0.4 are required:

* http://netfilter.org/projects/libnftnl/index.html
* http://netfilter.org/projects/libmnl/index.html

Visit our wikipage for user documentation at:

* http://wiki.nftables.org

For the manpage reference, check man(8) nft.

In case of bugs and feature request, file them via:

* https://bugzilla.netfilter.org

Have fun.

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="changes-nftables-0.9.6.txt"

Fabrice Fontaine (1):
      main: fix build with gcc <= 4.8

Pablo Neira Ayuso (8):
      evaluate: missing datatype definition in implicit_set_declaration()
      evaluate: remove superfluous check in set_evaluate()
      netlink: release dummy rule object from netlink_parse_set_expr()
      segtree: fix asan runtime error
      meta: fix asan runtime error in tc handle
      cmd: add misspelling suggestions for rule commands
      tests: shell: rename testcases/map/dump/0009vmap_0dump.nft
      build: Bump version to v0.9.6


--6c2NcOVqGQ03X4Wi--
