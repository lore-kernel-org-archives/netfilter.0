From: Cristian Goian <cfgoian@yahoo.com>
Subject: Re: NAT working for TCP and _NOT_ working for UDP
Date: Fri, 19 Dec 2003 09:31:32 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031219173132.65901.qmail@web40709.mail.yahoo.com>
References: <200312190039.15492.Alistair Tonner <>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-445575215-1071855092=:64726"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312190039.15492.Alistair Tonner <>>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Alistair@yahoo.com, netfilter@lists.netfilter.org

--0-445575215-1071855092=:64726
Content-Type: text/plain; charset=us-ascii

Hi
My mistake not give in enoght data. I'll start from begining because I made some modifications:
So I have a gatewayPC:
eth0 - INTERNET
eth1 - LAN - 192.168.1.0/24
eth2 - DMZ - 192.168.0.0/24
 
In DMZ I have 2 PC, one for web and one for content DNS, both deserv same 3 domains. IP a.b.c.240/28 and I want DNAT for them.
 
On gatewayPC I have now RedHAT with 2.4.23 and iptables 1.2.9. Also have now a proxy DNS to give answers to LAN and localhost. Also, temporary, I have mailserver to receive and send mail for LAN and 3 domains.
 
To configure iptables I use a script modified after Oskar Andeasson' Tutorial. It is a long script now.
 
When I conect from LAN on web server using IP adress it is OK. When a query DNS (different PC than web one) no respons. 
When I give traceroute to DNS server all packets go to my ISP, and then lost ... They are not DNAT to DMZ !!
 
Below are the script. Many thanks in advance.
 
#!/bin/sh
#
# rc.DMZ.firewall - DMZ IP Firewall script for Linux 2.4.x and iptables
#
# Copyright (C) 2001  Oskar Andreasson &lt;bluefluxATkoffeinDOTnet&gt;
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program or from the site that you downloaded it
# from; if not, write to the Free Software Foundation, Inc., 59 Temple
# Place, Suite 330, Boston, MA  02111-1307   USA
#
###########################################################################
#
# 1. Configuration options.
#
#
# 1.1 Internet Configuration.
#
INET_IP="x.y.z.w"
INET_BROADCAST="x.y.z.255"
INET_IFACE="eth0"
# For the first domain :
HTTP_1_IP="a.b.c.250"
DNS_1A_IP="a.b.c.242"
DNS_1B_IP="a.b.c.244"
SMTP_1_IP="a.b.c.246"
#FTP_1_IP
# For the second domain :
HTTP_2_IP="a.b.c.251"
DNS_2A_IP="a.b.c.243"
DNS_2B_IP="a.b.c.245"
SMTP_2_IP="a.b.c.253"
# For the third domain :
HTTP_3_IP="a.b.c.252"
DNS_3A_IP="a.b.c.248"
DNS_3B_IP="a.b.c.249"
SMTP_3_IP="a.b.c.246"

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
LAN1_IP="192.168.1.1"
LAN1_IP_RANGE1="192.168.1.0/24"
LAN1_BCAST_ADRESS="192.168.1.255"
LAN1_IFACE="eth1"

