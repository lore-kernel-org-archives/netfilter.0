From: Alok Nath Upadhyay <aloknathupadhyay@sunguru.com>
Subject: multiple ISP routing/firewall
Date: Fri, 23 Jul 2004 03:20:11 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040723102011.88D9E3959@sitemail.everyone.net>
Reply-To: aloknathupadhyay@sunguru.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

hi all,
i am in a not so common situation and i have tried to figure out the solution without luck. i have 3 leased lines from three different vendors. i want to distribute outbound traffic from my lan on these three differnet links. i have some degree of success i.e. i can route the traffic but internet access speed is very slow. i guess that this is due to differnet DNS servers of these vendors. moreover if i have the unristricted access to internet, i am fine. but not with the restrictions on services and ports. after this all internet access is denied. This is my firewalling script for ur debugging and any remedial measures.

#!/bin/sh               
# Iptables userspace executable
IPTABLES="/usr/local/sbin/iptables"

# Internal Interface
NET_INT_INT=eth0
# Internal IP
NET_INT_IP=a.b.c.201
# Internal Subnet
NET_INT_SUB=24
# Internal Network
NET_INT_NET=a.b.c.0

# First external interface
NET_EXT_INT1=eth1
# First external IP
NET_EXT_IP1=a.b.c.201
# First external interface's gateway
NET_EXT_GW1=a.b.c.1

# Second external interface
NET_EXT_INT2=eth2
# Second external IP
NET_EXT_IP2=a.b.c.201
# Second external interface's gateway
NET_EXT_GW2=a.b.c.1

# Third external interface
NET_EXT_INT3=eth3
# Third external IP
NET_EXT_IP3=a.b.c.201
# Third external interface's gateway
NET_EXT_GW3=a.b.c.1

echo "Flushing All Tables"
$IPTABLES -F
$IPTABLES -F -t nat
$IPTABLES -F -t mangle
$IPTABLES -X -t nat
$IPTABLES -X -t mangle
$IPTABLES -X

$IPTABLES -t mangle -N ETH1
$IPTABLES -t mangle -F ETH1
$IPTABLES -t mangle -A ETH1 -j MARK --set-mark 1

$IPTABLES -t mangle -N ETH2
$IPTABLES -t mangle -F ETH2
$IPTABLES -t mangle -A ETH2 -j MARK --set-mark 2

$IPTABLES -t mangle -N ETH3
$IPTABLES -t mangle -F ETH3
$IPTABLES -t mangle -A ETH3 -j MARK --set-mark 3

$IPTABLES -t nat -N SPOOF_ETH1
$IPTABLES -t nat -F SPOOF_ETH1
$IPTABLES -t nat -A SPOOF_ETH1 -j SNAT --to ${NET_EXT_IP1}

$IPTABLES -t nat -N SPOOF_ETH2
$IPTABLES -t nat -F SPOOF_ETH2
$IPTABLES -t nat -A SPOOF_ETH2 -j SNAT --to ${NET_EXT_IP2}

$IPTABLES -t nat -N SPOOF_ETH3
$IPTABLES -t nat -F SPOOF_ETH3
$IPTABLES -t nat -A SPOOF_ETH3 -j SNAT --to ${NET_EXT_IP3}

echo "Setting some local network rules..."
$IPTABLES -A INPUT -p icmp -s ${NET_INT_NET}/${NET_INT_SUB} -d ${NET_INT_IP} -j ACCEPT

echo "Setting Mangle rules for eth1..."
$IPTABLES -t mangle -A OUTPUT -o ! ${NET_INT_INT} -m random --average 40 -j ETH1
$IPTABLES -t mangle -A PREROUTING -i ${NET_INT_INT} -m random --average 40 -j ETH1
ip ro add table 10 default via ${NET_EXT_GW1} dev ${NET_EXT_INT1}
ip ru add fwmark 1 table 10
ip ro fl ca

echo "Setting Mangle rules for eth2..."
$IPTABLES -t mangle -A OUTPUT -o ! ${NET_INT_INT} -m random --average 40 -j ETH2
$IPTABLES -t mangle -A PREROUTING -i ${NET_INT_INT} -m random --average 40 -j ETH2
ip ro add table 20 default via ${NET_EXT_GW2} dev ${NET_EXT_INT2}
ip ru add fwmark 2 table 20
ip ro fl ca

echo "Setting Mangle rules for eth3..."
$IPTABLES -t mangle -A OUTPUT -o ! ${NET_INT_INT} -m random --average 20 -j ETH3
$IPTABLES -t mangle -A PREROUTING -i ${NET_INT_INT} -m random --average 20 -j ETH3
ip ro add table 30 default via ${NET_EXT_GW3} dev ${NET_EXT_INT3}
ip ru add fwmark 3 table 30
ip ro fl ca

