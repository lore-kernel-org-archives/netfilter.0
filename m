From: "Ricardo C" <racham@hotmail.com>
Subject: Please, see this firewall and say (have pity...:)
Date: Thu, 10 Jun 2004 01:36:28 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY1-DAV32gyeG6Hbit000332cc@hotmail.com>
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

I have a Intranet with clients Win XP and a server-router for exit to Internet Debian Woody with iptables
making NAT.
I want that a client (host 192.168.111.2) can download and upload files with eMule and I want that this host
doesn't have Low ID of eMule. For that I have opened the ports and redirected the packages TCP/UDP toward the
client.All the rules are copied from Oskar Andreasson tutorial, except those of FORWARD AND PREROUTING referred
to eMule ports.
But I'm not sure if I made it well.
You could give me your opinions????
I want to open up exclusively the necessary ports but I want to maintain the highest security in the rest.
I paste a copy of the iptables script below so that see it (maximize the window to see better the script)
--------------------------paste--------------------------------------------------------------------------------
--------------------------------------------------
#!/bin/sh
/etc/init.d/iptables clear

INET_IFACE="eth0"
INET_IP=$(ipofif eth0)

LAN_IFACE="eth1"
LAN_IP="192.168.111.1"
LAN_IP_RANGE="192.168.111.0/8"

LO_IFACE="lo"
LO_IP="127.0.0.1"

IPTABLES="/sbin/iptables"

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

$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 4661 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 4662 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 4711 -j allowed

#
# UDP ports
#

$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 2074 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 4000 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 4665 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 4672 -j ACCEPT

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
# INPUT chain
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
# Rules for incoming packets from the internet.
#

$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state ESTABLISHED,RELATED \
-j ACCEPT
$IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets
$IPTABLES -A INPUT -p UDP -i $INET_IFACE -j udp_packets
$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets

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
# Accept the packets we actually want to forward (Ports 4661, 4662, 4711, 4665, 4672 are for eMule)
#

$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 4661 -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 4662 -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 4711 -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 4000 -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 4665 -j ACCEPT
$IPTABLES -A FORWARD -p udp --dport 4672 -j ACCEPT

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
# 4.2.4 PREROUTING chain (Ports 4661, 4662, 4711, 4665, 4672 for eMule forward to host 192.168.111.2, the one
that running eMule)
#
$IPTABLES -t nat -A PREROUTING -p tcp -d $INET_IP --dport 4661 -j DNAT --to-destination 192.168.111.2:4661
$IPTABLES -t nat -A PREROUTING -p tcp -d $INET_IP --dport 4662 -j DNAT --to-destination 192.168.111.2:4662
$IPTABLES -t nat -A PREROUTING -p tcp -d $INET_IP --dport 4711 -j DNAT --to-destination 192.168.111.2:4711
$IPTABLES -t nat -A PREROUTING -p UDP -d $INET_IP --dport 4000 -j DNAT --to-destination 192.168.111.2:4000
$IPTABLES -t nat -A PREROUTING -p UDP -d $INET_IP --dport 4665 -j DNAT --to-destination 192.168.111.2:4665
$IPTABLES -t nat -A PREROUTING -p UDP -d $INET_IP --dport 4672 -j DNAT --to-destination 192.168.111.2:4672

#
# Enable Network Address Translation
#

$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP

#
#Save settings
#

/etc/init.d/iptables save active
-------------------------------------------------------------------end
paste------------------------------------------------------------------------------------

Thanks to all to help me
Regards
Richard

