From: leroy christophe <christophe.leroy@c-s.fr>
Subject: Re: issue with nftable - goto : Operation not supported
Date: Wed, 26 Nov 2014 18:15:38 +0100
Message-ID: <54760ABA.4040900@c-s.fr>
References: <5474BC91.6060108@c-s.fr> <20141126130042.GA1533@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20141126130042.GA1533@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org


Le 26/11/2014 14:00, Pablo Neira Ayuso a =E9crit :
> On Tue, Nov 25, 2014 at 06:29:53PM +0100, leroy christophe wrote:
>> Using nft, i'm trying to jump to another table from the end of a
>> table and I get the following error.
>>
>> root@localhost:~# nft add rule filter input  goto accs
>> <cmdline>:1:1-31: Error: Could not process rule: Operation not suppo=
rted
>> add rule filter input goto accs
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> What could be the reason ?
>>
>> I'm using
>> * nftables-20141121
>> * gmp-4.3.2
>> * libmnl-1.0.3
>> * libnfnetlink-1.0.1
>> * libnftnl-20141121
>> * libnetfilter_conntrack-1.0.4
> Kernel version?
3.17.4
>
> Could you run this command with strace:
>
> strace nft add rule ...
See at the end
>
> Could you post the relevant part of your ruleset (table and chain
> configuration)?
root@vgoip:~# nft list table filter
table ip filter {
         chain forward {
                  type filter hook forward priority 0;
                  drop
         }
}

root@vgoip:~# ./mynft.sh start
+ echo Starting NFTABLES test ...
Starting NFTABLES test ...
+ Start
+ nft add chain ip filter rej { type filter hook input priority 20 ; }
+ nft add rule filter rej ip saddr 192.168.2.0/24 reject with icmp type=
=20
host-prohibited
+ nft add rule filter rej drop
+ nft add chain ip filter test { type filter hook input priority 10 ; }
+ nft add rule filter test meta oifname lo accept
+ nft add rule filter test icmp type echo-request ip saddr 192.168.2.1=20
accept
+ nft add rule filter test icmp type {echo-request,timestamp-request}=20
goto rej
<cmdline>:1:1-72: Error: Could not process rule: Operation not supporte=
d
add rule filter test icmp type {echo-request,timestamp-request} goto re=
j
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^
+ nft add rule filter test ct state {established, related} accept
+ nft add rule filter test ct state new tcp dport 22 ip saddr=20
192.168.2.1 accept
+ nft add rule filter test goto rej
<cmdline>:1:1-29: Error: Could not process rule: Operation not supporte=
d
add rule filter test goto rej
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+ return 0
+ Result=3D0
+ echo Done
Done
+ exit 0

root@vgoip:~# nft list table filter
table ip filter {
         chain forward {
                  type filter hook forward priority 0;
                  drop
         }

         chain rej {
                  type filter hook input priority 20;
                  ip saddr 192.168.2.0/24 reject with icmp type 10
                  drop
         }

         chain test {
                  type filter hook input priority 10;
                  oifname "lo" accept
                  unknown unknown 0x8 [invalid type] ip saddr=20
192.168.2.1 accept
                  ct state { 4, 2} accept
                  ct state 8 unknown unknown 0x16 [invalid type] ip=20
saddr 192.168.2.1 accept
         }
}

root@vgoip:~# strace -f nft add rule filter test goto rej
execve("/usr/sbin/nft", ["nft", "add", "rule", "filter", "test", "goto"=
,=20
"rej"], [/* 10 vars */]) =3D 0
brk(0)                                  =3D 0x10069000
access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (No such file or=20
directory)
open("/usr/lib/tls/ppc823/libmnl.so.0", O_RDONLY|O_CLOEXEC) =3D -1 ENOE=
NT=20
(No such file or directory)
stat64("/usr/lib/tls/ppc823", 0x7fecc6b8) =3D -1 ENOENT (No such file o=
r=20
directory)
open("/usr/lib/tls/libmnl.so.0", O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No=20
such file or directory)
stat64("/usr/lib/tls", 0x7fecc6b8)      =3D -1 ENOENT (No such file or=20
directory)
open("/usr/lib/ppc823/libmnl.so.0", O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (=
No=20
such file or directory)
stat64("/usr/lib/ppc823", 0x7fecc6b8)   =3D -1 ENOENT (No such file or=20
directory)
open("/usr/lib/libmnl.so.0", O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such=
=20
file or directory)
stat64("/usr/lib", {st_mode=3DS_IFDIR|0755, st_size=3D912, ...}) =3D 0
open("/lib/tls/ppc823/libmnl.so.0", O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (=
No=20
such file or directory)
stat64("/lib/tls/ppc823", 0x7fecc6b8)   =3D -1 ENOENT (No such file or=20
directory)
open("/lib/tls/libmnl.so.0", O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such=
=20
file or directory)
stat64("/lib/tls", 0x7fecc6b8)          =3D -1 ENOENT (No such file or=20
directory)
open("/lib/ppc823/libmnl.so.0", O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No s=
uch=20
file or directory)
stat64("/lib/ppc823", 0x7fecc6b8)       =3D -1 ENOENT (No such file or=20
directory)
open("/lib/libmnl.so.0", O_RDONLY|O_CLOEXEC) =3D 3
read(3,=20
"\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\0\23\264\0\0\0004".=
=2E.,=20
512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D18666, ...}) =3D 0
mmap(0xffdc000, 78792, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,=20
3, 0) =3D 0xffdc000
mprotect(0xffe0000, 61440, PROT_NONE)   =3D 0
mmap(0xffef000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC,=20
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) =3D 0xffef000
close(3)                                =3D 0
open("/usr/lib/libnftnl.so.0", O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No su=
ch=20
file or directory)
open("/lib/libnftnl.so.0", O_RDONLY|O_CLOEXEC) =3D 3
read(3,=20
"\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\0V\350\0\0\0004"...=
,=20
512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D130461, ...}) =3D 0
mmap(0xffa1000, 174260, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,=
=20
3, 0) =3D 0xffa1000
mprotect(0xffbb000, 61440, PROT_NONE)   =3D 0
mmap(0xffca000, 8192, PROT_READ|PROT_WRITE|PROT_EXEC,=20
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x19000) =3D 0xffca000
close(3)                                =3D 0
open("/usr/lib/libgmp.so.3", O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such=
=20
file or directory)
open("/lib/libgmp.so.3", O_RDONLY|O_CLOEXEC) =3D 3
read(3,=20
"\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\0s\300\0\0\0004"...=
,=20
512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D368473, ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0=
)=20
=3D 0x77ced000
mmap(0xff2b000, 414688, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,=
=20
3, 0) =3D 0xff2b000
mprotect(0xff80000, 61440, PROT_NONE)   =3D 0
mmap(0xff8f000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC,=20
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x54000) =3D 0xff8f000
mmap(0xff90000, 992, PROT_READ|PROT_WRITE|PROT_EXEC,=20
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0xff90000
close(3)                                =3D 0
open("/usr/lib/libncurses.so.5", O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No=20
such file or directory)
open("/lib/libncurses.so.5", O_RDONLY|O_CLOEXEC) =3D 3
read(3,=20
"\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\0\301d\0\0\0004"...=
,=20
512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D284121, ...}) =3D 0
mmap(0xfecc000, 322280, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,=
=20
3, 0) =3D 0xfecc000
mprotect(0xff05000, 65536, PROT_NONE)   =3D 0
mmap(0xff15000, 20480, PROT_READ|PROT_WRITE|PROT_EXEC,=20
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x39000) =3D 0xff15000
mmap(0xff1a000, 2792, PROT_READ|PROT_WRITE|PROT_EXEC,=20
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0xff1a000
close(3)                                =3D 0
open("/usr/lib/libc.so.6", O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such f=
ile=20
or directory)
open("/lib/libc.so.6", O_RDONLY|O_CLOEXEC) =3D 3
read(3,=20
"\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\2\16t\0\0\0004"...,=
=20
512) =3D 512
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D1746172, ...}) =3D 0
mmap(0xfd36000, 1596552, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE=
,=20
3, 0) =3D 0xfd36000
mprotect(0xfea4000, 65536, PROT_NONE)   =3D 0
mmap(0xfeb4000, 24576, PROT_READ|PROT_WRITE|PROT_EXEC,=20
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16e000) =3D 0xfeb4000
mmap(0xfeba000, 7304, PROT_READ|PROT_WRITE|PROT_EXEC,=20
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0xfeba000
close(3)                                =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0=
)=20
=3D 0x77cec000
mprotect(0xfeb4000, 8192, PROT_READ)    =3D 0
mprotect(0x77cee000, 4096, PROT_READ)   =3D 0
brk(0)                                  =3D 0x10069000
brk(0x1008a000)                         =3D 0x1008a000
socket(PF_NETLINK, SOCK_RAW, 12)        =3D 3
fcntl64(3, F_SETFL, O_RDONLY|O_NONBLOCK) =3D 0
open("/etc/xtables/connlabel.conf", O_RDONLY) =3D -1 ENOENT (No such fi=
le=20
or directory)
open("/etc/iproute2/group", O_RDONLY)   =3D -1 ENOENT (No such file or=20
directory)
open("/etc/iproute2/rt_realms", O_RDONLY) =3D -1 ENOENT (No such file o=
r=20
directory)
open("/etc/iproute2/rt_marks", O_RDONLY) =3D -1 ENOENT (No such file or=
=20
directory)
sendto(3,=20
"\0\0\0\24\0\20\0\1\0\0\0\0\0\0\0\0\2\0\0\n\0\0\0\24\n\t\0\5\0\0\0\1"..=
=2E, 60,=20
0, {sa_family=3DAF_NETLINK, pid=3D0, groups=3D00000000}, 12) =3D 60
recvmsg(3, {msg_name(12)=3D{sa_family=3DAF_NETLINK, pid=3D0, groups=3D0=
0000000},=20
msg_iov(1)=3D[{"\0\0\0(\0\2\0\0\0\0\0\1\0\0\1\327\377\377\377\352\0\0\0=
\24\n\t\0\5\0\0\0\1"...,=20
4096}], msg_controllen=3D0, msg_flags=3D0}, 0) =3D 40
sendto(3, "\0\0\0\24\n\20\0\1\0\0\0\3\0\0\0\0\0\0\0\0", 20, 0,=20
{sa_family=3DAF_NETLINK, pid=3D0, groups=3D00000000}, 12) =3D 20
recvmsg(3, {msg_name(12)=3D{sa_family=3DAF_NETLINK, pid=3D0, groups=3D0=
0000000},=20
msg_iov(1)=3D[{"\0\0\0(\0\2\0\0\0\0\0\3\0\0\1\327\377\377\377\352\0\0\0=
\24\n\20\0\1\0\0\0\3"...,=20
69631}], msg_controllen=3D0, msg_flags=3D0}, 0) =3D 40
mmap(NULL, 204800, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,=
=20
0) =3D 0x77c8d000
setsockopt(3, SOL_SOCKET, 0x20 /* SO_??? */, [131072], 4) =3D 0
sendmsg(3, {msg_name(12)=3D{sa_family=3DAF_NETLINK, pid=3D0, groups=3D0=
0000000},=20
msg_iov(1)=3D[{"\0\0\0\24\0\20\0\1\0\0\0\3\0\0\0\0\0\0\0\n\0\0\0h\n\6\1=
6\1\0\0\0\4"...,=20
144}], msg_controllen=3D0, msg_flags=3D0}, 0) =3D 144
select(4, [3], NULL, NULL, {0, 0})      =3D 1 (in [3], left {0, 0})
recvmsg(3, {msg_name(12)=3D{sa_family=3DAF_NETLINK, pid=3D0, groups=3D0=
0000000},=20
msg_iov(1)=3D[{"\0\0\0|\0\2\0\0\0\0\0\4\0\0\1\327\377\377\377\241\0\0\0=
h\n\6\16\1\0\0\0\4"...,=20
4096}], msg_controllen=3D0, msg_flags=3D0}, 0) =3D 124
select(4, [3], NULL, NULL, {0, 0})      =3D 0 (Timeout)
munmap(0x77c8d000, 204800)              =3D 0
fstat64(1, {st_mode=3DS_IFCHR|0600, st_rdev=3Dmakedev(204, 46), ...}) =3D=
 0
ioctl(1, TCGETS, {B115200 opost isig icanon echo ...}) =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0=
)=20
=3D 0x77ceb000
write(1, "<cmdline>:1:1-29: Error: Could n"..., 73<cmdline>:1:1-29:=20
Error: Could not process rule: Operation not supported
) =3D 73
write(1, "add rule filter test goto rej\n", 30add rule filter test goto=
 rej
) =3D 30
write(1, "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", 30^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^
) =3D 30
close(3)                                =3D 0
exit_group(1)                           =3D ?
+++ exited with 1 +++

