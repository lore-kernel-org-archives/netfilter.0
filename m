From: Phil Sutter <phil@netfilter.org>
Subject: [ANNOUNCE] libnfnetlink 1.0.2 release
Date: Tue, 5 Apr 2022 16:39:42 +0200
Message-ID: <YkxUru2QG/o1BlTV@orbyte.nwl.cc>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="PfK1Du911qYl3QzP"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>
Cc: netdev@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--PfK1Du911qYl3QzP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnfnetlink 1.0.2

This release contains only fixes:

* Warnings with automake-1.12
* Update header comments to reflect GPLv2+ license
* Allow building on uclinux
* Valgrind warnings due to uninitialized padding in netlink messages
* Hide private library symbols
* Support builds with newer doxygen versions
* Failing calls to getsockname() were left unnoticed

You can download the new release from:

https://netfilter.org/projects/libnfnetlink/downloads.html#libnfnetlink-1.0.2

Note that despite the new release, this library remains deprecated and
users should migrate to libmnl if possible.

In case of bugs, file them via:

* https://bugzilla.netfilter.org

Happy firewalling!

--PfK1Du911qYl3QzP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="changes-libnfnetlink-1.0.2.txt"

Duncan Roe (2):
      Minimally resurrect doxygen documentation
      Make it clear that this library is deprecated

Felix Janda (2):
      include: Sync with kernel headers
      src: Use stdint types everywhere

Gustavo Zacarias (1):
      configure: uclinux is also linux

Jan Engelhardt (1):
      build: resolve automake-1.12 warnings

Pablo Neira Ayuso (5):
      src: get source code license header in sync with current licensing terms
      libnfnetlink: initialize attribute padding to resolve valgrind warnings
      autogen: don't convert __u16 to u_int16_t
      bump version to 1.0.2
      build: add nfnl.version to sources

Phil Sutter (2):
      include: Silence gcc warning in linux_list.h
      libnfnetlink: Check getsockname() return code

Yury Gribov (1):
      libnfnetlink: hide private symbols


--PfK1Du911qYl3QzP--
