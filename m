From: "Flavio Borup" <borup@running.com.br>
Subject: IPTables-P2P
Date: Mon, 26 Jul 2004 12:53:16 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01bb01c47328$aa7f6be0$1164a8c0@runningcentro.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_01B8_01C4730F.84DE2070"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_01B8_01C4730F.84DE2070
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'm trying to compile Iptables-P2P on my Red Hat 9 and the error =
messages on compiling are:

There is a RPM package for this app?


=3D=3D=3D COMPILING IPTABLES-P2P =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[root@firewall ~/iptables-p2p-0.3.0a]# make
make -C iptables
make[1]: Entrando no diret=C3=B3rio `/root/iptables-p2p-0.3.0a/iptables'
make[1]: Nada a ser feito para `all'.
make[1]: Saindo do diret=C3=B3rio `/root/iptables-p2p-0.3.0a/iptables'
make -C kernel linux-2.4
make[1]: Entrando no diret=C3=B3rio `/root/iptables-p2p-0.3.0a/kernel'
gcc -O3 -D__KERNEL__ -DMODULE =
-I/root/iptables-p2p-0.3.0a/kernel/../common -
I/lib/modules/2.4.20-8/build/include =
-I/lib/modules/2.4.20-8/build/include/a
sm/mach-default  -c -o main.o main.c
In file included from /usr/include/linux/fs.h:23,
                 from /usr/include/linux/capability.h:17,
                 from /usr/include/linux/binfmts.h:5,
                 from /usr/include/linux/sched.h:9,
                 from /usr/include/linux/skbuff.h:19,
                 from main.c:18:
/usr/include/linux/string.h:8:2: warning: #warning Using kernel header =
in
userland!
In file included from /usr/include/linux/sched.h:14,
                 from /usr/include/linux/skbuff.h:19,
                 from main.c:18:
