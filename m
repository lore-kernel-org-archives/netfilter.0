From: "James D. Parra" <JamesP@MusicReports.com>
Subject: iptable woes
Date: Mon, 21 Apr 2003 14:55:14 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9EC6A5A6B11DA843A551CC9AD9323FAC3014@exchange.musicreports.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Hello,

Try as I may, I cannot get packets to go through the firewall from the
public side to the private side. I have set up scripts that should work, as
written from Netfilter, but there must be something I am overlooking.
Interestingly, NAT works beautifully. 

Below is the script I am using.  If I could at least get http, port 80, to
forward, that would be a great start. Is there something omitted that will
allow packets to pass through?

# (1) Policies (default)
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# (2) User-defined chain for ACCEPTed TCP packets
iptables -N okay
iptables -A okay -p TCP --syn -j ACCEPT
iptables -A okay -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A okay -p TCP -j DROP

# (3) INPUT chain rules
# Rules for incoming packets from LAN
iptables -A INPUT -p ALL -i eth0 -s 192.168.1.0/8 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s 192.168.1.90 -j ACCEPT
iptables -A INPUT -p ALL -i lo -s XXX.XXX.XXX.XXX -j ACCEPT
iptables -A INPUT -p ALL -i eth0 -s 192.168.1.255 -j ACCEPT

# Rules for incoming packets from the Internet

# Packets for established connections
iptables -A INPUT -p ALL -d PUB.XXX.XXX.XXX -m state --state \
ESTABLISHED,RELATED -j ACCEPT

# TCP Rules
iptables -A INPUT -p TCP -i eth1 -s 0/0 --destination-port 1723 -j okay
iptables -A INPUT -p tcp -i eth1 -s 0/0 --destination-port 80 -j okay

# UDP Rules
iptables -A INPUT -p UDP -i eth1 -s 0/0 --destination-port 1723 -j ACCEPT

# ICMP Rules
iptables -A INPUT -p ICMP -i eth1 -s 0/0 --icmp-type 8 -j ACCEPT
iptables -A INPUT -p ICMP -i eth1 -s 0/0 --icmp-typ 11 -j ACCEPT

# (4) FORWARD chain rules
# Accept packets we want to forward
iptables -A FORWARD -i eth0 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp --sport 1024:65535 -d
PVT.XXX.XXX.XXX --dport 80 \
-m state --state NEW -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATED -j
ACCEPT

# (5) OUTPUT chain rules
# Only output packets with local addresses (no spoofing)
iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -p ALL -s 192.168.20.18 -j ACCEPT
iptables -A OUTPUT -p ALL -s 64.161.179.58 -j ACCEPT

# (6) PREROUTING chain rules
iptables -t nat -A PREROUTING -i eth1 -p tcp --sport 80 -d PUB.XXX.XXX.XXX
--dport 80 \
-j DNAT --to-destination PVT.XXX.XXX.XXX:80
iptables -t nat -A PREROUTING -p tcp -d  --dport 1723 -j DNAT
--to-destination PVT.XXX.XXX.XXX
iptables -t nat -A PREROUTING -p udp -d 64.161.179.58 --dport 1723 -j DNAT
--to-destination PVT.XXX.XXX.XXX

# (7) POSTROUTING chain rules
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source PUB.XXX.XXX.XXX

Many thanks in advance.

James D. Parra
JamesP@MusicReports.com


