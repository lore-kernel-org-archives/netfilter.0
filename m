From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: condition patch with kernel 2.6.16
Date: Mon, 24 Apr 2006 11:40:48 -0400
Message-ID: <iurp42dko5m7g69adrioode1kptovoqlps@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Errors-To: netfilter-bounces-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org

I've been successfully using the condition patch with 2.6-series kernels, up
through kernel 2.6.15.  It was simple to make it work:  I just removed the
line 'Requires: linux < 2.6.0' from the condition/info file, and then the
patch applied and worked just fine.

Now I'm trying to do the same with kernel 2.6.16, and the patch fails:

# ./runme --kernel-path=/usr/src/linux
--iptables-path=/usr/src/netfilter/iptables-1.3.1 --batch condition

<snip>

unable to find ladd slot in src /tmp/pom-6145/net/ipv6/netfilter/Makefile
(./patchlets/condition/linux/./net/ipv6/netfilter/Makefile.ladd)

Obviously something has changed, but I don't know what.  Can someone suggest
a fix?

The condition patch seems like a very important and useful one, and simple
in principle.  2.6 kernels have been in production use for well over a year.
Is "condition" ever going to be definitively ported to 2.6?

Thanks,
Andrew.


