From: ro0ot <ro0ot@phreaker.net>
Subject: iptables with policy routing
Date: Fri, 12 Nov 2004 01:01:06 +0800
Message-ID: <41939AD2.602@phreaker.net>
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

Hi,

Below is my Linux firewall network configuration: -

eth0 - isp 1, IP: 1.1.1.10, Netmask: 255.255.255.252
eth1 - isp 2, IP: 2.2.2.10, Netmask: 255.255.255.252
eth2 - lan, IP: 172.16.0.254, Netmask: 255.255.255.0
eth3 - dmz, 192.168.0.254, Netmask: 255.255.255.0

isp 1 gateway: 1.1.1.9
isp 2 gateway: 2.2.2.9


Below is my iptables rules: -

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat -A PREROUTING -d 1.1.1.10 -j DNAT --to-destination 
172.16.0.1
iptables -t nat -A PREROUTING -d 2.2.2.10 -j DNAT --to-destination 
192.168.0.1

iptables -t nat -A POSTROUTING -s 172.16.0.1 -j SNAT --to-source 1.1.1.10
iptables -t nat -A POSTROUTING -s 192.168.0.1 -j SNAT --to-source 2.2.2.10


Below is my split access routing for multiple providers: -

# First ISP
ip route add 1.1.1.8/30 dev eth0 src 1.1.1.10 table 1
ip route add default via 1.1.1.9 table 1

# Second ISP
ip route add 2.2.2.8/30 dev eth1 src 2.2.2.10 table 2
ip route add default via 2.2.2.9 table 2

#
ip rule add from 1.1.1.8/30 lookup 1
ip rule add from 2.2.2.8/30 lookup 2

# My default choice of gateway
ip route add default via 1.1.1.9

#
ip route add 2.2.2.8/30 dev eth1 table 1
ip route add 172.16.0.0/24 dev eth2 table 1
ip route add 192.168.0.0/24 dev eth3 table 1
ip route add 127.0.0.0/8 dev lo table 1

#
ip route add 1.1.1.8/30 dev eth0 table 2
ip route add 172.16.0.0/24 dev eth2 table 2
ip route add 192.168.0.0/24 dev eth3 table 2
ip route add 127.0.0.0/8 dev lo table 2

When I perform a traceroute from a workstation with the IP address of 
192.168.0.1 and gateway 192.168.0.254, I can see the result of the 
traceroute going through the 1.1.1.9 gateway, why?  It suppose to SNAT 
to 2.2.2.10 via 2.2.2.9 gateway.

Regards,
ro0ot




