From: <netfilter@sbgit.com>
Subject: Is my script good and secure?
Date: 15 Mar 2004 13:28:16 UT
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DIIE.000000E500002A8E@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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

Is this a good and secure Firewall Script?

Thanx Peter
----------------------------------------------------
#! /bin/sh

echo "1" > /proc/sys/net/ipv4/ip_forward # Initialising of Forwarding

# Flushen, Deleting, Create#
################################################################
iptables -F
iptables -F -t nat

iptables -F sperre
iptables -X sperre
iptables -N sperre
iptables -F sperre

# first contact #
#################
iptables -A sperre -i eth1 -s ! 192.168.1.0/255.255.255.0 -j DROP                 # Drop everything how not comes from lokal LAN
iptables -A sperre -i eth1 --dport 22,19,21,22,25,3389,1723,23000:23001 -j ACCEPT # Allow outbound only for specific ports
iptables -A sperre -i lo -s 127.0.0.1/255.0.0.0 -j ACCEPT                         # Allow everything from loopback
iptables -A sperre -i eth0 -s 192.168.1.0/255.255.255.0 -j DROP                   # Drop everyting how comes fro outside to inside  with LAN IP's

# acceptstuff #
###############
iptables -A sperre -p tcp --dport 21 -j ACCEPT             # ftp 
iptables -A sperre -p tcp --dport 23001:23001 -j ACCEPT    # Battlefield Server
iptables -A sperre -p tcp --dport 90 -j ACCEPT             # DVISE
iptables -A sperre -p tcp --dport 80 -j ACCEPT             # HTTP
iptables -A sperre -p tcp --dport 3389 -j ACCEPT           # VPN

# Antworten zulassen #
######################
iptables -A sperre -m state --state ESTABLISHED,RELATED -j ACCEPT

# Reject everything else (RFC-conform) #
#######################################
iptables -A sperre -p tcp -j REJECT --reject-with tcp-reset
iptables -A sperre -p udp -j REJECT --reject-with icmp-port-unreachable

# activating sperre#
#####################
iptables -A INPUT -j sperre
iptables -A FORWARD -j sperre
iptables -P INPUT DROP
iptables -P FORWARD DROP

iptables -P OUTPUT ACCEPT # output accept
iptables -P OUTPUT ACCEPT -t nat

# NAT #
#######
iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE 
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 21 -j DNAT --to 192.168.1.198        # FTP to FTP-Server
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 3389 -j DNAT --to 192.168.1.220      # Terminal Server
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 1723 -j DNAT --to 192.168.1.2        # VPN Server
iptables -A PREROUTING -t nat -i eth0 -p 47  -j DNAT --to 192.168.1.220                   # VPN Server
iptables -A PREROUTING -t nat -i eth0 -p 37  -j DNAT --to 192.168.1.220                   # VPN Server
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 4661:4662 -j DNAT --to 192.168.1.198 # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 6343 -j DNAT --to 192.168.1.198      # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 6300 -j DNAT --to 192.168.1.198      # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 4242 -j DNAT --to 192.168.1.198      # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 8888 -j DNAT --to 192.168.1.198      # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 6661:6662 -j DNAT --to 192.168.1.198 # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p udp --dport 4665 -j DNAT --to 192.168.1.198      # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p udp --dport 4672 -j DNAT --to 192.168.1.198      # EDONKEY
iptables -A PREROUTING -t nat -i eth0 -p udp --dport 6665 -j DNAT --to 192.168.1.198      # EDONKEY

# Special Rules
iptables -A INPUT -i eth0 -s 0/0 -p tcp --destination-port 25 -j ACCEPT
iptables -A OUTPUT -o eth1 -s 0/0 -p tcp --destination-port 25 -j ACCEPT
iptables -A INPUT -i eth0 -s 192.168.1.0/24 -p tcp --destination-port 25 -j ACCEPT
iptables -A OUTPUT -o eth0 -s 0/0 -p tcp --destination-port 25 -j ACCEPT

iptables -A INPUT lo -p tcp --destination-port 10024 -j ACCEPT
iptables -A OUTPUT -o lo -p tcp --destination-port 10024 -j ACCEPT

iptables -A INPUT -i lo -p tcp --destination-port 10025 -j ACCEPT
iptables -A OUTPUT -o lo -p tcp --destination-port 10025 -j ACCEPT

echo "Firewall started"


