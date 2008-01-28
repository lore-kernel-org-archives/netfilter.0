From: "Eric Estes" <Eric_Estes@aspensquare.com>
Subject: Trouble compiling with connlimit support
Date: Mon, 28 Jan 2008 14:09:43 -0500
Message-ID: <665B03CFBE2C1346A66B0CB9A9A0EE3801C7E466@ASM220.aspen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I am running Debian Sid and I am running into problems recompiling the =
kernel with connlimit support.

Iptables-1.3.6
Patch-o-matic-ng-20080127
Linux-source-2.6.23

Here is the output of the error when trying to recompile the kernel:

  CC [M]  net/ipv4/netfilter/iptable_mangle.o
  LD [M]  net/ipv4/netfilter/iptable_nat.o
  CC [M]  net/ipv4/netfilter/iptable_raw.o
  CC [M]  net/ipv4/netfilter/ipt_iprange.o
  CC [M]  net/ipv4/netfilter/ipt_owner.o
  CC [M]  net/ipv4/netfilter/ipt_tos.o
  CC [M]  net/ipv4/netfilter/ipt_connlimit.o
net/ipv4/netfilter/ipt_connlimit.c: In function =E2count_them=E2:
net/ipv4/netfilter/ipt_connlimit.c:98: error: too many arguments to fun=
ction =E2nf_conntrack_find_get=E2
net/ipv4/netfilter/ipt_connlimit.c: At top level:
net/ipv4/netfilter/ipt_connlimit.c:312: warning: initialization from in=
compatible pointer type
net/ipv4/netfilter/ipt_connlimit.c:316: warning: initialization from in=
compatible pointer type
make[4]: *** [net/ipv4/netfilter/ipt_connlimit.o] Error 1
make[3]: *** [net/ipv4/netfilter] Error 2
make[2]: *** [net/ipv4] Error 2
make[1]: *** [net] Error 2
make[1]: Leaving directory `/usr/src/linux-source-2.6.23'
make: *** [debian/stamp-build-kernel] Error 2
root@siduxbox:/usr/src/linux#

