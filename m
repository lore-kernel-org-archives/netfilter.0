From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Multiple PPTP clients behind NAT
Date: Thu, 16 Sep 2004 19:14:22 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040916171422.802196E8@sterenborg.info>
References: <20040915053717.40755.qmail@web52510.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040915053717.40755.qmail@web52510.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

netfilter-bounces@lists.netfilter.org wrote:
...
> Here's my configuration: fresh linux-2.4.26,
> patch-o-matic-ng-20040621, When running patch-o-matic, I only
> apply the PPTP, RTSP conntrack and transparent proxy patches.
> They seem to apply without problem.

There are some pending/base patches in POM that you may also have to
apply to the kernel source.

> When I compile, I get the following error:
> make[2]: Entering directory
> `/usr/src/linux-2.4.26/net/ipv4/netfilter'
> ld -m elf_i386 -r -o ip_conntrack.o
> ip_conntrack_standalone.o ip_conntrack_core.o
> ip_conntrack_proto_generic.o ip_conntrack_proto_tcp.o
> ip_conntrack_proto_udp.o ip_conntrack_proto_icmp.o gcc
> -D__KERNEL__ -I/usr/src/linux-2.4.26/include -Wall
> -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing
> -fno-common -fomit-frame-pointer -pipe
> -mpreferred-stack-boundary=2 -march=i686 -DMODULE
> -DMODVERSIONS -include
> /usr/src/linux-2.4.26/include/linux/modversions.h
> -nostdinc -iwithprefix include
> -DKBUILD_BASENAME=ip_nat_proto_gre  -c -o ip_nat_proto_gre.o
> ip_nat_proto_gre.c ip_nat_proto_gre.c: In function `gre_unique_tuple':
> ip_nat_proto_gre.c:108: too few arguments to function
> `ip_nat_used_tuple_R20700d95' make[2]: *** [ip_nat_proto_gre.o] Error
> 1 
> make[2]: Leaving directory
> `/usr/src/linux-2.4.26/net/ipv4/netfilter'

Did you also try using the latest POM snapshot ?
Often there are daily snapshots available, right now it is :
ftp://ftp.netfilter.org/pub/patch-o-matic-ng/snapshot/patch-o-matic-ng-2
0040915.tar.bz2


Gr,
Rob


