From: Gerd Knops <gerti-netfilter@bitart.com>
Subject: Force route to local?
Date: Sat, 19 Feb 2005 12:33:09 -0600
Message-ID: <9d2f2ab5f3a89fcc41889f81fb56ac77@bitart.com>
Mime-Version: 1.0 (Apple Message framework v619.2)
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

Hello all,

I have been trying to solve this problem for many hours now and can't.  
I hope someone here might be able to give me some insight...

The situation: Debian sarge, 2.6.8 kernel.

Firewall machine with 2 ethernet interfaces. On the 'inside' interface  
a LAN, SNAT. On the 'outside' interface two WANs (INET1 and INET2  
below) with a few static IPs on each, 2 gateways (2 ISPs).

I use some minor iproute2 magic to make sure the systems responds  
correctly to requests coming from either ISP by choosing the gateway  
for outbound packets based on the source address.

Everything works fine except one detail: The systems on the LAN can not  
connect to the firewall system by using one of the 2 'external' IPs of  
the firewall system. I tried everything I could think of. The most  
obvious solution to me seemed to be to assign the 2 external addresses  
as aliases to the internal interface (tried both via  
/etc/network/interfaces and ip addr add), but that doesn't seem to  
work. The packets come in to the 'inside' interface, and no responses.  
I logged all dropped/rejected pacjets on the firewall, these packets do  
not show. So I guess it is a routing problem.

How do I force the packets with a certain IP address to be handled as  
local?

(BTW If you are wondering why: There are a bunch of web sites hosted on  
the firewall system. I could just add them all to the internal name  
server and return the local address. But I shouldn't have to...)

I'd be really grateful for any pointers, I am at my wits end. My  
configuration is listed below.

Gerd

######################################################################## 
###
# Routing
######################################################################## 
###
#
# One table per ISP/gateway
#
$IP route add to default via $INET1_GATEWAY table 1
$IP route add to default via $INET2_GATEWAY table 2

#
# Rules: Make sure local packets stay local
#
$IP rule add to ${INET1_IP}/$INET1_PREFIX table main priority 4200
$IP rule add to ${INET2_IP}/$INET2_PREFIX table main priority 4202
#
# Then route remaining packets to the apropiate gateway
#
$IP rule add from $INET1_IP table 1 priority 4240
$IP rule add from $INET2_IP table 2 priority 4242

#
# And set the default route
#
$IP route delete default
$IP route add to default via $INET1_GATEWAY
$IP route flush cache


######################################################################## 
###
# Firewall
######################################################################## 
###
# Default policies
#
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

# new tables
#
$IPTABLES -N bad_tcp_packets
$IPTABLES -N allowed
$IPTABLES -N tcp_packets
$IPTABLES -N udp_packets
$IPTABLES -N icmp_packets

# bad_tcp_packets
#
$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK \
-m state --state NEW -j LOG --log-prefix "New xxx:"
$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK \
-m state --state NEW -j REJECT --reject-with tcp-reset
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG  
\
--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

# allowed
#
$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j  
ACCEPT
$IPTABLES -A allowed -p TCP -j DROP

# tcp_packets
# HTTPD
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 80 -j allowed

# udp_packets
# Nameserver
$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 53 -j ACCEPT

# icmp_packets
#
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

# INPUT chain
#

$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s ${LAN_IP}/${LAN_PREFIX} -j  
ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET1_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET2_IP -j ACCEPT

$IPTABLES -A INPUT -p tcp -j bad_tcp_packets

$IPTABLES -A INPUT -p ALL -d $INET1_IP -m state --state  
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -p ALL -d $INET2_IP -m state --state  
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -p TCP -i $INET_IFACE -j tcp_packets
$IPTABLES -A INPUT -p UDP -i $INET_IFACE -j udp_packets
$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets
$IPTABLES -A INPUT -j LOG --log-level DEBUG --log-prefix "IPT INPUT  
packet died: "

# FORWARD chain
#
$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets
$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -j LOG --log-level DEBUG --log-prefix "IPT FORWARD  
packet died: "

# OUTPUT chain
#
$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets
$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET1_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET2_IP -j ACCEPT
$IPTABLES -A OUTPUT -j LOG --log-level DEBUG --log-prefix "IPT OUTPUT  
packet died: "

# Clear nat rules, add new rule
$IPTABLES -t nat -F
$IPTABLES -t nat -A POSTROUTING -s ${LAN_IP}/${LAN_PREFIX} -o  
$INET_IFACE \
-j SNAT --to-source $MAIN_IP

# /proc set up
#
echo "1" > /proc/sys/net/ipv4/ip_forward


