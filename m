From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] arptables 0.0.5 release
Date: Mon, 2 Dec 2019 15:25:24 +0100
Message-ID: <20191202142524.sxyhei4w7vzmi62k@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="2rczdurehllifc6v"
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--2rczdurehllifc6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project presents:

        arptables 0.0.5

arptables is the userspace command line program used to configure the
Linux 2.4.x and later ARP packet filtering ruleset. It is targeted
towards system administrators.

NOTE: This is a release of legacy software. Patches may still be
accepted and pushed out to the git repository, which will remain active
and accessible as usual although support for this software might be
discontinued at some point.

We are thankful to all the contributors of arptables over time and we
also acknowledge it is time to move on.

See ChangeLog that comes attached to this email for more details.

You can download it from:

ftp://ftp.netfilter.org/pub/arptables/

Happy firewalling.

--2rczdurehllifc6v
Content-Type: text/plain; charset="utf-8"
Content-Disposition: attachment; filename="changes-arptables-0.0.5.txt"
Content-Transfer-Encoding: 8bit

Arturo Borrero Gonzalez (2):
      arptables: cleanup sysvinit script
      arptables: legacy renaming

Bart De Schuymer (2):
      add GPL text
      arptables: fix potential buffer overflow (author: dcb)

Felix Janda (2):
      src: Use stdint types
      src: Remove support for libc5

Gustavo Zacarias (1):
      arptables: remove dead dynamic hooks code

Jaromír Končický (2):
      make static analysis tool happy (false positive)
      fix potential buffer overflows reported by static analysis

Jesper Dangaard Brouer (3):
      Add man pages for arptables-{save,restore}
      arptables: install man pages
      arptables: add missing long option --set-counters and update documentation

Jonh Wendell (1):
      build an libarptc.a archive

Pablo Neira Ayuso (3):
      src: cache in tree and use x_tables.h
      src: fix compilation warning
      arptables 0.0.5 release

Phil Sutter (3):
      Add .gitignore
      Eliminate compiler warning about size passed to strncmp()
      libarptc: Simplify alloc_handle by using calloc()

Zhang Chunyu (2):
      arptables: Add revision field for arptables userspace
      arptables: Add MARK target


--2rczdurehllifc6v--
