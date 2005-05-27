From: Chris Dodd <cdodd@acm.org>
Subject: NAT and non-connection oriented UDP-based protocols
Date: Fri, 27 May 2005 14:55:01 -0700 (Pacific Daylight Time)
Message-ID: <Pine.WNT.4.43.0505271445140.203-100000@zipper.nvidia.com>
References: <mailman.757.1117228825.6796.netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <mailman.757.1117228825.6796.netfilter@lists.netfilter.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I'm having problems getting various UDP based non-connection-oriented
things running over my linux/iptables based firewall router using NAT.

What happens is this:

The application on my machine (call it A) opnes a UDP port (A) and sends
packets to some remove address (call it X:X).  The firewall (FW) sees
these packets and the SNAT rule rewrites the source address to be FW:A.
So when X gets the packets, they seem to come from FW:A.

Now if X replies directly, sending packets to FW:A from X:X, all is well;
the firewall sees those packets and forwards them to A:A (my machine) and
all is well.

If instead X forwards the packets (or just the source address FW:A) to
another machine Y, and Y sends replies back to FW:A from Y:Y, the firewall
doesn't forward the packets properly to A:A.  Instead it drops the packets
and sends ICMP port unreachable packets back to Y.

Is there a way to configure the firewall/iptables to not do that
and instead forward these packets to A:A?

Chris Dodd
cdodd@acm.org


