From: "Brent Clark" <bclark@eccotours.biz>
Subject: Ruleset
Date: Tue, 10 Aug 2004 09:22:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HAEOIFPIBBBLGLHOMLLIIEPPCGAA.bclark@eccotours.biz>
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
To: iptables <netfilter@lists.netfilter.org>

Hi all

When I learn \ try something new, I tend to post my findings and or config
file etc, in the hope of someone out there
would be kind so share their views, points, critism, experiences etc.
This time ive dabbling with DMZ and transparent proxy (squid).

If possible would someone be so kind as to have a look at my ruleset and if
possible, share some pointers.
I have another linux box (Ip address 192.168.3.3, connected to eth1 on the
FW)
I have a lan (192.168.2.0/24) connected to eth0
For my internet handling I have a ppp connection.
Im also currently toying with dyndns (ez-ipupdate).

Kind Regards
Brent Clark

============================================================================
==========================

#!/bin/sh -e

IP="/sbin/iptables"

#############################################################
# Flush clean all rules and chains

$IP --flush;	#Delete all rules in  chain or all chains
$IP --zero;	#Zero counters in chain or all chains
$IP --table nat --flush;	#Flush nat table
$IP --table mangle --flush;	#Flush mangle table
$IP -X;


############################################################
# Default policy
$IP -t filter --policy INPUT DROP;
$IP -t filter --policy FORWARD DROP;
$IP -t filter --policy OUTPUT DROP;

#############################################################
# Create outside connections
$IP -t nat -A POSTROUTING -o ppp+ -s 192.168.2.0/24  -j MASQUERADE;
$IP -t nat -A POSTROUTING -o ppp+ -s 192.168.3.0/24  -j MASQUERADE;
#############################################################
# Established Rules

$IP -t nat -A PREROUTING -i ! ppp0  -p tcp --dport 80 -j REDIRECT --to-port
3128
$IP -t nat -A PREROUTING -i ppp+ -p tcp --dport 80 -j DNAT --to-destination
192.168.3.3

$IP -t filter -A INPUT -p all -s 127.0.0.1 -j ACCEPT;
$IP -t filter -A INPUT -i lo -p all -s 192.168.2.2 -d 192.168.2.2 -j ACCEPT;
$IP -t filter -A INPUT -m state --state INVALID -j LOG --log-prefix "INVALID
INPUT DROP ";
$IP -t filter -A INPUT -m state --state INVALID -j DROP
$IP -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT;
$IP -t filter -A INPUT -i eth0 -p tcp --dport 22 -s 192.168.2.0/24 -m
state --state NEW -j ACCEPT;
$IP -t filter -A INPUT -i ! ppp0 -p udp --dport 53 -m state --state NEW -j
ACCEPT;
$IP -t filter -A INPUT -i ! ppp0 -p tcp --dport 53 -m state --state NEW -j
ACCEPT;
$IP -t filter -A INPUT -i ppp+ -p udp --sport 53 -m state --state NEW -j
ACCEPT;
$IP -t filter -A INPUT -i ppp+ -p tcp --sport 53 -m state --state NEW -j
ACCEPT;
$IP -t filter -A INPUT -i eth0 -p tcp --dport 80 -s 192.168.2.0/24  -m
state --state NEW -j ACCEPT;
$IP -t filter -A INPUT -i ! ppp0 -p tcp --dport 3128  -m state --state
NEW -j ACCEPT;
$IP -t filter -A INPUT -p udp --dport 135:139 -j DROP
$IP -t filter -A INPUT -p tcp --dport 135:139 -j DROP
$IP -t filter -A INPUT -p tcp --dport 445 -j DROP
$IP -t filter -A INPUT -p udp --dport 445 -j DROP
$IP -t filter -A INPUT -j LOG --log-prefix "INPUT DROP ";

$IP -t filter -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT;
$IP -t filter -A FORWARD -m state --state INVALID -j LOG --log-prefix
"INVALID FORWARD DROP ";
$IP -t filter -A FORWARD -m state --state INVALID -j DROP
$IP -t filter -A FORWARD -i eth0 -p all -d 192.168.2.255 -j LOG --log-prefix
"INVALID FORWARD DROP ";
$IP -t filter -A FORWARD -i eth0 -p all -d 192.168.2.255 -j DROP
$IP -t filter -A FORWARD -o ppp+ -m state --state NEW,ESTABLISHED,RELATED -j
ACCEPT;

#############################
# DMZ settings

$IP -t filter -A FORWARD -i ppp0 -o eth1 -m state --state NEW -j ACCEPT;
$IP -t filter -A FORWARD -i eth0 -o eth1 -m state --state NEW -j ACCEPT;
#$IP -t filter -A FORWARD -i eth1 -o eth0 -m state --state NEW -j ACCEPT;
$IP -t filter -A INPUT -i eth1 -p udp --dport 53  -m state --state NEW -j
ACCEPT;
############################
$IP -t filter -A FORWARD -j LOG --log-prefix "FORWARD DROP ";

$IP -t filter -A OUTPUT -m state --state INVALID -j LOG --log-prefix
"INVALID OUTPUT DROP ";
$IP -t filter -A OUTPUT -m state --state INVALID -j DROP
$IP -t filter -A OUTPUT -s 127.0.0.1 -j ACCEPT;
$IP -t filter -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT;
$IP -t filter -A OUTPUT -m state --state NEW -j ACCEPT;
#$IP -t filter -A OUTPUT -o eth0 -d 192.168.2.0/24 -j ACCEPT;
#$IP -t filter -A OUTPUT -o eth1 -d 192.168.3.0/24 -j ACCEPT;
$IP -t filter -A OUTPUT -j LOG --log-prefix "OUTPUT DROP ";

#################################################################
# Proc allows

echo 1 > /proc/sys/net/ipv4/ip_forward	#Ip forwarding;
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians;
echo 1 > /proc/sys/net/ipv4/ip_dynaddr
echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter
echo 1 > /proc/sys/net/ipv4/conf/all/proxy_arp


