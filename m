From: Phil Sutter <phil@netfilter.org>
Subject: [ANNOUNCE] libmnl 1.0.5 release
Date: Tue, 5 Apr 2022 14:55:48 +0200
Message-ID: <Ykw8VBenlUgEVPvl@orbyte.nwl.cc>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="FgAyCt4XeABDY93x"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>
Cc: netdev@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--FgAyCt4XeABDY93x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libmnl 1.0.5

This release contains new features:

* Two new examples:
  * rtnl-neigh-dump, dumping ARP cache
  * rtnl-addr-add, adding an IP address to an interface
* MNL_SOCKET_DUMP_SIZE define, holding a recommended buffer size for
  netlink dumps

... and fixes:

* nfct-daemon example compile error with musl libc
* Compiler warning when passing a const 'cb_ctl_array' to mnl_cb_run2()
* Typo in rtnl-addr-dump example
* Valgrind warnings due to uninitialized padding in netlink messages
* Misc fixes in doxygen documentation
* Misc build system fixes

You can download this new release from:

https://netfilter.org/projects/libmnl/downloads.html#libmnl-1.0.5

Check out the doxygen documentation at:

https://netfilter.org/projects/libmnl/doxygen/html/

In case of bugs and feature requests, file them via:

* https://bugzilla.netfilter.org

Happy firewalling!

--FgAyCt4XeABDY93x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="changes-libmnl-1.0.5.txt"

Duncan Roe (5):
      nlmsg: Fix a missing doxygen section trailer
      build: doc: "make" builds & installs a full set of man pages
      build: doc: get rid of the need for manual updating of Makefile
      build: If doxygen is not available, be sure to report "doxygen: no" to ./configure
      src: doc: Fix messed-up Netlink message batch diagram

Fernando Fernandez Mancera (1):
      src: fix doxygen function documentation

Florian Westphal (1):
      libmnl: zero attribute padding

Guillaume Nault (1):
      callback: mark cb_ctl_array 'const' in mnl_cb_run2()

Kylie McClain (1):
      examples: nfct-daemon: Fix test building on musl libc

Laura Garcia Liebana (4):
      examples: add arp cache dump example
      examples: fix neigh max attributes
      examples: fix print line format
      examples: reduce LOCs during neigh attributes validation

Pablo Neira Ayuso (3):
      doxygen: remove EXPORT_SYMBOL from the output
      include: add MNL_SOCKET_DUMP_SIZE definition
      build: libmnl 1.0.5 release

Petr Vorel (1):
      examples: Add rtnl-addr-add.c

Stephen Hemminger (1):
      examples: rtnl-addr-dump: fix typo

igo95862 (1):
      doxygen: Fixed link to the git source tree on the website.


--FgAyCt4XeABDY93x--
