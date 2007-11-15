From: =?gb2312?B?wO7OsLuq?= <liweihuahot@hotmail.com>
Subject: connlimit compile error in kernel2.6.23.1&iptables-1.3.8
Date: Thu, 15 Nov 2007 05:27:27 +0000
Message-ID: <BAY122-W4224C1094D9923D6C0F741BE820@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="gb2312"
To: netfilter@vger.kernel.org


  when i was patched kernel 2.6.23.1 and iptables-1.3.8 with last path-=
o-matic's patchlet connlimit and run compile iptables by "make KERNEL_D=
IR=3D../linux-2.6.23.1/ " , there some error appear :=20

Extensions found: IPv4:CLUSTERIP IPv4:NFLOG IPv4:condition IPv4:connbyt=
es IPv4:connlimit IPv4:dccp IPv4:ipp2p IPv4:layer7 IPv4:quota IPv4:rece=
nt IPv4:statistic IPv4:string IPv6:NFLOG IPv6:REJECT IPv6:ah IPv6:esp I=
Pv6:frag IPv6:hashlimit IPv6:ipv6header IPv6:mh IPv6:rt IPv6:sctpcc -O2=
 -Wall -Wunused -I../linux-2.6.23.1//include -Iinclude/ -DIPTABLES_VERS=
ION=3D\"1.3.8\" -fPIC -o extensions/libipt_connlimit_sh.o -c extensions=
/libipt_connlimit.cIn file included from ../linux-2.6.23.1/include/asm/=
bitops.h:9,from ../linux-2.6.23.1/include/linux/bitops.h:9,from /usr/in=
clude/linux/netfilter_ipv4/ip_conntrack.h:9,from extensions/libipt_conn=
limit.c:9:../linux-2.6.23.1/include/asm/alternative.h:9: error: syntax =
error before "u8"../linux-2.6.23.1/include/asm/alternative.h:11: error:=
 syntax error before "cpuid"../linux-2.6.23.1/include/asm/alternative.h=
:12: error: syntax error before "instrlen"../linux-2.6.23.1/include/asm=
/alternative.h:13: error: syntax error before "replacementlen"../linux-=
2.6.23.1/include/asm/alternative.h:14: error: syntax error before "pad"=
In file included from ../linux-2.6.23.1/include/linux/bitops.h:9,from /=
usr/include/linux/netfilter_ipv4/ip_conntrack.h:9,from extensions/libip=
t_connlimit.c:9:../linux-2.6.23.1/include/asm/bitops.h:244: error: synt=
ax error before "int"In file included from ../linux-2.6.23.1/include/li=
nux/cpumask.h:86,from ../linux-2.6.23.1/include/asm/processor.h:22,from=
 ../linux-2.6.23.1/include/asm/atomic.h:5,from /usr/include/linux/netfi=
lter_ipv4/ip_conntrack.h:11,from extensions/libipt_connlimit.c:9:../lin=
ux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_zero':../linux-=
2.6.23.1/include/linux/bitmap.h:134: error: `BITS_PER_LONG' undeclared =
(first use in this function)../linux-2.6.23.1/include/linux/bitmap.h:13=
4: error: (Each undeclared identifier is reported only once../linux-2.6=
=2E23.1/include/linux/bitmap.h:134: error: for each function it appears=
 in.)../linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_fill=
':../linux-2.6.23.1/include/linux/bitmap.h:149: error: `BITS_PER_LONG' =
undeclared (first use in this function)../linux-2.6.23.1/include/linux/=
bitmap.h: In function `bitmap_copy':../linux-2.6.23.1/include/linux/bit=
map.h:155: error: `BITS_PER_LONG' undeclared (first use in this functio=
n)../linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_and':..=
/linux-2.6.23.1/include/linux/bitmap.h:166: error: `BITS_PER_LONG' unde=
clared (first use in this function)../linux-2.6.23.1/include/linux/bitm=
ap.h: In function `bitmap_or':../linux-2.6.23.1/include/linux/bitmap.h:=
175: error: `BITS_PER_LONG' undeclared (first use in this function)../l=
inux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_xor':../linux=
-2.6.23.1/include/linux/bitmap.h:184: error: `BITS_PER_LONG' undeclared=
 (first use in this function)../linux-2.6.23.1/include/linux/bitmap.h: =
