From: "B H R Balaji" <balaji@sol.net.in>
Subject: Iptables 1.2.9 compilation problem with kernel 2.6.2
Date: Mon, 9 Feb 2004 11:45:16 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002401c3eed4$1624e520$c2bf09ca@huecal>
Reply-To: "B H R Balaji" <balaji@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.samba.org

Hi all

i have already installed FEDORA in PC

i have downloaded the Latest Kernel 2.6.2

i have uninstalled old RPM of iptables
Downloaded 1.2.9

when i try to make

iam getting the following error

[root@pdn iptables-1.2.9]# make KERNEL_DIR=/usr/src/linux-2.6.2
/bin/sh: line 1: extensions/.childlevel-test: Permission denied
/bin/sh: line 1: extensions/.layer7-test: Permission denied
Making dependencies: please wait...
make: *** Deleting file `extensions/libip6t_owner.d'
make: *** [extensions/libip6t_owner.d] Interrupt

[root@pdn iptables-1.2.9]# chmod +x extensions/.layer7-test
extensions/.childlevel-test
[root@pdn iptables-1.2.9]# make KERNEL_DIR=/usr/src/linux-2.6.2
Extensions found: IPv4:childlevel IPv4:layer7 IPv4:recent IPv6:ah IPv6:esp
IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.2/include -Iinclude/ -DIPTABLES_V
ERSION=\"1.2.9\"  -fPIC -o extensions/libipt_ah_sh.o -c
extensions/libipt_ah.c
ld -shared -o extensions/libipt_ah.so extensions/libipt_ah_sh.o
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.2/include -Iinclude/ -DIPTABLES_V
ERSION=\"1.2.9\"  -fPIC -o extensions/libipt_connlimit_sh.o -c
extensions/libipt_connlimit.c
In file included from /usr/src/linux-2.6.2/include/linux/bitops.h:4,
                 from
/usr/src/linux-2.6.2/include/linux/netfilter_ipv4/ip_conntrack.h:9,
                 from extensions/libipt_connlimit.c:9:
/usr/include/asm/bitops.h:327:2: warning: #warning This includefile is not
available on all architectures.
/usr/include/asm/bitops.h:328:2: warning: #warning Using kernel headers in
userspace: atomicity not guaranteed
In file included from
/usr/src/linux-2.6.2/include/linux/netfilter_ipv4/ip_conntrack.h:9,
                 from extensions/libipt_connlimit.c:9:
/usr/src/linux-2.6.2/include/linux/bitops.h: In function
`get_bitmask_order':
/usr/src/linux-2.6.2/include/linux/bitops.h:78: warning: implicit
declaration of function `fls'
In file included from /usr/src/linux-2.6.2/include/linux/compiler.h:16,
                 from
/usr/src/linux-2.6.2/include/linux/netfilter_ipv4/ip_conntrack.h:10,
                 from extensions/libipt_connlimit.c:9:
/usr/src/linux-2.6.2/include/linux/compiler-gcc3.h:17:1: warning:
"__attribute_used__" redefined
In file included from /usr/include/features.h:295,
                 from /usr/include/stdio.h:28,
                 from extensions/libipt_connlimit.c:2:
/usr/include/sys/cdefs.h:192:1: warning: this is the location of the
previous definition
In file included from /usr/src/linux-2.6.2/include/linux/compiler.h:16,
                 from
/usr/src/linux-2.6.2/include/linux/netfilter_ipv4/ip_conntrack.h:10,
                 from extensions/libipt_connlimit.c:9:
/usr/src/linux-2.6.2/include/linux/compiler-gcc3.h:22:1: warning:
"__attribute_pure__" redefined
In file included from /usr/include/features.h:295,
                 from /usr/include/stdio.h:28,
                 from extensions/libipt_connlimit.c:2:
/usr/include/sys/cdefs.h:183:1: warning: this is the location of the
previous definition
In file included from
/usr/src/linux-2.6.2/include/linux/netfilter_ipv4/ip_conntrack.h:11,
                 from extensions/libipt_connlimit.c:9:
/usr/include/asm/atomic.h:40:2: warning: #warning Using kernel header in
userland program. BAD!
In file included from
/usr/src/linux-2.6.2/include/linux/netfilter_ipv4/ip_conntrack.h:12,
                 from extensions/libipt_connlimit.c:9:
/usr/src/linux-2.6.2/include/linux/time.h: At top level:
/usr/src/linux-2.6.2/include/linux/time.h:9: error: redefinition of `struct
timespec'
/usr/src/linux-2.6.2/include/linux/time.h:15: error: redefinition of `struct
timeval'
In file included from
/usr/src/linux-2.6.2/include/linux/netfilter_ipv4/ip_conntrack.h:12,
                 from extensions/libipt_connlimit.c:9:
/usr/src/linux-2.6.2/include/linux/time.h:341:1: warning: "FD_SET" redefined
In file included from /usr/include/sys/types.h:216,
                 from /usr/include/sys/uio.h:24,
                 from /usr/include/sys/socket.h:27,
                 from /usr/include/netinet/in.h:24,
                 from /usr/include/netdb.h:28,
                 from extensions/libipt_connlimit.c:3:
/usr/include/sys/select.h:93:1: warning: this is the location of the
previous definition
In file included from
/usr/src/linux-2.6.2/include/linux/netfilter_ipv4/ip_conntrack.h:12,
                 from extensions/libipt_connlimit.c:9:
/usr/src/linux-2.6.2/include/linux/time.h:342:1: warning: "FD_CLR" redefined
In file included from /usr/include/sys/types.h:216,
                 from /usr/include/sys/uio.h:24,
                 from /usr/include/sys/socket.h:27,
                 from /usr/include/netinet/in.h:24,
                 from /usr/include/netdb.h:28,
                 from extensions/libipt_connlimit.c:3:
/usr/include/sys/select.h:94:1: warning: this is the location of the
previous definition
In file included from
/usr/src/linux-2.6.2/include/linux/netfilter_ipv4/ip_conntrack.h:12,
                 from extensions/libipt_connlimit.c:9:
/usr/src/linux-2.6.2/include/linux/time.h:343:1: warning: "FD_ISSET"
redefined
In file included from /usr/include/sys/types.h:216,
                 from /usr/include/sys/uio.h:24,
                 from /usr/include/sys/socket.h:27,
                 from /usr/include/netinet/in.h:24,
                 from /usr/include/netdb.h:28,
                 from extensions/libipt_connlimit.c:3:
/usr/include/sys/select.h:95:1: warning: this is the location of the
previous definition
In file included from
/usr/src/linux-2.6.2/include/linux/netfilter_ipv4/ip_conntrack.h:12,
                 from extensions/libipt_connlimit.c:9:
/usr/src/linux-2.6.2/include/linux/time.h:344:1: warning: "FD_ZERO"
redefined
In file included from /usr/include/sys/types.h:216,
                 from /usr/include/sys/uio.h:24,
                 from /usr/include/sys/socket.h:27,
                 from /usr/include/netinet/in.h:24,
                 from /usr/include/netdb.h:28,
                 from extensions/libipt_connlimit.c:3:
/usr/include/sys/select.h:96:1: warning: this is the location of the
previous definition
make: *** [extensions/libipt_connlimit_sh.o] Error 1
[root@pdn iptables-1.2.9]#


hare


