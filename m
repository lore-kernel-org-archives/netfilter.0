From: Zacky Ho <zackyho@yahoo.com>
Subject: (no subject)
Date: Wed, 29 Dec 2004 01:01:15 -0800 (PST)
Message-ID: <20041229090115.20936.qmail@web41215.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear all,
I have problem on configuring iptables in my home. I
used a linux box as gateway & firewall which installed
RedHat 9. There are two IP interfaces: One connects to
ISP (222.xxx.xxx.xxx) while another connects to
internal hub and shared with other private PC
(192.168.123.254). My Web server is Apache running on
W2K (192.168.123.222) and using 1080 as web access
port. My rc.firewall.txt has configured as follows.
Any mistakes on it? Please advise. Thanks in advance!
Zacky Ho.

#!/bin/sh
set -x
#
# rc.firewall - Initial SIMPLE IP Firewall script for
Linux 2.4.x and iptables
#
# Copyright (C) 2001  Oskar Andreasson
&lt;bluefluxATkoffeinDOTnet&gt;
#
# This program is free software; you can redistribute
it and/or modify
# it under the terms of the GNU General Public License
as published by
# the Free Software Foundation; version 2 of the
License.
#
# This program is distributed in the hope that it will
be useful,
# but WITHOUT ANY WARRANTY; without even the implied
warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General
Public License
# along with this program or from the site that you
downloaded it
# from; if not, write to the Free Software Foundation,
Inc., 59 Temple
# Place, Suite 330, Boston, MA  02111-1307   USA
#

###########################################################################
#
# 1. Configuration options.
#

#
# 1.1 Internet Configuration.
#

#INET_IP="61.10.148.25"
INET_IP="222.166.46.146"
INET_IFACE="eth1"
#INET_BROADCAST="194.236.50.255"

#
# 1.1.1 DHCP
#

#
# 1.1.2 PPPoE
#

#
# 1.2 Local Area Network configuration.
#
# your LAN's IP range and localhost IP. /24 means to
only use the first 24
# bits of the 32 bit IP address. the same as netmask
255.255.255.0
#

LAN_IP="192.168.123.254"
LAN_IP_RANGE="192.168.123.0/24"
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

/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_state

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

echo "1" > /proc/sys/net/ipv4/ip_forward

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
iptables -F
iptables -X

######
# 4.1 Filter table
#

#
# 4.1.1 Set policies
#

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

$IPTABLES -A INPUT   -j LOG --log-level DEBUG \
--log-prefix "DEBUG-INPUT:        "
$IPTABLES -A OUTPUT  -j LOG --log-level DEBUG \
--log-prefix "DEBUG_OUTPUT        "
$IPTABLES -A FORWARD -j LOG --log-level DEBUG \
--log-prefix "DEBUG-FORWARD:      "

#
# 4.1.2 Create userspecified chains
#

#
# Create chain for bad tcp packets
#

$IPTABLES -N bad_tcp_packets

#
# Create separate chains for ICMP, TCP and UDP to
traverse
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

$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags
SYN,ACK SYN,ACK \
-m state --state NEW -j REJECT --reject-with tcp-reset

$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state
--state NEW -j LOG \
--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state
--state NEW -j DROP

#
# allowed chain
#

$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A allowed -p TCP -j DROP
## added 20040403 from Thomas
$IPTABLES -A allowed -p TCP -j LOG --log-prefix
"FW-DroppedAllow:"
## added 20040403 from Thomas

#
# TCP rules
#

$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 21 -j
allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j
allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j
allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113 -j
allowed
#apache
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j
allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 8888 -j
allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 1080 -j
allowed
### added 2004 12 28
#$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 139 -j
allowed
###
# 
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 1580 -j
allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113 -j
allowed
# winmx
#$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 6699
-j allowed
# MTS
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 5080 -j
allowed
## added 2003 08 25
$IPTABLES -A tcp_packets -p TCP -j LOG --log-prefix
"FW-DroppedTCP: "
## added 2003 08 25


#
# UDP ports
#

$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port
53 -j ACCEPT
#if [ $DHCP == "yes" ] ; then
# $IPTABLES -A udp_packets -p UDP -s $DHCP_SERVER
--sport 67 \
# --dport 68 -j ACCEPT
#fi

#$IPTABLES -A udp_packets -p UDP -s 0/0
--destination-port 53 -j ACCEPT
#$IPTABLES -A udp_packets -p UDP -s 0/0
--destination-port 123 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --dport 20 -j
ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --dport 21 -j
ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --dport 22 -j
ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --dport 23 -j
ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0
--destination-port 2074 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0
--destination-port 4000 -j ACCEPT
# winmx
#$IPTABLES -A udp_packets -p UDP -s 0/0 --dport 6257
-j ACCEPT
#$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port
6257 -j ACCEPT
# MTS
$IPTABLES -A udp_packets -p UDP -s 0/0 --dport 500 -j
ACCEPT
#
#### added 2004 12 28 
#$IPTABLES -A udp_packets -p UDP -s 0/0 --dport 139 -j
ACCEPT
###

