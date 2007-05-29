From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: condition match: incompatible pointer types
Date: Tue, 29 May 2007 06:18:19 -0400
Message-ID: <53vn53ta7s8173jvsiamu2daldv782pq5l@4ax.com>
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

I'm building kernel 2.6.21 with the condition patch.  The build succeeds,
but there are some suspicious-looking errors:

  CC [M]  net/netfilter/xt_condition.o
net/netfilter/xt_condition.c:259: warning: initialization from incompatible
pointer type
net/netfilter/xt_condition.c:260: warning: initialization from incompatible
pointer type
net/netfilter/xt_condition.c:269: warning: initialization from incompatible
pointer type
net/netfilter/xt_condition.c:270: warning: initialization from incompatible
pointer type

These correspond to the checkentry and destroy fields of condition_match
and condition6_match.

Thanks,
Andrew.


