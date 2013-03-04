From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] libnetfilter_conntrack 1.0.3 release
Date: Mon, 4 Mar 2013 16:42:15 +0100
Message-ID: <20130304154215.GA19207@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="NzB8fVQJ5HfG6fxh"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnetfilter_conntrack 1.0.3

libnetfilter_conntrack is a userspace library providing a programming
interface (API) to the in-kernel connection tracking state table. The
library libnetfilter_conntrack has been previously known as
libnfnetlink_conntrack and libctnetlink.

See ChangeLog that comes attached to this email for more details.

You can download it from:

http://www.netfilter.org/projects/libnetfilter_conntrack/downloads.html
ftp://ftp.netfilter.org/pub/libnetfilter_conntrack/

Have fun!

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="changes-libnetfilter_conntrack-1.0.3.txt"

Florian Westphal (2):
      qa: fix handling of ATTR_HELPER_INFO attribute
      conntrack: fix nfct_clone with certain attribute data types

Jan Engelhardt (1):
      build: resolve automake-1.12 warnings

Pablo Neira Ayuso (5):
      refresh our public copy of nfnetlink_conntrack.h
      Merge branch 'next' into libnetfilter_conntrack master branch
      qa: fix bogus eror in test_api
      qa: add final OK message after checking release of clone objects
      build: bump version to 1.0.3

Thomas Jarosch (1):
      Fix logic typo in cmp_secctx


--NzB8fVQJ5HfG6fxh--
