From: Visham Ramsurrun <vishamr2000@gmail.com>
Subject: Load balancing
Date: Mon, 4 Apr 2005 13:46:20 +0400
Message-ID: <9927912d05040402467fd411c7@mail.gmail.com>
Reply-To: Visham Ramsurrun <vishamr2000@gmail.com>
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

Hi to all,

I have this rule:

iptables -t nat -A PREROUTING -i eth0 -o eth1 -d 192.0.34.72 -j dnat
--to-destination 192.168.1.3-192.168.1.4

It is supposed to be load balancing by taking the traffic from the
host (192.168.1.2)on which this rule is used and balancing between the
PCs with the ip addrs specified by the ip addr range
192.168.1.3-192.168.1.4.

What I would like to know what will happen if I apply this rule on the
PCs doing the load balancing (192.168.1.3-192.168.1.4). The two PCs
are connected back to back with a cross-over cable. The interfaces
used for this connection are both eth1.

                                                                      
 __________
 <MY NET>---->    -------- PC2 (192.168.1.3)------->|                 |
 192.168.1.2/24    |                                            | ROUTER   |
                           -------- PC1 (192.168.1.4)------->|__________|

If I apply the above rule on PC (192.168.1.3 instead of MY NET, will
it still load balance the traffic on the two PCs.

Regards,
Visham

