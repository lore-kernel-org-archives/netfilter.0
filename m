From: Nived Gopalan <nived.gopalan@gmail.com>
Subject: problems using random patch for 2.6.15.1 kernel
Date: Mon, 23 Jan 2006 14:54:34 +0000
Message-ID: <43D4EE2A.5030105@gmail.com>
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


Hi,

I get the following compilation errors when i build 2.6.15.1 kernel 
with  netfilter - random patch.

  CC [M]  net/ipv6/netfilter/ip6t_random.o
net/ipv6/netfilter/ip6t_random.c:76: warning: initialization makes 
integer from pointer without a cast
net/ipv6/netfilter/ip6t_random.c:76: error: initializer element is not 
computable at load time
net/ipv6/netfilter/ip6t_random.c:76: error: (near initialization for 
`ip6t_rand_reg.revision')
net/ipv6/netfilter/ip6t_random.c:77: warning: initialization from 
incompatible pointer type
net/ipv6/netfilter/ip6t_random.c:79: warning: initialization from 
incompatible pointer type
make[3]: *** [net/ipv6/netfilter/ip6t_random.o] Error 1
make[2]: *** [net/ipv6/netfilter] Error 2
make[1]: *** [net/ipv6] Error 2
make: *** [net] Error 2

-----------------------

Any ideas/ suggestions ?
Thanx.

Regards,
Nived.


