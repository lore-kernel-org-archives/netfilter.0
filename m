From: Phill <phillskonf@atlas.cz>
Subject: Source based routing, some TCP packets not SNAT-ed
Date: Wed, 23 Nov 2005 18:18:17 +0100
Message-ID: <4384A459.50206@atlas.cz>
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

Hello,
I have a problem with the following setup, I hope you can help me.

I have two internet gateways, one for LAN1 and the second for LAN2.

                      +--------------+
GW1    more      eth0|              |eth4(SNAT)    GW2
---...routers...-----+    router    +-----------------
                      |              |
                      +---+------+---+
                      eth1|  eth2|
                          |      |
                      LAN1|  LAN2|



I am using the following setup:

ip rule add fwmark 1 lookup LAN2

ip route add default via GW1

ip route add table LAN2 default via GW2
ip route flush cache


So the default routing table has default route set to GW1 and the table 
LAN2 has default gw set to GW2.

I am marking packets in iptables.

iptables -t mangle -A PREROUTING -s $IP1_IN_LAN2
   -d ! 10.0.0.0/255.0.0.0 -j MARK --set-mark 0x1

iptables -t mangle -A PREROUTING -s $IP2_IN_LAN2
   -d ! 10.0.0.0/255.0.0.0 -j MARK --set-mark 0x1


The last thing in my firewall is:

iptables -t nat -A POSTROUTING -o eth4 -j SNAT
--to-source $Public_IP


The configuration is quite simple, but now straight to the problem:

When I run tethereal I see packets with the correct IP address, but 
sometimes there are packets which have not been nat-ed.
I found out that the packets are always marked with the flags [FIN, ACK] 
and sometimes it is [TCP Retransmission].

For example:
#tethereal -i eth4 |grep "10.109.158"
1427.492655 10.109.158.109 -> 194.213.62.44 TCP 1943 > www [FIN, ACK]
Seq=0 Ack=0 Win=65535 Len=0
1428.938362 10.109.158.109 -> 194.213.62.44 TCP [TCP Retransmission]
1943 > www [FIN, ACK] Seq=0 Ack=0 Win=65535 Len=0
1431.855387 10.109.158.109 -> 194.213.62.44 TCP [TCP Retransmission]
1943 > www [FIN, ACK] Seq=0 Ack=0 Win=65535 Len=0
1437.890639 10.109.158.109 -> 194.213.62.44 TCP [TCP Retransmission]
1943 > www [FIN, ACK] Seq=0 Ack=0 Win=65535 Len=0

where 10.109 is my internal network (LAN2). These packets are not SNAT-ed.


Is it configuration problem, or a kernel/netfilter problem?

I tried google, various kernel options, some iptables rules, but
did not find the solution.
I can post more information if u ask me to.

Thanks for any advice, I am getting desperate.

-Phill


----------------------------------------------
		 Member of
      PSF|Predictable Suicide Fanatics[CZ]
	     a Day of Defeat clan

WWW: http://psf.gotdns.com
----------------------------------------------

----------------------------------------------
  		 Member of
      Wireless community network PilsFree

WWW: http://www.pilsfree.net
----------------------------------------------

----------------------------------------------
   I do know everything, just not all at once.
         It's a virtual memory problem.
----------------------------------------------


