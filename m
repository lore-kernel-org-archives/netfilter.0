From: Jani Averbach <jaa@cc.jyu.fi>
Subject: Re: Using iptables with x86_64 static kernel (module problems)?
Date: Sun, 5 Oct 2003 03:13:33 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031005001333.GA8589@cc.jyu.fi>
References: <20031001161136.GA13226@cc.jyu.fi> <20031003102156.GV5758@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031003102156.GV5758@sunbeam.de.gnumonks.org>
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
Content-Transfer-Encoding: 7bit
To: Harald Welte <laforge@netfilter.org>, netfilter@lists.netfilter.org

On 2003-10-03 12:21+0200, Harald Welte wrote:
> 
> I don't really understand the problem.  'iptables tries to do various
> mudules related task' ?

Ok, perhaps the culprit is not the module related things, but however
iptables won't work with x86_64 kernel. My first idea was that
iptables try to use modprobe etc. to probing if various netfilter
kernel modules are present, and it gets confused when this
module-stuff won't work with x86_64 kernel. 

> yes, please.   I have no idea what you are talking about, sorry.

Here is the transcript of what I have done, I hope it will bring some
light to this issue. If this is not a result of some kind of stupidity
what I have done, and this is real issue, I could test patch etc.

Thank you for your reply.

BR, Jani

#
# Compiling netfilter on i386 host, against x86_64 kernel tree
#
$ uname -a 
Linux HAL9000 2.4.23-pre5 #5 SMP Wed Oct 1 09:21:47 MDT 2003 i686 AMD Opteron(tm) Processor 240 AuthenticAMD GNU/Linux

$ make KERNEL_DIR=/usr/src/kernel/linux-2.4.23-pre5-x86_64-1 PREFIX=/opt/iptables/1.2.8
$ make KERNEL_DIR=/usr/src/kernel/linux-2.4.23-pre5-x86_64-1 PREFIX=/opt/iptables/1.2.8  install

#
# Booting x86_64 kernel
#

$ uname -a 
Linux HAL9000 2.4.23-pre5 #7 SMP Sat Oct 4 17:24:47 MDT 2003 x86_64 AMD Opteron(tm) Processor 240 AuthenticAMD GNU/Linux

#
# Trying to use iptables
#

$ /opt/iptables/1.2.8/sbin/iptables -F -t nat
iptables v1.2.8: can't initialize iptables table `nat': Module is wrong version
Perhaps iptables or your kernel needs to be upgraded.


$ strace /opt/iptables/1.2.8/sbin/iptables -F -t nat

execve("/opt/iptables/1.2.8/sbin/iptables", ["/opt/iptables/1.2.8/sbin/iptables", "-F", "-t", "nat"], [/* 36 vars */]) = 0
uname({sys="Linux", node="HAL9000", ...}) = 0
brk(0)                                  = 0x8053788
open("/etc/ld.so.preload", O_RDONLY)    = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
close(3)                                = 0
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=47201, ...}) = 0
mmap2(NULL, 47201, PROT_READ, MAP_PRIVATE, 3, 0) = 0x55568000
close(3)                                = 0
open("/lib/libdl.so.2", O_RDONLY)       = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0P\30\0\000"..., 1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=11532, ...}) = 0
mmap2(NULL, 11196, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x55574000
mprotect(0x55576000, 3004, PROT_NONE)   = 0
mmap2(0x55576000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x1) = 0x55576000
close(3)                                = 0
open("/lib/libnsl.so.1", O_RDONLY)      = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\360;\0"..., 1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=83181, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x55577000
mmap2(NULL, 76448, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x55578000
mprotect(0x55588000, 10912, PROT_NONE)  = 0
mmap2(0x55588000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x10) = 0x55588000
mmap2(0x55589000, 6816, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x55589000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0 ^\1\000"..., 1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=1386235, ...}) = 0
mmap2(NULL, 1211908, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x5558b000
mprotect(0x556a9000, 40452, PROT_NONE)  = 0
mmap2(0x556a9000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x11d) = 0x556a9000
mmap2(0x556af000, 15876, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x556af000
close(3)                                = 0
munmap(0x55568000, 47201)               = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, [7627118], [84]) = 0
brk(0)                                  = 0x8053788
brk(0x8054788)                          = 0x8054788
brk(0x8055000)                          = 0x8055000
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, 0x8053808, 0xffffd668) = -1 EINVAL (Invalid argument)
open("/proc/sys/kernel/modprobe", O_RDONLY) = -1 ENOENT (No such file or directory)
close(3)                                = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, [7627118], [84]) = 0
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, 0x8053808, 0xffffd668) = -1 EINVAL (Invalid argument)
write(2, "iptables v1.2.8: ", 17iptables v1.2.8: )       = 17
write(2, "can\'t initialize iptables table "..., 62can't initialize iptables table `nat': Module is wrong version) = 62
write(2, "\n", 1
)                       = 1
write(2, "Perhaps iptables or your kernel "..., 54Perhaps iptables or your kernel needs to be upgraded.
) = 54
_exit(3)                                = ?


-- 
Jani Averbach


