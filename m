From: DALive Editor <dalive@flashmail.com>
Subject: IPTABLES Nightmare - Save Me
Date: Mon, 04 Aug 2003 19:43:30 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2EEFA2.4040208@flashmail.com>
Reply-To: dalive@flashmail.com
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


	

Iptable seems flawed (DNAT)

Hey Linux network people...I'm really stumped, I'm starting to wonder if 
the problem is not with Iptables itself, here's avery brief history. I 
was trying to setup a VOIP device and software on one fo the client 
machines unsuccessfully. So i decided to start with something simpler, 
ie. running a Web Server on one of the client PC's temporarily. Well the 
plan was to DNAT traffic directed to port 8080 from ny Internet NIC to 
192.168.100.11:80...well needless to say this has not worked. Using 
Ethereal I can see the packets coming into the interface with the 
gateway as the destination on port 8080, yet the packets just don't seem 
to get to the client.. I adding my slightly untidy Firewall script 
below...please tell me i've made a very stupid mistake. FYI. things seem 
to get masquraded quite well from my clients and my IP is dynamic

Thanks a million
_______________________________________
###########################################################################
#
# 1. Configuration options.
#

#
# 1.1 Internet Configuration.
#

INET_IFACE="eth1"

#
# 1.1.1 DHCP
#

#
# Information pertaining to DHCP over the Internet, if needed.
#
# Set DHCP variable to no if you don't get IP from DHCP. If you get DHCP
# over the Internet set this variable to yes, and set up the proper IP
# address for the DHCP server in the DHCP_SERVER variable.
#

DHCP="yes"
DHCP_SERVER=""

#
# 1.1.2 PPPoE
#

# Configuration options pertaining to PPPoE.
#
# If you have problem with your PPPoE connection, such as large mails not
# getting through while small mail get through properly etc, you may set
# this option to "yes" which may fix the problem. This option will set a
# rule in the PREROUTING chain of the mangle table which will clamp
# (resize) all routed packets to PMTU (Path Maximum Transmit Unit).
#
# Note that it is better to set this up in the PPPoE package itself, since
# the PPPoE configuration option will give less overhead.
#

PPPOE_PMTU="no"

#
# 1.2 Local Area Network configuration.
#
# your LAN's IP range and localhost IP. /24 means to only use the first 24
# bits of the 32 bit IP address. the same as netmask 255.255.255.0
#

LAN_IP="192.168.100.1"
LAN_IP_RANGE="192.168.100.0/24"
LAN_IFACE="eth0"

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

/sbin/depmod -a

#
# 2.1 Required modules
#

/sbin/modprobe ip_conntrack
/sbin/modprobe ip_tables
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_MASQUERADE

#
# 2.2 Non-Required modules
#

#/sbin/modprobe ipt_owner
#/sbin/modprobe ipt_REJECT
/sbin/modprobe ip_conntrack_ftp
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

echo "1" > /proc/sys/net/ipv4/ip_forward

#
# 3.2 Non-Required proc configuration
#

#echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter
#echo "1" > /proc/sys/net/ipv4/conf/all/proxy_arp
echo "1" > /proc/sys/net/ipv4/ip_dynaddr

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
$IPTABLES -N allaccess
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
# allaccess chain
#

$IPTABLES -A allaccess -p TCP -j LOG --log-prefix "Port Forwarding: "
$IPTABLES -A allaccess -p TCP -j ACCEPT


#
# TCP rules
#
#-ftp ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 20 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 21 -j allowed
#-ssh ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
#-http ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j ACCEPT
#-Email ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 25 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --source-port 25 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 110 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113 -j allowed
#-squid ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 3128 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 443 -j allowed
#-MSN Messenger ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 6891:6901 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 1863 -j allowed
#-Kazaa ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 1214 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 2608 -j allowed
#-Interent Switchboard ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 7750:7751 -j allaccess
#-Abyss Web Server
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 8080 -j ACCEPT


#
# UDP ports
#

$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port 53 -j ACCEPT
if [ $DHCP == "yes" ] ; then
$IPTABLES -A udp_packets -p UDP -s 0/0 --sport 67 \
--dport 68 -j ACCEPT
fi

$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port 53 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port 123 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port 2074 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port 4000 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port 1863 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port 6901 -j ACCEPT
#-Internet Switchboard port
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 7750:7751 -j 
ACCEPT

#
# If we get DHCP requests from the Outside of our network, our logs will
# be swamped as well. This rule will block them from getting logged.
#

#$IPTABLES -A udp_packets -p UDP -i $INET_IFACE -d 255.255.255.255 \
#--destination-port 67:68 -j DROP

#
# ICMP rules
#

$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

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
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -j ACCEPT

#
# Special rule for DHCP requests from LAN, which are not caught properly
# otherwise.
#

$IPTABLES -A INPUT -p UDP -i $LAN_IFACE --dport 67 --sport 68 -j ACCEPT

#
# Rules for incoming packets from the internet.
#

$IPTABLES -A INPUT -p ALL -i $INET_IFACE -m state --state 
ESTABLISHED,RELATED \
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
# Forward some ports
#

$IPTABLES -A FORWARD -p tcp -i $INET_IFACE --dport 7750:7751 -j ACCEPT
$IPTABLES -A FORWARD -p udp -i $INET_IFACE --dport 7750:7751 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -i $INET_IFACE --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -i $INET_IFACE -d 192.168.100.11 --dport 80 
-j ACCEPT
$IPTABLES -A FORWARD -p tcp -i $LAN_IFACE --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 4662 -j ACCEPT


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
$IPTABLES -A OUTPUT -p ALL -o $INET_IFACE -j ACCEPT

#
# Log weird packets that don't match the above.
#

$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT OUTPUT packet died: "

######
# 4.2 nat table
#
#
# 4.2.4 PREROUTING chain
#
#
#Port forwarding
#

$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp --dport 7750:7751 
-j DNAT --to 192.168.100.12
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p udp --dport 7750:7751 
-j DNAT --to 192.168.100.12
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp --dport 4662 -j 
DNAT --to 192.168.100.11
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp --dport 8080 -j 
DNAT --to 192.168.100.11:80
$IPTABLES -t nat -A PREROUTING -i $LAN_IFACE -p tcp --dport 8080 -j DNAT 
--to 192.168.100.11:80


#
# 4.2.5 POSTROUTING chain
#

if [ $PPPOE_PMTU == "yes" ] ; then
$IPTABLES -t nat -A POSTROUTING -p tcp --tcp-flags SYN,RST SYN \
-j TCPMSS --clamp-mss-to-pmtu
fi
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j MASQUERADE




