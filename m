From: "Oldenburg, Todd" <todd.oldenburg@thomson.com>
Subject: Installation problem...
Date: Tue, 16 Mar 2004 10:37:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <422BBAB60DEBBF45B26A38C670AE8EFD03BC1649@tfsmamsg3.tfn.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I am trying to install the patch-o-matic.  When I compile my kernel I get
the following error:

make -C ipv4 modules
make[2]: Entering directory `/usr/src/linux-2.4.20-30.9/net/ipv4'
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ipip  -DEXPORT_SYMTAB -c ipip.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_gre  -DEXPORT_SYMTAB -c ip_gre.c
make[2]: Leaving directory `/usr/src/linux-2.4.20-30.9/net/ipv4'
make -C ipv4/netfilter modules
make[2]: Entering directory `/usr/src/linux-2.4.20-30.9/net/ipv4/netfilter'
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_conntrack_standalone
-DEXPORT_SYMTAB -c ip_conntrack_standalone.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_conntrack_core  -c -o
ip_conntrack_core.o ip_conntrack_core.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_conntrack_proto_generic  -c -o
ip_conntrack_proto_generic.o ip_conntrack_proto_generic.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_conntrack_proto_tcp  -c -o
ip_conntrack_proto_tcp.o ip_conntrack_proto_tcp.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_conntrack_proto_udp  -c -o
ip_conntrack_proto_udp.o ip_conntrack_proto_udp.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_conntrack_proto_icmp  -c -o
ip_conntrack_proto_icmp.o ip_conntrack_proto_icmp.c
ld -m elf_i386 -r -o ip_conntrack.o ip_conntrack_standalone.o
ip_conntrack_core.o ip_conntrack_proto_generic.o ip_conntrack_proto_tcp.o
ip_conntrack_proto_udp.o ip_conntrack_proto_icmp.o
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_conntrack_amanda  -DEXPORT_SYMTAB
-c ip_conntrack_amanda.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_nat_amanda  -c -o ip_nat_amanda.o
ip_nat_amanda.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_conntrack_tftp  -c -o
ip_conntrack_tftp.o ip_conntrack_tftp.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_conntrack_ftp  -DEXPORT_SYMTAB -c
ip_conntrack_ftp.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_conntrack_irc  -DEXPORT_SYMTAB -c
ip_conntrack_irc.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_nat_tftp  -c -o ip_nat_tftp.o
ip_nat_tftp.c
ip_nat_tftp.c: In function `init':
ip_nat_tftp.c:156: warning: `ret' might be used uninitialized in this
function
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_nat_ftp  -c -o ip_nat_ftp.o
ip_nat_ftp.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_nat_irc  -c -o ip_nat_irc.o
ip_nat_irc.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_tables  -DEXPORT_SYMTAB -c
ip_tables.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=iptable_filter  -c -o
iptable_filter.o iptable_filter.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=iptable_mangle  -c -o
iptable_mangle.o iptable_mangle.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_nat_standalone  -DEXPORT_SYMTAB -c
ip_nat_standalone.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_nat_rule  -c -o ip_nat_rule.o
ip_nat_rule.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_nat_core  -c -o ip_nat_core.o
ip_nat_core.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_nat_helper  -c -o ip_nat_helper.o
ip_nat_helper.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_nat_proto_unknown  -c -o
ip_nat_proto_unknown.o ip_nat_proto_unknown.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_nat_proto_tcp  -c -o
ip_nat_proto_tcp.o ip_nat_proto_tcp.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_nat_proto_udp  -c -o
ip_nat_proto_udp.o ip_nat_proto_udp.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ip_nat_proto_icmp  -c -o
ip_nat_proto_icmp.o ip_nat_proto_icmp.c
ld -m elf_i386 -r -o iptable_nat.o ip_nat_standalone.o ip_nat_rule.o
ip_nat_core.o ip_nat_helper.o ip_nat_proto_unknown.o ip_nat_proto_tcp.o
ip_nat_proto_udp.o ip_nat_proto_icmp.o
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ipt_helper  -c -o ipt_helper.o
ipt_helper.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ipt_limit  -c -o ipt_limit.o
ipt_limit.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ipt_mark  -c -o ipt_mark.o ipt_mark.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ipt_mac  -c -o ipt_mac.o ipt_mac.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ipt_pkttype  -c -o ipt_pkttype.o
ipt_pkttype.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ipt_multiport  -c -o ipt_multiport.o
ipt_multiport.c
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-30.9/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686 -DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.20-30.9/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=ipt_owner  -c -o ipt_owner.o
ipt_owner.c
ipt_owner.c: In function `match_comm':
ipt_owner.c:17: warning: unused variable `g'
ipt_owner.c: In function `match_sid':
ipt_owner.c:80: warning: unused variable `g'
ipt_owner.c: In function `match_gid':
ipt_owner.c:126: warning: implicit declaration of function `for_each_task'
ipt_owner.c:126: parse error before '{' token
ipt_owner.c: At top level:
ipt_owner.c:153: parse error before "do"
make[2]: *** [ipt_owner.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.20-30.9/net/ipv4/netfilter'
make[1]: *** [_modsubdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.20-30.9/net'
make: *** [_mod_net] Error 2

ANY IDEA's?  Thanks

-Todd




