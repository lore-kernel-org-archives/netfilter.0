From: "Brent Clark" <bclark@eccotours.biz>
Subject: ruleset
Date: Tue, 20 Jul 2004 16:58:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HAEOIFPIBBBLGLHOMLLIAEMFCEAA.bclark@eccotours.biz>
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
To: iptables <netfilter@lists.netfilter.org>

Hi all

Sorry to be a pain about this
But hopefully im getting there. No cant say im not learning.

Below is a copied and pasted ruleset.
Anyone care to have a look, it would really be appreciated.

I have concentrated on more FORWARDS and removing unnessacary DROPS, like i
mistakenly previously had (Thanks Anthony for putting me on the right road)

Thanks in advance to anyone who would care to assist

Kind Regards
Brent Clark

P.s. Sorry been a pain, but im determined to get this right and understand
iptables more fully.

============================================================================
============================

#/bin/sh

# Rules for gateway

#Clear \ Flush all the rules from the different chains and tables

/sbin/iptables --flush
/sbin/iptables --flush INPUT		#Flush the INPUT chain
/sbin/iptables --flush OUTPUT		#Flush the OUTPUT chain
/sbin/iptables --flush FORWARD		#Flush the FORWARD chain
/sbin/iptables -t nat --flush		#Flush the nat table
/sbin/iptables -t mangle --flush	#Flush the mangle table
/sbin/iptables --delete-chain		#Delete any pre-existing chains
/sbin/iptables -t nat --delete-chain	#Delete any pre-existing chains from
nat table
/sbin/iptables -t mangle --delete-chain	#Delete any pre-existing chains from
the mangle table

#Setting the default Policies for the chains
/sbin/iptables --policy INPUT DROP	#Setting the default policy for INPUT
chain
/sbin/iptables --policy FORWARD DROP	#Setting the default plicy for FORWARD
chain
/sbin/iptables --policy OUTPUT DROP	#Setting the default policy for the
OUTPUT chain

#Create new chain
/sbin/iptables -N LOG_DROP		#Create new chain
/sbin/iptables -N LOG_ACCEPT		#Create new chain

#Accepting traffic for and to internal interface
/sbin/iptables -A INPUT -i lo -j ACCEPT		#Allowing unlimited loopback
traffic
/sbin/iptables -A OUTPUT -o lo -j ACCEPT	#Allowing unlimited loopback
traffic

###########################################################
#Stealth Scans and TCP state flags
#
# All of the bits are cleared
#/sbin/iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

# SYN and FIN are both set
#/sbin/iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP

# SYN and RST are both set
#/sbin/iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP

# FIN and RST are both set
#/sbin/iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP

# FIN is the only bit set, without the expected accompanying ACK
#/sbin/iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP

# PSH is the only bit set, without the expected accompanying ACK
#/sbin/iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP

# URG is the only bit set, without the expected accompanying ACK
#/sbin/iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP

###########################################################
# Using Connection State to By-Pass checking
# Creating the rules
/sbin/iptables -t nat -A POSTROUTING -o eth0 -s 192.168.111.0/24 -d 0/0  -j
MASQUERADE
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

/sbin/iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT #NOTE TO SELF - NEED TO
MAKE THIS MORE TIGHTER

/sbin/iptables -A INPUT -m state --state INVALID -j LOG --log-prefix
"INVALID input: "
/sbin/iptables -A INPUT -m state --state INVALID -j DROP

/sbin/iptables -A OUTPUT -m state --state INVALID -j LOG --log-prefix
"INVALID output: "
/sbin/iptables -A OUTPUT -m state --state INVALID -j DROP

##########################################################

/sbin/iptables -A INPUT -i eth0 -p udp -d 224.0.0.0/4 -j ACCEPT

############################################################
# Allow for resolving of  DNS and lookup from  gate

/sbin/iptables -A OUTPUT -o eth0 -p udp --dport 53 -m state --state NEW -j
ACCEPT
/sbin/iptables -A INPUT -i eth1 -p udp --sport 53 -m state --state NEW -j
ACCEPT
/sbin/iptables -A FORWARD -p udp --sport 53 -m state --state NEW -j ACCEPT

#############################################################
# Allow for mail traffic

/sbin/iptables -A OUTPUT -o eth0 -p tcp --dport 25 -m state --state NEW -j
ACCEPT
/sbin/iptables -A FORWARD -o eth0 -p tcp --dport 25 -m state --state NEW -j
ACCEPT