In function `bitmap_andnot':../linux-2.6.23.1/include/linux/bitmap.h:19=
3: error: `BITS_PER_LONG' undeclared (first use in this function)../lin=
ux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_complement':../=
linux-2.6.23.1/include/linux/bitmap.h:202: error: `BITS_PER_LONG' undec=
lared (first use in this function)../linux-2.6.23.1/include/linux/bitma=
p.h: In function `bitmap_equal':../linux-2.6.23.1/include/linux/bitmap.=
h:211: error: `BITS_PER_LONG' undeclared (first use in this function)..=
/linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_intersects'=
:../linux-2.6.23.1/include/linux/bitmap.h:220: error: `BITS_PER_LONG' u=
ndeclared (first use in this function)../linux-2.6.23.1/include/linux/b=
itmap.h: In function `bitmap_subset':../linux-2.6.23.1/include/linux/bi=
tmap.h:229: error: `BITS_PER_LONG' undeclared (first use in this functi=
on)../linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_empty'=
:../linux-2.6.23.1/include/linux/bitmap.h:237: error: `BITS_PER_LONG' u=
ndeclared (first use in this function)../linux-2.6.23.1/include/linux/b=
itmap.h: In function `bitmap_full':../linux-2.6.23.1/include/linux/bitm=
ap.h:245: error: `BITS_PER_LONG' undeclared (first use in this function=
)../linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_weight':=
=2E./linux-2.6.23.1/include/linux/bitmap.h:253: error: `BITS_PER_LONG' =
undeclared (first use in this function)../linux-2.6.23.1/include/linux/=
bitmap.h: In function `bitmap_shift_right':../linux-2.6.23.1/include/li=
nux/bitmap.h:261: error: `BITS_PER_LONG' undeclared (first use in this =
function)../linux-2.6.23.1/include/linux/bitmap.h: In function `bitmap_=
shift_left':../linux-2.6.23.1/include/linux/bitmap.h:270: error: `BITS_=
PER_LONG' undeclared (first use in this function)In file included from =
=2E./linux-2.6.23.1/include/asm/processor.h:22,from ../linux-2.6.23.1/i=
nclude/asm/atomic.h:5,from /usr/include/linux/netfilter_ipv4/ip_conntra=
ck.h:11,from extensions/libipt_connlimit.c:9:../linux-2.6.23.1/include/=
linux/cpumask.h: At top level:../linux-2.6.23.1/include/linux/cpumask.h=
:88: error: syntax error before "DECLARE_BITMAP"../linux-2.6.23.1/inclu=
de/linux/cpumask.h:89: error: syntax error before "_unused_cpumask_arg_=
"../linux-2.6.23.1/include/linux/cpumask.h:92: error: syntax error befo=
re '*' token../linux-2.6.23.1/include/linux/cpumask.h: In function `__c=
pu_set':../linux-2.6.23.1/include/linux/cpumask.h:94: error: `cpu' unde=
clared (first use in this function)../linux-2.6.23.1/include/linux/cpum=
ask.h:94: error: `dstp' undeclared (first use in this function)../linux=
-2.6.23.1/include/linux/cpumask.h: At top level:../linux-2.6.23.1/inclu=
de/linux/cpumask.h:98: error: syntax error before '*' token../linux-2.6=
=2E23.1/include/linux/cpumask.h: In function `__cpu_clear':../linux-2.6=
=2E23.1/include/linux/cpumask.h:100: error: `cpu' undeclared (first use=
 in this function)../linux-2.6.23.1/include/linux/cpumask.h:100: error:=
 `dstp' undeclared (first use in this function)../linux-2.6.23.1/includ=