#
# 1.3 DMZ Configuration.
#
DMZ_IFACE="eth2"
DMZ_IP="192.168.0.1"
DMZ_BCAST_ADRESS="192.168.0.255"
DMZ_HTTP_1_IP="192.168.0.250"
DMZ_DNS_1A_IP="192.168.0.2"
#DMZ_DNS_1B_IP="192.168.0.3"
DMZ_DNS_1B_IP="192.168.0.2"
#DMZ_FTP_1_IP="192.168.0.3"
DMZ_HTTP_2_IP="192.168.0.250"
DMZ_DNS_2A_IP="192.168.0.2"
#DMZ_DNS_2B_IP="192.168.0.3"
DMZ_DNS_2B_IP="192.168.0.2"
DMZ_HTTP_3_IP="192.168.0.250"
DMZ_DNS_3A_IP="192.168.0.2"
#DMZ_DNS_3B_IP="192.168.0.3"
DMZ_DNS_3B_IP="192.168.0.2"

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
$IPTABLES -N icmp_packets
#
# 4.1.3 Create content in userspecified chains
#
#
# bad_tcp_packets chain
#
$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK \
-m state --state NEW -j REJECT  --reject-with tcp-reset
#$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG \
#--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP
#
# allowed chain
#
$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A allowed -p TCP -j DROP
#
# ICMP rules
#
# Changed rules totally
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 0 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 3 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 5 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT
#
# 4.1.4 INPUT chain
#
#
# Bad TCP packets we don't want
#
# Temporar SMTP, DNS from LAN (!?)
$IPTABLES -A INPUT -p tcp -s 0/0 --dport 25 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 0/0 --dport 110 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 0/0 --dport 53 -j ACCEPT
$IPTABLES -A INPUT -p udp -s 0/0 --dport 53 -j ACCEPT
$IPTABLES -A INPUT -p icmp -s 0/0 -j icmp_packets
$IPTABLES -A INPUT -p TCP -j bad_tcp_packets
#
# Packets from the Internet to this box
#
$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets
#
# Packets from LAN, DMZ or LOCALHOST
#
#
# From DMZ Interface to DMZ firewall IP
#
$IPTABLES -A INPUT -p ALL -i $DMZ_IFACE -d $DMZ_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $DMZ_IFACE -d $DMZ_BCAST_ADRESS -j ACCEPT
#
# From LAN Interface to LAN firewall IP
#
$IPTABLES -A INPUT -p ALL -i $LAN1_IFACE -d $LAN1_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LAN1_IFACE -d $LAN1_BCAST_ADRESS -j ACCEPT
#
# From Localhost interface to Localhost IP's
#
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN1_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j ACCEPT
#
# Special rule for DHCP requests from LAN, which are not caught properly
# otherwise.
#
$IPTABLES -A INPUT -p UDP -i $INET_IFACE --dport 67 --sport 68 -j DROP
$IPTABLES -A INPUT -p UDP -i $LAN1_IFACE --dport 67 --sport 68 -j DROP
#
# All established and related packets incoming from the internet to the
# firewall
#
$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state ESTABLISHED,RELATED \
-j ACCEPT
#
# In Microsoft Networks you will be swamped by broadcasts. These lines
# will prevent them from showing up in the logs.
#
#$IPTABLES -A INPUT -p UDP -i $INET_IFACE -d $INET_BROADCAST \
#--destination-port 135:139 -j DROP
#
# If we get DHCP requests from the Outside of our network, our logs will
# be swamped as well. This rule will block them from getting logged.
#
#$IPTABLES -A INPUT -p UDP -i $INET_IFACE -d 255.255.255.255 \
#--destination-port 67:68 -j DROP
#$IPTABLES -A INPUT -p UDP -i $DMZ_IFACE -d 255.255.255.255 \
#--destination-port 67:68 -j DROP
#
# If you have a Microsoft Network on the outside of your firewall, you may
# also get flooded by Multicasts. We drop them so we do not get flooded by
# logs
#
#$IPTABLES -A INPUT -i $INET_IFACE -d 224.0.0.0/8 -j DROP
#$IPTABLES -A INPUT -i $DMZ_IFACE -d 224.0.0.0/8 -j DROP
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
# DMZ section
#
# General rules
#
$IPTABLES -A FORWARD -i $DMZ_IFACE -o $INET_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -m state \
--state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $LAN1_IFACE -o $DMZ_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $DMZ_IFACE -o $LAN1_IFACE -m state \
--state ESTABLISHED,RELATED -j ACCEPT
#
# HTTP server
#
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_1_IP \
--dport 80 -j allowed
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_1_IP \
-j icmp_packets
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_2_IP \
--dport 80 -j allowed
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_2_IP \
-j icmp_packets
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_3_IP \
--dport 80 -j allowed
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_3_IP \
-j icmp_packets
#
# DNS server
#
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_1A_IP \
--dport 53 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_1A_IP \
--dport 53 -j ACCEPT
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_1A_IP \
-j icmp_packets
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_1B_IP \
--dport 53 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_1B_IP \
--dport 53 -j ACCEPT
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_1B_IP \
-j icmp_packets
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_2A_IP \
--dport 53 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_2A_IP \
--dport 53 -j ACCEPT
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_2A_IP \
-j icmp_packets
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_2B_IP \
--dport 53 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_2B_IP \
--dport 53 -j ACCEPT
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_2B_IP \
-j icmp_packets
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_3A_IP \
--dport 53 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_3A_IP \
--dport 53 -j ACCEPT
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_3A_IP \
-j icmp_packets
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_3B_IP \
--dport 53 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_3B_IP \
--dport 53 -j ACCEPT
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_3B_IP \
-j icmp_packets
 