/usr/include/linux/timex.h:173: field `time' has incomplete type
In file included from /usr/include/linux/bitops.h:69,
                 from /usr/include/asm/system.h:7,
                 from /usr/include/linux/sched.h:16,
                 from /usr/include/linux/skbuff.h:19,
                 from main.c:18:
/usr/include/asm/bitops.h:327:2: warning: #warning This includefile is =
not
available on all architectures.
/usr/include/asm/bitops.h:328:2: warning: #warning Using kernel headers =
in
userspace: atomicity not guaranteed
In file included from /usr/include/linux/signal.h:4,
                 from /usr/include/linux/sched.h:25,
                 from /usr/include/linux/skbuff.h:19,
                 from main.c:18:
/usr/include/asm/signal.h:107: parse error before "sigset_t"
/usr/include/asm/signal.h:110: parse error before '}' token
In file included from /usr/include/linux/sched.h:81,
                 from /usr/include/linux/skbuff.h:19,
                 from main.c:18:
/usr/include/linux/timer.h:45: parse error before "spinlock_t"
/usr/include/linux/timer.h:53: parse error before '}' token
/usr/include/linux/timer.h:67: parse error before "tvec_base_t"
/usr/include/linux/timer.h:101: parse error before "tvec_bases"
/usr/include/linux/timer.h: In function `init_timer':
/usr/include/linux/timer.h:105: dereferencing pointer to incomplete type
/usr/include/linux/timer.h:105: dereferencing pointer to incomplete type
/usr/include/linux/timer.h:106: dereferencing pointer to incomplete type
/usr/include/linux/timer.h: In function `timer_pending':
/usr/include/linux/timer.h:121: dereferencing pointer to incomplete type
In file included from /usr/include/linux/highmem.h:5,
                 from /usr/include/linux/skbuff.h:26,
                 from main.c:18:
/usr/include/asm/pgalloc.h:6:24: asm/fixmap.h: Arquivo ou diret=C3=B3rio =
n=C3=A3o
encontrado
In file included from /usr/include/linux/highmem.h:5,
                 from /usr/include/linux/skbuff.h:26,
                 from main.c:18:
/usr/include/asm/pgalloc.h: At top level:
/usr/include/asm/pgalloc.h:57: parse error before '*' token
/usr/include/asm/pgalloc.h: In function `get_pgd_slow':
/usr/include/asm/pgalloc.h:59: `pgd_t' undeclared (first use in this
function)
/usr/include/asm/pgalloc.h:59: (Each undeclared identifier is reported =
only
once
/usr/include/asm/pgalloc.h:59: for each function it appears in.)
/usr/include/asm/pgalloc.h:59: `pgd' undeclared (first use in this =
function)
/usr/include/asm/pgalloc.h:59: parse error before ')' token
/usr/include/asm/pgalloc.h:62: `USER_PTRS_PER_PGD' undeclared (first use =
in
this function)
/usr/include/asm/pgalloc.h:63: `swapper_pg_dir' undeclared (first use in
this function)
/usr/include/asm/pgalloc.h:63: `PTRS_PER_PGD' undeclared (first use in =
this
function)
/usr/include/asm/pgalloc.h: At top level:
/usr/include/asm/pgalloc.h:70: parse error before '*' token
/usr/include/asm/pgalloc.h: In function `get_pgd_fast':
/usr/include/asm/pgalloc.h:80: `pgd_t' undeclared (first use in this
function)
/usr/include/asm/pgalloc.h:80: parse error before ')' token
/usr/include/asm/pgalloc.h: At top level:
/usr/include/asm/pgalloc.h:83: parse error before '*' token
/usr/include/asm/pgalloc.h: In function `free_pgd_fast':
/usr/include/asm/pgalloc.h:85: `pgd' undeclared (first use in this =
function)
/usr/include/asm/pgalloc.h: At top level:
/usr/include/asm/pgalloc.h:90: parse error before '*' token
/usr/include/asm/pgalloc.h: In function `free_pgd_slow':
/usr/include/asm/pgalloc.h:99: `pgd' undeclared (first use in this =
function)
/usr/include/asm/pgalloc.h: At top level:
/usr/include/asm/pgalloc.h:103: parse error before '*' token
/usr/include/asm/pgalloc.h: In function `pte_alloc_one':
/usr/include/asm/pgalloc.h:105: `pte_t' undeclared (first use in this
function)
/usr/include/asm/pgalloc.h:105: `pte' undeclared (first use in this
function)
/usr/include/asm/pgalloc.h:109: parse error before ')' token
/usr/include/asm/pgalloc.h: At top level:
/usr/include/asm/pgalloc.h:118: parse error before '*' token
/usr/include/asm/pgalloc.h: In function `pte_alloc_one_fast':
/usr/include/asm/pgalloc.h:127: `pte_t' undeclared (first use in this
function)
/usr/include/asm/pgalloc.h:127: parse error before ')' token
/usr/include/asm/pgalloc.h: At top level:
/usr/include/asm/pgalloc.h:130: parse error before '*' token
/usr/include/asm/pgalloc.h: In function `pte_free_fast':
/usr/include/asm/pgalloc.h:132: `pte' undeclared (first use in this
function)
/usr/include/asm/pgalloc.h: At top level:
/usr/include/asm/pgalloc.h:137: parse error before '*' token
/usr/include/asm/pgalloc.h: In function `pte_free_slow':
/usr/include/asm/pgalloc.h:139: `pte' undeclared (first use in this
function)
/usr/include/asm/pgalloc.h: In function `flush_tlb_mm':
/usr/include/asm/pgalloc.h:183: `current' undeclared (first use in this
function)
/usr/include/asm/pgalloc.h: In function `flush_tlb_page':
/usr/include/asm/pgalloc.h:190: dereferencing pointer to incomplete type
/usr/include/asm/pgalloc.h:190: `current' undeclared (first use in this
function)
/usr/include/asm/pgalloc.h: In function `flush_tlb_range':
/usr/include/asm/pgalloc.h:197: `current' undeclared (first use in this
function)
In file included from main.c:18:
/usr/include/linux/skbuff.h: At top level:
/usr/include/linux/skbuff.h:100: parse error before "spinlock_t"
/usr/include/linux/skbuff.h:120: parse error before "atomic_t"
/usr/include/linux/skbuff.h:124: parse error before '}' token
/usr/include/linux/skbuff.h:183: parse error before "atomic_t"
/usr/include/linux/skbuff.h:215: parse error before '}' token
In file included from /usr/include/linux/netfilter_ipv4/ip_tables.h:18,
                 from main.c:21:
