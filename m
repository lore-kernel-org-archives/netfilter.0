From: Jason Williams <jwilliams@courtesymortgage.com>
Subject: Second shot at IPTables script
Date: Fri, 17 Dec 2004 13:14:40 -0800
Message-ID: <6.1.2.0.0.20041217130746.026796b0@corpmail.courtesymortgage.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Thought i'd post my second attempt at a script here, with comments to make 
sure I am on the right path.
Spent the better part of the last two days reading up on IPTables and 
finally understand the whole INPUT,OUTPUT,FORWARD chain. That helped a lot.

Here it is: Simple script to just setup a firewall to protect a private LAN.

#External interface
INET_IP="xxx.xxx.xxx.xxx"
INET_IFACE="eth0"

Usually variables.

#Internal/Private LAN
LAN_IP="192.168.0.2"
LAN_IP_RANGE="192.168.0.0/24"
LAN_IFACE="eth1"

Same.

#LOOPback
LO_IFACE="lo"
LO_IP="127.0.0.1"

Same.

# 1.5 IPTables Configuration.

IPTABLES="/usr/sbin/iptables"


#Default Policy Setting

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

Default drops.

#Custom chain

$IPTABLES -N tcp_packets

Custom chain, so I can specify later what to drop:

# bad_tcp_packets chain

$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK -m state 
--state NEW -j REJECT --reject-with tcp-reset
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG 
--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

Something i've been looking into. May change it. Looking to drop packets 
that scan, probe, etc on the firewall.

#Accept loopback interface
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT


# Rules for incoming packets from the internet.

$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state ESTABLISHED,RELATED 
-j ACCEPT

This rule, should only work when the host (firewall) initiate connections 
first. Nothing should be accepted back unless a connection originated from 
the firewall, correct? This would allow pings to work, ftp, package 
grabbing, patches etc. Am I correct?

# Accept the packets we actually want to forward

$IPTABLES -A FORWARD -i $LAN_IFACE -o $INET_IFACE -s $LAN_IP -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

Accept traffic from my private LAN.

# Special OUTPUT rules to decide which IP's to allow.

$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT

To allow outbound traffic. This correct? I had question here.

#NAT SETUP

$IPTABLES -t nat -A POSTROUTING -s $LAN_IP -o $INET_IFACE -j SNAT 
--to-source $INET_IP

Simple enough: Do SNAT.

I appreciate the help and feedback here. I look forward to your responses.

CHeers,

Jason







