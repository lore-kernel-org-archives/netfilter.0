From: Ulrich Weber <uw@imos.net>
Subject: iptables -t nat -A OUTPUT -d 1.2.3.4 -j DNAT --to 127.0.0.1 not working
Date: Wed, 05 Mar 2003 10:13:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E65BFBB.3070008@imos.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello all,

could anyone tell me why this and any other Destination Redirection not 
works?
I'm using iptables v1.2.7a and 2.4.20-ac2 as Kernel.

On any other Installations it works perfekt (maybe i tuned my system to 
much ;)

Here an strace of my notworking system and another working system.

Bye
  Ulrich

---not working---
root@serv1:~/.ssh# strace iptables -t nat -A OUTPUT -d 1.2.3.4 -j DNAT
--to 127.0.0.1
execve("/usr/local/sbin/iptables", ["iptables", "-t", "nat", "-A",
"OUTPUT", "-d", "1.2.3.4", "-j", "DNAT", "--to", "127.0.0.1"], [/* 26
vars */]) = 0
brk(0)                                  = 0x80537a0
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or
directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=32305, ...}) = 0
old_mmap(NULL, 32305, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40015000
close(3)                                = 0
open("/lib/libdl.so.2", O_RDONLY)       = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0P\27\0\000"...,
1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=61247, ...}) = 0
old_mmap(NULL, 10988, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4001d000
mprotect(0x4001f000, 2796, PROT_NONE)   = 0
old_mmap(0x4001f000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0x1000) = 0x4001f000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0h\222\1"...,
1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=5029105, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x40020000
old_mmap(NULL, 1191168, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40021000
mprotect(0x4013a000, 40192, PROT_NONE)  = 0
old_mmap(0x4013a000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0x119000) = 0x4013a000
old_mmap(0x40140000, 15616, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40140000
close(3)                                = 0
munmap(0x40015000, 32305)               = 0
brk(0)                                  = 0x80537a0
brk(0x80537d8)                          = 0x80537d8
brk(0x8054000)                          = 0x8054000
open("/usr/lib/iptables/libipt_DNAT.so", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0`\5\0\000"...,
1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=5433, ...}) = 0
old_mmap(NULL, 7692, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40015000
mprotect(0x40016000, 3596, PROT_NONE)   = 0
old_mmap(0x40016000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0x40016000
close(3)                                = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, [7627118], [84]) = 0
brk(0x8055000)                          = 0x8055000
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, [7627118], [1652]) = 0
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, [7627118], 1872) = -1 EINVAL
(Invalid argument)
write(2, "iptables: Invalid argument\n", 27iptables: Invalid argument
) = 27
_exit(1)                                = ?



---working---
root@serv2:~# strace iptables -t nat -A OUTPUT -d 1.2.3.4 -j DNAT --to
127.0.0.1
execve("/usr/sbin/iptables", ["iptables", "-t", "nat", "-A", "OUTPUT",
"-d", "1.2.3.4", "-j", "DNAT", "--to", "127.0.0.1"], [/* 25 vars */]) = 0
brk(0)                                  = 0x8056a7c
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or
directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=14628, ...}) = 0
old_mmap(NULL, 14628, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40015000
close(3)                                = 0
open("/lib/libdl.so.2", O_RDONLY)       = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0000\31\0"...,
1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=11788, ...}) = 0
old_mmap(NULL, 11476, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40019000
mprotect(0x4001b000, 3284, PROT_NONE)   = 0
old_mmap(0x4001b000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0x1000) = 0x4001b000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0p\\\1\000"...,
1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=1433605, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x4001c000
old_mmap(NULL, 1256740, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4001d000
mprotect(0x40147000, 36132, PROT_NONE)  = 0
old_mmap(0x40147000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0x12a000) = 0x40147000
old_mmap(0x4014c000, 15652, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4014c000
close(3)                                = 0
munmap(0x40015000, 14628)               = 0
brk(0)                                  = 0x8056a7c
brk(0x8057a7c)                          = 0x8057a7c
brk(0x8058000)                          = 0x8058000
open("/usr/lib/iptables/libipt_DNAT.so", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0@\5\0\000"...,
1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=4336, ...}) = 0
old_mmap(NULL, 7628, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40015000
mprotect(0x40016000, 3532, PROT_NONE)   = 0
old_mmap(0x40016000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
3, 0) = 0x40016000
close(3)                                = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, [7627118], [84]) = 0
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, [7627118], [656]) = 0
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, [7627118], 876) = 0
setsockopt(3, SOL_IP, 0x41 /* IP_??? */, [7627118], 116) = 0
_exit(0)                                = ?



