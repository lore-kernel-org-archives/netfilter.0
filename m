From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
Subject: Iptables 1.3.7 and uClibc
Date: Wed, 21 Feb 2007 16:54:33 +0100
Message-ID: <45DC6B39.8040907@cetrtapot.si>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I'm trying to build iptables 1.3.7 with uClibc 0,9,27 for cris=20
architecture. I'm having some problems while loading shared ipt=20
libraries (when invoking iptables). Build string:

CC=3D"gcc_cris -mlinux -DLINUX -DLINUX_SYSTEM -D_REENTRANT=20
-mno-mul-bug-workaround=20
-muclibc=3D/home/hinkok/delo/fw/car2_R1-uclibc.gen/stage.uclibc" \
CROSS=3D"cris-axis-linux-gnu-" \
CFLAGS=3D"-O2 -pipe -Wall" \
LDFLAGS=3D"-L/home/hinkok/delo/fw/car2_R1-uclibc.gen/stage.uclibc/lib=20
-Wl,-rpath-link,/home/hinkok/delo/fw/car2_R1-uclibc.gen/stage.uclibc/lib"=
 \
STATIC=3D"" \
KERNEL_DIR=3D\"/home/hinkok/delo/fw/car2_R1-uclibc.gen/pkg/linux-R2/build=
/uclibc/\"=20
\
LIBDIR=3D"/lib" \
make \
all


I've managed to build iptables with my cross-compile toolchain. On=20
target system I can run the iptables binary:
# iptables --version
iptables v1.3.7
# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

When trying to set som rules I get following error:

# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables v1.3.7: Couldn't load target '/lib/iptables/libipt_MASQUERADE.so=
'

Try `iptables -h' or 'iptables --help' for more information.

I've hacked the iptables.c source to get full path displayed when error=20
occurs. I can verify that the file /lib/iptables/libipt_MASQUERADE.so=20
actually exists on the target rootfs.

What am I missing here?!

PS.: I've tried to statically compile iptables but with no avail -=20
iptables failed with:

# iptables
getsockopt failed strangely: No such file or directory


best regards,
hinko

--=20
=C4=8CETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si


