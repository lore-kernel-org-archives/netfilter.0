From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: iptables 1.3.7 doesn't properly test for condition patch
Date: Mon, 28 May 2007 07:20:57 -0400
Message-ID: <bgel53lion8nqn77p455vughf1071fgple@4ax.com>
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

I have kernel 2.6.21, iptables 1.3.7, and pom-ng 20070527.  I run

./runme --download --batch condition

and the patch applies successfully.  But when I build iptables, the
condition extension isn't included.  This is because
iptables-1.3.7/extensions/.condition-test tests for the existence of

$KERNEL_DIR/include/linux/netfilter_ipv4/ipt_condition.h

But the condition patch doesn't create that file any more; it now creates

$KERNEL_DIR/include/linux/netfilter/xt_condition.h

I guess that .condition-test needs to check for the kernel version that
it's being built against before deciding which header file it wants to look
for.

Thanks,
Andrew.