e/linux/cpumask.h: At top level:../linux-2.6.23.1/include/linux/cpumask=
=2Eh:104: error: syntax error before '*' token../linux-2.6.23.1/include=
/linux/cpumask.h: In function `__cpus_setall':../linux-2.6.23.1/include=
/linux/cpumask.h:106: error: `dstp' undeclared (first use in this funct=
ion)../linux-2.6.23.1/include/linux/cpumask.h:106: error: `nbits' undec=
lared (first use in this function)../linux-2.6.23.1/include/linux/cpuma=
sk.h: At top level:../linux-2.6.23.1/include/linux/cpumask.h:110: error=
: syntax error before '*' token../linux-2.6.23.1/include/linux/cpumask.=
h: In function `__cpus_clear':../linux-2.6.23.1/include/linux/cpumask.h=
:112: error: `dstp' undeclared (first use in this function)../linux-2.6=
=2E23.1/include/linux/cpumask.h:112: error: `nbits' undeclared (first u=
se in this function)../linux-2.6.23.1/include/linux/cpumask.h: At top l=
evel:../linux-2.6.23.1/include/linux/cpumask.h:119: error: syntax error=
 before "cpumask_t"../linux-2.6.23.1/include/linux/cpumask.h: In functi=
on `__cpu_test_and_set':../linux-2.6.23.1/include/linux/cpumask.h:121: =
error: `cpu' undeclared (first use in this function)../linux-2.6.23.1/i=
nclude/linux/cpumask.h:121: error: `addr' undeclared (first use in this=
 function)../linux-2.6.23.1/include/linux/cpumask.h: At top level:../li=
nux-2.6.23.1/include/linux/cpumask.h:125: error: syntax error before '*=
' token../linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_a=
nd':../linux-2.6.23.1/include/linux/cpumask.h:128: error: `dstp' undecl=
ared (first use in this function)../linux-2.6.23.1/include/linux/cpumas=
k.h:128: error: `src1p' undeclared (first use in this function)../linux=
-2.6.23.1/include/linux/cpumask.h:128: error: `src2p' undeclared (first=
 use in this function)../linux-2.6.23.1/include/linux/cpumask.h:128: er=
ror: `nbits' undeclared (first use in this function)../linux-2.6.23.1/i=
nclude/linux/cpumask.h: At top level:../linux-2.6.23.1/include/linux/cp=
umask.h:132: error: syntax error before '*' token../linux-2.6.23.1/incl=
ude/linux/cpumask.h: In function `__cpus_or':../linux-2.6.23.1/include/=
linux/cpumask.h:135: error: `dstp' undeclared (first use in this functi=
on)../linux-2.6.23.1/include/linux/cpumask.h:135: error: `src1p' undecl=
ared (first use in this function)../linux-2.6.23.1/include/linux/cpumas=
k.h:135: error: `src2p' undeclared (first use in this function)../linux=
-2.6.23.1/include/linux/cpumask.h:135: error: `nbits' undeclared (first=
 use in this function)../linux-2.6.23.1/include/linux/cpumask.h: At top=
 level:../linux-2.6.23.1/include/linux/cpumask.h:139: error: syntax err=
or before '*' token../linux-2.6.23.1/include/linux/cpumask.h: In functi=
on `__cpus_xor':../linux-2.6.23.1/include/linux/cpumask.h:142: error: `=
dstp' undeclared (first use in this function)../linux-2.6.23.1/include/=
linux/cpumask.h:142: error: `src1p' undeclared (first use in this funct=
ion)../linux-2.6.23.1/include/linux/cpumask.h:142: error: `src2p' undec=
lared (first use in this function)../linux-2.6.23.1/include/linux/cpuma=
sk.h:142: error: `nbits' undeclared (first use in this function)../linu=
x-2.6.23.1/include/linux/cpumask.h: At top level:../linux-2.6.23.1/incl=
ude/linux/cpumask.h:147: error: syntax error before '*' token../linux-2=
=2E6.23.1/include/linux/cpumask.h: In function `__cpus_andnot':../linux=
-2.6.23.1/include/linux/cpumask.h:150: error: `dstp' undeclared (first =
use in this function)../linux-2.6.23.1/include/linux/cpumask.h:150: err=
or: `src1p' undeclared (first use in this function)../linux-2.6.23.1/in=
clude/linux/cpumask.h:150: error: `src2p' undeclared (first use in this=
 function)../linux-2.6.23.1/include/linux/cpumask.h:150: error: `nbits'=
 undeclared (first use in this function)../linux-2.6.23.1/include/linux=
