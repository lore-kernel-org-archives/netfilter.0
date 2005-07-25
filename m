From: Pierre JUHEN <pierre.juhen@wanadoo.fr>
Subject: UDP forwarding trouble
Date: Mon, 25 Jul 2005 21:28:28 +0200
Message-ID: <42E53D5C.2050004@pierre.juhen>
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

I have a problem with iptables.

This is the configuration

+---------+                 +---------+                 +---------+
|         |                 |         |                 |         |
|    A    +-----------------+    B    ++----------------+    C    |
|         |                 |         |                 |         |
+---------+                 +---------+                 +---------+

A sends UDP packets (ports p1, p2, p3) to C through B.

There is a continuous flow of UDP/p1 packets (10 packets/s) whilst
p2 and p3 are more seldom.

When I activate a rule to  redirect all UDP packets from A to B
the rule seems to be applied only to p2 and p3 ports, p1 packets
are still forwarded directly.

Is there a form of caching mechanism that explains the fact that
the packets are treated differently ?

Thanks for your help

Regards,

Pierre JUHEN




