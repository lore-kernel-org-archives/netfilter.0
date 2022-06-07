From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] nftables 1.0.4 release
Date: Tue, 7 Jun 2022 16:41:43 +0200
Message-ID: <Yp9jp9XwOtcNaBCe@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="uYBAG99Q7XAC+1B/"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>
Cc: netdev@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--uYBAG99Q7XAC+1B/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        nftables 1.0.4

This is an incremental release accumulating bugfixes for two
regressions that were introduced in 1.0.3:

* Fix segfault in -o/--optimize with unsupported statements:
  http://git.netfilter.org/nftables/commit/?id=59bd944f6d75e99fe0c8d743e7fd482672640c2d

* Bogus datatype mismatch error report in sets:
  http://git.netfilter.org/nftables/commit/?id=818f7dded9c9e8a89a2de98801425536180ae307

You can download this new release from:

https://www.netfilter.org/projects/nftables/downloads.html
https://www.netfilter.org/pub/nftables/

To build the code, libnftnl >= 1.2.2 and libmnl >= 1.0.4 are required:

* https://netfilter.org/projects/libnftnl/index.html
* https://netfilter.org/projects/libmnl/index.html

Visit our wikipage for user documentation at:

* https://wiki.nftables.org

For the manpage reference, check man(8) nft.

In case of bugs and feature request, file them via:

* https://bugzilla.netfilter.org

Happy firewalling.

--uYBAG99Q7XAC+1B/
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="changes-nftables-1.0.4.txt"

Pablo Neira Ayuso (5):
      optimize: segfault when releasing unsupported statement
      tests: shell: sets_with_ifnames release netns on exit
      evaluate: reset ctx->set after set interval evaluation
      tests: shell: remove leftover modules on cleanup
      build: Bump version to 1.0.4


--uYBAG99Q7XAC+1B/--
