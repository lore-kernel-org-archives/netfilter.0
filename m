From: Gerry Weaver <gerryw@it-procorp.com>
Subject: Nat for two private subnets with subnet routing
Date: Wed, 21 Jul 2004 00:42:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FE0238.4030500@it-procorp.com>
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
To: netfilter <netfilter@lists.netfilter.org>


Hello All,



I'm having a bit of trouble setting up a linux router with two private 
subnets. Each subnet can access the internet, but they cannot 
communicate with each other. I've include my rules. Any and all advice 
would be greatly appreciated.



Thanks in advance,

-G



### setup networking ############################################



LAN_IP1="10.10.10.1/24"

LAN_IP2="10.10.11.254/24"



echo "Bringing down interfaces"



# bring down interfaces

ip link set $WAN_IFACE down

ip link set $LAN_IFACE1 down

ip link set $LAN_IFACE2 down



echo "Setting interface addresses"



# set interface addresses

ip addr add $WAN_IP dev $WAN_IFACE

ip addr add $LAN_IP1 dev $LAN_IFACE1

ip addr add $LAN_IP2 dev $LAN_IFACE2



echo "Cleanup iptables"



# clean up the tables

iptables -F

iptables -X

iptables -Z



echo "Setting default policies"



# Set the default policies

iptables -P INPUT DROP

iptables -P OUTPUT DROP

iptables -P FORWARD DROP



echo "Bringing up interfaces"



# bring up interfaces

ip link set $WAN_IFACE up

ip link set $LAN_IFACE1 up

ip link set $LAN_IFACE2 up



echo "Adding default route"



# add default route

ip route add default via $INET_ROUTER dev eth0



echo "Enable forwarding"



# Enable ip_forward

echo "1" > /proc/sys/net/ipv4/ip_forward



### setup firewall
#######################################################                                                                               



# Let stuff on the local loopback through

iptables -A INPUT -i lo -j ACCEPT

iptables -A OUTPUT -o lo -j ACCEPT



echo "Setup SNAT..."



# Source NAT

iptables -t nat -A POSTROUTING -s 10.10.11.0/24 -j SNAT --to 67.65.229.8





echo "Accept internal addresses"



# packets with valid internal address are accepted on $LAN_IFACE

iptables -t mangle -A PREROUTING -i $LAN_IFACE1 -s 
$INTERNAL_ADDRESS_RANGE1 -j ACCEPT

iptables -t mangle -A PREROUTING -i $LAN_IFACE2 -s 
$INTERNAL_ADDRESS_RANGE2 -j ACCEPT

#iptables -t mangle -A PREROUTING -i $LAN_IFACE1 -s 
$INTERNAL_ADDRESS_RANGE2 -j ACCEPT

#iptables -t mangle -A PREROUTING -i $LAN_IFACE2 -s 
$INTERNAL_ADDRESS_RANGE1 -j ACCEPT



# no packets with $LAN_IP accepted on $WAN_IFACE

iptables -t mangle -A PREROUTING -i $WAN_IFACE -s 
$INTERNAL_ADDRESS_RANGE1 -j DROP

iptables -t mangle -A PREROUTING -i $WAN_IFACE -s 
$INTERNAL_ADDRESS_RANGE2 -j DROP



# allow connections to firewall from LAN

iptables -A INPUT -p ALL -i $LAN_IFACE1 -s $INTERNAL_ADDRESS_RANGE1 -d 
$LAN_BCAST_ADDRESS1 -j ACCEPT

iptables -A INPUT -p ALL -i $LAN_IFACE2 -s $INTERNAL_ADDRESS_RANGE2 -d 
$LAN_BCAST_ADDRESS2 -j ACCEPT





iptables -A OUTPUT -o $WAN_IFACE -j ACCEPT



# First off, allow through standard subnet-subnet traffic.  It doesn't need

# to be logged, so get it out of there



# Accept the traffic to and from the subnets

iptables -A FORWARD -p all -s $INTERNAL_ADDRESS_RANGE1 -d 
$INTERNAL_ADDRESS_RANGE1 -j ACCEPT

iptables -A FORWARD -p ALL -s $INTERNAL_ADDRESS_RANGE2 -d 
$INTERNAL_ADDRESS_RANGE2 -j ACCEPT

#iptables -A FORWARD -p ALL -s $INTERNAL_ADDRESS_RANGE1 -d 
$INTERNAL_ADDRESS_RANGE2 -j ACCEPT

#iptables -A FORWARD -p ALL -s $INTERNAL_ADDRESS_RANGE2 -d 
$INTERNAL_ADDRESS_RANGE1 -j ACCEPT



# Put in a syn flood rule to stop people from a DOS attack

# Commented out while testing things

iptables -N syn-flood

iptables -A FORWARD -p tcp --syn -j syn-flood

iptables -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN

iptables -A syn-flood -j DROP



# Allow new connections out (And logged for interest sake)

#iptables -A FORWARD -p tcp -s $INTERNAL_ADDRESS_RANGE --syn -m state 
--state NEW -j LOG --log-prefix "New connection: "

iptables -A FORWARD -p tcp -s $INTERNAL_ADDRESS_RANGE1 --syn -m state 
--state NEW -j ACCEPT

iptables -A FORWARD -p tcp -s $INTERNAL_ADDRESS_RANGE2 --syn -m state 
--state NEW -j ACCEPT



# allow all DNS traffic out

iptables -A FORWARD -p udp -s $INTERNAL_ADDRESS_RANGE1 -j ACCEPT

iptables -A FORWARD -p udp -s $INTERNAL_ADDRESS_RANGE2 -j ACCEPT



# And accept established connections

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT



# Also don't allow fragments - they're bad

iptables -A FORWARD -f -j LOG --log-prefix "IP Fragment: "

iptables -A FORWARD -f -j DROP



# Allow ping out (but not in)

iptables -A FORWARD -p icmp -s $INTERNAL_ADDRESS_RANGE1 -j ACCEPT

iptables -A FORWARD -p icmp -s $INTERNAL_ADDRESS_RANGE2 -j ACCEPT



# And in this bit we'll put the things we do allow in

# Allow web requests to web server

iptables -A FORWARD -p tcp -d $WWW --dport 80 -j ACCEPT



# FTP connections to ftp server

iptables -A FORWARD -p tcp -d $FTP --dport 21 -j ACCEPT



# Allow incoming mail

iptables -A FORWARD -p tcp -d $MAIL --dport 25 -j ACCEPT





# DNS lookups to DNS

iptables -A FORWARD -p tcp -d $DNSa --dport 53 -j ACCEPT

iptables -A FORWARD -p udp -d $DNSa --dport 53 -j ACCEPT



# And DNS requests to Secondary DNS

iptables -A FORWARD -p tcp -d $DNSb --dport 53 -j ACCEPT

iptables -A FORWARD -p udp -d $DNSb --dport 53 -j ACCEPT



# Log and drop stuff

iptables -A FORWARD -p tcp -j LOG --log-prefix "Dropped TCP: "

iptables -A FORWARD -p tcp -j DROP



iptables -A FORWARD -p udp -j LOG --log-prefix "Dropped UDP: "

iptables -A FORWARD -p udp -j DROP



iptables -A FORWARD -p icmp -j LOG --log-prefix "Dropped ICMP: "

iptables -A FORWARD -p icmp -j DROP



# This is to really make sure things disappear

iptables -A FORWARD -j LOG --log-prefix "End Forward chain - Dropped: "

iptables -A FORWARD -j DROP



       
                  
                  