echo "Accept pre established connections....."
$IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

echo "Accept everything on local loopback....."
$IPTABLES -A INPUT  -i lo  -j ACCEPT 
$IPTABLES -A OUTPUT  -o lo  -j ACCEPT 

echo "Setting up Internet Access rules for services allowed......"
$IPTABLES -N RULE_0
$IPTABLES -A INPUT -p icmp  -s w.x.y.z/a  --icmp-type 11/0   -m state --state NEW  -j RULE_0 
$IPTABLES -A INPUT -p icmp  -s w.x.y.z/a  --icmp-type 11/1   -m state --state NEW  -j RULE_0 
$IPTABLES -A INPUT -p icmp  -s w.x.y.z/a  --icmp-type 0/0   -m state --state NEW  -j RULE_0 
$IPTABLES -A INPUT -p icmp  -s w.x.y.z/a  --icmp-type 3  -m state --state NEW  -j RULE_0 
$IPTABLES -A INPUT -p tcp  -s w.x.y.z/a  --source-port 20  --destination-port 1024:65535  -m state --state NEW  -j RULE_0 
$IPTABLES -A INPUT -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 21,20,80,443  -m state --state NEW  -j RULE_0 
$IPTABLES -A OUTPUT -p icmp  -s w.x.y.z/a  --icmp-type 11/0   -m state --state NEW  -j RULE_0 
$IPTABLES -A OUTPUT -p icmp  -s w.x.y.z/a  --icmp-type 11/1   -m state --state NEW  -j RULE_0 
$IPTABLES -A OUTPUT -p icmp  -s w.x.y.z/a  --icmp-type 0/0   -m state --state NEW  -j RULE_0 
$IPTABLES -A OUTPUT -p icmp  -s w.x.y.z/a  --icmp-type 3  -m state --state NEW  -j RULE_0 
$IPTABLES -A OUTPUT -p tcp  -s w.x.y.z/a  --source-port 20  --destination-port 1024:65535  -m state --state NEW  -j RULE_0 
$IPTABLES -A OUTPUT -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 21,20,80,443  -m state --state NEW  -j RULE_0 
$IPTABLES -A FORWARD -p icmp  -s w.x.y.z/a  --icmp-type 11/0   -m state --state NEW  -j RULE_0 
$IPTABLES -A FORWARD -p icmp  -s w.x.y.z/a  --icmp-type 11/1   -m state --state NEW  -j RULE_0 
$IPTABLES -A FORWARD -p icmp  -s w.x.y.z/a  --icmp-type 0/0   -m state --state NEW  -j RULE_0 
$IPTABLES -A FORWARD -p icmp  -s w.x.y.z/a  --icmp-type 3  -m state --state NEW  -j RULE_0 
$IPTABLES -A FORWARD -p tcp  -s w.x.y.z/a  --source-port 20  --destination-port 1024:65535  -m state --state NEW  -j RULE_0 
$IPTABLES -A FORWARD -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 21,20,80,443  -m state --state NEW  -j RULE_0 
$IPTABLES -A RULE_0  -j LOG  --log-level info --log-prefix "RULE 0 -- ACCEPT " 
$IPTABLES -A RULE_0  -j ACCEPT 

