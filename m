From: Alok Nath Upadhyay <aloknathupadhyay@sunguru.com>
Subject: different ISP random routing
Date: Fri, 23 Jul 2004 06:45:50 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040723134550.B294FE4B9@sitemail.everyone.net>
Reply-To: aloknathupadhyay@sunguru.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Dear all,
i have driven myself in a mess, i am working on this problem since last wee=
k but without luck. my problem is that i have 3 leased lines for internet a=
ccess. 2 of the lines are 512 KBPS from a single ISP(gw1 192.168.2.1 and gw=
2 192.168.3.1)and remaining is of 256 KBPS from doffernet ISP(gw3 10.19.28.=
1). Now, i want to configure my firewall in a way that will allow my out go=
ing traffic over all these connections in balanced or random mode. for this=
 i am using random match module. i am able to get the connections working a=
nd outgoing traffic is randomly distributed over these lines. i can also pi=
ng the 3 gateways.my problem is that internet access is very slow. i am giv=
ing DNS addresses for the different ISPs at the client machines. also i hav=
e noticed that when i try to traceroute any website from the firewall after=
 1-2 hops from  gw1/gw2/gw3 it reaches an address 192.168.100.1. i dont kno=
w why that is happening. i am attaching my firewall script in hope that som=
e of you may help me. this script is a rip-off from www.linux.com.lb site. =
so i hoped that it will work but now i am not so sure.

#!/bin/sh=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
# Iptables userspace executable
IPTABLES=3D"/usr/local/sbin/iptables"

# Internal Interface
NET_INT_INT=3Deth0
# Internal IP
NET_INT_IP=3D192.168.1.2
# Internal Subnet
NET_INT_SUB=3D24
# Internal Network
NET_INT_NET=3D192.168.1.0

# First external interface
NET_EXT_INT1=3Deth1
# First external IP
NET_EXT_IP1=3D192.168.2.201
# First external interface's gateway
NET_EXT_GW1=3D192.168.2.1

# Second external interface
NET_EXT_INT3=3Deth3
# Third external IP
NET_EXT_IP3=3D10.19.28.201
# Third external interface's gateway
NET_EXT_GW3=3D10.19.28.1

# Third external interface
NET_EXT_INT3=3Deth2
# Third external IP
NET_EXT_IP3=3D192.168.3.201
# Third external interface's gateway
NET_EXT_GW3=3D192.168.3.1


echo "Flushing All Tables"
$IPTABLES -F
$IPTABLES -F -t nat
$IPTABLES -F -t mangle
$IPTABLES -X -t nat
$IPTABLES -X -t mangle
$IPTABLES -X


$IPTABLES -t mangle -N ETH1
$IPTABLES -t mangle -F ETH1
$IPTABLES -t mangle -A ETH1 -p tcp -j LOG --log-prefix " MANGLE_TCP_ETH1 "
$IPTABLES -t mangle -A ETH1 -p icmp -j LOG --log-prefix " MANGLE_ICMP_ETH1 "
$IPTABLES -t mangle -A ETH1 -j MARK --set-mark 1

$IPTABLES -t mangle -N ETH2
$IPTABLES -t mangle -F ETH2
$IPTABLES -t mangle -A ETH2 -p tcp -j LOG --log-prefix " MANGLE_TCP_ETH2 "
$IPTABLES -t mangle -A ETH2 -p icmp -j LOG --log-prefix " MANGLE_ICMP_ETH2 "
$IPTABLES -t mangle -A ETH2 -j MARK --set-mark 2

$IPTABLES -t mangle -N ETH3
$IPTABLES -t mangle -F ETH3
$IPTABLES -t mangle -A ETH3 -p tcp -j LOG --log-prefix " MANGLE_TCP_ETH3 "
$IPTABLES -t mangle -A ETH3 -p icmp -j LOG --log-prefix " MANGLE_ICMP_ETH3 "
$IPTABLES -t mangle -A ETH3 -j MARK --set-mark 3

