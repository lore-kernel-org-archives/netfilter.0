From: Jeremy Guthrie <Jeremy.Guthrie@cdw.com>
Subject: iptables --rename-chain segfaults
Date: Tue, 17 Dec 2013 20:13:15 +0000
Message-ID: <88FFED98AFE8704DA7F1EF36492E56970138585A@EXMBD7VH.corp.cdw.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

We have an issue where 'iptables --rename-chain' appears to segfault
without any indication as to why.  We have a system with a 100+ tunXX
interfaces on it.  We have a FORWARD-tunXX-in iptable for every
interface on the box.  When we first boot the box, the box is able to
create the FORWARD-tunXX-in iptables for tunnels 0-73 and 100-~140. 
However, if you run the script we use to manage ACLs again, it then
creates the missing iptables for tunnels 74-89. Running it again does
not yield any additional iptables.  I found a work around, you manually
create any one of the FORWARD-tun9X-in interfaces, in which case it just
creates the rest of the missing tables like nothing was wrong to begin
with.

The general process my script uses roughly works as follows:
1.  built a temporary table
2.  populate it with what should be the proper config(each interface has
minor customizations)
3.  If the final name does not exist, -rename- the temptable to the
appropriate FORWARD-tunXX-in table name
4.  Insert ACL into forward sending traffic to the new table name

There are a few process exceptions obviously if I am doing an update to
an existing table.  The key part here is that on a fully flushed/blank
IPtables setup or a reboot, we see behavior where only the
--rename-chain function breaks.  None of the other operations break.

OS:  SLES 11 SP3
IPTables Release:  iptables-1.4.6-2.11.4
Kernel:  3.0.82-0.7-default #1 SMP

What changed on our machine(s):
-  We applied a round of patches and went from SP2 to SP3.  Another
system running identical code and software is not exhibiting this
issue.  We have an identical pair of hosts in another geography and they
are running just fine.
-  I tried our old Kernel used prior to the SP2-SP3 update and that did
not fix it
-  I tried iptables 1.4.21 and that too exhibited the same issue where
only the rename-chain broke and only for the tables under the
circumstances below.
-  I put in some delays in my script while the problem is happening so I
could examine it in parallel.  The temptable was not anything special,
in fact, there were a bunch of other tables that were nearly identical
short of the IP addressing in a few cases).
-  I did an strace of it while it was happening and you can see down
below the output.

strace:  /usr/sbin/iptables --rename-chain
temptable_12-16-2013_185321598 FORWARD-tun74-in
----------------
execve("/usr/sbin/iptables", ["/usr/sbin/iptables", "--rename-chain",
"temptable_12-16-2013_185321598", "FORWARD-tun74-in"], [/* 60 vars */]) = 0
brk(0)                                  = 0x674000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x7f39dae3e000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or
directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=61820, ...}) = 0
mmap(NULL, 61820, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f39dae2e000
close(3)                                = 0
open("/usr/lib64/libip4tc.so.0", O_RDONLY) = 3
read(3,
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\300\30\0\0\0\0\0\0"...,
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=26920, ...}) = 0
mmap(NULL, 2121960, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x7f39daa1a000
fadvise64(3, 0, 2121960, POSIX_FADV_WILLNEED) = 0
mprotect(0x7f39daa20000, 2093056, PROT_NONE) = 0
mmap(0x7f39dac1f000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x5000) = 0x7f39dac1f000
close(3)                                = 0
open("/usr/lib64/libxtables.so.4", O_RDONLY) = 3
read(3,
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340(\0\0\0\0\0\0"...,
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=31464, ...}) = 0
mmap(NULL, 2127904, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x7f39da812000
fadvise64(3, 0, 2127904, POSIX_FADV_WILLNEED) = 0
mprotect(0x7f39da819000, 2093056, PROT_NONE) = 0
mmap(0x7f39daa18000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0x7f39daa18000
close(3)                                = 0
open("/lib64/libdl.so.2", O_RDONLY)     = 3
read(3,
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\360\r\0\0\0\0\0\0"...,
832) = 832
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x7f39dae2d000
fstat(3, {st_mode=S_IFREG|0755, st_size=19173, ...}) = 0
mmap(NULL, 2109728, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x7f39da60e000
fadvise64(3, 0, 2109728, POSIX_FADV_WILLNEED) = 0
mprotect(0x7f39da610000, 2097152, PROT_NONE) = 0
mmap(0x7f39da810000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7f39da810000
close(3)                                = 0
open("/lib64/libm.so.6", O_RDONLY)      = 3
read(3,
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\300E\0\0\0\0\0\0"...,
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=541914, ...}) = 0
mmap(NULL, 2592104, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x7f39da395000
fadvise64(3, 0, 2592104, POSIX_FADV_WILLNEED) = 0
mprotect(0x7f39da3f0000, 2093056, PROT_NONE) = 0
mmap(0x7f39da5ef000, 126976, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x5a000) = 0x7f39da5ef000
close(3)                                = 0
open("/lib64/libc.so.6", O_RDONLY)      = 3
read(3,
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0P\355\1\0\0\0\0\0"...,
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=1759139, ...}) = 0
mmap(NULL, 3631320, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x7f39da01e000
fadvise64(3, 0, 3631320, POSIX_FADV_WILLNEED) = 0
mprotect(0x7f39da18c000, 2093056, PROT_NONE) = 0
mmap(0x7f39da38b000, 20480, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16d000) = 0x7f39da38b000
mmap(0x7f39da390000, 18648, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f39da390000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x7f39dae2c000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x7f39dae2b000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0)
= 0x7f39dae2a000
arch_prctl(ARCH_SET_FS, 0x7f39dae2b700) = 0
mprotect(0x7f39da38b000, 16384, PROT_READ) = 0
mprotect(0x7f39da5ef000, 4096, PROT_READ) = 0
mprotect(0x7f39da810000, 4096, PROT_READ) = 0
mprotect(0x7f39daa18000, 4096, PROT_READ) = 0
mprotect(0x7f39dac1f000, 4096, PROT_READ) = 0
mprotect(0x60c000, 4096, PROT_READ)     = 0
mprotect(0x7f39dae3f000, 4096, PROT_READ) = 0
munmap(0x7f39dae2e000, 61820)           = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */,
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [84]) = 0
brk(0)                                  = 0x674000
brk(0x695000)                           = 0x695000
mmap(NULL, 184320, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f39dadfd000
getsockopt(3, SOL_IP, 0x41 /* IP_??? */,
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
[181680]) = 0
brk(0x6b6000)                           = 0x6b6000
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++

Any ideas?
