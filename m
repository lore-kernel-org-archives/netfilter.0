From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: pptp+masq fsckup! PLEASE help...
Date: Mon, 6 Jan 2003 19:26:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301061926.49827.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

hi all

still I can't make it

compiled in the patch at http://roeder.goe.net/~koepi/newnat.html, as Die=
go=20
Sarasua pointed to, but getting the same ole crap as the only time I've e=
ver=20
managed to patch-o-maticize the kernel. As I try to add the following rul=
e, I=20
just get an 'invalid argument' message. The following shows an strace of=20
iptables.

thanks

roy

nyfw:~# strace iptables -t nat -A POSTROUTING -s 192.168.0.0/255.255.0.0 =
-d !=20
192.168.0.0/255.255.0.0 -j MASQUERADE
execve("/sbin/iptables", ["iptables", "-t", "nat", "-A", "POSTROUTING", "=
-s",=20
"192.168.0.0/255.255.0.0", "-d", "!", "192.168.0.0/255.255.0.0", "-j",=20
"MASQUERADE"], [/* 13 vars */]) =3D 0
uname({sys=3D"Linux", node=3D"nyfw", ...})  =3D 0
brk(0)                                  =3D 0x8056a5c
open("/etc/ld.so.preload", O_RDONLY)    =3D -1 ENOENT (No such file or=20
directory)
open("/etc/ld.so.cache", O_RDONLY)      =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D11871, ...}) =3D 0
old_mmap(NULL, 11871, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40014000
close(3)                                =3D 0
open("/lib/libdl.so.2", O_RDONLY)       =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0T\27\0\000"..., 1=
024)=20
=3D 1024
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D8008, ...}) =3D 0
old_mmap(NULL, 11004, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x40017=
000
mprotect(0x40019000, 2812, PROT_NONE)   =3D 0
old_mmap(0x40019000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3=
,=20
0x1000) =3D 0x40019000
close(3)                                =3D 0
open("/lib/libc.so.6", O_RDONLY)        =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\30\222"..., 1024=
) =3D=20
1024
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D1153784, ...}) =3D 0
old_mmap(NULL, 1166560, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x400=
1a000
mprotect(0x4012d000, 40160, PROT_NONE)  =3D 0
old_mmap(0x4012d000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, =
3,=20
0x113000) =3D 0x4012d000
old_mmap(0x40133000, 15584, PROT_READ|PROT_WRITE,=20
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x40133000
close(3)                                =3D 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,=
 0) =3D=20
0x40137000
munmap(0x40014000, 11871)               =3D 0
brk(0)                                  =3D 0x8056a5c
brk(0x8056a94)                          =3D 0x8056a94
brk(0x8057000)                          =3D 0x8057000
open("/lib/iptables/libipt_MASQUERADE.so", O_RDONLY) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\220\4\0"..., 102=
4) =3D=20
1024
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D3276, ...}) =3D 0
old_mmap(NULL, 6720, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x400140=
00
mprotect(0x40015000, 2624, PROT_NONE)   =3D 0
old_mmap(0x40015000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3=
, 0)=20
=3D 0x40015000
close(3)                                =3D 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  =3D 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, [7627118], [84]) =3D 0
brk(0x8058000)                          =3D 0x8058000
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, [7627118], [656]) =3D 0
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, [7627118], 876) =3D -1 EINVAL (I=
nvalid=20
argument)
write(2, "iptables: Invalid argument\n", 27iptables: Invalid argument
) =3D 27
_exit(1)                                =3D ?

--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