#
# In Microsoft Networks you will be swamped by
broadcasts. These lines 
# will prevent them from showing up in the logs.
#

$IPTABLES -A udp_packets -p UDP -i $INET_IFACE -d
$INET_BROADCAST \
--destination-port 135:139 -j DROP
$IPTABLES -A udp_packets -p UDP -i $INET_IFACE \
--destination-port 135:139 -j LOG --log-prefix
"FW-Dropped:    "
$IPTABLES -A udp_packets -p UDP -i $INET_IFACE \
--destination-port 135:139 -j DROP

## added 2003 08 25
$IPTABLES -A udp_packets -p UDP -i $INET_IFACE \
-j LOG --log-prefix "Dropped: "
## added 2003 08 25

#
# If we get DHCP requests from the Outside of our
network, our logs will 
# be swamped as well. This rule will block them from
getting logged.
#

#$IPTABLES -A udp_packets -p UDP -i $INET_IFACE -d
255.255.255.255 \
#--destination-port 67:68 -j DROP

#
# ICMP rules
#

$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8
-j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -i $INET_IFACE
--icmp-type 8 -j LOG \
--log-prefix "FW-DroppedEchoRep:  "
$IPTABLES -A icmp_packets -p ICMP -i $INET_IFACE
--icmp-type 8 -j DROP
$IPTABLES -A icmp_packets -p ICMP -i $LAN_IFACE -s
$LAN_IP_RANGE -j ACCEPT

$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type
11 -j ACCEPT

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
## Added 20040403 from Thomas
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s
$LAN_IP_RANGE -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -j ACCEPT
## Added 20040403 from Thomas
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s
$LAN_IP_RANGE -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j
ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j
ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j
ACCEPT

#
# Special rule for DHCP requests from LAN, which are
not caught properly
# otherwise. 
#

$IPTABLES -A INPUT -p UDP -i $LAN_IFACE --dport 67
--sport 68 -j ACCEPT

#
# Rules for incoming packets from the internet.
#

$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state
ESTABLISHED,RELATED \
-j ACCEPT
$IPTABLES -A INPUT -p TCP -i $INET_IFACE -j
tcp_packets
$IPTABLES -A INPUT -p UDP -i $INET_IFACE -j
udp_packets
$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j
icmp_packets

#
# If you have a Microsoft Network on the outside of
your firewall, you may 
# also get flooded by Multicasts. We drop them so we
do not get flooded by 
# logs
#

#$IPTABLES -A INPUT -i $INET_IFACE -d 224.0.0.0/8 -j
DROP

#
# Log weird packets that don't match the above.
#
## Added 20040403 from Thomas
$IPTABLES -A INPUT -m limit --limit 3/minute
--limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT INPUT packet
died:"
## Added 20040403 from Thomas
#$IPTABLES -A INPUT -m limit --limit 3/minute
--limit-burst 3 -j LOG \
#--log-level DEBUG --log-prefix "IPT INPUT packet
died:" 


#
# 4.1.5 FORWARD chain
#

#
# Bad TCP packets we don't want
#
## Added 20040403 from Thomas
$IPTABLES -A FORWARD -i $LAN_IFACE -p UDP  \
--destination-port 135:139 -j LOG --log-prefix
"FW-Dropped_135-139: "
$IPTABLES -A FORWARD -i $LAN_IFACE -p UDP  \
--destination-port 135:139 -j DROP
## Added 20040403 from Thomas

$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets

#
# Accept the packets we actually want to forward
#

$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state
ESTABLISHED,RELATED -j ACCEPT

#
# Log weird packets that don't match the above.
#

$IPTABLES -A FORWARD -m limit --limit 3/minute
--limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT FORWARD packet
died: "

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

$IPTABLES -A OUTPUT -m limit --limit 3/minute
--limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT OUTPUT packet
died: "

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
# 4.2.5 POSTROUTING chain Added on 20041226 by zacky
#
$IPTABLES -t nat -A PREROUTING -p tcp -i $INET_IFACE
-d 222.166.46.146 --dport 1080 -j DNAT \
--to-destination 192.168.123.222:1080
$IPTABLES -A FORWARD -p tcp -i $LAN_IFACE -d
192.168.123.222 --dport 1080 -j ACCEPT

#
# Enable simple IP Forwarding and Network Address
Translation
#

$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT
--to-source $INET_IP

#
# 4.2.6 OUTPUT chain
#

######
# 4.3 mangle table
#

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




		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - Helps protect you from nasty viruses. 
http://promotions.yahoo.com/new_mail