echo "Setting up Internet Access rules for services denied......"
$IPTABLES -N RULE_1
$IPTABLES -A INPUT -p tcp  -s w.x.y.z/a  --syn   -j RULE_1 
$IPTABLES -A INPUT -p tcp  -s w.x.y.z/a  --tcp-flags ALL URG,ACK,PSH,RST,SYN,FIN  -j RULE_1 
$IPTABLES -A INPUT -p tcp  -s w.x.y.z/a  --destination-port 1024:65535  -j RULE_1 
$IPTABLES -A INPUT -p tcp  -s w.x.y.z/a  --destination-port 6000:6063  -j RULE_1 
$IPTABLES -A INPUT -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 5190,1494,709,710,1720,3268,3269,2000,5631,7070,2998,445,49,42,113  -j RULE_1 
$IPTABLES -A INPUT -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 13,53,2105,79,143,6667,993,88,543,544,389,636,98,515,98  -j RULE_1 
$IPTABLES -A INPUT -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 135,3306,1433,2049,139,119,563,110,995,5432,26000,515,512,513,514  -j RULE_1 
$IPTABLES -A INPUT -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 4321,554,25,5510,465,1080,1521,3128,22,111,23,540,3389,7100  -j RULE_1 
$IPTABLES -A OUTPUT -p tcp  -s w.x.y.z/a  --syn   -j RULE_1 
$IPTABLES -A OUTPUT -p tcp  -s w.x.y.z/a  --tcp-flags ALL URG,ACK,PSH,RST,SYN,FIN  -j RULE_1 
$IPTABLES -A OUTPUT -p tcp  -s w.x.y.z/a  --destination-port 1024:65535  -j RULE_1 
$IPTABLES -A OUTPUT -p tcp  -s w.x.y.z/a  --destination-port 6000:6063  -j RULE_1 
$IPTABLES -A OUTPUT -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 5190,1494,709,710,1720,3268,3269,2000,5631,7070,2998,445,49,42,113  -j RULE_1 
$IPTABLES -A OUTPUT -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 13,53,2105,79,143,6667,993,88,543,544,389,636,98,515,98  -j RULE_1 
$IPTABLES -A OUTPUT -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 135,3306,1433,2049,139,119,563,110,995,5432,26000,515,512,513,514  -j RULE_1 
$IPTABLES -A OUTPUT -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 4321,554,25,5510,465,1080,1521,3128,22,111,23,540,3389,7100  -j RULE_1 
$IPTABLES -A FORWARD -p tcp  -s w.x.y.z/a  --syn   -j RULE_1 
$IPTABLES -A FORWARD -p tcp  -s w.x.y.z/a  --tcp-flags ALL URG,ACK,PSH,RST,SYN,FIN  -j RULE_1 
$IPTABLES -A FORWARD -p tcp  -s w.x.y.z/a  --destination-port 1024:65535  -j RULE_1 
$IPTABLES -A FORWARD -p tcp  -s w.x.y.z/a  --destination-port 6000:6063  -j RULE_1 
$IPTABLES -A FORWARD -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 5190,1494,709,710,1720,3268,3269,2000,5631,7070,2998,445,49,42,113  -j RULE_1 
$IPTABLES -A FORWARD -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 13,53,2105,79,143,6667,993,88,543,544,389,636,98,515,98  -j RULE_1 
$IPTABLES -A FORWARD -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 135,3306,1433,2049,139,119,563,110,995,5432,26000,515,512,513,514  -j RULE_1 
$IPTABLES -A FORWARD -p tcp  -m multiport  -s w.x.y.z/a  --destination-port 4321,554,25,5510,465,1080,1521,3128,22,111,23,540,3389,7100  -j RULE_1 
$IPTABLES -A RULE_1  -j LOG  --log-level info --log-prefix "RULE 1 -- DENY " 
$IPTABLES -A RULE_1  -j DROP 

echo "Setting up internet access from firewall....."
$IPTABLES -N RULE_2
$IPTABLES -A OUTPUT  -s ${NET_INT_IP}  -m state --state NEW  -j RULE_2 
$IPTABLES -A OUTPUT  -s ${NET_EXT_IP1}  -m state --state NEW  -j RULE_2 
$IPTABLES -A OUTPUT  -s ${NET_EXT_IP2}  -m state --state NEW  -j RULE_2 
$IPTABLES -A OUTPUT  -s ${NET_EXT_IP3}  -m state --state NEW  -j RULE_2 
$IPTABLES -A RULE_2  -j LOG  --log-level info --log-prefix "RULE 2 -- ACCEPT " 
$IPTABLES -A RULE_2  -j ACCEPT 

echo "Setting up catch all rules......"
$IPTABLES -N RULE_4
$IPTABLES -A OUTPUT  -j RULE_4 
$IPTABLES -A INPUT  -j RULE_4 
$IPTABLES -A FORWARD  -j RULE_4 
$IPTABLES -A RULE_4  -j LOG  --log-level info --log-prefix "RULE 4 -- DENY " 
$IPTABLES -A RULE_4  -j DROP 


echo "Setting up spoofing rules..."
$IPTABLES -t nat -A POSTROUTING -o ${NET_EXT_INT1} -j SPOOF_ETH1
$IPTABLES -t nat -A POSTROUTING -o ${NET_EXT_INT2} -j SPOOF_ETH2
$IPTABLES -t nat -A POSTROUTING -o ${NET_EXT_INT3} -j SPOOF_ETH3

echo "Adding default route..."
ip ro add default nexthop via ${NET_EXT_GW1} dev ${NET_EXT_INT1} weight 1 nexthop via ${NET_EXT_GW2} dev ${NET_EXT_INT2} weight 1 nexthop via ${NET_EXT_GW3} dev ${NET_EXT_INT3} weight 1

echo "Disabling Reverse Path Filtering..."
echo 0> /proc/sys/net/ipv4/conf/eth1/rp_filter
echo 0> /proc/sys/net/ipv4/conf/eth2/rp_filter
echo 0> /proc/sys/net/ipv4/conf/eth3/rp_filter

echo "Enabling IPv4 Packet forwarding..."
echo "1"> /proc/sys/net/ipv4/ip_forward