$IPTABLES -t nat -N SPOOF_ETH1
$IPTABLES -t nat -F SPOOF_ETH1
$IPTABLES -t nat -A SPOOF_ETH1 -j LOG --log-prefix " SPOOF_ETH1 "
$IPTABLES -t nat -A SPOOF_ETH1 -j SNAT --to ${NET_EXT_IP1}

$IPTABLES -t nat -N SPOOF_ETH2
$IPTABLES -t nat -F SPOOF_ETH2
$IPTABLES -t nat -A SPOOF_ETH2 -j LOG --log-prefix " SPOOF_ETH2 "
$IPTABLES -t nat -A SPOOF_ETH2 -j SNAT --to ${NET_EXT_IP2}

$IPTABLES -t nat -N SPOOF_ETH3
$IPTABLES -t nat -F SPOOF_ETH3
$IPTABLES -t nat -A SPOOF_ETH3 -j LOG --log-prefix " SPOOF_ETH3 "
$IPTABLES -t nat -A SPOOF_ETH3 -j SNAT --to ${NET_EXT_IP3}

echo "Setting some local network rules..."
$IPTABLES -A INPUT -p icmp -s ${NET_INT_NET}/${NET_INT_SUB} -d ${NET_INT_IP=
} -j ACCEPT

echo "Setting Mangle rules for eth1..."
$IPTABLES -t mangle -A OUTPUT -o ! ${NET_INT_INT} -m random --average 40 -j=
 ETH1
$IPTABLES -t mangle -A PREROUTING -i ${NET_INT_INT} -m random --average 40 =
-j ETH1
ip ro add table 10 default via ${NET_EXT_GW1} dev ${NET_EXT_INT1}
ip ru add fwmark 1 table 10
ip ro fl ca

echo "Setting Mangle rules for eth2..."
$IPTABLES -t mangle -A OUTPUT -o ! ${NET_INT_INT} -m random --average 40 -j=
 ETH2
$IPTABLES -t mangle -A PREROUTING -i ${NET_INT_INT} -m random --average 40 =
-j ETH2
ip ro add table 20 default via ${NET_EXT_GW2} dev ${NET_EXT_INT2}
ip ru add fwmark 2 table 20
ip ro fl ca


echo "Setting Mangle rules for eth3..."
$IPTABLES -t mangle -A OUTPUT -o ! ${NET_INT_INT} -m random --average 30 -j=
 ETH3
$IPTABLES -t mangle -A PREROUTING -i ${NET_INT_INT} -m random --average 30 =
-j ETH3
ip ro add table 30 default via ${NET_EXT_GW3} dev ${NET_EXT_INT3}
ip ru add fwmark 3 table 30
ip ro fl ca

echo "Setting up spoofing rules..."
$IPTABLES -t nat -A POSTROUTING -o ${NET_EXT_INT1} -j SPOOF_ETH1
$IPTABLES -t nat -A POSTROUTING -o ${NET_EXT_INT2} -j SPOOF_ETH2
$IPTABLES -t nat -A POSTROUTING -o ${NET_EXT_INT3} -j SPOOF_ETH3

echo "Adding default route..."
ip ro add default nexthop via ${NET_EXT_GW1} dev ${NET_EXT_INT1} weight 1 n=
exthop via ${NET_EXT_GW2} dev ${NET_EXT_INT2} weight 1 nexthop via ${NET_EX=
T_GW3} dev ${NET_EXT_INT3} weight 1

echo "Disabling Reverse Path Filtering..."
echo 0> /proc/sys/net/ipv4/conf/eth1/rp_filter
echo 0> /proc/sys/net/ipv4/conf/eth2/rp_filter
echo 0> /proc/sys/net/ipv4/conf/eth3/rp_filter

echo "Enabling IPv4 Packet forwarding..."
echo "1"> /proc/sys/net/ipv4/ip_forward

for any help, Thanks in advance.


Alok Nath Upadhyay
Suntech (OSM) Team
PC Solutions (P) Limited
12, Sant Nagar, East of Kailash
New Delhi - 110 065.
Tel.: +91-11-2621 3355 / 2621 7766 / 2688 4433 (Ext.: 51)
Fax : +91-11-647 6822

