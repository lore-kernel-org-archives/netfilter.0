From: Jason Williams <jwilliams@courtesymortgage.com>
Subject: Help with iptables script
Date: Tue, 14 Dec 2004 16:22:33 -0800
Message-ID: <6.1.2.0.0.20041214161928.02702088@corpmail.courtesymortgage.com>
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

Evening everyone.

I will be quick to the point. Need some help with IPTables. New to 
IPTables, but not to firewalls. Right now, just getting my head wrapped 
around the differences and syntax IPTables compared to other firewalls i've 
used.

Anyway, working on just a very simple firewal script (for first time 
learning) to do the following:

1) Block all incoming requests to firewall host and private LAN

2) Do NAT for my private LAN

3) Allow private LAN outbound on all ports.

So far, this is what i've come up with. Not sure if it is correct, but 
thought i'd ask some of the experts on this list.

#External interface and IP info
INET_IP="1.2.3.4"
INET_IFACE="eth0"

#Private LAN macros
LAN_IP="192.168.1.0/24"
LAN_IFACE="eth2"

# IPTables Configuration.

IPTABLES="/usr/sbin/iptables"

# Set default policies for the INPUT, FORWARD and OUTPUT chains.
#

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP


#
# Take care of bad TCP packets that we don't want.
#

$IPTABLES -N bad_tcp_packets
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG 
--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

# Do some checks for obviously spoofed IP's

$IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 192.168.0.0/16 -j DROP
$IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 10.0.0.0/8 -j DROP
$IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 172.16.0.0/12 -j DROP

#Simple NAT setup

$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP

# Accept the packets we actually want to forward

$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG 
--log-level DEBUG --log-prefix "IPT FORWARD packet died: "

# INPUT chain

$IPTABLES -A INPUT -p tcp -j bad_tcp_packets


# OUTPUT chain

$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets

#
# Special OUTPUT rules to decide which IP's to allow.
#

$IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT

I build this from reading some how-to's, sample scripts and now started 
reading a book called "Red Hat Linux Firewalls" by Bill McCarty.

I appreciate any help.

Cheers,
Jason


