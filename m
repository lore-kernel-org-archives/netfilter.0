From: Scott van Looy <scott@ethosuk.org.uk>
Subject: iptables 1.2.7a and kernel 2.4.19
Date: Tue, 17 Sep 2002 14:03:54 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209171400480.3423-100000@fire.ethosuk.org.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I just took a clean 2.4.19 kernel, patched it with patch-o-matic-20020825 
and then built the kernel, rebooted and then tried to install iptables 
1.2.7a

I get 

make
Extensions found: IPv4:ipv4options IPv4:IPV4OPTSSTRIP IPv4:mport 
IPv4:NETMAP IPv
4:nth IPv4:pool IPv4:POOL IPv4:psd IPv4:quota IPv4:random IPv4:realm 
IPv4:recent
 IPv4:ROUTE IPv4:string IPv4:time IPv6:ah IPv6:esp IPv6:frag 
IPv6:ipv6header IPv
6:hbh IPv6:dst IPv6:REJECT IPv6:rt
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ 
-DIPTABLES_VERSION=\"1
.2.7a\"  -fPIC -o extensions/libipt_conntrack_sh.o -c 
extensions/libipt_conntrac
k.c
In file included from 
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h
:64,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:6:2: 
#error Only
 in kernel.
make: *** [extensions/libipt_conntrack_sh.o] Error 1

Yet when I did this this morning on a different machine it worked fine, 
same pom, same kernel, same iptables builds

Any ideas where I could start to look to see what's wrong?

-- 
Scott van Looy - email:me@ethosuk.org.uk | web:www.ethosuk.org.uk
PGP Fingerprint: 7180 5543 C6C4 747B 7E74  802C 7CF9 E526 44D9 D4A7
      -------------------------------------------
      |/// /// /// /// WIDE LOAD /// /// /// ///|
      -------------------------------------------

Welcome to Lake Wobegon, where all the men are strong, the women are pretty,
and the children are above-average.
		-- Garrison Keillor


