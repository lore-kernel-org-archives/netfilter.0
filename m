From: Sabrina Lautier <slautier@lavache.com>
Subject: trouble compiling iptables v1.2.7a
Date: Thu, 06 Mar 2003 16:36:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046964968.3e676ae844a48@lavache.alinto.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter mailing list <netfilter@lists.netfilter.org>

Hi all !

I'm following the "Linux IP Masqueade HowTo" to set up a linux
router-firewall.
I'm having trouble compiling iptables and I don't know how to solve my
problem...

I'm running linux redhat 7.3 with a 2.4.18-3 kernel but I've
downloaded the latest kernel version (2.4.20) in order to compile it
with iptables-1.2.7a and patch-o-matic kernel patches.

When I try to compile here is the error I get:
**********************************************************************
$ make KERNEL_DIR=/usr/src/kernel/linux
Extentions found:
cc -02 ...
In file included from /usr/src/kernel/linux/include/linux/config.h:4,
from /usr/src/kernel/linux/include/linux/netfilter_ipv4.h:8,
from /usr/src/kernel/linux/include/linux/netfilter_ipv4/iptables.h:25,
from include/libiptc.h:6,
from include/iptables.h:5,
from extentions/libipt_ah.c:8,
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header
inluded in user space
make: ** [extentions/libipt_ah_sh.o] Error 1
**********************************************************************

For information, I'm using gcc-2.96-110. I've tried to upgrade to
gcc-3.2-7 but cannot find glibc-devel-2.2.90-12 required for this
version of gcc (does anybody know of where to find it ?).

Any idea of how to solve my issue ?
Any help would be greatly appreciated.

Regards,
Sabrina


---------------------------------------------
Powered by Alinto (http://www.alinto.net)
        for lavache.com (http://www.lavacheautomatique.com)