/sbin/iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 192.168.111.0/24 --dport
110 -m state --state NEW -j ACCEPT
/sbin/iptables -A OUTPUT -o eth0 -p tcp -s 192.168.111.0/24 --dport 110 -m
state --state NEW -j ACCEPT

#############################################################
# Allow access gate from 192.168.111.0/255.255.255.0

/sbin/iptables -A INPUT -i eth1 -p all -s 192.168.111.0/24 -j ACCEPT
/sbin/iptables -A FORWARD -p all -s 192.168.111.0/24 -d 192.168.111.0/24 -j
ACCEPT
/sbin/iptables -A OUTPUT -o eth1 -p all -s 192.168.111.0/24 -j ACCEPT

############################################################
# Allow access to port 80(http) and 443(https) to the gate

/sbin/iptables -A FORWARD -o eth0 -p tcp -m multiport --dport 80,443 -m
state --state NEW -j ACCEPT
/sbin/iptables -A OUTPUT -o eth0 -p tcp -m multiport --dport 80,443 -m
state --state NEW -j ACCEPT
/sbin/iptables -A INPUT -i eth1 -s 192.168.111.0/24 -p tcp -m
multiport --dport 80,443 -m state --state NEW -j ACCEPT

###########################################################
# Allowing ssh to remote servers

/sbin/iptables -A OUTPUT -o eth0 -p tcp --dport 22 -m state --state NEW -j
ACCEPT
/sbin/iptables -A INPUT -i eth0 -p tcp ! --syn --sport 22 -j ACCEPT

###########################################################
# FTP ACCESS
/sbin/iptables -A FORWARD -o eth0 -p tcp -m multiport --dport 20,21 -m
state --state NEW -j ACCEPT
/sbin/iptables -A OUTPUT -o eth0 -p tcp -m multiport --dport 20,21 -m
state --state NEW -j  ACCEPT
#/sbin/iptables -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT

###########################################################
# Ntp update
/sbin/iptables -A OUTPUT -o eth0 -p udp -m state --state NEW --dport 123 -j
ACCEPT
/sbin/iptables -A INPUT -i eth1 -p udp --sport 123 -m state --state NEW -j
ACCEPT
#/sbin/iptables -A INPUT -p tcp -m tcp --dport 123 -j  ACCEPT
#/sbin/iptables -A OUTPUT -p tcp -m tcp --dport 123 -j  ACCEPT

#############################################################
# Allowing me to ping from here and dealing in ICMP packets
/sbin/iptables -A INPUT -p icmp --icmp-type source-quench -j ACCEPT
/sbin/iptables -A INPUT -p icmp --icmp-type parameter-problem -j ACCEPT
/sbin/iptables -A INPUT -p icmp --icmp-type destination-unreachable -j
ACCEPT
/sbin/iptables -A INPUT -i eth0 -p icmp --icmp-type time-exceeded -j ACCEPT
/sbin/iptables -A OUTPUT -p icmp --icmp-type source-quench -j ACCEPT
/sbin/iptables -A OUTPUT -p icmp --icmp-type parameter-problem -j ACCEPT
/sbin/iptables -A OUTPUT -p icmp --icmp-type fragmentation-needed -j ACCEPT
/sbin/iptables -A OUTPUT -p icmp --icmp-type echo-request -m state --state
NEW -j ACCEPT
/sbin/iptables -A OUTPUT -o eth1 -p icmp --icmp-type
destination-unreachable -j ACCEPT
/sbin/iptables -A INPUT -i eth0 -p icmp --icmp-type ! echo-request -j LOG

############################################################
# Create some logging
/sbin/iptables -A INPUT -j LOG_DROP
/sbin/iptables -A OUTPUT -j LOG_DROP
/sbin/iptables -A LOG_DROP -j LOG --log-prefix "[IPTABLES DROP]:
" --log-tcp-options --log-ip-options
/sbin/iptables -A LOG_DROP -j DROP
/sbin/iptables -A LOG_ACCEPT -j LOG --log-prefix "[IPTABLES ACCEPT]:
" --log-tcp-options --log-ip-options
/sbin/iptables -A LOG_ACCEPT -j ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_dynaddr			#
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians	#Enable logging for
malformed Ip Address
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv4/conf/all/proxy_arp
echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects


