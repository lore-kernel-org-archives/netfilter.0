From: Andreas Haumer <andreas@xss.co.at>
Subject: MASQUERADE/SNAT problems for iptables > 1.3.7
Date: Wed, 20 May 2009 13:01:19 +0200
Message-ID: <4A13E2FF.50701@xss.co.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi!

I'm trying to upgrade a iptables installation from version
1.3.7 to something newer but I have problems.

I tried iptables version 1.3.8, 1.4.1.1 and 1.4.2 but for
all those versions I can not add MASQUERADE or SNAT rules
because I get an "invalid argument" error. The same rules
work with iptables 1.3.7

I'll try to execute the following commands:

root@test4:~ {405} $ iptables -v -t nat -A POSTROUTING -j MASQUERADE -o eth1 -s 192.168.162.0/24
MASQUERADE  all opt -- in * out eth1  192.168.162.0/24  -> 0.0.0.0/0
iptables: Invalid argument

or

root@test4:~ {407} $ iptables -v -t nat -A POSTROUTING -j SNAT --to-source PUBADDR -o eth1 -s 192.168.162.0/24
SNAT  all opt -- in * out eth1  192.168.162.0/24  -> 0.0.0.0/0  to:PUBADDR
iptables: Invalid argument

(PUBADDR is my public IP address)

With strace I see the following for iptables-1.3.8 (example):

root@test4:~ {408} $ strace iptables -v -t nat -A POSTROUTING -j SNAT --to-source PUBADDR -o eth1 -s 192.168.162.0/24
execve("/usr/sbin/iptables", ["iptables", "-v", "-t", "nat", "-A", "POSTROUTING", "-j", "SNAT", "--to-source", "PUBADDR", "-o", "eth1", "-s", "192.168.162.0/24"], [/* 33 vars */]) = 0
brk(0)                                  = 0x8053724
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/lib/i686/libdl.so.2", O_RDONLY)  = -1 ENOENT (No such file or directory)
stat64("/lib/i686", 0xbffff248)         = -1 ENOENT (No such file or directory)
open("/lib/libdl.so.2", O_RDONLY)       = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300\v\0"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=14635, ...}) = 0
old_mmap(NULL, 12392, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x40016000
old_mmap(0x40018000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0x40018000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\240T\1"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1333978, ...}) = 0
old_mmap(NULL, 1101108, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x4001a000
old_mmap(0x40121000, 16384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x107000) = 0x40121000
old_mmap(0x40125000, 7476, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40125000
close(3)                                = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40127000
mprotect(0x40121000, 8192, PROT_READ)   = 0
mprotect(0x40018000, 4096, PROT_READ)   = 0
mprotect(0x40014000, 4096, PROT_READ)   = 0
brk(0)                                  = 0x8053724
brk(0x8074724)                          = 0x8074724
brk(0x8075000)                          = 0x8075000
open("/usr/lib/iptables/libipt_SNAT.so", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0 \7\0\000"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=9077, ...}) = 0
old_mmap(NULL, 8804, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x40128000
old_mmap(0x4012a000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0x4012a000
close(3)                                = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, "nat\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [84]) = 0
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, "nat\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [824]) = 0
fstat64(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 0), ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4012b000
write(1, "SNAT  all opt -- in * out eth1  "..., 81SNAT  all opt -- in * out eth1  192.168.162.0/24  -> 0.0.0.0/0  to:PUBADDR
) = 81
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, "nat\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 1044) = -1 EINVAL (Invalid argument)
write(2, "iptables: Invalid argument\n", 27iptables: Invalid argument
) = 27
munmap(0x4012b000, 4096)                = 0
exit_group(1)                           = ?
Process 3128 detached


With iptables-1.3.7 this command works fine:

root@test4:~ {410} $ iptables -v -t nat -A POSTROUTING -j SNAT --to-source PUBADDR -o eth1 -s 192.168.162.0/24
SNAT  all opt -- in * out eth1  192.168.162.0/24  -> 0.0.0.0/0  to:PUBADDR


On this system I'm using linux kernel 2.4.34.5

I checked the release notes but haven't found any obvious
note between version 1.3.7 and 1.3.8 (or newer)

What might be wrong?
Do I miss the obvious?

As a side note: on this system I can't compile any iptables
version >= 1.4.3 because of the following compile error:

[...]
make[2]: Entering directory `/work/iptables-1.4.3/libipq'
if gcc -DHAVE_CONFIG_H -I. -I. -I..    -D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64      -D_REENTRANT -Wall -Waggregate-return -Wmissing-declarations    -Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes    -Winline -pipe  -DXTABLES_LIBDIR=\"/usr/libexec/xtables\" -DXTABLES_INTERNAL -I../include -I../include -g -O2 -MT libipq.o -MD -MP -MF ".deps/libipq.Tpo" -c -o libipq.o libipq.c; \
        then mv -f ".deps/libipq.Tpo" ".deps/libipq.Po"; else rm -f ".deps/libipq.Tpo"; exit 1; fi
In file included from libipq.c:36:
../include/linux/netfilter.h:51: error: parse error before "__be32"
../include/linux/netfilter.h:51: warning: no semicolon at end of struct or union
../include/linux/netfilter.h:52: warning: type defaults to `int' in declaration of `ip6'
../include/linux/netfilter.h:52: warning: data definition has no type or storage class
../include/linux/netfilter.h:55: error: parse error before '}' token
make[2]: *** [libipq.o] Error 1
make[2]: Leaving directory `/work/iptables-1.4.3/libipq'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/work/iptables-1.4.3'
make: *** [all] Error 2

Version 1.4.2 is the last one which compiles fine on this system...

Any idea?

Thanks!

- - andreas

- --
Andreas Haumer                     | mailto:andreas@xss.co.at
*x Software + Systeme              | http://www.xss.co.at/
Karmarschgasse 51/2/20             | Tel: +43-1-6060114-0
A-1100 Vienna, Austria             | Fax: +43-1-6060114-71
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFKE+L8xJmyeGcXPhERAtPyAJ0aHJvf29CQTfmEwhsFr0koPg0vqwCcD1mQ
QptuQ/CpgSB8C5BACgiE+8s=
=G3Vv
-----END PGP SIGNATURE-----
