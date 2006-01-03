From: Glenn Schmidt <glenns@deakin.edu.au>
Subject: ICMP packets won't go through NAT table
Date: Wed,  4 Jan 2006 02:17:55 +1100
Message-ID: <1136301475.43ba95a30a5fe@mail.deakin.edu.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I am using iptables on my NAT gateway but it refuses to apply NAT to any ICMP
packets. NAT works correctly for other types of packets. The issue seems to be
that ICMP packets don't pass through the 'nat' table at all. They enter and
leave the box, without ever seeing the NAT rules.

To demonstrate the problem, I first flushed all my iptables rules, and made sure
there was no other filtering running on the gateway. Then, I apply one or more
of the following rules:

iptables --table nat --append PREROUTING --protocol icmp --jump LOG --log-prefix
"ICMP packet: "
iptables --table nat --append POSTROUTING --protocol icmp --jump LOG
--log-prefix "ICMP packet: "
iptables --table nat --append OUTPUT --protocol icmp --jump LOG --log-prefix
"ICMP packet: "

I then generate some ICMP packets by pinging or tracerouting either a host
accessed via the gateway, or the gateway itself. The packets get through, but
they are not logged. And there are no other iptables rules active except the
logging ones shown above.

If I apply the same rules to chains in the 'filter' table instead of the 'nat'
table, I get packets logged. So if ICMP packets are passing through the filter
table and not getting dropped, why isn't the nat table seeing any of these
packets?

Again, the problem only seems to occur with ICMP packets, not TCP or UDP.

I am using iptables v1.3.1 on a 2.6.12 kernel.

My apologies if this has been addressed before, I did quite a few different
Google searches and haven't come up with anything. Is there a bug, or any
likely conflict/configuration option that I might be overlooking?

Thanks,
Glenn

