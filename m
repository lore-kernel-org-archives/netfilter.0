From: Phil Sutter <phil@netfilter.org>
Subject: [ANNOUNCE] libnetfilter_cthelper 1.0.1 release
Date: Thu, 5 May 2022 13:46:00 +0200
Message-ID: <YnO4+K+GhiQ4sKU8@orbyte.nwl.cc>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="rWWChI9JZTcReYjR"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>, netdev@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--rWWChI9JZTcReYjR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnetfilter_cthelper 1.0.1

This release contains only fixes:

* Allow build on uclinux
* Use after free in nfct_helper_free()
* Double free in nfct-helper-add example
* Invalid argument error in nftc-helper-add
* Incorrect netlink message building with multiple nfct helper policies

You can download the new release from:

https://netfilter.org/projects/libnetfilter_cthelper/downloads.html#libnetfilter_cthelper-1.0.1

In case of bugs, file them via:

* https://bugzilla.netfilter.org

Happy firewalling!

--rWWChI9JZTcReYjR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="changes-libnetfilter_cthelper-1.0.1.txt"

Christopher Horler (1):
  src: fix use after free

Felix Janda (1):
  include: Sync with kernel headers

Gustavo Zacarias (1):
  configure: uclinux is also linux

Jan Engelhardt (2):
  build: resolve automake-1.12 warnings
  Update .gitignore

Kevin Cernekee (1):
  Use __EXPORTED rather than EXPORT_SYMBOL

Liping Zhang (3):
  examples: fix double free in nftc-helper-add
  examples: kill the "invalid argument" error in nftc-helper-add
  src: fix incorrect building and parsing of the NFCTH_POLICY_SETX
    attribute


--rWWChI9JZTcReYjR--
