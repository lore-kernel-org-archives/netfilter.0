From: Jeff Bonner <lunar@comcast.net>
Subject: Please critique my iptables script
Date: Sun, 02 Jun 2002 23:43:50 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CFAE5F6.7070201@comcast.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_7GwyTetkGA1tOybhqGPRWA)"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

--Boundary_(ID_7GwyTetkGA1tOybhqGPRWA)
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT

Greetings,

After reading all the documentation I could find (and understand), and 
viewing numerous examples, I have begun to write my own iptables script. 
  I chose not to use something like ShoreWall, because I wanted to 
understand what was going on, and keep it as simple as possible.

Since I had only limited experience with ipchains before this, and I'm a 
newbie at Linux in general, I don't know if there are any glaring holes 
or omissions in the script, or if things could be done more "cleanly", 
etc.  I would like to solicit any constructive criticism, comments or 
suggestions that may be appropriate.

The script can be viewed at http://firegate.lunarfox.com and is also 
attached to this mail.  I have placed comments throughout, to explain 
what I'm trying to do, and also to ask questions in certain places.

Thanks in advance,

Jeff Bonner

--Boundary_(ID_7GwyTetkGA1tOybhqGPRWA)
Content-type: text/plain; name=firewall.040
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=firewall.040

#!/bin/bash

# Program Name = FireGate
# Intended Use = An IPTABLES firewall ruleset and NAT gateway
# Revision Num = 0.40
# Created File = 20 Jan 2002
# Last Updated = 01 Jun 2002
#
# Copyright 2002 Jeff Bonner (lunar@xrs.net, http://www.lunarfox.com)
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License,
# Version 2, as published by the Free Software Foundation (for
# complete text, see http://www.gnu.org/copyleft/gpl.html).
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTIBILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

echo -e -n "\nStarting FireGate v0.40... "

# Basic Variables;
#
IPT="/sbin/iptables"					# Where is IPTABLES
EVIL="24.0.0.203"					# Blacklisted IPs
DHCP="172.30.166.36"					# DHCP server IP
DNS="68.60.32.5 206.141.251.2"				# DNS server IP

# SYSCTL DoS Prevention, etc;
# Definitions at http://www.linuxdoc.org/HOWTO/Adv-Routing-HOWTO-13.html
#
echo 1 > /proc/sys/net/ipv4/ip_forward			# Enable masq below
echo 1 > /proc/sys/net/ipv4/ip_dynaddr			# Rebound to new addr
echo 1 > /proc/sys/net/ipv4/tcp_syncookies		# No TCP SYN overload
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts # No Smurf amplifying
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians	# Spoof/route/redirect
echo 0 > /proc/sys/net/ipv4/tcp_timestamps		# Uptime/Gigabit ether
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects	# No route altering
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

