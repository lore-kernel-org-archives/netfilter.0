From: "Ricardo C" <racham@hotmail.com>
Subject: Stealth on emule....
Date: Mon, 7 Jun 2004 11:34:50 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY1-DAV54XsNQptgFr000169b4@hotmail.com>
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

I have a LAN with Windows XP clients and cablemodem exit to Internet thru a router Debian Woody with iptables.
I need that one of the clients (192.168.111.2) can to download and upload files with eMule.
I applied in the router the iptables rules given by Oskar Andreason in their tutorial and I opened the ports
(tcp and udp) 4661, 4662, 4665, 4672, 4711.
BUT the eMule continues giving Low ID to client. With an external ports-scan on the router I find that these
ports continue presenting to eMule as stealth, in spite of the fact that I opened them.
I need to know if what I made to open these ports is well. Please you could revise the rules that I paste below
and tell me if they are OK??? Because if they are OK my ISP is filtering the ports corresponding to the eMule.

-----------------------------paste iptables rules from here-----------
#!/bin/sh
/etc/init.d/iptables clear

# 1.1 Internet Configuration.
#

INET_IFACE="eth0"
INET_IP=$(ipofif eth0)

#
# 1.1.1 DHCP
#

#
# 1.1.2 PPPoE
#

#
# 1.2 Local Area Network configuration.
#
# your LAN's IP range and localhost IP. /24 means to only use the first 24
# bits of the 32 bit IP address. the same as netmask 255.255.255.0
#

LAN_IFACE="eth1"
LAN_IP="192.168.111.1"
LAN_IP_RANGE="192.168.111.0/8"

#
# 1.3 DMZ Configuration.
#

#
# 1.4 Localhost Configuration.
#

LO_IFACE="lo"
LO_IP="127.0.0.1"

#
# 1.5 IPTables Configuration.
#

IPTABLES="/sbin/iptables"

#
# 1.6 Other Configuration.
#

###########################################################################
#
# 2. Module loading.
#

#
# Needed to initially load modules
#
#
#/sbin/depmod -a
#
#
# 2.1 Required modules
#
#
#/sbin/modprobe ip_tables
#/sbin/modprobe ip_conntrack
#/sbin/modprobe iptable_filter
#/sbin/modprobe iptable_mangle
#/sbin/modprobe iptable_nat
#/sbin/modprobe ipt_LOG
#/sbin/modprobe ipt_limit
#/sbin/modprobe ipt_state

#
# 2.2 Non-Required modules
#

#/sbin/modprobe ipt_owner
#/sbin/modprobe ipt_REJECT
#/sbin/modprobe ipt_MASQUERADE
#/sbin/modprobe ip_conntrack_ftp
#/sbin/modprobe ip_conntrack_irc
#/sbin/modprobe ip_nat_ftp
#/sbin/modprobe ip_nat_irc

###########################################################################
#
# 3. /proc set up.
#

#
# 3.1 Required proc configuration
#

#echo "1" > /proc/sys/net/ipv4/ip_forward

#
# 3.2 Non-Required proc configuration
#

#echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter
#echo "1" > /proc/sys/net/ipv4/conf/all/proxy_arp
#echo "1" > /proc/sys/net/ipv4/ip_dynaddr

###########################################################################
#
# 4. rules set up.
#

######
# 4.1 Filter table
#

#
# 4.1.1 Set policies
#

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

#
# 4.1.2 Create userspecified chains
#

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
# 4.1.3 Create content in userspecified chains
#

#
# bad_tcp_packets chain
#

$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK \
-m state --state NEW -j REJECT --reject-with tcp-reset
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG \
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

#$IPTABLES -A tcp_packets -p TCP -s $LAN_IP_RANGE --dport 21 -j allowed
#$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
#$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 4661 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 4662 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 4711 -j allowed

#
# UDP ports
#

#$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 53 -j ACCEPT
#$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 23 -j ACCEPT
#$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 80 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 2074 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 4000 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 4665 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 4672 -j ACCEPT

#
# In Microsoft Networks you will be swamped by broadcasts. These lines
# will prevent them from showing up in the logs.
#

#$IPTABLES -A udp_packets -p UDP -i $INET_IFACE -d $INET_BROADCAST \
#--destination-port 135:139 -j DROP

#
# If we get DHCP requests from the Outside of our network, our logs will
# be swamped as well. This rule will block them from getting logged.
#

$IPTABLES -A udp_packets -p UDP -i $INET_IFACE -d 255.255.255.255 \
--destination-port 67:68 -j DROP

#
# ICMP rules
#

$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j DROP
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j DROP

#
# 4.1.4 INPUT chain
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

#$IPTABLES -A INPUT -p UDP -i $LAN_IFACE --dport 67 --sport 68 -j ACCEPT

#
# Rules for incoming packets from the internet.
#

$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state ESTABLISHED,RELATED \
-j ACCEPT
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

$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT INPUT packet died: "

#
# 4.1.5 FORWARD chain
#
#$IPTABLES -t nat -A PREROUTING -p tcp -d $INET_IP --dport 80 -j DNAT --to-destination 192.168.111.2:80
$IPTABLES -t nat -A PREROUTING -p tcp -d $INET_IP --dport 4661 -j DNAT --to-destination 192.168.111.2:4661
$IPTABLES -t nat -A PREROUTING -p tcp -d $INET_IP --dport 4662 -j DNAT --to-destination 192.168.111.2:4662
$IPTABLES -t nat -A PREROUTING -p UDP -d $INET_IP --dport 4665 -j DNAT --to-destination 192.168.111.2:4665
$IPTABLES -t nat -A PREROUTING -p UDP -d $INET_IP --dport 4672 -j DNAT --to-destination 192.168.111.2:4672

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

$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT FORWARD packet died: "

#
# 4.1.6 OUTPUT chain
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

$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT OUTPUT packet died: "

######
# 4.2 nat table
#

#
# 4.2.1 Set policies
#

#
# 4.2.2 Create user specified chains
#

#
# 4.2.3 Create content in user specified chains
#

#
# 4.2.4 PREROUTING chain
#

#
# 4.2.5 POSTROUTING chain
#

#
# Enable simple IP Forwarding and Network Address Translation
#

$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP

#
# 4.2.6 OUTPUT chain
#

######
# 4.3 mangle table
#Mark paquetes segun IPs, para sfq (QoS)(ver script /etc/init.d/cbq.init)

#$IPTABLES -A FORWARD -s 192.168.111.2 -t mangle -j MARK --set-mark 1
#$IPTABLES -A FORWARD -s 192.168.111.3 -t mangle -j MARK --set-mark 2
#$IPTABLES -A FORWARD -s 192.168.111.4 -t mangle -j MARK --set-mark 3

#
# 4.3.1 Set policies
#

#
# 4.3.2 Create user specified chains
#

#
# 4.3.3 Create content in user specified chains
#

#
# 4.3.4 PREROUTING chain
#

#
# 4.3.5 INPUT chain
#

#
# 4.3.6 FORWARD chain
#

#
# 4.3.7 OUTPUT chain
#

#
# 4.3.8 POSTROUTING chain
#

#
#Guardando seteos en el inicio
#

/etc/init.d/iptables save active

-----------------end paste------------------------------------------

Thank you for the help and the patience. . . ;)
Regards
Richard
Buenos Aires
Argentina