#
# LAN section, configured for ONLY one client 192.168.1.2   !
#
$IPTABLES -A FORWARD -p all -s 192.168.1.2 -d 0/0 -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $LAN1_IFACE -m state \
--state ESTABLISHED,RELATED -j ACCEPT

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
$IPTABLES -A OUTPUT -p ALL -s $LAN1_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $DMZ_IP -j ACCEPT
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
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_1_IP --dport 80 \
-j DNAT --to-destination $DMZ_HTTP_1_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_2_IP --dport 80 \
-j DNAT --to-destination $DMZ_HTTP_2_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_3_IP --dport 80 \
-j DNAT --to-destination $DMZ_HTTP_3_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $HTTP_1_IP --dport 80 \
-j DNAT --to-destination $DMZ_HTTP_1_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $HTTP_2_IP --dport 80 \
-j DNAT --to-destination $DMZ_HTTP_2_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $HTTP_3_IP --dport 80 \
-j DNAT --to-destination $DMZ_HTTP_3_IP

$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DNS_1A_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_1A_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $DNS_1A_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_1A_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DNS_1B_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_1B_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $DNS_1B_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_1B_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $DNS_1A_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_1A_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $LAN1_IFACE -d $DNS_1A_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_1A_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $DNS_1B_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_1B_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $LAN1_IFACE -d $DNS_1B_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_1B_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DNS_2A_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_2A_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $DNS_2A_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_2A_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DNS_2B_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_2B_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $DNS_2B_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_2B_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $DNS_2A_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_2A_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $LAN1_IFACE -d $DNS_2A_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_2A_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $DNS_2B_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_2B_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $LAN1_IFACE -d $DNS_2B_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_2B_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DNS_3A_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_3A_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $DNS_3A_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_3A_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DNS_3B_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_3B_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $DNS_3B_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_3B_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $DNS_3A_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_3A_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $LAN1_IFACE -d $DNS_3A_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_3A_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $DNS_3B_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_3B_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $LAN1_IFACE -d $DNS_3B_IP --dport 53 \
-j DNAT --to-destination $DMZ_DNS_3B_IP

$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $INET_IP --dport 25 \
-j DNAT --to-destination $LAN1_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $SMTP_1_IP --dport 25 \
-j DNAT --to-destination $LAN1_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $SMTP_2_IP --dport 25 \
-j DNAT --to-destination $LAN1_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $SMTP_3_IP --dport 25 \
-j DNAT --to-destination $LAN1_IP
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


---------------------------------
Do you Yahoo!?
New Yahoo! Photos - easier uploading and sharing
--0-445575215-1071855092=:64726
Content-Type: text/html; charset=us-ascii

<DIV>Hi</DIV>
<DIV>My mistake not give in enoght data. I'll start from begining because I made some modifications:</DIV>
<DIV>So I have a gatewayPC:</DIV>
<DIV>eth0 - INTERNET</DIV>
<DIV>eth1 - LAN - 192.168.1.0/24</DIV>
<DIV>eth2 - DMZ - 192.168.0.0/24</DIV>
<DIV>&nbsp;</DIV>
<DIV>In DMZ I have 2 PC, one for web and one for content DNS, both deserv same 3 domains. IP a.b.c.240/28 and I want DNAT for them.</DIV>
<DIV>&nbsp;</DIV>
<DIV>On gatewayPC I have now RedHAT with 2.4.23 and iptables 1.2.9. Also have now a proxy DNS to give answers to LAN and localhost. Also, temporary,&nbsp;I have mailserver to receive and send mail for LAN and 3 domains.</DIV>
<DIV>&nbsp;</DIV>
<DIV>To configure iptables I use a script modified after Oskar Andeasson' Tutorial. It is a long script now.</DIV>
<DIV>&nbsp;</DIV>
<DIV>When I conect from LAN on web server using IP adress it is OK. When a query DNS (different PC than web one) no respons. </DIV>
<DIV>When I give traceroute to DNS server all packets go to my ISP, and then lost ... They are not DNAT to DMZ !!</DIV>
<DIV>&nbsp;</DIV>
<DIV>Below are the script. Many thanks in advance.</DIV>
<DIV>&nbsp;</DIV>
<DIV>#!/bin/sh<BR>#<BR># rc.DMZ.firewall - DMZ IP Firewall script for Linux 2.4.x and iptables<BR>#<BR># Copyright (C) 2001&nbsp; Oskar Andreasson &amp;lt;bluefluxATkoffeinDOTnet&amp;gt;<BR>#<BR># This program is free software; you can redistribute it and/or modify<BR># it under the terms of the GNU General Public License as published by<BR># the Free Software Foundation; version 2 of the License.<BR>#<BR># This program is distributed in the hope that it will be useful,<BR># but WITHOUT ANY WARRANTY; without even the implied warranty of<BR># MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.&nbsp; See the<BR># GNU General Public License for more details.<BR>#<BR># You should have received a copy of the GNU General Public License<BR># along with this program or from the site that you downloaded it<BR># from; if not, write to the Free Software Foundation, Inc., 59 Temple<BR># Place, Suit
 e 330, Boston, MA&nbsp; 02111-1307&nbsp;&nbsp; USA<BR>#</DIV>
