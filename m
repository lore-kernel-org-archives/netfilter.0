From: Brownout <brovvnout@gmail.com>
Subject: --reject-with tcp-reset doesn't work in IPv6
Date: Thu, 16 Aug 2007 15:19:03 +0000 (UTC)
Message-ID: <loom.20070816T165147-228@post.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I'm trying to figure out how to set up a rule to reply properly to a 
connection attempt to a filtered port, with no success.
ip6tables -I INPUT -p tcp --dport 23 -j REJECT --reject-with tcp-reset
sends an icmp6-port-unreachable (default action for REJECT);
removing the rule (i.e.: trying to connect to a closed unfiltered port)
produces the expected RST.

No problems getting other error messages (icmp6-no-route,
icmp6-addr-unreachable, ...).

send_reset() is defined in net/ipv6/netfilter/ip6t_REJECT.c and looks like 
is called properly in reject6_target().

With IPv4 always worked fine. I'm using vanilla kernel 2.6.22.3 and
iptables 1.3.8.


