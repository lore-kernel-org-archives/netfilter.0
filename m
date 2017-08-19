From: J Doe <general@nativemethods.com>
Subject: Failure with autogen.sh when building libnftnl
Date: Sat, 19 Aug 2017 15:16:23 -0400
Message-ID: <B934F71F-B5FF-4B6A-8AA7-1C479F09E760@nativemethods.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I am currently attempting to build libnftnl as per the instructions on the wiki [1]

$ git clone git://git.netfilter.org/libnftnl
$ cd libnftnl
$ sh autogen.sh

autogen fails with the following error code:

configure.ac.28: error: possibly undefined macro: AC_DISABLE_STATIC
	If this token and others are legitimate, please use m4_pattern_allow.
	See the Autoconf documentation.
autoreconf: /user/bin/autoconf failed with exit status: 1
	
What am I currently doing wrong ?

Thanks,
- J

Sources:
[1] wiki.nftables.org/wiki-nftables/index.php/Building_and_installing_nftables_from_sources
