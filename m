From: DALive Editor <dalive@flashmail.com>
Subject: Strange: Traffic to Server on External IP from Lan is blocked
Date: Mon, 15 Dec 2003 18:52:27 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FDE3B2B.3060401@flashmail.com>
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

Hello to all,

I have a strange prob. Whenever the script bellow is in place for my 
firewall, I can access my server by using it's INET IP. In other words I 
can only access it with 192.168.100.1. And this is prooving to be a big 
prob for me.

I just can't seem to figure out where the prob is. Maybe a better 
trained eye can see. I've incuded the script bellow.

Thank you.

#!/bin/sh

#

# rc.firewall - DHCP IP Firewall script for Linux 2.4.x and iptables

###########################################################################

#

# 1. Configuration options.

#

INET_IFACE="eth1"

LAN_IP="192.168.100.1"

LAN_IP_RANGE="192.168.100.0/24"

LAN_IFACE="eth0"

BAD_IPS[0]="192.168.0.255"

BAD_IPS_COUNT=${#BAD_IPS[@]}

LO_IFACE="lo"

LO_IP="127.0.0.1"

#

# 1.5 IPTables Configuration.

#

IPTABLES="/sbin/iptables"

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

#------------------#

# 4.1 Filter table #

#------------------#

######################

# 4.1.1 Set policies #

######################

$IPTABLES -P INPUT DROP

$IPTABLES -P OUTPUT DROP

$IPTABLES -P FORWARD DROP

#####################################

# 4.1.2 Create userspecified chains #

#####################################

#

# Create chain seperate traffic flow

#

$IPTABLES -N Inet_to_Server

$IPTABLES -N Inet_to_Lan

$IPTABLES -N Lan_to_Inet

$IPTABLES -N Lan_to_Server

$IPTABLES -N Server_to_Inet

$IPTABLES -N Server_to_Lan

#

# Create chain for dealing with all packets

#

$IPTABLES -N bad_tcp_packets

$IPTABLES -N allowed

$IPTABLES -N allaccess

$IPTABLES -N wierd_packets

$IPTABLES -N banned_ips

################################################

# 4.1.3 Create content in userspecified chains #

################################################

############################################################################

# Inet_to_Server chain

#

#-already establish or related connections

  $IPTABLES -A Inet_to_Server -p ALL -i $INET_IFACE -m state --state ESTABLISHED,RELATED -j ACCEPT

#-ftp ports

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 20 -j allowed

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 21 -j allowed

#-ssh ports

$IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 22 -j allowed

#-http ports

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 80 -j allowed

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 443 -j allowed

#-Email ports

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 25 -j allowed

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 110 -j allowed

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 143 -j allowed

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 993 -j allowed

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 995 -j allowed

#-MSN Messenger ports

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 6891:6901 -j allowed

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 1863 -j allowed

#-Kazaa ports

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 1214 -j allowed

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 2608 -j allowed

#-Interent Switchboard ports

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 7750:7751 -j allowed

  $IPTABLES -A Inet_to_Server -p UDP -s 0/0 --destination-port 7750:7751 -j ACCEPT

#-MySQL ports

  $IPTABLES -A Inet_to_Server -p TCP -s 0/0 --dport 3306 -j allowed

#-DNS and DHCP ports

  $IPTABLES -A Inet_to_Server -p UDP -s 0/0 --source-port 53 -j ACCEPT

  $IPTABLES -A Inet_to_Server -p UDP -s 0/0 --sport 67 --dport 68 -j ACCEPT

#-Network Time Protocol ports

  $IPTABLES -A Inet_to_Server -p UDP -s 0/0 --source-port 123 -j ACCEPT

#-Vertel VMF SA port

  $IPTABLES -A Inet_to_Server -p UDP -s 0/0 --source-port 2074 -j ACCEPT

#-Terabase port

  $IPTABLES -A Inet_to_Server -p UDP -s 0/0 --source-port 4000 -j ACCEPT

#-MSNP port

  $IPTABLES -A Inet_to_Server -p UDP -s 0/0 --source-port 1863 -j ACCEPT

#-undefined  

  $IPTABLES -A Inet_to_Server -p UDP -s 0/0 --source-port 6901 -j ACCEPT

#-Echo requests

  $IPTABLES -A Inet_to_Server -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT

#-TTL errors

  $IPTABLES -A Inet_to_Server -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

#-wierd packets to be logged  

  $IPTABLES -A Inet_to_Server -j wierd_packets

  

  

############################################################################

# Inet_to_Lan chain

#

$IPTABLES -A Inet_to_Lan -m state --state ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A Inet_to_Lan -j wierd_packets

 

############################################################################

# Lan_to_Inet chain

#

$IPTABLES -A Lan_to_Inet -i $LAN_IFACE -j ACCEPT

$IPTABLES -A Inet_to_Lan -j wierd_packets

 

############################################################################

# Lan_to_Server chain

#

$IPTABLES -A Lan_to_Server -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT

$IPTABLES -A Inet_to_Lan -j wierd_packets

 

############################################################################

# Server_to_Inet chain

#

$IPTABLES -A Server_to_Inet -p ALL -j ACCEPT

$IPTABLES -A Inet_to_Lan -j wierd_packets

 

############################################################################

# Server_to_Lan chain

#

$IPTABLES -A Server_to_Lan -p ALL -j ACCEPT

$IPTABLES -A Inet_to_Lan -j wierd_packets

############################################################################

# bad_tcp_packets chain

#

$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK \

-m state --state NEW -j REJECT --reject-with tcp-reset

$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG \

--log-prefix "New not syn: "

$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

############################################################################

# allowed chain

#

$IPTABLES -A allowed -p tcp --syn -j LOG \

--log-prefix "Input packet"

$IPTABLES -A allowed -p TCP --syn -j ACCEPT

$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A allowed -p TCP -j DROP

############################################################################

# allaccess chain

#

$IPTABLES -A allaccess -p TCP -j LOG --log-prefix "Port Forwarding: "

$IPTABLES -A allaccess -p TCP -j ACCEPT

############################################################################

# wierd_packets chain

#

$IPTABLES -A wierd_packets -m limit --limit 3/minute --limit-burst 3 -j LOG \

--log-level DEBUG --log-prefix "IPT packet died: "

############################################################################

# banned_ips chain

#

if [ $BAD_IPS_COUNT > 0 ] ; then

  for ((i=0; i < BAD_IPS_COUNT ; i++)) do

    $IPTABLES -A banned_ips -s ${BAD_IPS[$i]} -p ALL -j DROP

  done

fi

#

# 4.1.4 Remove all bad tcp packets

#

$IPTABLES -A INPUT -p tcp -j bad_tcp_packets

$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets

$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets

###################################################

# 4.1.5 Route packets to their directional chains #

###################################################

#$IPTABLES -A INPUT -p tcp -i $INET_IFACE -j LOG \

#--log-prefix "Inet_to_Server: "

$IPTABLES -A INPUT -p ALL -i $INET_IFACE -j Inet_to_Server

$IPTABLES -A FORWARD -p ALL -i $INET_IFACE -j Inet_to_Lan

$IPTABLES -A FORWARD -p ALL -i $LAN_IFACE  -j Lan_to_Inet

$IPTABLES -A INPUT -p ALL -i $LAN_IFACE  -j Lan_to_Server

$IPTABLES -A OUTPUT -p ALL -o $INET_IFACE -j Server_to_Inet

$IPTABLES -A OUTPUT -p ALL -o $LAN_IFACE -j Server_to_Lan

#

# Special rule for DHCP requests from LAN, which are not caught properly 

# otherwise.

#

$IPTABLES -A INPUT -p UDP -i $LAN_IFACE --dport 67 --sport 68 -j ACCEPT

###################

# Port forwarding #

###################

$IPTABLES -A FORWARD -p tcp -i $INET_IFACE --dport 7750:7751 -j ACCEPT

$IPTABLES -A FORWARD -p udp -i $INET_IFACE --dport 7750:7751 -j ACCEPT

$IPTABLES -A FORWARD -p tcp --dport 4662 -j ACCEPT 

#---------------#

# 4.2 nat table #

#---------------#

#

# 4.2.4 PREROUTING chain

#

#

#Port forwarding

#

$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp --dport 7750:7751 -j DNAT --to 192.168.100.12

$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p udp --dport 7750:7751 -j DNAT --to 192.168.100.12

$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp --dport 4662 -j DNAT --to 192.168.100.11

#

# 4.2.5 POSTROUTING chain

#

$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j MASQUERADE





