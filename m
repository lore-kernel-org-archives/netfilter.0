From: Bob Keyes <bob@xa.net>
Subject: compilation failure with IP_CAT_DIR_MAX, uclibc
Date: Wed, 10 Mar 2004 13:15:03 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0403101306470.9220-100000@Sinister.Com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I can't get beyond a problem I am having compiling iptables for uClibc.

iptables: 1.2.9
uClibc: toolchain from cvs
gcc: 2.95
target linux: 2.4.20, linked to /usr/src/linux
build OS: debian-3.0 stable, kernel 2.4.18-1-k7

in the kernel, all netfilter modules have been selected, most as modules

The netfilter Makefile has had the following lines added, so it would
compile using the uclibc toolchain"

merlin:/usr/src/iptables-1.2.9# more Makefile
# uncomment this to get a fully statically linked version
# NO_SHARED_LIBS = 1

# uncomment this to disable IPv6 support
DO_IPV6 = 0

CC := /usr/i386-linux-uclibc/bin/gcc
LD := /usr/i386-linux-uclibc/bin/ld
AR := /usr/i386-linux-uclibc/bin/ar
######################################################################
# YOU SHOULD NOT NEED TO TOUCH ANYTHING BELOW THIS LINE
######################################################################


merlin:/usr/src/iptables-1.2.9# make
Extensions found:
/usr/i386-linux-uclibc/bin/gcc -O2 -Wall -Wunused -I/usr/src/linux/include
-Iinclude/ -DIPTABLES_VERSION=\"1.2.9\"  -fPIC -o
extensions/libipt_conntrack_sh.o -c extensions/libipt_conntrack.c
In file included from extensions/libipt_conntrack.c:14:
/usr/src/linux/include/linux/netfilter_ipv4/ipt_conntrack.h:30:
`IP_CT_DIR_MAX' undeclared here (not in a function)
/usr/src/linux/include/linux/netfilter_ipv4/ipt_conntrack.h:31:
`IP_CT_DIR_MAX' undeclared here (not in a function)
/usr/src/linux/include/linux/netfilter_ipv4/ipt_conntrack.h:31:
`IP_CT_DIR_MAX' undeclared here (not in a function)
extensions/libipt_conntrack.c: In function `parse_status':
extensions/libipt_conntrack.c:109: `IPS_EXPECTED' undeclared (first use in
this function)
extensions/libipt_conntrack.c:109: (Each undeclared identifier is reported
only once
extensions/libipt_conntrack.c:111: `IPS_SEEN_REPLY' undeclared (first use
in this function)
extensions/libipt_conntrack.c:113: `IPS_ASSURED' undeclared (first use in
this function)
extensions/libipt_conntrack.c: In function `parse':
extensions/libipt_conntrack.c:212: `IP_CT_DIR_ORIGINAL' undeclared (first
use in this function)
extensions/libipt_conntrack.c:269: `IP_CT_DIR_REPLY' undeclared (first use
in this function)
extensions/libipt_conntrack.c: In function `print_status':
extensions/libipt_conntrack.c:378: `IPS_EXPECTED' undeclared (first use in
this function)
extensions/libipt_conntrack.c:382: `IPS_SEEN_REPLY' undeclared (first use
in this function)
extensions/libipt_conntrack.c:386: `IPS_ASSURED' undeclared (first use in
this function)
extensions/libipt_conntrack.c: In function `matchinfo_print':
extensions/libipt_conntrack.c:440: `IP_CT_DIR_ORIGINAL' undeclared (first
use in this function)
extensions/libipt_conntrack.c:460: `IP_CT_DIR_REPLY' undeclared (first use
in this function)
make: *** [extensions/libipt_conntrack_sh.o] Error 1
merlin:/usr/src/iptables-1.2.9#




