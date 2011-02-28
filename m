From: jobhunts02@aol.com
Subject: Problem crosscompiling libnetfilter_conntrack-0.9.1
Date: Mon, 28 Feb 2011 09:02:19 -0800
Message-ID: <BCC8F5E1-33FB-4FEB-ABA5-CA0CB7EB3655@aol.com>
Mime-Version: 1.0 (iPhone Mail 8C148)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am trying to crosscompile libnetfilter_conntrack-0.9.1 on an i686-pc for use on a powerpc.  When I run make, I get the following error:

In file included from api.c:13:../../include/internal/internal.h:24:39: error: libnfnetlink/libnfnetlink.h: No such file or directory


libnfnetlink.h is located at /home/steve/libnfnetlink-1.0.0/include/libnfnetlink/libnfnetlink.h


My configure command is:

./configure --host=i686-pc-linux-gnu --target=ppc CROSS_COMPILE=powerpc-linux- PKG_CONFIG_PATH=/home/steve/libnfnetlink-1.0.0


How do I correct this error?