<DIV>###########################################################################<BR>#<BR># 1. Configuration options.<BR>#</DIV>
<DIV>#<BR># 1.1 Internet Configuration.<BR>#</DIV>
<DIV>INET_IP="x.y.z.w"<BR>INET_BROADCAST="x.y.z.255"<BR>INET_IFACE="eth0"</DIV>
<DIV># For the first domain :<BR>HTTP_1_IP="a.b.c.250"<BR>DNS_1A_IP="a.b.c.242"<BR>DNS_1B_IP="a.b.c.244"<BR>SMTP_1_IP="a.b.c.246"<BR>#FTP_1_IP</DIV>
<DIV># For the second domain :<BR>HTTP_2_IP="a.b.c.251"<BR>DNS_2A_IP="a.b.c.243"<BR>DNS_2B_IP="a.b.c.245"<BR>SMTP_2_IP="a.b.c.253"</DIV>
<DIV># For the third domain :<BR>HTTP_3_IP="a.b.c.252"<BR>DNS_3A_IP="a.b.c.248"<BR>DNS_3B_IP="a.b.c.249"<BR>SMTP_3_IP="a.b.c.246"</DIV>
<DIV><BR>#<BR># 1.1.1 DHCP<BR>#</DIV>
<DIV>#<BR># 1.1.2 PPPoE<BR>#</DIV>
<DIV>#<BR># 1.2 Local Area Network configuration.<BR>#<BR># your LAN's IP range and localhost IP. /24 means to only use the first 24<BR># bits of the 32 bit IP address. the same as netmask 255.255.255.0<BR>#</DIV>
<DIV>LAN1_IP="192.168.1.1"<BR>LAN1_IP_RANGE1="192.168.1.0/24"<BR>LAN1_BCAST_ADRESS="192.168.1.255"<BR>LAN1_IFACE="eth1"</DIV>
<DIV><BR>#<BR># 1.3 DMZ Configuration.<BR>#<BR>DMZ_IFACE="eth2"<BR>DMZ_IP="192.168.0.1"<BR>DMZ_BCAST_ADRESS="192.168.0.255"</DIV>
<DIV>DMZ_HTTP_1_IP="192.168.0.250"<BR>DMZ_DNS_1A_IP="192.168.0.2"<BR>#DMZ_DNS_1B_IP="192.168.0.3"<BR>DMZ_DNS_1B_IP="192.168.0.2"<BR>#DMZ_FTP_1_IP="192.168.0.3"</DIV>
<DIV>DMZ_HTTP_2_IP="192.168.0.250"<BR>DMZ_DNS_2A_IP="192.168.0.2"<BR>#DMZ_DNS_2B_IP="192.168.0.3"<BR>DMZ_DNS_2B_IP="192.168.0.2"</DIV>
<DIV>DMZ_HTTP_3_IP="192.168.0.250"<BR>DMZ_DNS_3A_IP="192.168.0.2"<BR>#DMZ_DNS_3B_IP="192.168.0.3"<BR>DMZ_DNS_3B_IP="192.168.0.2"</DIV>
<DIV><BR>#<BR># 1.4 Localhost Configuration.<BR>#</DIV>
<DIV>LO_IFACE="lo"<BR>LO_IP="127.0.0.1"</DIV>
<DIV>#<BR># 1.5 IPTables Configuration.<BR>#<BR>&nbsp;<BR>IPTABLES="/sbin/iptables"</DIV>
<DIV>#<BR># 1.6 Other Configuration.<BR>#</DIV>
<DIV>###########################################################################<BR>#<BR># 2. Module loading.<BR>#</DIV>
<DIV>#<BR># Needed to initially load modules<BR>#<BR>/sbin/depmod -a</DIV>
<DIV>&nbsp;</DIV>
<DIV>#<BR># 2.1 Required modules<BR>#</DIV>
<DIV>/sbin/modprobe ip_tables<BR>/sbin/modprobe ip_conntrack<BR>/sbin/modprobe iptable_filter<BR>/sbin/modprobe iptable_mangle<BR>/sbin/modprobe iptable_nat<BR>/sbin/modprobe ipt_LOG<BR>/sbin/modprobe ipt_limit<BR>/sbin/modprobe ipt_state</DIV>
<DIV>#<BR># 2.2 Non-Required modules<BR>#</DIV>
<DIV>#/sbin/modprobe ipt_owner<BR>#/sbin/modprobe ipt_REJECT<BR>#/sbin/modprobe ipt_MASQUERADE<BR>#/sbin/modprobe ip_conntrack_ftp<BR>#/sbin/modprobe ip_conntrack_irc<BR>#/sbin/modprobe ip_nat_ftp<BR>#/sbin/modprobe ip_nat_irc</DIV>
<DIV>###########################################################################<BR>#<BR># 3. /proc set up.<BR>#</DIV>
<DIV>#<BR># 3.1 Required proc configuration<BR>#</DIV>
<DIV>echo "1" &gt; /proc/sys/net/ipv4/ip_forward</DIV>
<DIV>#<BR># 3.2 Non-Required proc configuration<BR>#</DIV>
<DIV>#echo "1" &gt; /proc/sys/net/ipv4/conf/all/rp_filter<BR>#echo "1" &gt; /proc/sys/net/ipv4/conf/all/proxy_arp<BR>#echo "1" &gt; /proc/sys/net/ipv4/ip_dynaddr</DIV>
<DIV>###########################################################################<BR>#<BR># 4. rules set up.<BR>#</DIV>
<DIV>######<BR># 4.1 Filter table<BR>#</DIV>
<DIV>#<BR># 4.1.1 Set policies<BR>#</DIV>
<DIV>$IPTABLES -P INPUT DROP<BR>$IPTABLES -P OUTPUT DROP<BR>$IPTABLES -P FORWARD DROP</DIV>
<DIV>#<BR># 4.1.2 Create userspecified chains<BR>#</DIV>
<DIV>#<BR># Create chain for bad tcp packets<BR>#</DIV>
<DIV>$IPTABLES -N bad_tcp_packets</DIV>
<DIV>#<BR># Create separate chains for ICMP, TCP and UDP to traverse<BR>#</DIV>
<DIV>$IPTABLES -N allowed<BR>$IPTABLES -N icmp_packets</DIV>
<DIV>#<BR># 4.1.3 Create content in userspecified chains<BR>#</DIV>
<DIV>#<BR># bad_tcp_packets chain<BR>#<BR>$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK \<BR>-m state --state NEW -j REJECT&nbsp; --reject-with tcp-reset<BR>#$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG \<BR>#--log-prefix "New not syn:"<BR>$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP</DIV>
<DIV>#<BR># allowed chain<BR>#</DIV>
<DIV>$IPTABLES -A allowed -p TCP --syn -j ACCEPT<BR>$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT<BR>$IPTABLES -A allowed -p TCP -j DROP</DIV>
<DIV>#<BR># ICMP rules<BR>#</DIV>
<DIV># Changed rules totally<BR>$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 0 -j ACCEPT<BR>$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 3 -j ACCEPT<BR>$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 5 -j ACCEPT<BR>$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT<BR>$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT</DIV>
<DIV>#<BR># 4.1.4 INPUT chain<BR>#</DIV>
<DIV>#<BR># Bad TCP packets we don't want<BR>#</DIV>
<DIV># Temporar SMTP, DNS from LAN (!?)<BR>$IPTABLES -A INPUT -p tcp -s 0/0 --dport 25 -j ACCEPT<BR>$IPTABLES -A INPUT -p tcp -s 0/0 --dport 110 -j ACCEPT<BR>$IPTABLES -A INPUT -p tcp -s 0/0 --dport 53 -j ACCEPT<BR>$IPTABLES -A INPUT -p udp -s 0/0 --dport 53 -j ACCEPT<BR>$IPTABLES -A INPUT -p icmp -s 0/0 -j icmp_packets<BR>$IPTABLES -A INPUT -p TCP -j bad_tcp_packets</DIV>
<DIV>#<BR># Packets from the Internet to this box<BR>#</DIV>
<DIV>$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets</DIV>
<DIV>#<BR># Packets from LAN, DMZ or LOCALHOST<BR>#</DIV>
<DIV>#<BR># From DMZ Interface to DMZ firewall IP<BR>#</DIV>
<DIV>$IPTABLES -A INPUT -p ALL -i $DMZ_IFACE -d $DMZ_IP -j ACCEPT<BR>$IPTABLES -A INPUT -p ALL -i $DMZ_IFACE -d $DMZ_BCAST_ADRESS -j ACCEPT</DIV>
<DIV>#<BR># From LAN Interface to LAN firewall IP<BR>#</DIV>
<DIV>$IPTABLES -A INPUT -p ALL -i $LAN1_IFACE -d $LAN1_IP -j ACCEPT<BR>$IPTABLES -A INPUT -p ALL -i $LAN1_IFACE -d $LAN1_BCAST_ADRESS -j ACCEPT</DIV>
<DIV>#<BR># From Localhost interface to Localhost IP's<BR>#</DIV>
<DIV>$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT<BR>$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN1_IP -j ACCEPT<BR>$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j ACCEPT</DIV>
<DIV>#<BR># Special rule for DHCP requests from LAN, which are not caught properly<BR># otherwise.<BR>#</DIV>
<DIV>$IPTABLES -A INPUT -p UDP -i $INET_IFACE --dport 67 --sport 68 -j DROP<BR>$IPTABLES -A INPUT -p UDP -i $LAN1_IFACE --dport 67 --sport 68 -j DROP</DIV>
<DIV>#<BR># All established and related packets incoming from the internet to the<BR># firewall<BR>#</DIV>
<DIV>$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state ESTABLISHED,RELATED \<BR>-j ACCEPT</DIV>
<DIV>#<BR># In Microsoft Networks you will be swamped by broadcasts. These lines<BR># will prevent them from showing up in the logs.<BR>#</DIV>
<DIV>#$IPTABLES -A INPUT -p UDP -i $INET_IFACE -d $INET_BROADCAST \<BR>#--destination-port 135:139 -j DROP</DIV>
<DIV>#<BR># If we get DHCP requests from the Outside of our network, our logs will<BR># be swamped as well. This rule will block them from getting logged.<BR>#</DIV>
<DIV>#$IPTABLES -A INPUT -p UDP -i $INET_IFACE -d 255.255.255.255 \<BR>#--destination-port 67:68 -j DROP<BR>#$IPTABLES -A INPUT -p UDP -i $DMZ_IFACE -d 255.255.255.255 \<BR>#--destination-port 67:68 -j DROP</DIV>
<DIV>#<BR># If you have a Microsoft Network on the outside of your firewall, you may<BR># also get flooded by Multicasts. We drop them so we do not get flooded by<BR># logs<BR>#</DIV>
<DIV>#$IPTABLES -A INPUT -i $INET_IFACE -d 224.0.0.0/8 -j DROP<BR>#$IPTABLES -A INPUT -i $DMZ_IFACE -d 224.0.0.0/8 -j DROP</DIV>
<DIV>#<BR># Log weird packets that don't match the above.<BR>#</DIV>
<DIV>$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \<BR>--log-level DEBUG --log-prefix "IPT INPUT packet died: "</DIV>
<DIV>#<BR># 4.1.5 FORWARD chain<BR>#</DIV>
<DIV>#<BR># Bad TCP packets we don't want<BR>#</DIV>
<DIV>$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets</DIV>
<DIV><BR>#<BR># DMZ section<BR>#<BR># General rules<BR>#</DIV>
<DIV>$IPTABLES -A FORWARD -i $DMZ_IFACE -o $INET_IFACE -j ACCEPT<BR>$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -m state \<BR>--state ESTABLISHED,RELATED -j ACCEPT<BR>$IPTABLES -A FORWARD -i $LAN1_IFACE -o $DMZ_IFACE -j ACCEPT<BR>$IPTABLES -A FORWARD -i $DMZ_IFACE -o $LAN1_IFACE -m state \<BR>--state ESTABLISHED,RELATED -j ACCEPT</DIV>
<DIV>#<BR># HTTP server<BR>#</DIV>
<DIV>$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_1_IP \<BR>--dport 80 -j allowed<BR>$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_1_IP \<BR>-j icmp_packets<BR>$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_2_IP \<BR>--dport 80 -j allowed<BR>$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_2_IP \<BR>-j icmp_packets<BR>$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_3_IP \<BR>--dport 80 -j allowed<BR>$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_3_IP \<BR>-j icmp_packets</DIV>
<DIV>#<BR># DNS server<BR>#</DIV>
<DIV>$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_1A_IP \<BR>--dport 53 -j allowed<BR>$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_1A_IP \<BR>--dport 53 -j ACCEPT<BR>$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_1A_IP \<BR>-j icmp_packets<BR>$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_1B_IP \<BR>--dport 53 -j allowed<BR>$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_1B_IP \<BR>--dport 53 -j ACCEPT<BR>$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_1B_IP \<BR>-j icmp_packets</DIV>
<DIV>$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_2A_IP \<BR>--dport 53 -j allowed<BR>$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_2A_IP \<BR>--dport 53 -j ACCEPT<BR>$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_2A_IP \<BR>-j icmp_packets<BR>$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_2B_IP \<BR>--dport 53 -j allowed<BR>$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_2B_IP \<BR>--dport 53 -j ACCEPT<BR>$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_2B_IP \<BR>-j icmp_packets</DIV>
<DIV>$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_3A_IP \<BR>--dport 53 -j allowed<BR>$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_3A_IP \<BR>--dport 53 -j ACCEPT<BR>$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_3A_IP \<BR>-j icmp_packets<BR>$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_3B_IP \<BR>--dport 53 -j allowed<BR>$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_3B_IP \<BR>--dport 53 -j ACCEPT<BR>$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_DNS_3B_IP \<BR>-j icmp_packets</DIV>
<DIV>&nbsp;</DIV>
<DIV>#<BR># LAN section, configured for ONLY one client 192.168.1.2&nbsp;&nbsp; !<BR>#</DIV>
<DIV>$IPTABLES -A FORWARD -p all -s 192.168.1.2 -d 0/0 -j ACCEPT</DIV>
<DIV>$IPTABLES -A FORWARD -i $INET_IFACE -o $LAN1_IFACE -m state \<BR>--state ESTABLISHED,RELATED -j ACCEPT</DIV>
<DIV><BR>#<BR># Log weird packets that don't match the above.<BR>#</DIV>
<DIV>$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG \<BR>--log-level DEBUG --log-prefix "IPT FORWARD packet died: "</DIV>
<DIV>#<BR># 4.1.6 OUTPUT chain<BR>#</DIV>
<DIV>#<BR># Bad TCP packets we don't want.<BR>#</DIV>
<DIV>$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets</DIV>
<DIV>#<BR># Special OUTPUT rules to decide which IP's to allow.<BR>#</DIV>
<DIV>$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT<BR>$IPTABLES -A OUTPUT -p ALL -s $LAN1_IP -j ACCEPT<BR>$IPTABLES -A OUTPUT -p ALL -s $DMZ_IP -j ACCEPT<BR>$IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT</DIV>
<DIV>#<BR># Log weird packets that don't match the above.<BR>#</DIV>
<DIV>$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \<BR>--log-level DEBUG --log-prefix "IPT OUTPUT packet died: "</DIV>
<DIV>######<BR># 4.2 nat table<BR>#</DIV>
<DIV>#<BR># 4.2.1 Set policies<BR>#</DIV>
<DIV>#<BR># 4.2.2 Create user specified chains<BR>#</DIV>
<DIV>#<BR># 4.2.3 Create content in user specified chains<BR>#</DIV>
<DIV>#<BR># 4.2.4 PREROUTING chain<BR>#</DIV>
<DIV>$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_1_IP --dport 80 \<BR>-j DNAT --to-destination $DMZ_HTTP_1_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_2_IP --dport 80 \<BR>-j DNAT --to-destination $DMZ_HTTP_2_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_3_IP --dport 80 \<BR>-j DNAT --to-destination $DMZ_HTTP_3_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $HTTP_1_IP --dport 80 \<BR>-j DNAT --to-destination $DMZ_HTTP_1_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $HTTP_2_IP --dport 80 \<BR>-j DNAT --to-destination $DMZ_HTTP_2_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $HTTP_3_IP --dport 80 \<BR>-j DNAT --to-destination $DMZ_HTTP_3_IP</DIV>
<DIV><BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DNS_1A_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_1A_IP<BR>$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $DNS_1A_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_1A_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DNS_1B_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_1B_IP<BR>$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $DNS_1B_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_1B_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $DNS_1A_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_1A_IP<BR>$IPTABLES -t nat -A PREROUTING -p UDP -i $LAN1_IFACE -d $DNS_1A_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_1A_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $DNS_1B_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_1B_IP<BR>$IPTABLES
  -t nat -A PREROUTING -p UDP -i $LAN1_IFACE -d $DNS_1B_IP --dport 53 \<BR>-j DNAT --to-destination
 $DMZ_DNS_1B_IP</DIV>
