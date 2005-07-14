From: Don Porter <porterde@hendrix.edu>
Subject: Delay rejecting packets on OUTPUT chain
Date: Thu, 14 Jul 2005 13:25:31 -0500
Message-ID: <1121365531.3241.13.camel@augustine>
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

I have iptables configured with a policy of DROP on the OUTPUT chain,
followed by various ACCEPT rules, and then I append a REJECT extension
on the chain.

I have a simple test application that tries to open a tcp socket to
another machine.  This application runs in a few tenths of a second when
the OUTPUT chain is configured to ACCEPT, even if the packet is rejected
on the other machine's INPUT chain.  If I DROP and REJECT the traffic on
the output chain, however, it consistently takes about 3 seconds to run
(and, obviously, even longer without the REJECT).

So why is it that it takes so much longer for the test to fail when the
packet is rejected on the box than when it goes across the wire and
back?

Any insights/advice on this would be greatly appreciated.

Don Porter