/cpumask.h: At top level:../linux-2.6.23.1/include/linux/cpumask.h:154:=
 error: syntax error before '*' token../linux-2.6.23.1/include/linux/cp=
umask.h: In function `__cpus_complement':../linux-2.6.23.1/include/linu=
x/cpumask.h:157: error: `dstp' undeclared (first use in this function).=
=2E/linux-2.6.23.1/include/linux/cpumask.h:157: error: `srcp' undeclare=
d (first use in this function)../linux-2.6.23.1/include/linux/cpumask.h=
:157: error: `nbits' undeclared (first use in this function)../linux-2.=
6.23.1/include/linux/cpumask.h: At top level:../linux-2.6.23.1/include/=
linux/cpumask.h:161: error: syntax error before '*' token../linux-2.6.2=
3.1/include/linux/cpumask.h: In function `__cpus_equal':../linux-2.6.23=
=2E1/include/linux/cpumask.h:164: error: `src1p' undeclared (first use =
in this function)../linux-2.6.23.1/include/linux/cpumask.h:164: error: =
`src2p' undeclared (first use in this function)../linux-2.6.23.1/includ=
e/linux/cpumask.h:164: error: `nbits' undeclared (first use in this fun=
ction)../linux-2.6.23.1/include/linux/cpumask.h: At top level:../linux-=
2.6.23.1/include/linux/cpumask.h:168: error: syntax error before '*' to=
ken../linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_inter=
sects':../linux-2.6.23.1/include/linux/cpumask.h:171: error: `src1p' un=
declared (first use in this function)../linux-2.6.23.1/include/linux/cp=
umask.h:171: error: `src2p' undeclared (first use in this function)../l=
inux-2.6.23.1/include/linux/cpumask.h:171: error: `nbits' undeclared (f=
irst use in this function)../linux-2.6.23.1/include/linux/cpumask.h: At=
 top level:../linux-2.6.23.1/include/linux/cpumask.h:175: error: syntax=
 error before '*' token../linux-2.6.23.1/include/linux/cpumask.h: In fu=
nction `__cpus_subset':../linux-2.6.23.1/include/linux/cpumask.h:178: e=
rror: `src1p' undeclared (first use in this function)../linux-2.6.23.1/=
include/linux/cpumask.h:178: error: `src2p' undeclared (first use in th=
is function)../linux-2.6.23.1/include/linux/cpumask.h:178: error: `nbit=
s' undeclared (first use in this function)../linux-2.6.23.1/include/lin=
ux/cpumask.h: At top level:../linux-2.6.23.1/include/linux/cpumask.h:18=
2: error: syntax error before '*' token../linux-2.6.23.1/include/linux/=
cpumask.h: In function `__cpus_empty':../linux-2.6.23.1/include/linux/c=
pumask.h:184: error: `srcp' undeclared (first use in this function)../l=
inux-2.6.23.1/include/linux/cpumask.h:184: error: `nbits' undeclared (f=
irst use in this function)../linux-2.6.23.1/include/linux/cpumask.h: At=
 top level:../linux-2.6.23.1/include/linux/cpumask.h:188: error: syntax=
 error before '*' token../linux-2.6.23.1/include/linux/cpumask.h: In fu=
nction `__cpus_full':../linux-2.6.23.1/include/linux/cpumask.h:190: err=
or: `srcp' undeclared (first use in this function)../linux-2.6.23.1/inc=
lude/linux/cpumask.h:190: error: `nbits' undeclared (first use in this =
function)../linux-2.6.23.1/include/linux/cpumask.h: At top level:../lin=
ux-2.6.23.1/include/linux/cpumask.h:194: error: syntax error before '*'=
 token../linux-2.6.23.1/include/linux/cpumask.h: In function `__cpus_we=
ight':../linux-2.6.23.1/include/linux/cpumask.h:196: error: `srcp' unde=
clared (first use in this function)../linux-2.6.23.1/include/linux/cpum=
ask.h:196: error: `nbits' undeclared (first use in this function)../lin=
ux-2.6.23.1/include/linux/cpumask.h: At top level:../linux-2.6.23.1/inc=
lude/linux/cpumask.h:201: error: syntax error before '*' token../linux-=
2.6.23.1/include/linux/cpumask.h: In function `__cpus_shift_right':../l=
inux-2.6.23.1/include/linux/cpumask.h:204: error: `dstp' undeclared (fi=
rst use in this function)../linux-2.6.23.1/include/linux/cpumask.h:204:=
 error: `srcp' undeclared (first use in this function)../linux-2.6.23.1=
