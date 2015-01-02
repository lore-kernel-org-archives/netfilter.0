From: Neven Vrenko <neven.vrenko@gmail.com>
Subject: IPset v6.24 - make modules fails
Date: Fri, 2 Jan 2015 01:29:16 +0000 (UTC)
Message-ID: <loom.20150102T020804-673@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi guys,

I'm having problem with IPset v.6.24.
I compiled and installed kernel 2.6.39 on CentOS 6.5, without any
customisation and system is running fine. There was no previous ipset
version installed on system.

I've noticed error when I ran: "make modules" during ipset install. I'v=
e got
following error:

[root@localhost ipset-6.24]# make modules
make -C /lib/modules/`uname -r`/build M=3D$PWD/kernel/net V=3D \
			KCFLAGS=3D"-DPACKAGE_VERSION=3D6.24" \
			IP_SET_MAX=3D256 KDIR=3D$PWD/kernel modules
make[1]: Entering directory `/usr/src/kernels/linux-2.6.39'
Makefile:634: "WARNING: Appending $KCFLAGS (-DPACKAGE_VERSION=3D6.24) f=
rom
command line to kernel $CFLAGS"
  CC [M]  /root/ipset-6.24/kernel/net/netfilter/xt_set.o
  CC [M]  /root/ipset-6.24/kernel/net/netfilter/ipset/ip_set_core.o
/root/ipset-6.24/kernel/net/netfilter/ipset/ip_set_core.c: In function
=E2=80=98call_ad=E2=80=99:
/root/ipset-6.24/kernel/net/netfilter/ipset/ip_set_core.c:1449: error:
=E2=80=98SIZE_MAX=E2=80=99 undeclared (first use in this function)
/root/ipset-6.24/kernel/net/netfilter/ipset/ip_set_core.c:1449: error: =
(Each
undeclared identifier is reported only once
/root/ipset-6.24/kernel/net/netfilter/ipset/ip_set_core.c:1449: error: =
for
each function it appears in.)
/root/ipset-6.24/kernel/net/netfilter/ipset/ip_set_core.c:1449: warning=
:
type defaults to =E2=80=98int=E2=80=99 in declaration of =E2=80=98_min1=
=E2=80=99
/root/ipset-6.24/kernel/net/netfilter/ipset/ip_set_core.c:1449: warning=
:
comparison of distinct pointer types lacks a cast
make[4]: *** [/root/ipset-6.24/kernel/net/netfilter/ipset/ip_set_core.o=
] Error 1
make[3]: *** [/root/ipset-6.24/kernel/net/netfilter/ipset] Error 2
make[2]: *** [/root/ipset-6.24/kernel/net/netfilter] Error 2
make[1]: *** [_module_/root/ipset-6.24/kernel/net] Error 2
make[1]: Leaving directory `/usr/src/kernels/linux-2.6.39'
make: *** [modules] Error 2

I'm not sure what this error actually means and how to debug it, please=
 can
you help me on this or give me in which direction I should investigate.

P.S. Other steps as ./autogen.sh, ./configure and make are passing just=
 fine


