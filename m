From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: unresolved symbols in ip_conntrack_rpc_udp.o
Date: Fri, 23 Apr 2004 13:54:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40896678.5030106@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I've donwloaded rpc.patch and applied it against Red Hat's 
kernel-source-2.4.20-24.7 package on my development machine.  I've used 
configs/kernel-2.4.20-i386.config as basic configuration file, and added 
RPC match support under Netfilter Configuration.  I've used i386 config 
file, since I wanted to build modules that I could copy to other Linux 
boxes I have, and not to have to worry about exact architecture.

When I copy three RPC modules (ip_conntrack_rpc_tcp.o, 
ip_conntrack_rpc_udp.o and ipt_rpc.o) to 
/lib/modules/kernel-version/kernel/net/ipv4/netfilter, and do depmode -a 
everything is fine.  All works if I copy those files to another test box 
I have which is also i686 (same as devel box).  However if I copy them 
to i586 box, depmode complains about unresolved symbols, and if I try 
modprobe, it says that irq_stat_R9c2e871c can't be resolved.  The only 
difference between two test boxes is that one is i686, and the other is 
i586.  This is kind of strange, why would code built for i386 work on 
i686, and not on i586?

Is there a way to compile those modules so that I can use them on all my 
boxes, regardless of exact architecture?  Additionally, it would be nice 
if there is a way to build them so that I can use them with different 
2.4 revisions without recompiling.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