/include/linux/cpumask.h:204: error: `n' undeclared (first use in this =
function)../linux-2.6.23.1/include/linux/cpumask.h:204: error: `nbits' =
undeclared (first use in this function)../linux-2.6.23.1/include/linux/=
cpumask.h: At top level:../linux-2.6.23.1/include/linux/cpumask.h:209: =
error: syntax error before '*' token../linux-2.6.23.1/include/linux/cpu=
mask.h: In function `__cpus_shift_left':../linux-2.6.23.1/include/linux=
/cpumask.h:212: error: `dstp' undeclared (first use in this function)..=
/linux-2.6.23.1/include/linux/cpumask.h:212: error: `srcp' undeclared (=
first use in this function)../linux-2.6.23.1/include/linux/cpumask.h:21=
2: error: `n' undeclared (first use in this function)../linux-2.6.23.1/=
include/linux/cpumask.h:212: error: `nbits' undeclared (first use in th=
is function)../linux-2.6.23.1/include/linux/cpumask.h: At top level:../=
linux-2.6.23.1/include/linux/cpumask.h:216: error: syntax error before =
'*' token../linux-2.6.23.1/include/linux/cpumask.h:218: error: syntax e=
rror before '*' token../linux-2.6.23.1/include/linux/cpumask.h:271: err=
or: syntax error before '*' token../linux-2.6.23.1/include/linux/cpumas=
k.h: In function `__cpumask_scnprintf':../linux-2.6.23.1/include/linux/=
cpumask.h:273: error: `buf' undeclared (first use in this function)../l=
inux-2.6.23.1/include/linux/cpumask.h:273: error: `len' undeclared (fir=
st use in this function)../linux-2.6.23.1/include/linux/cpumask.h:273: =
error: `srcp' undeclared (first use in this function)../linux-2.6.23.1/=
include/linux/cpumask.h:273: error: `nbits' undeclared (first use in th=
is function)../linux-2.6.23.1/include/linux/cpumask.h: At top level:../=
linux-2.6.23.1/include/linux/cpumask.h:279: error: syntax error before =
"cpumask_t"../linux-2.6.23.1/include/linux/cpumask.h: In function `__cp=
umask_parse_user':../linux-2.6.23.1/include/linux/cpumask.h:281: error:=
 `buf' undeclared (first use in this function)../linux-2.6.23.1/include=
