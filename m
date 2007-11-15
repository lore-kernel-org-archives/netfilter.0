From: =?gb2312?B?wO7OsLuq?= <liweihuahot@hotmail.com>
Subject: (unknown)
Date: Thu, 15 Nov 2007 05:24:13 +0000
Message-ID: <BAY122-W962C66DD8159A88633770BE820@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Subject: 
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="gb2312"
To: netfilter@vger.kernel.org



when i was patched kernel 2.6.23.1 and iptables-1.3.8 with last path-o-=
matic's patchlet connlimit and run compile iptables by  "make KERNEL_DI=
R=3D../linux-2.6.23.1/  " , there some error appear :


Extensions found: IPv4:CLUSTERIP IPv4:NFLOG IPv4:condition IPv4:connbyt=
es IPv4:connlimit IPv4:dccp IPv4:ipp2p IPv4:layer7 IPv4:quota IPv4:rece=
nt IPv4:statistic IPv4:string IPv6:NFLOG IPv6:REJECT IPv6:ah IPv6:esp I=
Pv6:frag IPv6:hashlimit IPv6:ipv6header IPv6:mh IPv6:rt IPv6:sctp
cc -O2 -Wall -Wunused -I../linux-2.6.23.1//include -Iinclude/ -DIPTABLE=
S_VERSION=3D\"1.3.8\"  -fPIC -o extensions/libipt_connlimit_sh.o -c ext=
ensions/libipt_connlimit.c
In file included from ../linux-2.6.23.1/include/asm/bitops.h:9,
                 from ../linux-2.6.23.1/include/linux/bitops.h:9,
                 from /usr/include/linux/netfilter_ipv4/ip_conntrack.h:=
9,
                 from extensions/libipt_connlimit.c:9:
=2E./linux-2.6.23.1/include/asm/alternative.h:9: error: syntax error be=
fore "u8"
=2E./linux-2.6.23.1/include/asm/alternative.h:11: error: syntax error b=
efore "cpuid"
=2E./linux-2.6.23.1/include/asm/alternative.h:12: error: syntax error b=
efore "instrlen"
=2E./linux-2.6.23.1/include/asm/alternative.h:13: error: syntax error b=
efore "replacementlen"
=2E./linux-2.6.23.1/include/asm/alternative.h:14: error: syntax error b=
efore "pad"
In file included from ../linux-2.6.23.1/include/linux/bitops.h:9,
                 from /usr/include/linux/netfilter_ipv4/ip_conntrack.h:=
9,
                 from extensions/libipt_connlimit.c:9:
=2E./linux-2.6.23.1/include/asm/bitops.h:244: error: syntax error befor=
e "int"
In file included from ../linux-2.6.23.1/include/linux/cpumask.h:86,
                 from ../linux-2.6.23.1/include/asm/processor.h:22,
                 from ../linux-2.6.23.1/include/asm/atomic.h:5,
                 from /usr/include/linux/netfilter_ipv4/ip_conntrack.h:=
11,
                 from extensions/libipt_connlimit.c:9:
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_zero':
=2E./linux-2.6.23.1/include/linux/bitmap.h:134: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h:134: error: (Each undeclared=
 identifier is reported only once
=2E./linux-2.6.23.1/include/linux/bitmap.h:134: error: for each functio=
n it appears in.)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_fill':
=2E./linux-2.6.23.1/include/linux/bitmap.h:149: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_copy':
=2E./linux-2.6.23.1/include/linux/bitmap.h:155: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_and':
=2E./linux-2.6.23.1/include/linux/bitmap.h:166: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_or':
=2E./linux-2.6.23.1/include/linux/bitmap.h:175: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_xor':
=2E./linux-2.6.23.1/include/linux/bitmap.h:184: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_andnot'=
:
=2E./linux-2.6.23.1/include/linux/bitmap.h:193: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_complem=
ent':
=2E./linux-2.6.23.1/include/linux/bitmap.h:202: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_equal':
=2E./linux-2.6.23.1/include/linux/bitmap.h:211: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_interse=
cts':
=2E./linux-2.6.23.1/include/linux/bitmap.h:220: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_subset'=
:
=2E./linux-2.6.23.1/include/linux/bitmap.h:229: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_empty':
=2E./linux-2.6.23.1/include/linux/bitmap.h:237: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_full':
=2E./linux-2.6.23.1/include/linux/bitmap.h:245: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_weight'=
:
=2E./linux-2.6.23.1/include/linux/bitmap.h:253: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_shift_r=
ight':
=2E./linux-2.6.23.1/include/linux/bitmap.h:261: error: `BITS_PER_LONG' =
undeclared (first use in this function)
=2E./linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_shift_l=
eft':
=2E./linux-2.6.23.1/include/linux/bitmap.h:270: error: `BITS_PER_LONG' =
undeclared (first use in this function)
In file included from ../linux-2.6.23.1/include/asm/processor.h:22,
                 from ../linux-2.6.23.1/include/asm/atomic.h:5,
                 from /usr/include/linux/netfilter_ipv4/ip_conntrack.h:=
11,
                 from extensions/libipt_connlimit.c:9:
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:88: error: syntax error bef=
ore "DECLARE_BITMAP"
=2E./linux-2.6.23.1/include/linux/cpumask.h:89: error: syntax error bef=
ore "_unused_cpumask_arg_"
=2E./linux-2.6.23.1/include/linux/cpumask.h:92: error: syntax error bef=
ore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpu_set':
=2E./linux-2.6.23.1/include/linux/cpumask.h:94: error: `cpu' undeclared=
 (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:94: error: `dstp' undeclare=