<DIV>$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DNS_2A_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_2A_IP<BR>$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $DNS_2A_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_2A_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DNS_2B_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_2B_IP<BR>$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $DNS_2B_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_2B_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $DNS_2A_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_2A_IP<BR>$IPTABLES -t nat -A PREROUTING -p UDP -i $LAN1_IFACE -d $DNS_2A_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_2A_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $DNS_2B_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_2B_IP<BR>$IPTABLES -t 
 nat -A PREROUTING -p UDP -i $LAN1_IFACE -d $DNS_2B_IP --dport 53 \<BR>-j DNAT --to-destination
 $DMZ_DNS_2B_IP</DIV>
<DIV>$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DNS_3A_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_3A_IP<BR>$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $DNS_3A_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_3A_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DNS_3B_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_3B_IP<BR>$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $DNS_3B_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_3B_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $DNS_3A_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_3A_IP<BR>$IPTABLES -t nat -A PREROUTING -p UDP -i $LAN1_IFACE -d $DNS_3A_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_3A_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $LAN1_IFACE -d $DNS_3B_IP --dport 53 \<BR>-j DNAT --to-destination $DMZ_DNS_3B_IP<BR>$IPTABLES -t 
 nat -A PREROUTING -p UDP -i $LAN1_IFACE -d $DNS_3B_IP --dport 53 \<BR>-j DNAT --to-destination
 $DMZ_DNS_3B_IP</DIV>
