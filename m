From: "Robert Gil" <rgil@bodybuildingdiscount.com>
Subject: mysql remote connections
Date: Mon, 1 Mar 2004 15:04:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009001c3ffc8$5eacc970$3901a8c0@AFBWholesale.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

mysql port is 3306.... its currently running on the same box as the firewall
just for testing purposes... but i cant figure out why i cant connect
remotely.. im sure its just a careless mistake somewhere or a mixup.. if
somone can just take a quick peek i would appreciate it alot.

# Start With Everything Closed
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Connection Tracking
#TCP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

#ICMP
iptables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED,RELATED -j
ACCEPT
iptables -A INPUT -p icmp -m state --state ESTABLISHED,RELATED  -j ACCEPT

# Open Ports

iptables -A INPUT -j ACCEPT -p tcp --dport 80
iptables -A INPUT -j ACCEPT -p tcp --dport 21
iptables -A INPUT -j ACCEPT -p tcp --dport 110
iptables -A INPUT -j ACCEPT -p tcp --dport 25
iptables -A INPUT -j ACCEPT -p tcp --dport 22
iptables -A INPUT -j ACCEPT -p tcp --dport 3389
iptables -A INPUT -j ACCEPT -p tcp --dport 3306
iptables -A INPUT -j ACCEPT -p tcp --dport 2121
iptables -A INPUT -j ACCEPT -p tcp --dport 53

# Masquerading and NAT
iptables -t nat -A POSTROUTING -s 192.168.1.2 -j MASQUERADE
iptables -A FORWARD -j ACCEPT -i eth1 -s 192.168.1.2
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Terminal Services Forwarding
iptables -A FORWARD -j ACCEPT -p tcp --dport 3389
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 3389 -j DNAT --to
192.168.1.2:3389

# MS BOX FTP Fowarding
iptables -A FORWARD -j ACCEPT -p tcp --dport 2121
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2121 -j DNAT --to
192.168.1.2:2121

# Flood Protection
# SYN
iptables -A FORWARD -p tcp --syn -m limit --limit 1/s -j ACCEPT

# Port Scan
iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit
1/s -j ACCEPT

# Ping Of Death
iptables -A FORWARD -p icmp --icmp-type echo-request -m limit --limit 1/s -j
ACCEPT

# Enable Forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward


