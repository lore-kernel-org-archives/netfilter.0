From: Julian Labuschagne <personxx@wan4u.co.za>
Subject: Port Forwarding Problem
Date: Fri, 15 Apr 2005 10:36:37 +0000
Message-ID: <425F9935.3010906@wan4u.co.za>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060501010008090001000906"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------060501010008090001000906
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi everyone I'm a bit new to iptables so please bear with me on this one ;)

I wrote a small firewall that basicaly nats users through my gateway
machine only allowing certain hosts on my network Web DNS and Mail access.

This section works fine.

But I also want to port forward any connections from outside to port 800
to a host running inside my LAN.
I added a rule in the PREROUTING table to do this.

But it seems that no connection gets forwarded.

If I set my default policies to ACCEPT and add the PREROUTING rule it
actualy does the port forwarding correctly.

I attached a copy of the firewall I wrote with this message.

Please can someone have a look through it for me cause I'm sure I'm just
missing something.

Kind Regards Julian.




--------------060501010008090001000906
Content-Type: text/plain;
 name="custom.firewall"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="custom.firewall"

#!/bin/bash

# Set path to iptables binary
IPTABLES=/usr/sbin/iptables

#
# Loopback IP and Interface
#
LO_IFACE="lo"
LO_IP="127.0.0.1"

#
# Internet IP and Interface
#
INET_IP=`/sbin/ifconfig ppp0 | grep "inet addr" | cut -d: -f2 | cut -d ' ' -f1`
INET_IFACE="ppp0"

#
# LAN Range, IP Address and Interface
#
LAN_IP="192.168.1.1"
LAN_IP_RANGE="192.168.1.0/24"
LAN_BCAST_ADRESS="192.168.1.255"
LAN_IFACE="eth0"

# 
# Set default policies
#
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

#
# Flush Chains
#
$IPTABLES -F
$IPTABLES -t nat -F

#
# Allow loopback interface
#
$IPTABLES -A INPUT -i $LO_IFACE -j ACCEPT
$IPTABLES -A OUTPUT -o $LO_IFACE -j ACCEPT

# Output Chain
$IPTABLES -A OUTPUT -o $INET_IFACE -p tcp --dport 53 -j ACCEPT
$IPTABLES -A OUTPUT -o $INET_IFACE -p udp --dport 53 -j ACCEPT
$IPTABLES -A OUTPUT -o $INET_IFACE -p tcp --dport 25 -j ACCEPT
$IPTABLES -A OUTPUT -o $INET_IFACE -p tcp --dport 80 -j ACCEPT
$IPTABLES -A OUTPUT -o $INET_IFACE -p tcp --dport 110 -j ACCEPT

# Input Chain
$IPTABLES -A INPUT -i $INET_IFACE -p tcp -m state --state established,related -j ACCEPT
$IPTABLES -A INPUT -i $INET_IFACE -p udp -m state --state established,related -j ACCEPT

$IPTABLES -A INPUT -i $INET_IFACE -p tcp --dport 800 -j ACCEPT
$IPTABLES -A INPUT -i $INET_IFACE -p udp --dport 800 -j ACCEPT

# Forward Chain
$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -o $LAN_IFACE -j ACCEPT

#
# Allow ICMP
#
$IPTABLES -A OUTPUT -o $INET_IFACE -p icmp -j ACCEPT
$IPTABLES -A INPUT -i $INET_IFACE -p icmp -j ACCEPT

#
# Users allowed internet access
#
$IPTABLES -A INPUT -i $LAN_IFACE -s 192.168.1.143 -j ACCEPT
$IPTABLES -A OUTPUT -o $LAN_IFACE -d 192.168.1.143 -j ACCEPT

$IPTABLES -A INPUT -i $LAN_IFACE -s 192.168.1.5 -j ACCEPT
$IPTABLES -A OUTPUT -o $LAN_IFACE -d 192.168.1.5 -j ACCEPT

$IPTABLES -A INPUT -i $LAN_IFACE -s 192.168.1.8 -j ACCEPT
$IPTABLES -A OUTPUT -o $LAN_IFACE -d 192.168.1.8 -j ACCEPT


#
# Add port forwarding rule
#
$IPTABLES -A PREROUTING -t nat -p tcp -d $INET_IP --dport 800 -j DNAT --to 192.168.1.5:800
$IPTABLES -A PREROUTING -t nat -p udp -d $INET_IP --dport 800 -j DNAT --to 192.168.1.5:800

#
# Masquerade LAN users (Internet Sharing)
#
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP

--------------060501010008090001000906--

