From: "Rob" <rwideman@austin.rr.com>
Subject: RE: ftp server issue, trying to DL 1.2.7a
Date: Mon, 9 Sep 2002 22:51:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NEENJAPFEAIEMGMNIGFLMEMICCAA.rwideman@austin.rr.com>
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
To: netfilter@lists.netfilter.org

new problem...I compiled the kernel and I get these errors:
**the first few lines are the actual compilation to show you where it is**
--------------
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-tri
graphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -pipe -mpre
ferred-stack-boundary=2 -march=i586   -nostdinc -I
/usr/lib/gcc-lib/i386-redhat-linux/2.96/include -DKBUILD_BASENAME=ip_nat_pro
to_tcp  -c -o ip_nat_proto_tcp.o ip_nat_proto_tcp.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-tri
graphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -pipe -mpre
ferred-stack-boundary=2 -march=i586   -nostdinc -I
/usr/lib/gcc-lib/i386-redhat-linux/2.96/include -DKBUILD_BASENAME=ip_nat_pro
to_udp  -c -o ip_nat_proto_udp.o ip_nat_proto_udp.c
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-tri
graphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -pipe -mpre
ferred-stack-boundary=2 -march=i586   -nostdinc -I
/usr/lib/gcc-lib/i386-redhat-linux/2.96/include -DKBUILD_BASENAME=ip_nat_pro
to_icmp  -c -o ip_nat_proto_icmp.o ip_nat_proto_icmp.c
ld -m elf_i386 -r -o iptable_nat.o ip_nat_standalone.o ip_nat_rule.o
ip_nat_helper.o ip_nat_core.o ip_nat_proto_unknown.o ip_nat_proto_tcp.o
ip_nat_proto_udp.o ip_nat_proto_icmp.o
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-tri
graphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -pipe -mpre
ferred-stack-boundary=2 -march=i586   -nostdinc -I
/usr/lib/gcc-lib/i386-redhat-linux/2.96/include -DKBUILD_BASENAME=ipt_helper
  -c -o ipt_helper.o ipt_helper.c
ipt_helper.c: In function `match':
ipt_helper.c:46: wrong type argument to unary exclamation mark
ipt_helper.c:51: incompatible types in assignment
ipt_helper.c:67: structure has no member named `name'
ipt_helper.c:68: structure has no member named `name'
make[3]: *** [ipt_helper.o] Error 1
make[3]: Leaving directory `/usr/src/linux/net/ipv4/netfilter'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux/net/ipv4/netfilter'
make[1]: *** [_subdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux/net'
make: *** [_dir_net] Error 2


Any help is appreciated. Thanks
Rob


