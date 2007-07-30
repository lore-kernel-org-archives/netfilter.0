From: richard <rich@thevillas.eclipse.co.uk>
Subject: check a simple set of rules
Date: Mon, 30 Jul 2007 15:11:26 +0100
Message-ID: <46ADF18E.3070502@thevillas.eclipse.co.uk>
References: <C2AFB97A.1D36E%robert@leblancnet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <C2AFB97A.1D36E%robert@leblancnet.us>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Hi,

i'm relatively new to putting together my own set of iptables as opposed 
to just using a tool that build them for me. Hence, i'm not very 
confident in a set that I have manually constructed.
I was wondering whether anybody would be good enough to scan over the 
set below and point any blunders/omissions?

My set up is such that I have a firewall with 2 network cards, one 
attached to the LAN and one external facing. I have a webserver that 
sits on a box behind the firewall. I also have a number of boxes on the 
LAN that I want to be able to ssh to remotely. I also want users on the 
LAN to be able to browse to the web server by using the external facing 
address.

Thanks in advance,

Rich

#!/bin/sh
#

###########################################################################
#
# 1. Configuration options.
#

#
# Internet Configuration.
#

INET_IP="*.*.*.*"
INET_IFACE="eth0"
INET_BROADCAST="*.*.*.*"

# Local Area Network configuration.
#


LAN_IP="192.168.1.118"
LAN_IP_RANGE="192.168.1.0/24"
LAN_IFACE="eth1"
LO_IFACE="lo"
LO_IP="127.0.0.1"


IPTABLES="/sbin/iptables"

#
# Other Configuration.
#

###########################################################################
#
# 2. Module loading.
#

#
# Needed to initially load modules
#

/sbin/depmod -a

#
# Required modules
#

/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_state

#
# Non-Required modules
#

/sbin/modprobe ip_conntrack_ftp     #need this to allow outgoing ftp 
connections

/sbin/modprobe ip_nat_ftp        #need this to allow outgoing ftp 
connections



############################################################################
# 3. rules set up.
#

######
# Filter table
#

#
# Set policies
#

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

#
# Create chain for bad tcp packets
#

$IPTABLES -N bad_tcp_packets

#
# Create separate chains for ICMP, TCP and UDP to traverse
#

$IPTABLES -N allowed
$IPTABLES -N tcp_packets
$IPTABLES -N udp_packets
$IPTABLES -N icmp_packets

#
# Create content in userspecified chains
#

#
# bad_tcp_packets chain
#

$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK -m state 
--state NEW -j REJECT --reject-with tcp-reset
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG 
--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

#
# allowed chain
#

$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A allowed -p TCP -j DROP

#
# TCP rules
#


$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 2222 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 2223 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 2224 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 2225 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 443 -j allowed


#
# UDP ports
#


$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 123 -j ACCEPT 
# allow ntp


#
# In Microsoft Networks you will be swamped by broadcasts. These lines
# will prevent them from showing up in the logs.
#

$IPTABLES -A udp_packets -p UDP -i $INET_IFACE -d $INET_BROADCAST 
--destination-port 135:139 -j DROP

#
# If we get DHCP requests from the Outside of our network, our logs will
# be swamped as well. This rule will block them from getting logged.
#

$IPTABLES -A udp_packets -p UDP -i $INET_IFACE -d 255.255.255.255 
--destination-port 67:68 -j DROP

#
# ICMP rules
#

#$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT #don't 
allow people to ping us
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

###############################################
# INPUT chain
#

#
# Bad TCP packets we don't want.
#

$IPTABLES -A INPUT -p tcp -j bad_tcp_packets

#
# Rules for special networks not part of the Internet
#

$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j ACCEPT

#
# Special rule for DHCP requests from LAN, which are not caught properly
# otherwise.
#

$IPTABLES -A INPUT -p UDP -i $LAN_IFACE --dport 67 --sport 68 -j ACCEPT

#
# Rules for incoming packets from the internet.
#

$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state 
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets
$IPTABLES -A INPUT -p UDP -i $INET_IFACE -j udp_packets
$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets

#
# If you have a Microsoft Network on the outside of your firewall, you may
# also get flooded by Multicasts. We drop them so we do not get flooded by
# logs
#

#$IPTABLES -A INPUT -i $INET_IFACE -d 224.0.0.0/8 -j DROP

#
# Log weird packets that don't match the above.
#

$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG 
--log-level DEBUG --log-prefix "IPT INPUT packet died: "


#####
# FORWARD chain
#

#
# Bad TCP packets we don't want
#

$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets

#
# Accept the packets we actually want to forward
#

$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#
# Log weird packets that don't match the above.
#

$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG 
--log-level DEBUG --log-prefix "IPT FORWARD packet died: "

#####
# OUTPUT chain
#

#
# Bad TCP packets we don't want.
#

$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets

#
# Special OUTPUT rules to decide which IP's to allow.
#

$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT

#
# Log weird packets that don't match the above.
#

$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG 
--log-level DEBUG --log-prefix "IPT OUTPUT packet died: "


###########################################################################
#
# 4. /proc set up.
#

#
# Required proc configuration
#

echo "1" > /proc/sys/net/ipv4/ip_forward


###########################################################################




###########################################################################
# 5. nat table

#
# PREROUTING chain
#
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to 
192.168.1.110:80
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j DNAT --to 
192.168.1.110:443
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2222 -j DNAT --to 
192.168.1.110:22
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2223 -j DNAT --to 
192.168.1.154:22
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2224 -j DNAT --to 
192.168.1.153:22
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2225 -j DNAT --to 
192.168.1.141:22

#
# POSTROUTING chain
#

#
# Enable simple IP Forwarding and Network Address Translation
#

$IPTABLES -t nat -A POSTROUTING -p tcp -s 192.168.1.0/24 -d $INET_IP 
--dport 80 -j SNAT --to-source $LAN_IP #deal with connections to the web 
server on the external address that originate from the LAN
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP




