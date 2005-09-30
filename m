From: Stefan.Weigel@mondial.de
Subject: can't initialize iptables table `filter': Bad file descriptor
Date: Fri, 30 Sep 2005 17:00:10 +0200
Message-ID: <OF44D8A4FA.986454A5-ONC125708C.0051084E-C125708C.005269B7@mondial.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
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
To: netfilter@lists.netfilter.org

Hi!
I compiled kernel 2.6.13.2 and iptables 1.3.3 with some extra modules from =

patch-o-matic-ng. Compiling went good.
But when doing a=20

# iptables -L

I get the following error message:

iptables v1.3.3: can't initialize iptables table `filter': Bad file=20
descriptor
Perhaps iptables or your kernel needs to be upgraded.

Here's my module list:

iptable=5Ffilter          7168  0
ip=5Ftables              25856  1 iptable=5Ffilter
edd                    14816  0
ipv6                  278528  21
joydev                 13760  0
sg                     42656  0
st                     44064  0
sr=5Fmod                 21412  0
ide=5Fcd                 45572  0
cdrom                  42912  2 sr=5Fmod,ide=5Fcd
binfmt=5Fmisc            16392  1
ohci=5Fhcd               25988  0
e1000                 113844  0
sworks=5Fagp             13344  0
agpgart                38988  1 sworks=5Fagp
i2c=5Fpiix4              12816  0
i2c=5Fcore               25728  1 i2c=5Fpiix4
evdev                  13312  0
dm=5Fmod                 63388  0
usbcore               125308  2 ohci=5Fhcd
gdth                   86308  3
sd=5Fmod                 23552  3
scsi=5Fmod              141288  5 sg,st,sr=5Fmod,gdth,sd=5Fmod

output from strace:

execve("/usr/sbin/iptables", ["iptables", "-L"], [/* 70 vars */]) =3D 0
uname({sysname=3D"Linux", nodename=3D"srv11", release=3D"2.6.13.2-P3smp",=20
version=3D"#1 SMP Fri Sep 30 13:37:02 CEST 2005", machine=3D"i686"}) =3D 0
brk(0)                                  =3D 0x8054000
access("/etc/ld.so.preload", R=5FOK)      =3D -1 ENOENT (No such file or=20
directory)
open("/etc/ld.so.cache", O=5FRDONLY)      =3D 3
fstat64(3, {st=5Fdev=3Dmakedev(3, 1), st=5Fino=3D708235, st=5Fmode=3DS=5FIF=
REG|0644,=20
st=5Fnlink=3D1, st=5Fuid=3D0, st=5Fgid=3D0, st=5Fblksize=3D4096, st=5Fblock=
s=3D256,=20
st=5Fsize=3D126736, st=5Fatime=3D2005/09/30-16:47:26,=20
st=5Fmtime=3D2005/09/30-16:12:52, st=5Fctime=3D2005/09/30-16:12:52}) =3D 0
old=5Fmmap(NULL, 126736, PROT=5FREAD, MAP=5FPRIVATE, 3, 0) =3D 0x40018000
close(3)                                =3D 0
open("/lib/libdl.so.2", O=5FRDONLY)       =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0@\v\0\000"...,=20
512) =3D 512
fstat64(3, {st=5Fdev=3Dmakedev(3, 1), st=5Fino=3D58002, st=5Fmode=3DS=5FIFR=
EG|0755,=20
st=5Fnlink=3D1, st=5Fuid=3D0, st=5Fgid=3D0, st=5Fblksize=3D4096, st=5Fblock=
s=3D32,=20
st=5Fsize=3D13072, st=5Fatime=3D2005/09/30-16:47:26, st=5Fmtime=3D2004/10/0=
5-14:06:48,=20
st=5Fctime=3D2005/01/28-12:03:16}) =3D 0
old=5Fmmap(NULL, 12388, PROT=5FREAD|PROT=5FEXEC, MAP=5FPRIVATE|MAP=5FDENYWR=
ITE, 3,=20
0) =3D 0x40037000
madvise(0x40037000, 12388, MADV=5FSEQUENTIAL|0x1) =3D 0
old=5Fmmap(0x40039000, 8192, PROT=5FREAD|PROT=5FWRITE,=20
MAP=5FPRIVATE|MAP=5FFIXED|MAP=5FDENYWRITE, 3, 0x1000) =3D 0x40039000
close(3)                                =3D 0
open("/lib/libnsl.so.1", O=5FRDONLY)      =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300:\0"..., 512)=20
=3D 512
fstat64(3, {st=5Fdev=3Dmakedev(3, 1), st=5Fino=3D58005, st=5Fmode=3DS=5FIFR=
EG|0755,=20
st=5Fnlink=3D1, st=5Fuid=3D0, st=5Fgid=3D0, st=5Fblksize=3D4096, st=5Fblock=
s=3D192,=20
st=5Fsize=3D91523, st=5Fatime=3D2005/09/30-16:47:26, st=5Fmtime=3D2004/10/0=
5-14:08:06,=20
st=5Fctime=3D2005/01/28-12:03:17}) =3D 0
old=5Fmmap(NULL, 4096, PROT=5FREAD|PROT=5FWRITE, MAP=5FPRIVATE|MAP=5FANONYM=
OUS, -1,=20
0) =3D 0x4003b000
old=5Fmmap(NULL, 88288, PROT=5FREAD|PROT=5FEXEC, MAP=5FPRIVATE|MAP=5FDENYWR=
ITE, 3,=20
0) =3D 0x4003c000
madvise(0x4003c000, 88288, MADV=5FSEQUENTIAL|0x1) =3D 0
old=5Fmmap(0x4004e000, 8192, PROT=5FREAD|PROT=5FWRITE,=20
MAP=5FPRIVATE|MAP=5FFIXED|MAP=5FDENYWRITE, 3, 0x11000) =3D 0x4004e000
old=5Fmmap(0x40050000, 6368, PROT=5FREAD|PROT=5FWRITE,=20
MAP=5FPRIVATE|MAP=5FFIXED|MAP=5FANONYMOUS, -1, 0) =3D 0x40050000
close(3)                                =3D 0
open("/lib/tls/libc.so.6", O=5FRDONLY)    =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\0L\1\000"...,=20
512) =3D 512
fstat64(3, {st=5Fdev=3Dmakedev(3, 1), st=5Fino=3D58019, st=5Fmode=3DS=5FIFR=
EG|0755,=20
st=5Fnlink=3D1, st=5Fuid=3D0, st=5Fgid=3D0, st=5Fblksize=3D4096, st=5Fblock=
s=3D2664,=20
st=5Fsize=3D1359489, st=5Fatime=3D2005/09/30-16:47:26,=20
st=5Fmtime=3D2004/10/05-14:21:02, st=5Fctime=3D2005/01/28-12:03:17}) =3D 0
old=5Fmmap(NULL, 1137708, PROT=5FREAD|PROT=5FEXEC, MAP=5FPRIVATE|MAP=5FDENY=
WRITE, 3,=20
0) =3D 0x40052000
madvise(0x40052000, 1137708, MADV=5FSEQUENTIAL|0x1) =3D 0
mprotect(0x40161000, 27692, PROT=5FNONE)  =3D 0
old=5Fmmap(0x40162000, 16384, PROT=5FREAD|PROT=5FWRITE,=20
MAP=5FPRIVATE|MAP=5FFIXED|MAP=5FDENYWRITE, 3, 0x10f000) =3D 0x40162000
old=5Fmmap(0x40166000, 7212, PROT=5FREAD|PROT=5FWRITE,=20
MAP=5FPRIVATE|MAP=5FFIXED|MAP=5FANONYMOUS, -1, 0) =3D 0x40166000
close(3)                                =3D 0
old=5Fmmap(NULL, 4096, PROT=5FREAD|PROT=5FWRITE, MAP=5FPRIVATE|MAP=5FANONYM=
OUS, -1,=20
0) =3D 0x40168000
mprotect(0x40162000, 4096, PROT=5FREAD)   =3D 0
set=5Fthread=5Farea({entry=5Fnumber:-1 -> 6, base=5Faddr:0x40168080,=20
limit:1048575, seg=5F32bit:1, contents:0, read=5Fexec=5Fonly:0,=20
limit=5Fin=5Fpages:1, seg=5Fnot=5Fpresent:0, useable:1}) =3D 0
munmap(0x40018000, 126736)              =3D 0
socket(PF=5FINET, SOCK=5FRAW, IPPROTO=5FRAW)  =3D 3
getsockopt(3, SOL=5FIP, 0x40 /* IP=5F??? */, "filter\0@\364?\26@\314=20
\0\0\0045\5\10\344\267\224\277\021"..., [84]) =3D 0
brk(0)                                  =3D 0x8054000
brk(0x8075000)                          =3D 0x8075000
getsockopt(3, SOL=5FIP, 0x41 /* IP=5F??? */, 0x8054078, 0xbf94b798) =3D -1 =

EINVAL (Invalid argument)
close(3)                                =3D 0
open("/proc/sys/kernel/modprobe", O=5FRDONLY) =3D 3
read(3, "/sbin/modprobe\n", 1024)       =3D 15
close(3)                                =3D 0
clone(child=5Fstack=3D0,=20
flags=3DCLONE=5FCHILD=5FCLEARTID|CLONE=5FCHILD=5FSETTID|SIGCHLD,=20
child=5Ftidptr=3D0x401680c8) =3D 11622
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) =3D=3D 0}], 0, NULL) =3D 11622
--- SIGCHLD (Child exited) @ 0 (0) ---
getsockopt(-1, SOL=5FIP, 0x40 /* IP=5F??? */, 0xbf94b7a0, 0xbf94b79c) =3D -=
1=20
EBADF (Bad file descriptor)
write(2, "iptables v1.3.3: ", 17iptables v1.3.3: )       =3D 17
write(2, "can\'t initialize iptables table "..., 61can't initialize=20
iptables table `filter': Bad file descriptor) =3D 61
write(2, "\n", 1
)                       =3D 1
write(2, "Perhaps iptables or your kernel "..., 54Perhaps iptables or your =

kernel needs to be upgraded.
) =3D 54
exit=5Fgroup(3)                           =3D ?


Binaries reside under /usr/sbin, libs under /usr/lib/netfilter.
What am I missing ?


Best regards

Stefan Weigel
IT

Mondial Assistance Deutschland GmbH
Riedenburger Strasse 2
D-81677 M=FCnchen
Telefon +49 (89) 20 80 1 - 1085
Telefax +49 (89) 20 80 1 - 1907
mailto: stefan.weigel@mondial.de
http://www.mondial.de


