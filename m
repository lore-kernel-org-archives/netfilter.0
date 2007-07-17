From: Stanislav Kruchinin <stas@crypt.org.ru>
Subject: problems with connlimit extension
Date: Tue, 17 Jul 2007 21:36:29 +0400
Message-ID: <469CFE1D.6080006@crypt.org.ru>
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

Hello.

I have problems with connlimit module. I've got properly configured, 
patched and compiled kernel 2.6.21.5 and iptables 1.3.8. 
patch-o-matic-ng-20070713 was used.

The module ipt_connlimit is loaded properly, but iptables still can't 
create any rules with it.

# modprobe ipt_connlimit

# lsmod | grep connlimit
ipt_connlimit           4352  0
nf_conntrack           59656  5 
iptable_nat,nf_nat,xt_state,ipt_connlimit,nf_conntrack_ipv4
x_tables               15620  10 
ipt_set,xt_tcpudp,iptable_nat,xt_pkttype,xt_state,xt_multiport,
xt_limit,ipt_REJECT,ipt_connlimit,ip_tables

# iptables -A FORWARD -i eth1 -p tcp --syn \
-m connlimit --connlimit-above 64 -j DROP
iptables: No chain/target/match by that name


Some output from "strace iptables ...":

open("/usr/local/lib/iptables/libipt_connlimit.so", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\260\5\0"..., 
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=7722, ...}) = 0
mmap2(NULL, 7412, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0x40019000
mmap2(0x4001a000, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0x4001a000
close(3)                                = 0
open("/usr/local/lib/iptables/libipt_standard.so", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\240\4\0"..., 
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=6355, ...}) = 0
mmap2(NULL, 6260, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0x4001b000
mmap2(0x4001c000, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0x4001c000
close(3)                                = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, 
"filter\0\300\3\0\0\0\225\r\346\7\n\0\376d\n\0\376\5\0\0"..., [84]) = 0
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, 
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [10480]) = 0
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, 
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 10732) = -1 
ENOENT (No such file or directory)
write(2, "iptables: No chain/target/match "..., 45iptables: No 
chain/target/match by that name
) = 45
exit_group(1)                           = ?
Process 20418 detached