<DIV><BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $INET_IP --dport 25 \<BR>-j DNAT --to-destination $LAN1_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $SMTP_1_IP --dport 25 \<BR>-j DNAT --to-destination $LAN1_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $SMTP_2_IP --dport 25 \<BR>-j DNAT --to-destination $LAN1_IP<BR>$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $SMTP_3_IP --dport 25 \<BR>-j DNAT --to-destination $LAN1_IP</DIV>
<DIV>#<BR># 4.2.5 POSTROUTING chain<BR>#</DIV>
<DIV>#<BR># Enable simple IP Forwarding and Network Address Translation<BR>#</DIV>
<DIV>$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP</DIV>
<DIV>#<BR># 4.2.6 OUTPUT chain<BR>#</DIV>
<DIV>######<BR># 4.3 mangle table<BR>#</DIV>
<DIV>#<BR># 4.3.1 Set policies<BR>#</DIV>
<DIV>#<BR># 4.3.2 Create user specified chains<BR>#</DIV>
<DIV>#<BR># 4.3.3 Create content in user specified chains<BR>#</DIV>
<DIV>#<BR># 4.3.4 PREROUTING chain<BR>#</DIV>
<DIV>#<BR># 4.3.5 INPUT chain<BR>#</DIV>
<DIV>#<BR># 4.3.6 FORWARD chain<BR>#</DIV>
<DIV>#<BR># 4.3.7 OUTPUT chain<BR>#</DIV>
<DIV>#<BR># 4.3.8 POSTROUTING chain<BR>#</DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://pa.yahoo.com/*http://us.rd.yahoo.com/evt=21260/*http://photos.yahoo.com">New Yahoo! Photos - easier uploading and sharing</a>
--0-445575215-1071855092=:64726--

