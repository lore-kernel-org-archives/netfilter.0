From: Brian Schang <netfilter@lists.schang.net>
Subject: Troubles compiling iptables v1.4.8
Date: Fri, 21 May 2010 23:24:40 -0400
Message-ID: <4BF74E78.1030805@lists.schang.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello:

I am having troubles compiling iptables v1.4.8. I have been able to 
successfully compile and run v1.4.7, but for some reason v1.4.8 gets the 
following error:

...
make[2]: Entering directory `/raida/packages/iptables/utils'
gcc -DHAVE_CONFIG_H -I. -I..     -g -O2 -MT nfnl_osf.o -MD -MP -MF 
.deps/nfnl_osf.Tpo -c -o nfnl_osf.o nfnl_osf.c
nfnl_osf.c:48:36: error: linux/netfilter/xt_osf.h: No such file or directory

I'm not sure where to turn next. Any insight would be appreciated.

Thank you.

-- 
Brian Schang
