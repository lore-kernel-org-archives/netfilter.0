From: DALive Editor <dalive@flashmail.com>
Subject: Iptables router issue
Date: Tue, 23 Sep 2003 18:47:36 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F70CD88.3010209@flashmail.com>
Reply-To: dalive@flashmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070208090900030905050808"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------070208090900030905050808
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Objective:

To use a single Penguin box to do everything. (at least for now). But 
more importantly to route traffic to and from a private lan to the 
internet, and to filter off open ports of the box.


Problem:

When DNS lookup to my client returns the my internet dynamic ip) as it 
should for my own domain, for some reason my firewall filters out the 
traffic. Although it's to an open port and the firewall is suppose to 
accept all traffic from the lan.


Host Setup

Kernel from RH9 Distribution and latest version of Iptables (having been 
haveing probs with settign up my own kernel)


Network Map:

eth0 -- 192.168.100.1 -- internal lan's NIC
eth1 -- dynamic address -- internet's NIC

Additional Information:

I have attached my firewall script as a .txt file.


Your assistance is much appreciated and anticipated.
Thank you.

--------------070208090900030905050808
Content-Type: text/plain;
 name="rc.firewall.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="rc.firewall.txt"

#!/bin/sh
#

INET_IFACE="eth1"

DHCP="yes"
DHCP_SERVER=""

PPPOE_PMTU="no"

LAN_IP="192.168.100.1"
LAN_IP_RANGE="192.168.100.0/24"
LAN_IFACE="eth0"

LO_IFACE="lo"
LO_IP="127.0.0.1"

IPTABLES="/sbin/iptables"


$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

$IPTABLES -N allowed
$IPTABLES -N allaccess
$IPTABLES -N tcp_packets
$IPTABLES -N udp_packets
$IPTABLES -N icmp_packets

$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK \
-m state --state NEW -j REJECT --reject-with tcp-reset
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG \
--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP


$IPTABLES -A allowed -p tcp --syn -j LOG \
--log-prefix "Input packet"
$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A allowed -p TCP -j DROP


$IPTABLES -A allaccess -p TCP -j LOG --log-prefix "Port Forwarding: "
$IPTABLES -A allaccess -p TCP -j ACCEPT



#-ftp ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 20 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 21 -j allowed
#-ssh ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed
#-http ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed
#-Email ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 25 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --source-port 25 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 110 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 143 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 113 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 993 -j allowed
#-squid ports
#$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 3128 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 443 -j allowed
#-MSN Messenger ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 6891:6901 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 1863 -j allowed
#-Kazaa ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 1214 -j allowed
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 2608 -j allowed
#-Interent Switchboard ports
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 7750:7751 -j allaccess
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 3306 -j allowed


$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port 53 -j ACCEPT
if [ $DHCP == "yes" ] ; then
 $IPTABLES -A udp_packets -p UDP -s 0/0 --sport 67 \
 --dport 68 -j ACCEPT
fi

$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port 53 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port 123 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port 2074 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port 4000 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port 1863 -j ACCEPT
$IPTABLES -A udp_packets -p UDP -s 0/0 --source-port 6901 -j ACCEPT


#$IPTABLES -A udp_packets -p UDP -i $INET_IFACE -d 255.255.255.255 \
#--destination-port 67:68 -j DROP


$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

$IPTABLES -A INPUT -p tcp -j bad_tcp_packets

$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -j ACCEPT


$IPTABLES -A INPUT -p UDP -i $LAN_IFACE --dport 67 --sport 68 -j ACCEPT

$IPTABLES -A INPUT -p ALL -i $INET_IFACE -m state --state ESTABLISHED,RELATED \
-j ACCEPT
$IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets
$IPTABLES -A INPUT -p UDP -i $INET_IFACE -j udp_packets
$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets


$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT INPUT packet died: "


$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT



$IPTABLES -A FORWARD -p tcp -i $INET_IFACE --dport 7750:7751 -j ACCEPT
$IPTABLES -A FORWARD -p udp -i $INET_IFACE --dport 7750:7751 -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 4662 -j ACCEPT 


$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT FORWARD packet died: "

$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets

$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -o $INET_IFACE -j ACCEPT


$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
--log-level DEBUG --log-prefix "IPT OUTPUT packet died: "

$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp --dport 7750:7751 -j DNAT --to 192.168.100.12
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p udp --dport 7750:7751 -j DNAT --to 192.168.100.12
$IPTABLES -t nat -A PREROUTING -i $INET_IFACE -p tcp --dport 4662 -j DNAT --to 192.168.100.11

if [ $PPPOE_PMTU == "yes" ] ; then
 $IPTABLES -t nat -A POSTROUTING -p tcp --tcp-flags SYN,RST SYN \
 -j TCPMSS --clamp-mss-to-pmtu
fi
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j MASQUERADE


--------------070208090900030905050808--



