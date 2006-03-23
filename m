From: r93942033@ntu.edu.tw
Subject: Routing for multiple GRE tunnels?
Date: Thu, 23 Mar 2006 11:28:20 +0800
Message-ID: <20060323112820.n4xgy96lw80wok4s@wmail6.cc.ntu.edu.tw>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Dear all:
      I have a network configuration as in the link:

http://homepage.ntu.edu.tw/~r93942033/network.png

and I establish one GRE tunnel on both ADSL and WLAN. For the tunnel on 
ADSL, I use the following commands:
==at Router 1==
ip tunnel add neta mode gre remote 10.0.1.2 local 10.0.1.1 ttl 255
ip link set neta up
ip addr add 192.168.1.3 dev neta
==at Router 2==
ip tunnel add netb mode gre remote 10.0.1.1 local 10.0.1.2 ttl 255
ip link set netb up
ip addr add 192.168.2.3 dev netb

And for the tunnel on WLAN:
==at Router 1==
ip tunnel add neta_wlan mode gre remote 10.0.0.2 local 10.0.0.1 ttl 255
ip link set neta_wlan up
ip addr add 192.168.1.4 dev neta_wlan
==at Router 2==
ip tunnel add netb_wlan mode gre remote 10.0.0.1 local 10.0.0.2 ttl 255
ip link set netb_wlan up
ip addr add 192.168.2.4 dev netb_wlan

Then I set the routing table:
==at Router 1==
ip route add 192.168.2.0/24 dev neta_wlan
==at Router 2==
ip route add 192.168.1.0/24 dev netb_wlan

Using this configuration, the NB 1 and NB 2 can ping each other successfully.

My Problem is:
How can I make some traffic go through ADSL tunnel and others through 
WLAN tunnel?
For example, let TCP traffic to through WLAN tunnel and ICMP go through 
ADSL tunnel?
I have tried the commands:
==at Router 1==
iptables -t mangle -A PREROUTING -p icmp -j ROUTE --oif neta
==at Router 2==
iptables -t mangle -A PREROUTING -p icmp -j ROUTE --oif netb

or ==at Router 1==
iptables -t mangle -A FORWARD -p icmp -j ROUTE --oif neta
==at Router 2==
iptables -t mangle -A FORWARD -p icmp -j ROUTE --oif netb

But it fails, NB1 cannot ping NB2 (request time out).

How can I solve it?
Thanks for your answering!