/usr/include/linux/netfilter_ipv4.h:53: `INT_MIN' undeclared here (not =
in a
function)
/usr/include/linux/netfilter_ipv4.h:53: enumerator value for
`NF_IP_PRI_FIRST' not integer constant
/usr/include/linux/netfilter_ipv4.h:59: `INT_MAX' undeclared here (not =
in a
function)
/usr/include/linux/netfilter_ipv4.h:59: enumerator value for
`NF_IP_PRI_LAST' not integer constant
In file included from main.c:21:
/usr/include/linux/netfilter_ipv4/ip_tables.h:26: field `src' has =
incomplete
type
/usr/include/linux/netfilter_ipv4/ip_tables.h:26: field `dst' has =
incomplete
type
/usr/include/linux/netfilter_ipv4/ip_tables.h:28: field `smsk' has
incomplete type
/usr/include/linux/netfilter_ipv4/ip_tables.h:28: field `dmsk' has
incomplete type
/usr/include/linux/netfilter_ipv4/ip_tables.h:29: `IFNAMSIZ' undeclared =
here
(not in a function)
/usr/include/linux/netfilter_ipv4/ip_tables.h:29: `IFNAMSIZ' undeclared =
here
(not in a function)
/usr/include/linux/netfilter_ipv4/ip_tables.h:30: `IFNAMSIZ' undeclared =
here
(not in a function)
/usr/include/linux/netfilter_ipv4/ip_tables.h:30: `IFNAMSIZ' undeclared =
here
(not in a function)
main.c: In function `match':
main.c:96: dereferencing pointer to incomplete type
main.c:108: dereferencing pointer to incomplete type
main.c:108: `IPPROTO_TCP' undeclared (first use in this function)
main.c:111: dereferencing pointer to incomplete type
main.c:111: dereferencing pointer to incomplete type
main.c: At top level:
main.c:132: variable `p2p_match' has initializer but incomplete type
main.c:133: unknown field `name' specified in initializer
main.c:133: warning: excess elements in struct initializer
main.c:133: warning: (near initialization for `p2p_match')
main.c:134: unknown field `match' specified in initializer
main.c:134: warning: excess elements in struct initializer
main.c:134: warning: (near initialization for `p2p_match')
main.c:135: unknown field `checkentry' specified in initializer
main.c:135: warning: excess elements in struct initializer
main.c:135: warning: (near initialization for `p2p_match')
main.c:136: unknown field `me' specified in initializer
main.c:136: warning: excess elements in struct initializer
main.c:136: warning: (near initialization for `p2p_match')
main.c:139: parse error before "init"
main.c: In function `init':
main.c:141: `KERN_INFO' undeclared (first use in this function)
main.c:141: parse error before string constant
main.c: At top level:
main.c:145: parse error before "fini"
main.c: In function `fini':
main.c:148: `KERN_INFO' undeclared (first use in this function)
main.c:148: parse error before string constant
main.c: At top level:
main.c:151: warning: parameter names (without types) in function =
declaration
main.c:151: warning: data definition has no type or storage class
main.c:152: warning: parameter names (without types) in function =
declaration
main.c:152: warning: data definition has no type or storage class
main.c:132: storage size of `p2p_match' isn't known
make[1]: ** [main.o] Erro 1
make[1]: Saindo do diret=C3=B3rio `/root/iptables-p2p-0.3.0a/kernel'
make: ** [linux-2.4] Erro 2
[root@firewall ~/iptables-p2p-0.3.0a]#

------=_NextPart_000_01B8_01C4730F.84DE2070
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I'm trying to compile Iptables-P2P on =
my Red Hat 9=20
and the error messages on compiling are:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>There is a RPM package for this =
app?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>=3D=3D=3D COMPILING IPTABLES-P2P=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<=
/FONT></DIV>
<DIV>[root@firewall ~/iptables-p2p-0.3.0a]# make<BR>make -C =
iptables<BR>make[1]:=20
Entrando no diret=C3=B3rio =
`/root/iptables-p2p-0.3.0a/iptables'<BR>make[1]: Nada a=20
ser feito para `all'.<BR>make[1]: Saindo do diret=C3=B3rio=20
`/root/iptables-p2p-0.3.0a/iptables'<BR>make -C kernel =
linux-2.4<BR>make[1]:=20
Entrando no diret=C3=B3rio `/root/iptables-p2p-0.3.0a/kernel'<BR>gcc -O3 =

-D__KERNEL__ -DMODULE -I/root/iptables-p2p-0.3.0a/kernel/../common=20
-<BR>I/lib/modules/2.4.20-8/build/include=20
-I/lib/modules/2.4.20-8/build/include/a<BR>sm/mach-default&nbsp; -c -o =
main.o=20
main.c<BR>In file included from=20
/usr/include/linux/fs.h:23,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from=20
/usr/include/linux/capability.h:17,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from=20
/usr/include/linux/binfmts.h:5,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from=20
/usr/include/linux/sched.h:9,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from=20
/usr/include/linux/skbuff.h:19,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from main.c:18:<BR>/usr/include/linux/string.h:8:2: warning: #warning =
Using=20
kernel header in<BR>userland!<BR>In file included from=20
/usr/include/linux/sched.h:14,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from=20
/usr/include/linux/skbuff.h:19,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from main.c:18:<BR>/usr/include/linux/timex.h:173: field `time' has =
incomplete=20
type<BR>In file included from=20
/usr/include/linux/bitops.h:69,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from=20
/usr/include/asm/system.h:7,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from=20
/usr/include/linux/sched.h:16,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from=20
/usr/include/linux/skbuff.h:19,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from main.c:18:<BR>/usr/include/asm/bitops.h:327:2: warning: #warning =
This=20
includefile is not<BR>available on all=20
architectures.<BR>/usr/include/asm/bitops.h:328:2: warning: #warning =
Using=20
kernel headers in<BR>userspace: atomicity not guaranteed<BR>In file =
included=20
from=20
/usr/include/linux/signal.h:4,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from=20
/usr/include/linux/sched.h:25,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from=20
/usr/include/linux/skbuff.h:19,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from main.c:18:<BR>/usr/include/asm/signal.h:107: parse error before=20
"sigset_t"<BR>/usr/include/asm/signal.h:110: parse error before '}' =
token<BR>In=20
file included from=20
/usr/include/linux/sched.h:81,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from=20
/usr/include/linux/skbuff.h:19,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from main.c:18:<BR>/usr/include/linux/timer.h:45: parse error before=20
"spinlock_t"<BR>/usr/include/linux/timer.h:53: parse error before '}'=20
token<BR>/usr/include/linux/timer.h:67: parse error before=20
"tvec_base_t"<BR>/usr/include/linux/timer.h:101: parse error before=20
"tvec_bases"<BR>/usr/include/linux/timer.h: In function=20
`init_timer':<BR>/usr/include/linux/timer.h:105: dereferencing pointer =
to=20
incomplete type<BR>/usr/include/linux/timer.h:105: dereferencing pointer =
to=20
incomplete type<BR>/usr/include/linux/timer.h:106: dereferencing pointer =
to=20
incomplete type<BR>/usr/include/linux/timer.h: In function=20
`timer_pending':<BR>/usr/include/linux/timer.h:121: dereferencing =
pointer to=20
incomplete type<BR>In file included from=20
/usr/include/linux/highmem.h:5,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from=20
/usr/include/linux/skbuff.h:26,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from main.c:18:<BR>/usr/include/asm/pgalloc.h:6:24: asm/fixmap.h: =
Arquivo ou=20
diret=C3=B3rio n=C3=A3o<BR>encontrado<BR>In file included from=20
/usr/include/linux/highmem.h:5,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from=20
/usr/include/linux/skbuff.h:26,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
from main.c:18:<BR>/usr/include/asm/pgalloc.h: At top=20
level:<BR>/usr/include/asm/pgalloc.h:57: parse error before '*'=20
token<BR>/usr/include/asm/pgalloc.h: In function=20
`get_pgd_slow':<BR>/usr/include/asm/pgalloc.h:59: `pgd_t' undeclared =
(first use=20
in this<BR>function)<BR>/usr/include/asm/pgalloc.h:59: (Each undeclared=20
identifier is reported only<BR>once<BR>/usr/include/asm/pgalloc.h:59: =
for each=20
function it appears in.)<BR>/usr/include/asm/pgalloc.h:59: `pgd' =
undeclared=20
(first use in this function)<BR>/usr/include/asm/pgalloc.h:59: parse =
error=20
before ')' token<BR>/usr/include/asm/pgalloc.h:62: `USER_PTRS_PER_PGD'=20
undeclared (first use in<BR>this =
function)<BR>/usr/include/asm/pgalloc.h:63:=20
`swapper_pg_dir' undeclared (first use in<BR>this=20
function)<BR>/usr/include/asm/pgalloc.h:63: `PTRS_PER_PGD' undeclared =
(first use=20
in this<BR>function)<BR>/usr/include/asm/pgalloc.h: At top=20
level:<BR>/usr/include/asm/pgalloc.h:70: parse error before '*'=20
token<BR>/usr/include/asm/pgalloc.h: In function=20
`get_pgd_fast':<BR>/usr/include/asm/pgalloc.h:80: `pgd_t' undeclared =
(first use=20
in this<BR>function)<BR>/usr/include/asm/pgalloc.h:80: parse error =
before ')'=20
token<BR>/usr/include/asm/pgalloc.h: At top=20
level:<BR>/usr/include/asm/pgalloc.h:83: parse error before '*'=20
token<BR>/usr/include/asm/pgalloc.h: In function=20
`free_pgd_fast':<BR>/usr/include/asm/pgalloc.h:85: `pgd' undeclared =
(first use=20
in this function)<BR>/usr/include/asm/pgalloc.h: At top=20
level:<BR>/usr/include/asm/pgalloc.h:90: parse error before '*'=20
token<BR>/usr/include/asm/pgalloc.h: In function=20
`free_pgd_slow':<BR>/usr/include/asm/pgalloc.h:99: `pgd' undeclared =
(first use=20
in this function)<BR>/usr/include/asm/pgalloc.h: At top=20
level:<BR>/usr/include/asm/pgalloc.h:103: parse error before '*'=20
token<BR>/usr/include/asm/pgalloc.h: In function=20
`pte_alloc_one':<BR>/usr/include/asm/pgalloc.h:105: `pte_t' undeclared =
(first=20
use in this<BR>function)<BR>/usr/include/asm/pgalloc.h:105: `pte' =
undeclared=20
(first use in this<BR>function)<BR>/usr/include/asm/pgalloc.h:109: parse =
error=20
before ')' token<BR>/usr/include/asm/pgalloc.h: At top=20
level:<BR>/usr/include/asm/pgalloc.h:118: parse error before '*'=20
token<BR>/usr/include/asm/pgalloc.h: In function=20
`pte_alloc_one_fast':<BR>/usr/include/asm/pgalloc.h:127: `pte_t' =
undeclared=20
(first use in this<BR>function)<BR>/usr/include/asm/pgalloc.h:127: parse =
error=20
before ')' token<BR>/usr/include/asm/pgalloc.h: At top=20
level:<BR>/usr/include/asm/pgalloc.h:130: parse error before '*'=20
token<BR>/usr/include/asm/pgalloc.h: In function=20
`pte_free_fast':<BR>/usr/include/asm/pgalloc.h:132: `pte' undeclared =
(first use=20
in this<BR>function)<BR>/usr/include/asm/pgalloc.h: At top=20
level:<BR>/usr/include/asm/pgalloc.h:137: parse error before '*'=20
token<BR>/usr/include/asm/pgalloc.h: In function=20
`pte_free_slow':<BR>/usr/include/asm/pgalloc.h:139: `pte' undeclared =
(first use=20
in this<BR>function)<BR>/usr/include/asm/pgalloc.h: In function=20
`flush_tlb_mm':<BR>/usr/include/asm/pgalloc.h:183: `current' undeclared =
(first=20
use in this<BR>function)<BR>/usr/include/asm/pgalloc.h: In function=20
`flush_tlb_page':<BR>/usr/include/asm/pgalloc.h:190: dereferencing =
pointer to=20
incomplete type<BR>/usr/include/asm/pgalloc.h:190: `current' undeclared =
(first=20
use in this<BR>function)<BR>/usr/include/asm/pgalloc.h: In function=20
`flush_tlb_range':<BR>/usr/include/asm/pgalloc.h:197: `current' =
undeclared=20
(first use in this<BR>function)<BR>In file included from=20
main.c:18:<BR>/usr/include/linux/skbuff.h: At top=20
level:<BR>/usr/include/linux/skbuff.h:100: parse error before=20
"spinlock_t"<BR>/usr/include/linux/skbuff.h:120: parse error before=20
"atomic_t"<BR>/usr/include/linux/skbuff.h:124: parse error before '}'=20
token<BR>/usr/include/linux/skbuff.h:183: parse error before=20
"atomic_t"<BR>/usr/include/linux/skbuff.h:215: parse error before '}'=20
token<BR>In file included from=20
/usr/include/linux/netfilter_ipv4/ip_tables.h:18,<BR>&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;=20
from main.c:21:<BR>/usr/include/linux/netfilter_ipv4.h:53: `INT_MIN' =
undeclared=20
here (not in a<BR>function)<BR>/usr/include/linux/netfilter_ipv4.h:53:=20
enumerator value for<BR>`NF_IP_PRI_FIRST' not integer=20
constant<BR>/usr/include/linux/netfilter_ipv4.h:59: `INT_MAX' undeclared =
here=20
(not in a<BR>function)<BR>/usr/include/linux/netfilter_ipv4.h:59: =
enumerator=20
value for<BR>`NF_IP_PRI_LAST' not integer constant<BR>In file included =
from=20
main.c:21:<BR>/usr/include/linux/netfilter_ipv4/ip_tables.h:26: field =
`src' has=20
incomplete<BR>type<BR>/usr/include/linux/netfilter_ipv4/ip_tables.h:26: =
field=20
`dst' has=20
incomplete<BR>type<BR>/usr/include/linux/netfilter_ipv4/ip_tables.h:28: =
field=20
`smsk' has<BR>incomplete=20
type<BR>/usr/include/linux/netfilter_ipv4/ip_tables.h:28: field `dmsk'=20
has<BR>incomplete =
type<BR>/usr/include/linux/netfilter_ipv4/ip_tables.h:29:=20
`IFNAMSIZ' undeclared here<BR>(not in a=20
function)<BR>/usr/include/linux/netfilter_ipv4/ip_tables.h:29: =
`IFNAMSIZ'=20
undeclared here<BR>(not in a=20
function)<BR>/usr/include/linux/netfilter_ipv4/ip_tables.h:30: =
`IFNAMSIZ'=20
undeclared here<BR>(not in a=20
function)<BR>/usr/include/linux/netfilter_ipv4/ip_tables.h:30: =
`IFNAMSIZ'=20
undeclared here<BR>(not in a function)<BR>main.c: In function=20
`match':<BR>main.c:96: dereferencing pointer to incomplete =
type<BR>main.c:108:=20
dereferencing pointer to incomplete type<BR>main.c:108: `IPPROTO_TCP' =
undeclared=20
(first use in this function)<BR>main.c:111: dereferencing pointer to =
incomplete=20
type<BR>main.c:111: dereferencing pointer to incomplete type<BR>main.c: =
At top=20
level:<BR>main.c:132: variable `p2p_match' has initializer but =
incomplete=20
type<BR>main.c:133: unknown field `name' specified in =
initializer<BR>main.c:133:=20
warning: excess elements in struct initializer<BR>main.c:133: warning: =
(near=20
initialization for `p2p_match')<BR>main.c:134: unknown field `match' =
specified=20
in initializer<BR>main.c:134: warning: excess elements in struct=20
initializer<BR>main.c:134: warning: (near initialization for=20
`p2p_match')<BR>main.c:135: unknown field `checkentry' specified in=20
initializer<BR>main.c:135: warning: excess elements in struct=20
initializer<BR>main.c:135: warning: (near initialization for=20
`p2p_match')<BR>main.c:136: unknown field `me' specified in=20
initializer<BR>main.c:136: warning: excess elements in struct=20
initializer<BR>main.c:136: warning: (near initialization for=20
`p2p_match')<BR>main.c:139: parse error before "init"<BR>main.c: In =
function=20
`init':<BR>main.c:141: `KERN_INFO' undeclared (first use in this=20
function)<BR>main.c:141: parse error before string constant<BR>main.c: =
At top=20
level:<BR>main.c:145: parse error before "fini"<BR>main.c: In function=20
`fini':<BR>main.c:148: `KERN_INFO' undeclared (first use in this=20
function)<BR>main.c:148: parse error before string constant<BR>main.c: =
At top=20
level:<BR>main.c:151: warning: parameter names (without types) in =
function=20
declaration<BR>main.c:151: warning: data definition has no type or =
storage=20
class<BR>main.c:152: warning: parameter names (without types) in =
function=20
declaration<BR>main.c:152: warning: data definition has no type or =
storage=20
class<BR>main.c:132: storage size of `p2p_match' isn't known<BR>make[1]: =
**=20
[main.o] Erro 1<BR>make[1]: Saindo do diret=C3=B3rio=20
`/root/iptables-p2p-0.3.0a/kernel'<BR>make: ** [linux-2.4] Erro=20
2<BR>[root@firewall ~/iptables-p2p-0.3.0a]#<BR></DIV></BODY></HTML>

------=_NextPart_000_01B8_01C4730F.84DE2070--



