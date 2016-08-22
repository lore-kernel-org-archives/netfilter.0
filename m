From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [ANNOUNCE] nfacct 1.0.2 release
Date: Mon, 22 Aug 2016 13:31:48 +0200
Message-ID: <20160822113148.GA12801@salvia>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="huq684BweRXVnRxX"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org
Cc: lwn@lwn.net


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project presents:

        nfacct 1.0.2

nfacct is the command line tool to create/retrieve/delete accounting
objects.

See ChangeLog that comes attached to this email for more details.

You can download it from:

ftp://ftp.netfilter.org/pub/nfacct/
http://www.netfilter.org/projects/nfacct/downloads.html

Have fun!

P.S: I'm updating the website at this moment, so first link to FTP
allows you a quick fetch of the package.

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="changes-nfacct-1.0.2.txt"

Alexey Perevalov (2):
      nfacct: check cmd line argument for singleness
      nfacct: add filter in to the list operation

Felix Janda (1):
      include: Sync with kernel headers

Gustavo Zacarias (1):
      configure: uclinux is also linux

Harald Welte (1):
      Add JSON output formatting to nfacct utility

Mathieu Poirier (2):
      nfacct: adding quota capabilities
      src: remove unnecessary end of line check

Pablo Neira Ayuso (3):
      nfacct: fix packet and bytes counters length in restore operation
      nfacct: simplify nfacct_cmd_monitor
      build: bump version to 1.0.2

Thomas Jarosch (1):
      nfacct: Improve 'flush' man page entry


--huq684BweRXVnRxX--
