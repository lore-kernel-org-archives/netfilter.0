From: Phil Sutter <phil@netfilter.org>
Subject: [ANNOUNCE] libnetfilter_cttimeout 1.0.1 release
Date: Thu, 5 May 2022 13:50:21 +0200
Message-ID: <YnO5/SN2W7IJ9mpM@orbyte.nwl.cc>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="qhvWvKzBXMBwWaf7"
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>, netfilter-devel <netfilter-devel@vger.kernel.org>
Cc: netdev@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net


--qhvWvKzBXMBwWaf7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

The Netfilter project proudly presents:

        libnetfilter_cttimeout 1.0.1

This release contains only fixes:

* Warnings with automake-1.12
* Allow building on uclinux
* Fix building with clang

You can download the new release from:

https://netfilter.org/projects/libnetfilter_cttimeout/downloads.html#libnetfilter_cttimeout-1.0.1

In case of bugs, file them via:

* https://bugzilla.netfilter.org

Happy firewalling!

--qhvWvKzBXMBwWaf7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="changes-libnetfilter_cttimeout-1.0.1.txt"

Felix Janda (1):
  include: Sync with kernel headers

Gustavo Zacarias (1):
  configure: uclinux is also linux

Jan Engelhardt (2):
  build: remove unnecessary pkgconfig->config.status dependency
  build: resolve automake-1.12 warnings

Kevin Cernekee (1):
  Use __EXPORTED rather than EXPORT_SYMBOL

--qhvWvKzBXMBwWaf7--
