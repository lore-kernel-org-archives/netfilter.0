From: Marek Figielski <raptorek@2600.pl>
Subject: Segfault on ip6tables 1.3.1 + p-o-m owner
Date: Wed, 22 Jun 2005 01:08:21 +0200
Message-ID: <42B89DE5.1090700@2600.pl>
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

[netfilter] Segfault on ip6tables 1.3.1 + p-o-m owner

1. Intro
I'm running Slackware-current with 2.4.31 kernel, grsecurity 2.1.6 
(200506141150) patch and patch-o-matic-ng 20050617. I patched kernel 
source (grsec first, then patchomaic using ./runme --batch pending, and 
then I added `owner' test from extras). Kernel compiled without any 
problems. The problem is that something is wrong with p-o-m...


2. Problem
Ok... so here we go..

# ip6tables
ip6tables v1.3.1: no command specified
Try `ip6tables -h' or 'ip6tables --help' for more information.

We are cool about that but....

# ip6tables -m owner
Segmentation fault (core dumped)

And that's my problem. Even biger because nothing is in logs but:

Jun 21 23:21:52 vanilla kernel: grsec: From 192.168.1.3: exec of 
/usr/local/sbin/ip6tables (ip6tables -m owner ) by /bin/bash[bash:5479] 
uid/euid:0/0 gid/egid:0/0, parent /bin/bash[bash:5215] uid/euid:0/0 
gid/egid:0/0

Ok, so I'm going to try strace on that... # strace ip6tables ends with 
no errors. But...

# strace ip6tables -m owner
execve("/usr/local/sbin/ip6tables", ["ip6tables", "-m", "owner"], [/* 28 
vars */]) = 0
brk(0) = 0x8053a3c
access("/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=25337, ...}) = 0
old_mmap(NULL, 25337, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40017000
close(3) = 0
open("/lib/libdl.so.2", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300\v\0"..., 
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=13120, ...}) = 0
old_mmap(NULL, 12392, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 
0) = 0x4001e000
old_mmap(0x40020000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0x40020000
close(3) = 0
open("/lib/libnsl.so.1", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0 5\0\000"..., 
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=92508, ...}) = 0
old_mmap(NULL, 88064, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 
0) = 0x40022000
old_mmap(0x40034000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11000) = 0x40034000
old_mmap(0x40036000, 6144, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40036000
close(3) = 0
open("/lib/libc.so.6", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0 U\1\000"..., 
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1357414, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 
-1, 0) = 0x40038000
old_mmap(NULL, 1166612, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 
3, 0) = 0x40039000
mprotect(0x4014f000, 27924, PROT_NONE) = 0
old_mmap(0x40150000, 16384, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x116000) = 0x40150000
old_mmap(0x40154000, 7444, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40154000
close(3) = 0
mprotect(0x40150000, 4096, PROT_READ) = 0
munmap(0x40017000, 25337) = 0
brk(0) = 0x8053a3c
brk(0x8074a3c) = 0x8074a3c
brk(0x8075000) = 0x8075000
open("/usr/local/lib/iptables/libip6t_owner.so", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0000\5\0"..., 
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=5960, ...}) = 0
old_mmap(NULL, 7960, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 
0) = 0x40017000
old_mmap(0x40018000, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0x40018000
close(3) = 0
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
+++ killed by SIGSEGV +++

The point is -- I have no idea why is Segfaults.


3. Summary.
Libary (/usr/local/lib/iptables/libip6t_owner.so) seems to be ok, so I 
guess something is wrong with that one part of p-o-m. I've tried built 
it into the kernel and as a module but no effect in both ways.

Have you got any idea what is wrong with that? Any advice how to solve 
this problem? I would be very thankful for any help with that.

Thanks in advance.

Best regards, Mark.
raptorek<at>2600<dot>pl

-- 
+[ Marek Figielski  ::  raptorek<at>2600<dot>pl  ::  RAPI1-6BONE ]+
+[ KeyID: 0x59A7B281 :: http://vanilla.pl/mf.asc :: ICQ#83691948 ]+
+[ " When You follow Your heart,  You leave normal.  You go into ]+
+[ the unknown. And once You do, You can never go back... " R.H. ]+


