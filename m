From: sandra-llistes <sandra-llistes@fib.upc.edu>
Subject: ipp2p problems
Date: Fri, 22 Jun 2007 13:21:14 +0200
Message-ID: <467BB0AA.9090202@fib.upc.edu>
Reply-To: sandra-llistes@fib.upc.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have a SunFire X4100M2 with OpenSUSE 10.2 64 bits installed. Kernel 2.6.18.8 and 
iptables v1.3.6
I've succesfully installed ipp2p thanks to a patch that change this line in Makefile:
-       ld -shared -o libipt_ipp2p.so libipt_ipp2p.o
+       $(CC) -shared -o libipt_ipp2p.so libipt_ipp2p.o

But now, when I try to load one rule, I get the following error:
# iptables -I FORWARD 1 -p tcp -m ipp2p --edk -j LOGDROPG
iptables: Invalid argument

and in messages:
Jun 22 11:58:36 kernel: ip_tables: ipp2p match: invalid size 16 != 8

I try with a strace to get more information:

# strace iptables -I FORWARD 1 -p tcp -m ipp2p --edk -j DROP
execve("/usr/sbin/iptables", ["iptables", "-I", "FORWARD", "1", "-p", "tcp", "-m", 
"ipp2p", "--edk", "-j", "DROP"], [/* 54 vars */]) = 0
brk(0)                                  = 0x60e000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x2adde7885000
uname({sys="Linux", node="elion", ...}) = 0
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=63223, ...}) = 0
mmap(NULL, 63223, PROT_READ, MAP_PRIVATE, 3, 0) = 0x2adde7886000
close(3)                                = 0
open("/lib64/libdl.so.2", O_RDONLY)     = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\220\17\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=19896, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x2adde7896000
mmap(NULL, 2109728, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x2adde7a87000
fadvise64(3, 0, 2109728, POSIX_FADV_WILLNEED) = 0
mprotect(0x2adde7a89000, 2097152, PROT_NONE) = 0
mmap(0x2adde7c89000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 
0x2000) = 0x2adde7c89000
close(3)                                = 0
open("/lib64/libnsl.so.1", O_RDONLY)    = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0A\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=105734, ...}) = 0
mmap(NULL, 2189680, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x2adde7c8b000
fadvise64(3, 0, 2189680, POSIX_FADV_WILLNEED) = 0
mprotect(0x2adde7c9f000, 2093056, PROT_NONE) = 0
mmap(0x2adde7e9e000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 
0x13000) = 0x2adde7e9e000
mmap(0x2adde7ea0000, 6512, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 
0) = 0x2adde7ea0000
close(3)                                = 0
open("/lib64/libc.so.6", O_RDONLY)      = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\333"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=1595305, ...}) = 0
mmap(NULL, 3412216, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x2adde7ea2000
fadvise64(3, 0, 3412216, POSIX_FADV_WILLNEED) = 0
mprotect(0x2adde7fdb000, 2093056, PROT_NONE) = 0
mmap(0x2adde81da000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 
0x138000) = 0x2adde81da000
mmap(0x2adde81df000, 16632, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 
0) = 0x2adde81df000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x2adde81e4000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x2adde81e5000
arch_prctl(ARCH_SET_FS, 0x2adde81e4e30) = 0
mprotect(0x2adde81da000, 12288, PROT_READ) = 0
munmap(0x2adde7886000, 63223)           = 0
brk(0)                                  = 0x60e000
brk(0x62f000)                           = 0x62f000
open("/etc/nsswitch.conf", O_RDONLY)    = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=1192, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x2adde7886000
read(3, "#\n# /etc/nsswitch.conf\n#\n# An ex"..., 4096) = 1192
read(3, "", 4096)                       = 0
close(3)                                = 0
munmap(0x2adde7886000, 4096)            = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=63223, ...}) = 0
mmap(NULL, 63223, PROT_READ, MAP_PRIVATE, 3, 0) = 0x2adde7886000
close(3)                                = 0
open("/lib64/libnss_files.so.2", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\300!\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=53809, ...}) = 0
mmap(NULL, 2139464, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x2adde81e6000
fadvise64(3, 0, 2139464, POSIX_FADV_WILLNEED) = 0
mprotect(0x2adde81f0000, 2093056, PROT_NONE) = 0
mmap(0x2adde83ef000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 
0x9000) = 0x2adde83ef000
close(3)                                = 0
munmap(0x2adde7886000, 63223)           = 0
open("/etc/protocols", O_RDONLY)        = 3
fcntl(3, F_GETFD)                       = 0
fcntl(3, F_SETFD, FD_CLOEXEC)           = 0
fstat(3, {st_mode=S_IFREG|0644, st_size=23232, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x2adde7886000
read(3, "# See also: protocols(5), http:/"..., 4096) = 4096
close(3)                                = 0
munmap(0x2adde7886000, 4096)            = 0
open("/usr/lib64/iptables/libipt_ipp2p.so", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\10\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14743, ...}) = 0
mmap(NULL, 2106088, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x2adde83f1000
fadvise64(3, 0, 2106088, POSIX_FADV_WILLNEED) = 0
mprotect(0x2adde83f3000, 2093056, PROT_NONE) = 0
mmap(0x2adde85f2000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 
0x1000) = 0x2adde85f2000
close(3)                                = 0
mprotect(0x2adde85f2000, 4096, PROT_READ) = 0
open("/usr/lib64/iptables/libipt_standard.so", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\6\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=6488, ...}) = 0
mmap(NULL, 2101536, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x2adde85f4000
fadvise64(3, 0, 2101536, POSIX_FADV_WILLNEED) = 0
mprotect(0x2adde85f5000, 2093056, PROT_NONE) = 0
mmap(0x2adde87f4000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 
0) = 0x2adde87f4000
close(3)                                = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, 
"filter\0\377\210\355\"\200\377\377\377\377@\0\0\0\0\0\0"..., [84]) = 0
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, 
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [15392]) = 0
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, 
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 15640) = -1 EINVAL (Invalid 
argument)
write(2, "iptables: Invalid argument\n", 27iptables: Invalid argument
) = 27
exit_group(1)                           = ?
Process 30291 detached

So, is a problem with setsockopt function but I don't know how to solve this.
Any help?

Thanks,

Sandra