d (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:98: error: syntax error bef=
ore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpu_clear':
=2E./linux-2.6.23.1/include/linux/cpumask.h:100: error: `cpu' undeclare=
d (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:100: error: `dstp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:104: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_setall=
':
=2E./linux-2.6.23.1/include/linux/cpumask.h:106: error: `dstp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:106: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:110: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_clear'=
:
=2E./linux-2.6.23.1/include/linux/cpumask.h:112: error: `dstp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:112: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:119: error: syntax error be=
fore "cpumask_t"
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpu_test_an=
d_set':
=2E./linux-2.6.23.1/include/linux/cpumask.h:121: error: `cpu' undeclare=
d (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:121: error: `addr' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:125: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_and':
=2E./linux-2.6.23.1/include/linux/cpumask.h:128: error: `dstp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:128: error: `src1p' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:128: error: `src2p' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:128: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:132: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_or':
=2E./linux-2.6.23.1/include/linux/cpumask.h:135: error: `dstp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:135: error: `src1p' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:135: error: `src2p' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:135: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:139: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_xor':
=2E./linux-2.6.23.1/include/linux/cpumask.h:142: error: `dstp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:142: error: `src1p' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:142: error: `src2p' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:142: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:147: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_andnot=
':
=2E./linux-2.6.23.1/include/linux/cpumask.h:150: error: `dstp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:150: error: `src1p' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:150: error: `src2p' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:150: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:154: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_comple=
ment':
=2E./linux-2.6.23.1/include/linux/cpumask.h:157: error: `dstp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:157: error: `srcp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:157: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:161: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_equal'=
:
=2E./linux-2.6.23.1/include/linux/cpumask.h:164: error: `src1p' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:164: error: `src2p' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:164: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:168: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_inters=
ects':
=2E./linux-2.6.23.1/include/linux/cpumask.h:171: error: `src1p' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:171: error: `src2p' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:171: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:175: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_subset=
':
=2E./linux-2.6.23.1/include/linux/cpumask.h:178: error: `src1p' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:178: error: `src2p' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:178: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:182: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_empty'=
:
=2E./linux-2.6.23.1/include/linux/cpumask.h:184: error: `srcp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:184: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:188: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_full':
=2E./linux-2.6.23.1/include/linux/cpumask.h:190: error: `srcp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:190: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:194: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_weight=
':
=2E./linux-2.6.23.1/include/linux/cpumask.h:196: error: `srcp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:196: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:201: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_shift_=
right':
=2E./linux-2.6.23.1/include/linux/cpumask.h:204: error: `dstp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:204: error: `srcp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:204: error: `n' undeclared =
(first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:204: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:209: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_shift_=
left':
=2E./linux-2.6.23.1/include/linux/cpumask.h:212: error: `dstp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:212: error: `srcp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:212: error: `n' undeclared =
(first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:212: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:216: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h:218: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h:271: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpumask_scn=
printf':
=2E./linux-2.6.23.1/include/linux/cpumask.h:273: error: `buf' undeclare=
d (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:273: error: `len' undeclare=
d (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:273: error: `srcp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:273: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:279: error: syntax error be=
fore "cpumask_t"
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpumask_par=
se_user':
=2E./linux-2.6.23.1/include/linux/cpumask.h:281: error: `buf' undeclare=
d (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:281: error: `len' undeclare=
d (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:281: error: `dstp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:281: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:287: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpulist_scn=
printf':
=2E./linux-2.6.23.1/include/linux/cpumask.h:289: error: `buf' undeclare=
d (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:289: error: `len' undeclare=
d (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:289: error: `srcp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:289: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:293: error: syntax error be=
fore "cpumask_t"
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpulist_par=
se':
=2E./linux-2.6.23.1/include/linux/cpumask.h:295: error: `buf' undeclare=
d (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:295: error: `dstp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:295: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:301: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpu_remap':
=2E./linux-2.6.23.1/include/linux/cpumask.h:303: error: `oldbit' undecl=
ared (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:303: error: `oldp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:303: error: `newp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:303: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:308: error: syntax error be=
fore '*' token
=2E./linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_remap'=
:
=2E./linux-2.6.23.1/include/linux/cpumask.h:311: error: `dstp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:311: error: `srcp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:311: error: `oldp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:311: error: `newp' undeclar=
ed (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h:311: error: `nbits' undecla=
red (first use in this function)
=2E./linux-2.6.23.1/include/linux/cpumask.h: At top level:
=2E./linux-2.6.23.1/include/linux/cpumask.h:380: error: syntax error be=
fore "cpu_possible_map"
=2E./linux-2.6.23.1/include/linux/cpumask.h:381: error: syntax error be=
fore "cpu_online_map"
=2E./linux-2.6.23.1/include/linux/cpumask.h:382: error: syntax error be=
fore "cpu_present_map"
=2E./linux-2.6.23.1/include/linux/cpumask.h:403: error: syntax error be=
fore '*' token
In file included from ../linux-2.6.23.1/include/asm/atomic.h:5,
                 from /usr/include/linux/netfilter_ipv4/ip_conntrack.h:=
11,
                 from extensions/libipt_connlimit.c:9:
=2E./linux-2.6.23.1/include/asm/processor.h:73: error: syntax error bef=
ore "cpumask_t"
=2E./linux-2.6.23.1/include/asm/processor.h:83: error: syntax error bef=
ore '}' token
=2E./linux-2.6.23.1/include/asm/processor.h:599: error: `cpuid' redecla=
red as different kind of symbol
=2E./linux-2.6.23.1/include/asm/alternative.h:11: error: previous decla=
ration of `cpuid'
make: *** [extensions/libipt_connlimit_sh.o] Error 1

_________________________________________________________________
=CA=D6=BB=FA=D2=B2=C4=DC=C9=CF MSN =C1=C4=CC=EC=C1=CB=A3=AC=BF=EC=C0=B4=
=CA=D4=CA=D4=B0=C9=A3=A1
http://mobile.msn.com.cn/
