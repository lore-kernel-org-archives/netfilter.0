From: Anatoly Pugachev <mator@gsib.ru>
Subject: error compiling iptables-1.2.8 on linux kernel-2.5.69
Date: Fri, 16 May 2003 12:17:58 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030516081758.GH30683@gsib.sl.ru>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="9dgjiU4MmWPVapMU"
Return-path: <netfilter-admin@lists.netfilter.org>
Resent-Message-Id: <200305160908.h4G98u0O012926@gsib.sl.ru>
Content-Disposition: inline
Resent-To: netfilter@lists.netfilter.org
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

Hello.
Sorry if i missed something essencials from the docs on compiling
iptables (INSTALL), but i'm unable to compile it. Here what i have:
iptables 1.2.8 got from netfilter.org
linux kernel version 2.5.69 from kernel.org
gcc-3.2.3 from RH rawhide
libc-2.3.2 from RH rawhide
and errors compiling iptables, 
$ make KERNEL_DIR=../linux-2.5.69 2>&1 | tee error-log.txt
in attached text file.
PS: i've succesfully compiled iptables, using source of 2.4.20 kernel.
So can i use this binary with newer linux kernel 2.5.X ?
-- 
/mator

--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: attachment; filename="error-log.txt"

Extensions found: IPv6:ah IPv6:esp IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_ah_sh.o -c extensions/libipt_ah.c
ld -shared -o extensions/libipt_ah.so extensions/libipt_ah_sh.o
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_conntrack_sh.o -c extensions/libipt_conntrack.c
In file included from ../linux-2.5.69/include/asm/bitops.h:9,
                 from ../linux-2.5.69/include/linux/bitops.h:3,
                 from ../linux-2.5.69/include/linux/netfilter_ipv4/ip_conntrack.h:9,
                 from extensions/libipt_conntrack.c:12:
../linux-2.5.69/include/linux/compiler.h:56:1: warning: "__attribute_used__" redefined
In file included from /usr/include/features.h:291,
                 from /usr/include/stdio.h:28,
                 from extensions/libipt_conntrack.c:5:
/usr/include/sys/cdefs.h:192:1: warning: this is the location of the previous definition
ld -shared -o extensions/libipt_conntrack.so extensions/libipt_conntrack_sh.o
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_dscp_sh.o -c extensions/libipt_dscp.c
extensions/libipt_dscp_helper.c:69: warning: `dscp_to_name' defined but not used
ld -shared -o extensions/libipt_dscp.so extensions/libipt_dscp_sh.o
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_ecn_sh.o -c extensions/libipt_ecn.c
ld -shared -o extensions/libipt_ecn.so extensions/libipt_ecn_sh.o
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_esp_sh.o -c extensions/libipt_esp.c
ld -shared -o extensions/libipt_esp.so extensions/libipt_esp_sh.o
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_helper_sh.o -c extensions/libipt_helper.c
ld -shared -o extensions/libipt_helper.so extensions/libipt_helper_sh.o
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_icmp_sh.o -c extensions/libipt_icmp.c
ld -shared -o extensions/libipt_icmp.so extensions/libipt_icmp_sh.o
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_iplimit_sh.o -c extensions/libipt_iplimit.c
In file included from ../linux-2.5.69/include/asm/bitops.h:9,
                 from ../linux-2.5.69/include/linux/bitops.h:3,
                 from ../linux-2.5.69/include/linux/netfilter_ipv4/ip_conntrack.h:9,
                 from extensions/libipt_iplimit.c:9:
../linux-2.5.69/include/linux/compiler.h:56:1: warning: "__attribute_used__" redefined
In file included from /usr/include/features.h:291,
                 from /usr/include/stdio.h:28,
                 from extensions/libipt_iplimit.c:2:
/usr/include/sys/cdefs.h:192:1: warning: this is the location of the previous definition
ld -shared -o extensions/libipt_iplimit.so extensions/libipt_iplimit_sh.o
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_length_sh.o -c extensions/libipt_length.c
ld -shared -o extensions/libipt_length.so extensions/libipt_length_sh.o
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_limit_sh.o -c extensions/libipt_limit.c
ld -shared -o extensions/libipt_limit.so extensions/libipt_limit_sh.o
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_mac_sh.o -c extensions/libipt_mac.c
ld -shared -o extensions/libipt_mac.so extensions/libipt_mac_sh.o
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_mark_sh.o -c extensions/libipt_mark.c
ld -shared -o extensions/libipt_mark.so extensions/libipt_mark_sh.o
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_multiport_sh.o -c extensions/libipt_multiport.c
ld -shared -o extensions/libipt_multiport.so extensions/libipt_multiport_sh.o
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_owner_sh.o -c extensions/libipt_owner.c
ld -shared -o extensions/libipt_owner.so extensions/libipt_owner_sh.o
cc -O2 -Wall -Wunused -I../linux-2.5.69/include -Iinclude/ -DIPTABLES_VERSION=\"1.2.8\"  -fPIC -o extensions/libipt_physdev_sh.o -c extensions/libipt_physdev.c
extensions/libipt_physdev.c: In function `parse':
extensions/libipt_physdev.c:86: `IPT_PHYSDEV_OP_MATCH_IN' undeclared (first use in this function)
extensions/libipt_physdev.c:86: (Each undeclared identifier is reported only once
extensions/libipt_physdev.c:86: for each function it appears in.)
extensions/libipt_physdev.c:97: `IPT_PHYSDEV_OP_MATCH_OUT' undeclared (first use in this function)
extensions/libipt_physdev.c: In function `print':
extensions/libipt_physdev.c:144: `IPT_PHYSDEV_OP_MATCH_IN' undeclared (first use in this function)
extensions/libipt_physdev.c:146: `IPT_PHYSDEV_OP_MATCH_OUT' undeclared (first use in this function)
extensions/libipt_physdev.c: In function `save':
extensions/libipt_physdev.c:156: `IPT_PHYSDEV_OP_MATCH_IN' undeclared (first use in this function)
extensions/libipt_physdev.c:158: `IPT_PHYSDEV_OP_MATCH_OUT' undeclared (first use in this function)
make: *** [extensions/libipt_physdev_sh.o] Error 1

--9dgjiU4MmWPVapMU--

