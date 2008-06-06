From: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= 
	<scramatte@zensoluciones.com>
Subject: ipp2p segfault with kernel 2.6.24.7
Date: Fri, 06 Jun 2008 23:16:50 +0200
Message-ID: <4849A942.9030204@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello

I've build latest IPP2P with  kernel 2.6.24.7 and iptables 4.0
When I try to use it I have a "segmentation fault" :

#strace iptables -t mangle -A QOS_eth1 -m ipp2p --edk
execve("/usr/local/sbin/iptables", ["iptables", "-t", "mangle", "-A", 
"QOS_eth1", "-m", "ipp2p", "--edk"], [/* 20 vars */]) = 0
brk(0)                                  = 0x8055000
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or 
directory)
mmap2(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x37f70000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or 
directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=9698, ...}) = 0
mmap2(NULL, 9698, PROT_READ, MAP_PRIVATE, 3, 0) = 0x37f6d000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or 
directory)
open("/lib/libdl.so.2", O_RDONLY)       = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0p\n\0\000"..., 
512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=9684, ...}) = 0
mmap2(NULL, 12412, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0x37f69000
mmap2(0x37f6b000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1) = 0x37f6b000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or 
directory)
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\260e\1"..., 
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1257708, ...}) = 0
mmap2(NULL, 1263216, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 
0) = 0x37e34000
mmap2(0x37f63000, 12288, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x12f) = 0x37f63000
mmap2(0x37f66000, 9840, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x37f66000
close(3)                                = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x37e33000
set_thread_area({entry_number:-1 -> 6, base_addr:0x37e33ad0, 
limit:1048575, seg_32bit:1, contents:0, read_exec_only:0, 
limit_in_pages:1, seg_not_present:0, useable:1}) = 0
mprotect(0x37f63000, 4096, PROT_READ)   = 0
munmap(0x37f6d000, 9698)                = 0
brk(0)                                  = 0x8055000
brk(0x8076000)                          = 0x8076000
open("/usr/local/lib/iptables/libxt_ipp2p.so", O_RDONLY) = -1 ENOENT (No 
such file or directory)
open("/usr/local/lib/iptables/libipt_ipp2p.so", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300\4\0"..., 
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=11554, ...}) = 0
mmap2(NULL, 11252, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0x37f6d000
mmap2(0x37f6f000, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1) = 0x37f6f000
close(3)                                = 0
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++


Thank you for your help.


