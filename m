From: Lindsay Haisley <fmouse-netfilter@fmp.com>
Subject: iptables: Unknown error 4294967295
Date: Mon, 25 Sep 2006 19:03:01 -0500
Message-ID: <20060926000301.GC10112@fmp.com>
Reply-To: Lindsay Haisley <fmouse-m14acd@fmp.com>
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

When I execute the following:

iptables -t nat -I PREROUTING -s 10.8.0.1 -i tap0 -j SNAT --to-source 216.110.12.105

... I'm getting the error: 

iptables: Unknown error 4294967295

(4294967295 = an unsigned representation of a signed long int of -1)

Running this under strace shows the following:


mmap2(NULL, 7648, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 
0xb7fbb000
mmap2(0xb7fbc000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0xb7fbc000
close(3)                                = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 3
getsockopt(3, SOL_IP, 0x40 /* IP_??? */, "nat\0\1\0\0\0\335g\21\300\0\0\0\0\224\313F\300\1\0\0\0"..., [84]) = 0
getsockopt(3, SOL_IP, 0x41 /* IP_??? */, "nat\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [656]) = 0
setsockopt(3, SOL_IP, 0x40 /* IP_??? */, "nat\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 876) = -1 EINVAL (Invalid argument)
write(2, "iptables: Unknown error 42949672"..., 35iptables: Unknown error 4294967295
) = 35
exit_group(1)                           = ?
Process 10231 detached

Apprently the error is originating in a malformed socket option call.  What's 
happening here, and how can I fix it?   I'm running kernel 2.6.17-gentoo-r4, 
iptables v1.3.5.

I have about every possible kernel netfilter capability compiled as a module, 
or built into the kernel.

-- 
Lindsay Haisley       | "Fighting against human |     PGP public key
FMP Computer Services |    creativity is like   |      available at
512-259-1190          |    trying to eradicate  | <http://pubkeys.fmp.com>
http://www.fmp.com    |        dandelions"      |
                      |      (Pamela Jones)     |

