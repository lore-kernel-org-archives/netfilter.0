From: Jason Williams <jwilliams@courtesymortgage.com>
Subject: Final IPTables script (hopefully)
Date: Tue, 28 Dec 2004 15:48:54 -0800
Message-ID: <6.1.2.0.0.20041228154423.18f8ee30@corpmail.courtesymortgage.com>
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

Hello everyone.

Back from a much needed vacation today and started back at IPTables. After 
reading up on a lot of documentation and taking some very good advice from 
this list, here is what i have come up with, in hopes of getting it right, 
to act as a personal firewall for my home network.

Without further a due...

#External interface
INET_IP="xxx.xxx.xxx.xxx"
INET_IFACE="eth0"

#Internal/Private LAN
LAN_IP="192.168.0.2"
LAN_IP_RANGE="192.168.0.0/24"
LAN_IFACE="eth1"

#LOOPback
LO_IFACE="lo"
LO_IP="127.0.0.1"

Variables. As always...

# 1.5 IPTables Configuration.

IPTABLES="/usr/sbin/iptables"

#Default Policy Setting

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

Not much needs to be said here.

#Custom chains

$IPTABLES -N tcp_packets

# bad_tcp_packets chain

$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK -m state 
--state NEW -j REJECT --reject-with tcp-reset
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG 
--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

Like the idea of this rule. Trying to prevent NMAP scans, xmas scans etc.

# Rules for incoming packets from the internet.

$IPTABLES -A INPUT -p ALL -d $INET_IFACE -m state --state 
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -i $LAN_IFACE -s 172.16.1.2 --dport 22 -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT

Should allow traffic to flow freely from the firewall to the internet and 
accept returning connections. No connections from the internet that are 
intiated will be accepted.
Acceping SSH from 172.16.1.2 on the private LAN.
Accceptin loopback interface.

# Accept the packets we actually want to forward

$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $LAN_IFACE -o $INET_IFACE -s $LAN_IP_RANGE -j ACCEPT

Pass out private LAN traffic and return it. First rule is in line for 
better performance.

# Special OUTPUT rules to decide which IP's to allow.

$IPTABLES -A OUTPUT -j ACCEPT

Simple enough.


#NAT SETUP

$IPTABLES -t nat -A POSTROUTING -s $LAN_IP -o $INET_IFACE -j SNAT 
--to-source $INET_IP

Do SNAT for trafffic on the private LAN.


Feel good about these rules. Just wante to ask one last time before I go 
live, in case i booger it up and need help

Appreciate the feedback.

Jason


