From: Elitesyntax <elitesyntax@yahoo.com>
Subject: iptables Question
Date: Mon, 8 Sep 2003 09:43:04 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030908164304.95550.qmail@web14703.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

#!/bin/sh
#
# The location of the IPTables binary file on your
system.
IPT="/sbin/iptables"

# The Internet interface. For ADSL or Dialup users,
this should be "ppp0".
# For a cable modem connection, this will probably be
"eth0".
INT="eth0"

# Out with the old stuff.
$IPT -F
$IPT -F INPUT
$IPT -F OUTPUT
$IPT -F FORWARD
$IPT -F -t mangle
$IPT -F -t nat
$IPT -X

# These will setup our policies.
$IPT -P INPUT DROP
$IPT -P OUTPUT ACCEPT
$IPT -P FORWARD ACCEPT

# Use this for NAT or IP Masquerading.
echo 1 > /proc/sys/net/ipv4/ip_forward
$IPT -t nat -A POSTROUTING -o $INT -j MASQUERADE

# This rule protects your fowarding rule.
$IPT -A FORWARD -i $INT -m state --state NEW,INVALID
-j DROP

# Port forwarding looks like this.
#$IPT -t nat -A PREROUTING -i $INT -p tcp --dport 25
-j DNAT --to 192.168.0.50
#$IPT -t nat -A PREROUTING -i $INT -p tcp --dport 53
-j DNAT --to 192.168.0.50
#$IPT -t nat -A PREROUTING -i $INT -p udp --dport 53
-j DNAT --to 192.168.0.50
# These two redirect a block of ports, in both udp and
tcp.
#$IPT -t nat -A PREROUTING -i $INT -p tcp --dport
2300:2400 -j DNAT --to 192.168.0.50
#$IPT -t nat -A PREROUTING -i $INT -p udp --dport
2300:2400 -j DNAT --to 192.168.0.50

# This rule will accept connections from local
machines.
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A INPUT -s 192.168.0.0/24 -d 0/0 -p all -j
ACCEPT

# Drop bad packets.
$IPT -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -j
DROP
$IPT -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
$IPT -A INPUT -p tcp --tcp-flags ALL
SYN,RST,ACK,FIN,URG -j DROP
$IPT -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
$IPT -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j
DROP
$IPT -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j
DROP

# Drop icmp, but only after letting certain types
through.
$IPT -A INPUT -p icmp --icmp-type 0 -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type 3 -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type 11 -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type 8 -m limit --limit
1/second -j ACCEPT
$IPT -A INPUT -p icmp -j DROP




Is there a way i can make this script more stable?I
have not got done with this script just yet.

=====
You are entering the lands of packets, brute force and misuse of trust.This is a dark land. Full of problems and choices. Be carefull when you use your knowledge. Be also carefull with your tools and weapons. Never underestimate your enemy.

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

