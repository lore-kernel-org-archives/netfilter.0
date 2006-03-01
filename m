From: Tommy W <tommy@svearike.sytes.net>
Subject: Problem with CONNMARK
Date: Wed, 1 Mar 2006 03:55:51 +0100
Message-ID: <200603010355.51074.tommy@svearike.sytes.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

# iptables -A PREROUTING -t mangle -i eth4  -j CONNMARK --restore-mark
iptables: No chain/target/match by that name

What's missing ?
I do HAVE the module libipt_CONNMARK.so

which also strace confirms.
The following output makes me think, perhaps I have to activate something in 
the /proc filesystem !?

open("/usr/local/lib/iptables/libipt_CONNMARK.so", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\200\4\0"..., 1024) = 
1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=5016, ...}) = 0
old_mmap(NULL, 7480, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0xb7fe9000
mprotect(0xb7fea000, 3384, PROT_NONE)   = 0
old_mmap(0xb7fea000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0) 
= 0xb7fea000
close(3)                                = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, 
"mangle\0\301\304e9\300\0\0\0\0\0\0\0\0\1\0\0\0004B\23\300"..., [84]) = 0
brk(0)                                  = 0x8055000
brk(0x8056000)                          = 0x8056000
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, 
"mangle\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [2456]) = 0
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, 
"mangle\0\267RK\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2668) = -1 
ENOENT (No such file or directory)
write(2, "iptables: No chain/target/match "..., 45) = 45

