From: henry <info@intellitree.com>
Subject: Can't get ipset to compile - kernel-2.6.10, iptables-1.3.0...
Date: Fri, 14 Jan 2005 21:27:46 -0500
Message-ID: <41E87FA2.9090308@intellitree.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

After the advice I got on using ipset for long lists of networks for ban 
lists, I set out to install it. I followed the instructions on the ipset 
webpage: Downloaded the latest kernel from kernel.org (2.6.10) 
downloaded the latest iptables (1.3.0) and downloaded the 
patch-o-matic-ng from the ipset link (patch-o-matic-ng-20041206.tar.bz2)

I ran ./runme set and it installed the patch just fine. But when I try 
and compile the kernel, this is what is happening:

<...>
   CC [M]  net/ipv4/netfilter/ipt_comment.o
   CC [M]  net/ipv4/netfilter/ip_nat_snmp_basic.o
   CC [M]  net/ipv4/netfilter/ipt_CONNMARK.o
   CC [M]  net/ipv4/netfilter/ipt_NOTRACK.o
   CC [M]  net/ipv4/netfilter/ipt_SET.o
   CC [M]  net/ipv4/netfilter/ip_set.o
net/ipv4/netfilter/ip_set.c: In function `ip_set_find_in_hash':
net/ipv4/netfilter/ip_set.c:86: error: structure has no member named 
`read_locked_map'
net/ipv4/netfilter/ip_set.c:86: error: structure has no member named 
`write_locked_map'
net/ipv4/netfilter/ip_set.c: In function `__set_hash_del':
net/ipv4/netfilter/ip_set.c:102: error: structure has no member named 
`write_locked_map'
net/ipv4/netfilter/ip_set.c: In function `ip_set_unbindip':
net/ipv4/netfilter/ip_set.c:634: error: structure has no member named 
`write_locked_map'
net/ipv4/netfilter/ip_set.c:662: error: structure has no member named 
`write_locked_map'
net/ipv4/netfilter/ip_set.c: In function `ip_set_destroy_set':
net/ipv4/netfilter/ip_set.c:894: error: structure has no member named 
`write_locked_map'
make[3]: *** [net/ipv4/netfilter/ip_set.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2


I have tried compiling the ipset functions both into the kernel and as 
modules. What am I doing wrong?

