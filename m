From: "Paul M. Goorskis" <pmg@rimako.lv>
Subject: DNAT problem
Date: Thu, 10 Jun 2004 14:03:11 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C83FEF.4050502@rimako.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello list!

Problem: forward from branch office address 10.1.12.146 to 192.168.130.15 on internal network
I'm stuck
It's not DNAT'ing...
Main office using 192.168.0.0/16 for internal needs and 10.23.17.0/24 to communicate with branch office
Branch office using 10.0.0.0/8

versions:
iptables v1.2.7a
kernel 2.4.20

                                                +-------------+          +-----------+
                                                |BRANCH VPN   +----------+10.1.12.146|
                                                |10.23.254.249|eth1      +-----------+
                                                +----+--------+
                                                     |eth0
                                      +--------+     |
                                      |Internet+-----+
                                      +--------+
                                          |
                                          |eth0 (213.175.70.195)
+---------------+                  eth2+------+            +------------------+
|192.168.130.15 +----------------------+ROUTER+------------+VPN 213.175.70.198|
+---------------+                      +------+eth1        |    10.23.254.250 |
                                                           |   10.23.17.0/0   |
                                                           +------------------+

BRANCH VPN:
route add -net 10.23.17.0/24 gw 10.23.254.250 dev tunl1

VPN:
route add -net 10.23.17.0/24 gw ROUTER
route add -net 10.0.0.0/8 gw 10.23.254.249 dev tunl1

ROUTER:
route add -net 10.0.0.0/8 gw VPN
iptables -t nat -A PREROUTING -i eth1 -s 10.1.12.146 -d 10.23.17.99 -j DNAT --to-destination 192.168.130.15
iptables -A FORWARD -s 10.1.12.146 -d 192.168.130.15 -i eth1 -o eth2 -j ACCEPT
iptables -A FORWARD -d 10.1.12.146 -s 192.168.130.15 -o eth1 -i eth2 -j ACCEPT

Ok, here it goes:
packet started traveling from 10.1.12.146 with DST=10.23.17.99
packet arrived at BRANCH VPN with TTL=27
packet arrived at VPN with TTL=26
packet arrived at ROUTER with TTL=25
and here comes troubles... instead of DNAT'ing connection to 192.168.130.15 and routing 
it via eth2 it routes it's not DNAT'ing but sending packet as if it final destination
is 10.23.17.99 via eth1 to VPN box. Not a big surprise that VPN box routes this packet
back to ROUTER. Finaly ping-pong ends at ROUTER with TTL=1 going nowhere. What i'm doing wrong?
I got bunch of similar rules working OK. Just stuck with this one. 
Help! :)

Thank you!