for r in /proc/sys/net/ipv4/conf/*/rp_filter; do	# Impossible addresses;
 echo 1 > $r						# can "2" be used here
done							# for full reversepath?

# Performance Tuning;
# What are appropriate values to change here, if any, for 2.4.x?
#
# echo 30  > /proc/sys/net/ipv4/tcp_fin_timeout		# Reduce dead sockets?
# echo 180 > /proc/sys/net/ipv4/tcp_keepalive_intvl	# Is this even needed?

# Erase Previous Rules, Define Policy;
#
$IPT -F							# Flush built-in rules
$IPT -X							# Erase custom rules
$IPT -Z							# Zero all counters
$IPT -F -t nat						# Flush pre/postrouting 

$IPT -P INPUT DROP					#
$IPT -P OUTPUT ACCEPT					# Set default policies
$IPT -P FORWARD DROP					#

$IPT -A INPUT -i lo -j ACCEPT				# Loopback traffic OK

$IPT -A INPUT -i eth0 -s 10.0.0.0/8 	-j DROP		#
$IPT -A INPUT -i eth0 -s 172.16.0.0/12	-j DROP		#
$IPT -A INPUT -i eth0 -s 192.168.0.0/16	-j DROP		# Toss any private
$IPT -A INPUT -i eth0 -s 127.0.0.0/8	-j DROP		# addresses coming in
$IPT -A INPUT -i eth0 -s 169.254.0.0/16	-j DROP		# from ext interface
$IPT -A INPUT -i eth0 -s 224.0.0.0/4	-j DROP		#
$IPT -A INPUT -i eth0 -s 240.0.0.0/5	-j DROP		#

$IPT -A INPUT -s 255.255.255.255 -d 0/0 -j DROP		# No bogus routing

for e in $EVIL; do					#
 $IPT -A INPUT -s $e -j DROP				# Drop blacklist sites
done							#

							# Toss any inbound
$IPT -A INPUT -p udp --sport 137:139 -j DROP		#  ... SMB
$IPT -A INPUT -p tcp --dport 80      -j DROP		#  ... HTTP
$IPT -A INPUT -p tcp --dport 22:23   -j DROP		#  ... Telnet/SSH
$IPT -A INPUT -p tcp --dport 1214    -j DROP		#  ... KaZaA

# Redirect ports for ReAIM proxy;
#
iptables -t nat -A PREROUTING -i eth0 -p tcp \
	--dport 5190 -j REDIRECT --to-ports 5190 	# AIM/ICQ Clients
iptables -t nat -A PREROUTING -i eth0 -p tcp \
	--dport 1863 -j REDIRECT --to-ports 1863	# MSN Clients
	
# Port Scanners, etc;
# Is this effective (or even necessary)?
#
$IPT -N SCAN
$IPT -A INPUT -i eth0 -p tcp --tcp-flags SYN,ACK,FIN,RST RST -j SCAN
$IPT -A SCAN -m limit --limit 1/s -j LOG --log-level info \
   --log-prefix "**PORTSCAN** "
$IPT -A SCAN -j DROP

# Fragmented Packets;
# How often are these seen? Are they mostly hostile? What do they break?
#
$IPT -A INPUT -i eth0 -f -j LOG -m limit --limit 1/s \
     --log-level info --log-prefix "**FRAGMENT** "
$IPT -A INPUT -i eth0 -f -j DROP

# Hostile TCP Flags;
#
$IPT -N FLAGS
$IPT -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -j FLAGS
$IPT -A INPUT -p tcp --tcp-flags ALL ALL -j FLAGS
$IPT -A INPUT -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j FLAGS
$IPT -A INPUT -p tcp --tcp-flags ALL NONE -j FLAGS
$IPT -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j FLAGS
$IPT -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j FLAGS
$IPT -A FLAGS -m limit --limit 60/minute -j LOG \
     --log-level info --log-prefix "**BADFLAGS** "
$IPT -A FLAGS -j DROP

# Miscellaneous Stuff;
#
$IPT -A INPUT -i eth0 -p tcp ! --syn -m state \
     --state NEW -j DROP				# New TCP must be SYN

$IPT -A INPUT -p tcp --dport 113 -j REJECT \
     --reject-with tcp-reset				# Handle auth/ident

$IPT -A INPUT -p udp -s $DHCP --sport 67 -d 0/0 \
     --dport 68 -j ACCEPT				# Let firewall get IP

# Allow authorized DNS servers;
#
for d in $DNS; do
  $IPT -A INPUT -p udp -s $d --sport 53 -d 0/0 \
     -j ACCEPT
done

# Blocked Outbound Trojan, Etc ports;
#
$IPT -N STOPOUT
$IPT -A OUTPUT -p tcp --dport 137:139     -j STOPOUT	# SMB
$IPT -A OUTPUT -p tcp --dport 31335:31337 -j STOPOUT	# Trinoo
$IPT -A OUTPUT -p tcp --dport 27444       -j STOPOUT	# Trinoo Slave
$IPT -A OUTPUT -p tcp --dport 27655       -j STOPOUT	# Trinoo Master
$IPT -A STOPOUT -m limit --limit 1/s -j LOG \
	--log-level info --log-prefix "**OUTBOUND** "	# Log these attempts
$IPT -A STOPOUT -j DROP					# then drop packets

# ICMP Control;
# Are these the only 'proper' ones to allow?
#
$IPT -A INPUT -p icmp --icmp-type 0 -s 0/0  -j ACCEPT	# ICMP echo reply
$IPT -A INPUT -p icmp --icmp-type 3 -s 0/0  -j ACCEPT	# ICMP dest-unreach
$IPT -A INPUT -p icmp --icmp-type 11 -s 0/0 -j ACCEPT	# ICMP time-exceeded
$IPT -A INPUT -p icmp -j LOG -m limit --limit 30/minute \
     --log-level info --log-prefix "**ICMP DROP** "	# Log anything denied
$IPT -A INPUT -p icmp -j DROP				# Drop failed packets

# Open IM File Xfer, Direct Connect for ReAIM;
#
$IPT -A INPUT -p tcp --dport 5190 	-j ACCEPT	# AOL/ICQ Client
$IPT -A INPUT -p tcp --dport 1863	-j ACCEPT	# MSN IM Client

# Main Ruleset;
#
$IPT -N TRAFFIC
$IPT -A TRAFFIC -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A TRAFFIC -m state --state NEW -i ! eth0 -j ACCEPT
$IPT -A TRAFFIC -j LOG -m limit --limit 60/minute \
     --log-level info --log-prefix "**PACKET DROP** "	# Log anything denied
$IPT -A TRAFFIC -j DROP					# Drop failed packets

$IPT -A FORWARD -j TRAFFIC				# Send FORWARD to above
$IPT -A INPUT 	-j TRAFFIC				# Send INPUT to above

# Enable NAT/Masquerading;
# Should this be located earlier in the script?
#
$IPT -t nat -A POSTROUTING -o eth0 -j MASQUERADE	# Enable sNAT

echo -e "DONE.\n"

--Boundary_(ID_7GwyTetkGA1tOybhqGPRWA)--

