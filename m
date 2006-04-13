From: Maurice Volaski <mvolaski@aecom.yu.edu>
Subject: Re: iptables is complaining with bogus unknown error
 18446744073709551615
Date: Thu, 13 Apr 2006 19:19:27 -0400
Message-ID: <a06230904c064384b2e58@[129.98.90.227]>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Some more info, the buggy netfilter in 2.6.16.1 is also present in 2.6.17-rc1.

Here's tail end of output from strace on executing

iptables -A INPUT -i bond0 -s 129.98.90.0/24 -p tcp --dport 548 -j ACCEPT

in 2.6.17-rc1

open("/lib64/iptables/libipt_standard.so", O_RDONLY) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 \4\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=3112, ...}) = 0
mmap(NULL, 1050528, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 
3, 0) = 0x2ac9564a1000
mprotect(0x2ac9564a2000, 1044480, PROT_NONE) = 0
mmap(0x2ac9565a1000, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0x2ac9565a1000
close(3)                                = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, 
"filter\0\377\0\0\0\0\0\0\0\0(\235v\361\0\201\377\377\241"..., [84]) 
= 0
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, 
"filter\0\0\200\336(V\311*\0\0M\215@\0\0\0\0\0\1\0\0\0\0"..., [672]) 
= 0
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, 
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 928) = 
-1 ENOENT (No such file or directory)
write(2, "iptables: Unknown error 18446744"..., 45iptables: Unknown 
error 18446744073709551615
) = 45
exit_group(1)                           = ?
-- 

Maurice Volaski, mvolaski@aecom.yu.edu
Computing Support, Rose F. Kennedy Center
Albert Einstein College of Medicine of Yeshiva University

