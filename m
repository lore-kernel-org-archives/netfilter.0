From: "Mark Jones" <mlp1@ig.com.br>
Subject: IPtables 1.2.11 compiling error
Date: Thu, 28 Oct 2004 16:04:47 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <clrft2$t0t$1@sea.gmane.org>
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi people,

I=B4m having trouble compiling iptables 1.2.11 (in order to have the "strin=
g"=20
match module - it=B4s not included in the standard RPM)...
I=B4m using Fedora 2 (full install) and when I try to compile, I receive=20
"#error including kernel header in userspace; use the glibc headers=20
instead!". My kernel sources are located in /usr/src/linux-2.6.5-1.358,=20
uname -r =3D 2.6.5-1.358, iptables v1.2.11.

Is there any other way to have the "libipt_string" module compiled? I=B4ve =

googled about these errors, but coudn=B4t find any info that helped me to=20
solve the problem... This is the output I get:

[root@server01 iptables-1.2.11]# make KERNEL_DIR=3D/usr/src/linux-2.6.5-1.3=
58
Extensions found: IPv4:recent IPv6:ah IPv6:esp IPv6:frag IPv6:ipv6header=20
IPv6:hbh IPv6:dst IPv6:rt
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.5-1.358/include -Iinclude/ -DIPT=
ABLES_VERSION=3D\"1.2.11\"=20
  -D_UNKNOWN_KERNEL_POINTER_SIZE -fPIC -o extensions/libipt_ah_sh.o -c=20
extensions/libipt_ah.c
In file included from /usr/src/linux-2.6.5-1.358/include/linux/config.h:4,
                 from=20
/usr/src/linux-2.6.5-1.358/include/linux/netfilter_ipv4.h:8,
                 from=20
/usr/src/linux-2.6.5-1.358/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in=
=20
userspace
In file included from=20
/usr/src/linux-2.6.5-1.358/include/linux/netfilter_ipv4.h:8,
                 from=20
/usr/src/linux-2.6.5-1.358/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux-2.6.5-1.358/include/linux/config.h:6:2: #error including=20
kernel header in userspace; use the glibc headers instead!
make: *** [extensions/libipt_ah_sh.o] Error 1

Mark Jones=20




