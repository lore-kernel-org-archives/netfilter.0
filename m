From: "dravya" <dravya@magma.ca>
Subject: recompile kernel with CONNMARK and NTH TARGETS?
Date: Fri, 20 Aug 2004 15:17:57 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408201917.i7KJHvvT006227@webmail1.magma.ca>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@lists.netfilter.org>



Hi all,

I have been tring now for a while to compile the kernel with the CONNMARK  and NTH
Targets... without any success... I patched the kernel (2.4.20-8) with patch-o-matic
Dec2003 release and i used the following patches with the following commands:

[ ]# ./runme extra/CONNMARK.patch
[ ]# ./runme base/nth.patch

I then enabled the targets in xconfig and compiled the kernel. After running the following
command:
[ ]# sudo /sbin/iptables -t mangle -A PREROUTING -j CONNMARK 
I get:
iptables v1.2.7a: Couldn't load target `CONNMARK':/lib/iptables/libipt_CONNMARK.so: cannot
open shared object file: No such file or directory

I try loading the module manually from
(/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_CONNMARK.o) and it says:
"unresolved symbol ip_conntrack_get_Rf1eafad5" and says something abt it is not licensed
under GPL correctly...

I then recompiled the kernel with the following option OFF:

loadable module support --> Set version information on all module symbols y or n --> n

Now I don't see the ipt_CONNMARK.o module at all in the directory:
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/    Thus can't load it and it doesn't load
automatically.

I am at a complete loss.... :( Can I get some tips.... 
Thank you very much ...

Dravya

I then recompiled the

