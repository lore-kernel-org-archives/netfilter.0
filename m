From: Duncan Hill <dhill+netfilter@cricalix.net>
Subject: Memory allocation problem on a VPS (iptables)
Date: Sat, 25 Oct 2003 17:37:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310251737.15841.dhill+netfilter@cricalix.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Good day.

My hosting company use the Virtuozzo virtual private server software, and I'm 
having major trouble getting iptables to behave properly (well, to behave at 
all).

rpm -q iptables
iptables-1.2.5-3

strace iptables -A INPUT -d 208.186.168.139/32 -p tcp --dport 8079 -j ACCEPT
execve("/sbin/iptables", ["iptables", "-A", "INPUT", "-d", 
"208.186.168.139/32", "-p", "tcp", "--dport", "8079", "-j", "ACCEPT"], [/* 18 
vars */]) = 0
...
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, [1953261926], [84]) = 0
brk(0x8059000)                          = 0x8059000
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, [1953261926], [848]) = 0
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, [1953261926], 1096) = -1 ENOMEM 
(Cannot allocate memory)
write(2, "iptables: Memory allocation prob"..., 36iptables: Memory allocation 
problem
) = 36
_exit(1)

I can get exactly -one- iptables command to work before the ENOMEM error shows 
up on all subsequent calls.  If I make enough calls (a la shorewall start), 
the entire virtual server just goes away and has to be rebooted by the 
hosting company.

I've searched google several times for this issue, and the only mentions that 
stick out were some posts to the aurora-linux list, but no sign of a 
solution.

I've filed a ticket with my hosting company, but I'm trying to find out what I 
can that may be able to resolve (or help with resolving) the problem.  I 
cannot upgrade the kernel on this system - there is, in fact, no kernel rpm - 
the kernel is provided by the VPS software.  I don't want to revert to 
ipchains if I can help it.

Can anyone provide me with some insight into this issue?  Is it a case of 
'Sorry man, it just isn't going to work'?