/linux/cpumask.h:281: error: `len' undeclared (first use in this functi=
on)../linux-2.6.23.1/include/linux/cpumask.h:281: error: `dstp' undecla=
red (first use in this function)../linux-2.6.23.1/include/linux/cpumask=
=2Eh:281: error: `nbits' undeclared (first use in this function)../linu=
x-2.6.23.1/include/linux/cpumask.h: At top level:../linux-2.6.23.1/incl=
ude/linux/cpumask.h:287: error: syntax error before '*' token../linux-2=
=2E6.23.1/include/linux/cpumask.h: In function `__cpulist_scnprintf':..=
/linux-2.6.23.1/include/linux/cpumask.h:289: error: `buf' undeclared (f=
irst use in this function)../linux-2.6.23.1/include/linux/cpumask.h:289=
: error: `len' undeclared (first use in this function)../linux-2.6.23.1=
/include/linux/cpumask.h:289: error: `srcp' undeclared (first use in th=
is function)../linux-2.6.23.1/include/linux/cpumask.h:289: error: `nbit=
s' undeclared (first use in this function)../linux-2.6.23.1/include/lin=
ux/cpumask.h: At top level:../linux-2.6.23.1/include/linux/cpumask.h:29=
3: error: syntax error before "cpumask_t"../linux-2.6.23.1/include/linu=
x/cpumask.h: In function `__cpulist_parse':../linux-2.6.23.1/include/li=
nux/cpumask.h:295: error: `buf' undeclared (first use in this function)=
=2E./linux-2.6.23.1/include/linux/cpumask.h:295: error: `dstp' undeclar=
ed (first use in this function)../linux-2.6.23.1/include/linux/cpumask.=
h:295: error: `nbits' undeclared (first use in this function)../linux-2=
=2E6.23.1/include/linux/cpumask.h: At top level:../linux-2.6.23.1/inclu=
de/linux/cpumask.h:301: error: syntax error before '*' token../linux-2.=
6.23.1/include/linux/cpumask.h: In function `__cpu_remap':../linux-2.6.=
23.1/include/linux/cpumask.h:303: error: `oldbit' undeclared (first use=
 in this function)../linux-2.6.23.1/include/linux/cpumask.h:303: error:=
 `oldp' undeclared (first use in this function)../linux-2.6.23.1/includ=
e/linux/cpumask.h:303: error: `newp' undeclared (first use in this func=
tion)../linux-2.6.23.1/include/linux/cpumask.h:303: error: `nbits' unde=
clared (first use in this function)../linux-2.6.23.1/include/linux/cpum=
ask.h: At top level:../linux-2.6.23.1/include/linux/cpumask.h:308: erro=
r: syntax error before '*' token../linux-2.6.23.1/include/linux/cpumask=
=2Eh: In function `__cpus_remap':../linux-2.6.23.1/include/linux/cpumas=
k.h:311: error: `dstp' undeclared (first use in this function)../linux-=
2.6.23.1/include/linux/cpumask.h:311: error: `srcp' undeclared (first u=
se in this function)../linux-2.6.23.1/include/linux/cpumask.h:311: erro=
r: `oldp' undeclared (first use in this function)../linux-2.6.23.1/incl=
ude/linux/cpumask.h:311: error: `newp' undeclared (first use in this fu=
nction)../linux-2.6.23.1/include/linux/cpumask.h:311: error: `nbits' un=
declared (first use in this function)../linux-2.6.23.1/include/linux/cp=
umask.h: At top level:../linux-2.6.23.1/include/linux/cpumask.h:380: er=
ror: syntax error before "cpu_possible_map"../linux-2.6.23.1/include/li=
nux/cpumask.h:381: error: syntax error before "cpu_online_map"../linux-=
2.6.23.1/include/linux/cpumask.h:382: error: syntax error before "cpu_p=
resent_map"../linux-2.6.23.1/include/linux/cpumask.h:403: error: syntax=
 error before '*' tokenIn file included from ../linux-2.6.23.1/include/=
asm/atomic.h:5,from /usr/include/linux/netfilter_ipv4/ip_conntrack.h:11=
,from extensions/libipt_connlimit.c:9:../linux-2.6.23.1/include/asm/pro=
cessor.h:73: error: syntax error before "cpumask_t"../linux-2.6.23.1/in=
clude/asm/processor.h:83: error: syntax error before '}' token../linux-=
2.6.23.1/include/asm/processor.h:599: error: `cpuid' redeclared as diff=
erent kind of symbol../linux-2.6.23.1/include/asm/alternative.h:11: err=
or: previous declaration of `cpuid'make: *** [extensions/libipt_connlim=
it_sh.o] Error 1 =20
=20
_________________________________________________________________
=D3=C3 Live Search =CB=D1=BE=A1=CC=EC=CF=C2=D7=CA=D1=B6=A3=A1
http://www.live.com/?searchOnly=3Dtrue
