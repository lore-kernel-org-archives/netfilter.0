From: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= 
	<scramatte@zensoluciones.com>
Subject: Error on building  libnetfilter_conntrack  debian package from git
 source
Date: Fri, 04 Jul 2008 17:26:47 +0200
Message-ID: <486E4137.8020006@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I'm trying to build the debian pacakge of  the latest  
libnetfilter_conntrack source.
I get the source using git.

I'm running debian lenny



/usr/src/libnetfilter_conntrack#./autogen.sh
/usr/src/libnetfilter_conntrack#dpkg-buildpackage
...
checking whether the g++ linker (/usr/bin/ld) supports shared 
libraries... yes
checking dynamic linker characteristics... GNU/Linux ld.so
(cached) (cached) checking how to hardcode library paths into 
programs... immediate
appending configuration tag "F77" to libtool
checking for a BSD-compatible install... /usr/bin/install -c
checking whether ln -s works... yes
checking for pkg-config... yes
/usr/src/libnetfilter_conntrack/./configure: line 19936: syntax error 
near unexpected token `LIBNFNETLINK,'
/usr/src/libnetfilter_conntrack/./configure: line 19936: 
`PKG_CHECK_MODULES(LIBNFNETLINK, libnfnetlink >= $LIBNFNETLINK_REQUIRED,,'
make: *** [config.status] Error 2
dpkg-buildpackage: failure: debian/rules build gave error exit status 2

Thank you for your help

Regards
