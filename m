From: David Collodel <dave@crawlspaceradio.com>
Subject: RE: DMZ trouble!
Date: 09 Jan 2003 00:34:56 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042090495.2320.216.camel@jimmy>
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

Perhaps it would help if I included my entire script? Or at least the
relevant parts of it.

Thanks for any help you can offer.

#
# 1.1 Internet Configuration.
#

#
# 1.1.1 Device and network configs.
#

EXT_IFACE="eth0"				# External Interface
LAN_IFACE="eth1"				# Internal Interface
DMZ_IFACE="eth2"				# DMZ Interface
LO_IFACE="lo"					# Loopback Interface
GATEWAY="66.91.171.1"				# Our External gateway.
EXT_IP="66.92.171.151"				# Primary IP address of $EXT_IFACE
NET_BCAST="66.92.171.255"			# Broadcast addy of external (ISP's) net.

#
# 1.1.2 Define our "real" ip's to be NAT'ed
#       More can be added, but additional rules will need to be created
#       below to specify their access.
#

HTTP_IP="66.92.171.152"				# WWW server IP
DNS_IP="66.92.171.150"				# Mail, DNS IP
SQL_IP="66.92.171.149"				# Data service IP



#
# 1.1.3 Local Area Network configuration.
#
# LAN IP range and localhost IP. /24 means to only use the first 24
# bits of the 32 bit IP address. the same as netmask 255.255.255.0
#

LAN_IP="172.16.11.1"				# IP bound to $LAN_IFACE
LAN_NET="172.16.11.0/24"			# Internal Net range
LAN_BCAST="172.16.11.255"			# LAN Broadcast Address

#
# 1.1.4 DMZ Configuration.
#

DMZ_HTTP_IP="172.16.12.2"			# IP where $HTTP_IP will be NAT'ed
DMZ_DNS_IP="172.16.12.3"			# IP where $DNS_IP will be NAT'ed
DMZ_SQL_IP="172.16.12.4"			# IP where $SQL_IP will be NAT'ed
DMZ_IP="172.16.12.1"				# IP bound to $DMZ_IFACE
DMZ_NET="172.16.12.0/24"			# DMZ Network range
DMZ_BCAST="172.16.12.255"			# DMZ Broadcast Address

#
# 1.1.5 Localhost Configuration.
#

LO_IP="127.0.0.1"

#
# 1.2 IPTables Configuration.
#

#
# 1.2.1 Define IPtables binary

IPTABLES="/sbin/iptables"


#
# 2. rules set up.
#


# 2.1 Filter table
#

#
# 2.1.1 Set policies first, then flush chains
#

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

$IPTABLES -F

$IPTABLES -F INPUT
$IPTABLES -F OUTPUT
$IPTABLES -F FORWARD

$IPTABLES -F -t mangle
$IPTABLES -t mangle -X

$IPTABLES -X

#
# 2.2 Create userspecified chains
#

#
# 2.2.1 Create chain for bad tcp packets
#

$IPTABLES -N bad_tcp_packets
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG
\
--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

## DROP packets associated with an "INVALID" connection.
$IPTABLES -A bad_tcp_packets -m state --state INVALID $LOG "INVALID
STATE: "
$IPTABLES -A bad_tcp_packets -m state --state INVALID -j DROP


#
# 2.2.2 Create chain to handle various stateful connections
#

$IPTABLES -N KEEP_STATE
$IPTABLES -F KEEP_STATE

## ACCEPT certain packets which are starting a new connection or are
## related to an established connection.
$IPTABLES -A KEEP_STATE -p TCP --syn -j ACCEPT
$IPTABLES -A KEEP_STATE -m state --state RELATED,ESTABLISHED -j ACCEPT

## ACCEPT packets whose input interface is anything but the external
interface.
$IPTABLES -A KEEP_STATE -i ! $EXT_IP -m state --state NEW -j ACCEPT

## DROP packets associated with an "INVALID" connection.
$IPTABLES -A KEEP_STATE -m state --state INVALID $LOG "INVALID STATE: "
$IPTABLES -A KEEP_STATE -m state --state INVALID -j DROP

## Drop the rest
$IPTABLES -A KEEP_STATE -p TCP -j DROP

#
# 2.2.3 Create chain for ICMP control
#

$IPTABLES -N icmp_packets
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 3 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 4 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

#
# 2.3  INPUT chain
#

#
# 2.3.1 Take out the nasties first.
#

$IPTABLES -A INPUT -p tcp -j bad_tcp_packets

#
# 2.3.2 Filter ICMP Packets from the Internet to this box
#

$IPTABLES -A INPUT -p ICMP -i $EXT_IFACE -j icmp_packets

#
# 2.3.3 Packets from LAN, DMZ or LOCALHOST
#
# From External Interface, for SSH management
$IPTABLES -A INPUT -p TCP -i $EXT_IFACE -d $EXT_IP --dport 22 -j ACCEPT

# From DMZ Interface to DMZ firewall IP
$IPTABLES -A INPUT -p ALL -i $DMZ_IFACE -d $DMZ_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $DMZ_IFACE -s $DMZ_IP -d $DMZ_NET -j
KEEP_STATE

# From LAN Interface to LAN firewall IP
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -d $LAN_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -d $LAN_BCAST -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -d $LAN_NET -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_NET -d $LAN_IP -j ACCEPT

