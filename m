From: John Haxby <john.haxby@oracle.com>
Subject: xtables problem
Date: Wed, 19 Nov 2008 17:25:37 +0000
Message-ID: <49244C11.6080808@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm ashamed to say I can't build xtables-addons.   I'm at a bit of a 
loss, but this is what I get:

$ ./configure --with-kbuild=/lib/modules/2.6.27.6/build
$ make
...
  CC       libxt_CHAOS.oo
  CCLD     libxt_CHAOS.so
libxt_CHAOS.oo: In function `_init':
/home/jch/rpmbuild/BUILD/xtables-addons-1.6/extensions/libxt_CHAOS.c:112: multiple definition of `_init'
/usr/lib/gcc/x86_64-redhat-linux/4.3.0/../../../../lib64/crti.o:(.init+0x0): first defined here
collect2: ld returned 1 exit status


It's the end of a long day, so I'm probably doing something stupidly 
wrong.   If anyone can point out the error of my ways I'd be most grateful.

jch
