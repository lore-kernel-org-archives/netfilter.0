From: Alexandros Papadopoulos <apapadop@alumni.carnegiemellon.edu>
Subject: iptables -L crashes with "illegal instruction"
Date: Mon, 18 Oct 2004 21:36:28 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410182136.28520.apapadop@alumni.carnegiemellon.edu>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_s0AdBuXvUxizkeo"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--Boundary-00=_s0AdBuXvUxizkeo
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On one of my Debian Sarge boxes, I just noticed that iptables -L 
seemingly crashes right after beginning to enumerate my rules (which 
are very few, by the way).

This is what I see:
ohm:~# iptables -L
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  localhost            localhost
ACCEPT     all  --  anywhere          anywhere state RELATED,ESTABLISHED
Illegal instruction

...with this happening under the hood:
# strace iptables -L -n 2>ipt_trace.txt (attached)

Anyone got a clue how I should further pursue this?

Cheers

-A

--Boundary-00=_s0AdBuXvUxizkeo
Content-Type: text/plain;
  charset="us-ascii";
  name="ipt_trace.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="ipt_trace.txt"

execve("/sbin/iptables", ["iptables", "-L", "-n"], [/* 14 vars */]) = 0
uname({sys="Linux", node="ohm", ...})   = 0
brk(0)                                  = 0x8053570
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40017000
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=10675, ...}) = 0
old_mmap(NULL, 10675, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40018000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/libdl.so.2", O_RDONLY)       = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0p\34\0\000"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=9872, ...}) = 0
old_mmap(NULL, 8632, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4001b000
old_mmap(0x4001d000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x2000) = 0x4001d000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/libnsl.so.1", O_RDONLY)      = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0000<\0\000"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=73528, ...}) = 0
old_mmap(NULL, 84864, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4001e000
old_mmap(0x40030000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x11000) = 0x40030000
old_mmap(0x40031000, 7040, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40031000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\200^\1"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=1243888, ...}) = 0
old_mmap(NULL, 1254052, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40033000
old_mmap(0x4015b000, 32768, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x127000) = 0x4015b000
old_mmap(0x40163000, 8868, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40163000
close(3)                                = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40166000
munmap(0x40018000, 10675)               = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, "filter\0\0\3\342\21\300\5\0\0\0\0\0\0\0\206\2\0\0\206\2"..., [84]) = 0
brk(0)                                  = 0x8053570
brk(0x8074570)                          = 0x8074570
brk(0)                                  = 0x8074570
brk(0x8075000)                          = 0x8075000
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, "filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [5792]) = 0
fstat64(1, {st_mode=S_IFCHR|0600, st_rdev=makedev(136, 1), ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40018000
write(1, "Chain INPUT (policy DROP)\n", 26) = 26
write(1, "target     prot opt source      "..., 62) = 62
open("/lib/iptables/libipt_standard.so", O_RDONLY) = 4
read(4, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\220\3\0"..., 512) = 512
fstat64(4, {st_mode=S_IFREG|0644, st_size=2132, ...}) = 0
old_mmap(NULL, 5592, PROT_READ|PROT_EXEC, MAP_PRIVATE, 4, 0) = 0x40019000
old_mmap(0x4001a000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4, 0) = 0x4001a000
close(4)                                = 0
write(1, "ACCEPT     all  --  127.0.0.1   "..., 62) = 62
open("/lib/iptables/libipt_state.so", O_RDONLY) = 4
read(4, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0 \5\0\000"..., 512) = 512
fstat64(4, {st_mode=S_IFREG|0644, st_size=3700, ...}) = 0
old_mmap(NULL, 7144, PROT_READ|PROT_EXEC, MAP_PRIVATE, 4, 0) = 0x40167000
old_mmap(0x40168000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4, 0) = 0x40168000
close(4)                                = 0
write(1, "ACCEPT     all  --  0.0.0.0/0   "..., 88) = 88
open("/lib/iptables/libipt_tcp.so", O_RDONLY) = 4
read(4, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\260\6\0"..., 512) = 512
fstat64(4, {st_mode=S_IFREG|0644, st_size=7272, ...}) = 0
old_mmap(NULL, 10716, PROT_READ|PROT_EXEC, MAP_PRIVATE, 4, 0) = 0x40169000
old_mmap(0x4016b000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 4, 0x1000) = 0x4016b000
close(4)                                = 0
--- SIGILL (Illegal instruction) @ 0 (0) ---
+++ killed by SIGILL +++

--Boundary-00=_s0AdBuXvUxizkeo--