# From Localhost interface to Localhost IP's
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $EXT_IP -j ACCEPT

# Special rule for DHCP requests from LAN, which are not caught properly
# otherwise.
$IPTABLES -A INPUT -p UDP -i $LAN_IFACE --dport 67 --sport 68 -j ACCEPT

# All established and related packets incoming from the internet to the
# firewall
$IPTABLES -A INPUT -p ALL -d $EXT_IP -m state --state
ESTABLISHED,RELATED \
-j ACCEPT

# Prevent MS multicast from nailing the logs.
$IPTABLES -A INPUT -i $EXT_IFACE -d 224.0.0.0/8 -j DROP

# Log weird packets that don't match the above.
$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT INPUT packet died: "

#
# 2.4 Forward chain
#

#
# 2.4.1 Take out the nasties first.
#

$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets


#
# 2.4.2 DMZ section
#

# General rules

$IPTABLES -A FORWARD -i $DMZ_IFACE -o $EXT_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $EXT_IFACE -o $DMZ_IFACE -m state \
--state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $LAN_IFACE -o $DMZ_IFACE -j KEEP_STATE
$IPTABLES -A FORWARD -i $DMZ_IFACE -o $LAN_IFACE -m state \
--state ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A FORWARD -p icmp -i $DMZ_IFACE -j icmp_packets

# HTTP server
$IPTABLES -A FORWARD -p TCP -i $EXT_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_IP
--dport 80 -j KEEP_STATE
$IPTABLES -A FORWARD -p TCP -i $EXT_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_IP
--dport 443 -j KEEP_STATE
$IPTABLES -A FORWARD -p TCP -i $EXT_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_IP
--dport 8000 -j KEEP_STATE
$IPTABLES -A FORWARD -p TCP -i $EXT_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_IP
--dport 8001 -j KEEP_STATE
$IPTABLES -A FORWARD -p TCP -i $EXT_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_IP
--dport 22 -j KEEP_STATE
$IPTABLES -A FORWARD -p ICMP -i $EXT_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_IP
-j icmp_packets

# DNS server
$IPTABLES -A FORWARD -p TCP -i $EXT_IFACE -o $DMZ_IFACE -d $DMZ_DNS_IP
--dport 53 -j KEEP_STATE
$IPTABLES -A FORWARD -p UDP -i $EXT_IFACE -o $DMZ_IFACE -d $DMZ_DNS_IP
--dport 53 -j ACCEPT
$IPTABLES -A FORWARD -p TCP -i $EXT_IFACE -o $DMZ_IFACE -d $DMZ_DNS_IP
--dport 443 -j KEEP_STATE
$IPTABLES -A FORWARD -p TCP -i $EXT_IFACE -o $DMZ_IFACE -d $DMZ_DNS_IP
--dport 25 -j KEEP_STATE
$IPTABLES -A FORWARD -p TCP -i $EXT_IFACE -o $DMZ_IFACE -d $DMZ_DNS_IP
--dport 22 -j KEEP_STATE
$IPTABLES -A FORWARD -p TCP -i $EXT_IFACE -o $DMZ_IFACE -d $DMZ_DNS_IP
--dport 995 -j KEEP_STATE
$IPTABLES -A FORWARD -p ICMP -i $EXT_IFACE -o $DMZ_IFACE -d $DMZ_DNS_IP
-j icmp_packets

#
# 2.4.3 LAN section
#

$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Log weird packets that don't match the above.
$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT FORWARD packet died: "


#
# 2.5 OUTPUT chain
#

#
# 2.5.1 Take out the nasties first
#

$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets

#
# Special OUTPUT rules to decide which IP's to allow.
#

$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $LAN_NET -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $EXT_IP -j ACCEPT

# Log weird packets that don't match the above.
$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT OUTPUT packet died: "

#
# 3 NAT table
#

#
# 3.1 Flush the NAT table
#

$IPTABLES -F -t nat


#
# 3.2 PREROUTING chain
#

#
# 3.2.3 DMZ DNAT
#

$IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP --dport
80 -j DNAT --to-destination $DMZ_HTTP_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP --dport
22 -j DNAT --to-destination $DMZ_HTTP_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP --dport
443 -j DNAT --to-destination $DMZ_HTTP_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP --dport
8000 -j DNAT --to-destination $DMZ_HTTP_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $HTTP_IP --dport
8001 -j DNAT --to-destination $DMZ_HTTP_IP

$IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
53 -j DNAT --to-destination $DMZ_DNS_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $EXT_IFACE -d $DNS_IP --dport
53 -j DNAT --to-destination $DMZ_DNS_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
443 -j DNAT --to-destination $DMZ_DNS_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
22 -j DNAT --to-destination $DMZ_DNS_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
25 -j DNAT --to-destination $DMZ_DNS_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $EXT_IFACE -d $DNS_IP --dport
995 -j DNAT --to-destination $DMZ_DNS_IP

#
# 3.3 POSTROUTING chain
#

#
# 3.3.1 Enable simple IP Forwarding and Network Address Translation
#

$IPTABLES -t nat -A POSTROUTING -o $EXT_IFACE -j SNAT --to-source
$EXT_IP


-- 
David Collodel <dave@crawlspaceradio.com>


