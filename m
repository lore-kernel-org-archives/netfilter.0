From: "john bowers" <johnkbowers@hotmail.com>
Subject: Nat/router problem
Date: Tue, 23 Mar 2004 18:53:26 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY8-F12vEH28FeH4cW00003097@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi everyone, I've been using my iptables nat/router/firewall for many months 
now and love it.
It has two interfaces one ppp(eth1) to my dsl modem, and eth0 to my local 
network. My problem is
that when logged into the machine I have never been able to send packets out 
the back to my local
network. No ssh, ping, or anything. Ssh just dissapears and ping says 
operation not permitted.
I can ssh into the machine from the local network fine. Is it possible to 
route packets out
the back interface when using masquerading? I've included my iptables 
script, output
from iptables -L, and output from the command route. Is this a routing 
problem or are my
iptables rules wrong?








#/bin/bash
# nat router take 2
###############################################################################
# load modules & set proc values

#modprobe ip_conntrack_ftp
#modprobe iptable_nat

echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/ip_dynaddr
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo "1" > /proc/sys/net/ipv4/tcp_syncookies

# disable source routed packets
for f in /proc/sys/net/ipv4/conf/*/accept_source_route; do
	echo "0" > $f
done

# disable icmp redirect acceptance
for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do
	echo "0" > $f
done

# don't send redirect messages
for f in /proc/sys/net/ipv4/conf/*/send_redirects; do
	echo "0" > $f
done

# drop spoofed packets which would be responded to on another interface
for f in /proc/sys/net/ipv4/conf/*/rp_filter; do
	echo "1" > $f
done

# log packets with impossible addresses
for f in /proc/sys/net/ipv4/conf/*/log_martians; do
	echo "0" > $f
done
###############################################################################
# set variables



LAN_INTERFACE="eth0"
NAMESERVER_1="205.152.37.254"
NAMESERVER_2="205.152.144.235"
PRIVPORTS="0:1023"
UNPRIVPORTS="1024:65535"
LAN_ADDR="192.168.1.0/24"

LOOPBACK="127.0.0.0/8"
CLASS_A="10.0.0.0/8"
CLASS_B="172.16.0.0/12"
CLASS_C="192.168.0.0/16"
CLASS_D_MULTICAST="224.0.0.0/4"
CLASS_E_RESERVED_NET="240.0.0.0/5"
BROADCAST_SRC="0.0.0.0"
BROADCAST_DEST="255.255.255.255"

###############################################################################
# set default policy & flush old rules

iptables --flush
iptables -t nat --flush
iptables -t mangle --flush

iptables --delete-chain
iptables -t nat --delete-chain
iptables -t mangle --delete-chain

iptables --policy INPUT DROP
iptables --policy OUTPUT DROP
iptables --policy FORWARD DROP

iptables -t nat --policy POSTROUTING DROP

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
###############################################################################
# Stealth scans and tcp state flags

iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A FORWARD -p tcp --tcp-flags ALL NONE -j DROP

iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
iptables -A FORWARD -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP

iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN,RST -j DROP

iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
iptables -A FORWARD -p tcp --tcp-flags FIN,RST FIN,RST -j DROP

iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
iptables -A FORWARD -p tcp --tcp-flags ACK,FIN FIN -j DROP

iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
iptables -A FORWARD -p tcp --tcp-flags ACK,PSH PSH -j DROP

iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP
iptables -A FORWARD -p tcp --tcp-flags ACK,URG URG -j DROP
###############################################################################
# source address spoofing & other bad addresses

iptables -A INPUT -i ppp0 -s $LAN_ADDR -j DROP
iptables -A INPUT -i ppp0 -s $CLASS_A -j DROP
iptables -A INPUT -i ppp0 -s $CLASS_B -j DROP
iptables -A INPUT -i ppp0 -s $CLASS_C -j DROP
iptables -A INPUT -i ppp0 -s $LOOPBACK -j DROP
iptables -A INPUT -i ppp0 -s $BROADCAST_DEST -j DROP
iptables -A INPUT -i ppp0 -s $BROADCAST_SRC -j LOG
iptables -A INPUT -i ppp0 -s $BROADCAST_SRC -j DROP
iptables -A INPUT -i ppp0 -s $CLASS_D_MULTICAST -j DROP
iptables -A INPUT -i ppp0 -p ! udp -d $CLASS_D_MULTICAST -j DROP
iptables -A INPUT -i ppp0 -p udp -d $CLASS_D_MULTICAST -j ACCEPT
iptables -A INPUT -i ppp0 -s $CLASS_E_RESERVED_NET -j DROP



iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE


################################################################################
# INPUT RULES

#RELATED & ESTABLISHED RULES
iptables -A INPUT -i ppp0 \
	-m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A OUTPUT -o ppp0 \
	-m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A OUTPUT -o eth0 \
	-m state --state ESTABLISHED,RELATED -j ACCEPT

#DNS
iptables -A OUTPUT -o ppp0 -p udp \
	--sport $UNPRIVPORTS -d $NAMESERVER_1 --dport 53 \
	-m state --state NEW -j ACCEPT

iptables -A OUTPUT -o ppp0 -p udp \
	--sport $UNPRIVPORTS -d $NAMESERVER_2 --dport 53 \
	-m state --state NEW -j ACCEPT

iptables -A OUTPUT -o $LAN_INTERFACE -p udp \
	 -d 192.168.1.100 --dport 53 \
	-m state --state NEW -j ACCEPT
#HTTP
iptables -A OUTPUT -o ppp0 -p tcp \
	--sport $UNPRIVPORTS --dport 80 \
	-m state --state NEW -j ACCEPT

#MORE ESTABLISHED & RELATED
iptables -A INPUT -i $LAN_INTERFACE \
	-m state --state ESTABLISHED,RELATED -j ACCEPT

#SSH
iptables -A INPUT -i $LAN_INTERFACE -p tcp \
	-s $LAN_ADDR --sport $UNPRIVPORTS --dport 22 \
	-m state --state NEW -j ACCEPT

iptables -A OUTPUT -o $LAN_INTERFACE -p tcp \
	-s 192.168.1.104 --sport $UNPRIVPORTS -d $LAN_ADDR --dport 22 \
	-m state --state NEW -j ACCEPT

iptables -A OUTPUT -o $LAN_INTERFACE -p tcp \
	 -d $LAN_ADDR --sport 22  --dport $UNPRIVPORTS \
	-m state --state NEW -j ACCEPT
#RSYNC
iptables -A OUTPUT -o ppp0 -p tcp \
	--dport 873 -m state --state NEW -j ACCEPT

#ICMP
iptables -A OUTPUT -o $LAN_INTERFACE -p icmp \
	--icmp-type echo-request \
	-m state --state NEW -j ACCEPT

iptables -A OUTPUT -o $LAN_INTERFACE -p icmp \
	--icmp-type echo-reply \
	-m state --state NEW -j ACCEPT

iptables -A INPUT -i ppp0 -p icmp \
	--icmp-type source-quench -j ACCEPT

iptables -A OUTPUT -o ppp0 -p icmp \
	--icmp-type source-quench -j ACCEPT

# allow router to be pinged
iptables -A INPUT -i $LAN_INTERFACE -p icmp \
	--icmp-type echo-request \
	-m state --state NEW -j ACCEPT

iptables -A OUTPUT -o $LAN_INTERFACE -p icmp \
	--icmp-type echo-reply \
	-m state --state NEW -j ACCEPT

#iptables -A INPUT -i ppp0 \
#	-p icmp -m limit --limit 1/second -j LOG

iptables -A INPUT -i eth0 -p icmp \
	-m limit  -j LOG

#iptables -A INPUT -i ppp0 -p tcp \
#	-m limit -j LOG

#iptables -A INPUT -i ppp0 -p udp \
#	-m limit -j LOG

iptables -A INPUT -i ppp0 -p udp \
	-j LOG

iptables -A INPUT -i ppp0 -p tcp \
	-j LOG

iptables -A INPUT -i eth0 -p icmp \
	-m limit --limit 1/second -j LOG

iptables -A INPUT -i eth0 \
	-m limit -j LOG

iptables -A OUTPUT -o eth0 \
	-m limit -j LOG
###############################################################################
# FORWARD RULES

# ESTABLISHED & RELATED CONNECTIONS

iptables -A FORWARD -i ppp0 -o $LAN_INTERFACE \
	-m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -i $LAN_INTERFACE -o ppp0 \
	-m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -o ppp0 \
	-m state --state ESTABLISHED,RELATED -j ACCEPT
#GAIM
iptables -A FORWARD -o ppp0 -p tcp \
	--sport $UNPRIVPORTS --dport 5190 \
	-m state --state NEW -j ACCEPT

#ICMP
iptables -A FORWARD -i ppp0 -p icmp \
	--icmp-type source-quench -d $LAN_ADDR -j ACCEPT

iptables -A FORWARD -o ppp0 -p icmp \
	--icmp-type source-quench -s $LAN_ADDR -j ACCEPT

#DNS
iptables -A FORWARD -o ppp0 -p udp \
	-s $LAN_ADDR --sport $UNPRIVPORTS -d $NAMESERVER_1 --dport 53 \
	-m state --state NEW -j ACCEPT

iptables -A FORWARD -o ppp0 -p udp \
	-s $LAN_ADDR --sport $UNPRIVPORTS -d $NAMESERVER_2 --dport 53 \
	-m state --state NEW -j ACCEPT

iptables -A FORWARD -o ppp0 -p tcp \
	-s $LAN_ADDR --sport $UNPRIVPORTS -d $NAMESERVER_1 --dport 53 \
	-m state --state NEW -j ACCEPT

iptables -A FORWARD -o ppp0 -p tcp \
        -s $LAN_ADDR --sport $UNPRIVPORTS -d $NAMESERVER_2 --dport 53 \
        -m state --state NEW -j ACCEPT

#HTTP
iptables -A FORWARD -o ppp0 -p tcp \
	-s $LAN_ADDR --sport $UNPRIVPORTS --dport 80 \
	-m state --state NEW -j ACCEPT
#HTTPS
iptables -A FORWARD -o ppp0 -p tcp \
	-s $LAN_ADDR --sport $UNPRIVPORTS --dport 443 \
	-m state --state NEW -j LOG

iptables -A FORWARD -o ppp0 -p tcp \
	-s $LAN_ADDR --sport $UNPRIVPORTS --dport 443 \
	-m state --state NEW -j ACCEPT

#Mail to Mike & Hotmail
iptables -A FORWARD -o ppp0 -p tcp \
	-s $LAN_ADDR -d 206.65.55.130  --dport 25 \
	-m state --state NEW -j ACCEPT

iptables -A FORWARD -o ppp0 -p tcp \
	-s $LAN_ADDR -d 65.54.252.230 --dport 25 \
	-m state --state NEW -j ACCEPT

#NTP
iptables -A FORWARD -o ppp0 -p udp \
	-s 192.168.1.100 --dport 123 \
	-m state --state NEW -j ACCEPT

#DROP X WINDOWS REQUEST
iptables -A FORWARD -i ppp0 -p tcp \
	-d $LAN_ADDR --dport 6000:6009 -j DROP

iptables -A FORWARD -o ppp0 -p tcp \
	-s $LAN_ADDR --sport $UNPRIVPORTS --dport $UNPRIVPORTS \
	-m state --state NEW -j ACCEPT

iptables -A FORWARD -o ppp0 -p udp \
	-s $LAN_ADDR --sport $UNPRIVPORTS --dport $UNPRIVPORTS \
	-m state --state NEW -j ACCEPT

# Non Stateful FTP
iptables -A FORWARD -i ppp0 -o eth0 -p tcp ! --syn \
	--sport 21 -d $LAN_ADDR --dport $UNPRIVPORTS -j ACCEPT

iptables -A FORWARD -i eth0 -o ppp0 -p tcp \
	-s $LAN_ADDR --sport $UNPRIVPORTS \
	--dport 21 -j ACCEPT

iptables -A FORWARD -i eth0 -o ppp0 -p tcp \
	-s $LAN_ADDR --sport $UNPRIVPORTS \
	--dport 20 -j ACCEPT

iptables -A FORWARD -i ppp0 -o eth0 -p tcp ! --syn \
	--sport 20 -d $LAN_ADDR --dport $UNPRIVPORTS -j ACCEPT
# RSYNC
iptables -A FORWARD -i eth0 -o ppp0 -p tcp \
	-s $LAN_ADDR --sport $UNPRIVPORTS --dport 873 -j ACCEPT

iptables -A FORWARD -i eth0 -o ppp0 -p udp \
	-s $LAN_ADDR --sport $UNPRIVPORTS --dport 873 -j ACCEPT

# Logging
iptables -A FORWARD -p icmp \
	-m limit --limit 1/second -j LOG

iptables -A FORWARD \
	-m limit -j LOG

adsl-start

route add -host 192.168.1.100 eth0
route add -host 192.168.1.101 eth0
route add -host 192.168.1.102 eth0

echo "Gentoo Nat/Router/Firewall take 1 : 1/16/04"
exit 0




################################################################################
#################################################################################
#################################################################################

		THIS IS THE OUTPUT FROM iptables -L


Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
DROP       tcp  --  anywhere             anywhere           tcp 
flags:FIN,SYN,RST,PSH,ACK,URG/NONE
DROP       tcp  --  anywhere             anywhere           tcp 
flags:FIN,SYN/FIN,SYN
DROP       tcp  --  anywhere             anywhere           tcp 
flags:SYN,RST/SYN,RST
DROP       tcp  --  anywhere             anywhere           tcp 
flags:FIN,RST/FIN,RST
DROP       tcp  --  anywhere             anywhere           tcp 
flags:FIN,ACK/FIN
DROP       tcp  --  anywhere             anywhere           tcp 
flags:PSH,ACK/PSH
DROP       tcp  --  anywhere             anywhere           tcp 
flags:ACK,URG/URG
DROP       all  --  localnet/24          anywhere
DROP       all  --  10.0.0.0/8           anywhere
DROP       all  --  172.16.0.0/12        anywhere
DROP       all  --  192.168.0.0/16       anywhere
DROP       all  --  loopback.mia.bellsouth.net/8  anywhere
DROP       all  --  255.255.255.255      anywhere
LOG        all  --  0.0.0.0              anywhere           LOG level 
warning
DROP       all  --  0.0.0.0              anywhere
DROP       all  --  BASE-ADDRESS.MCAST.NET/4  anywhere
DROP      !udp  --  anywhere             BASE-ADDRESS.MCAST.NET/4
ACCEPT     udp  --  anywhere             BASE-ADDRESS.MCAST.NET/4
DROP       all  --  240.0.0.0/5          anywhere
ACCEPT     all  --  anywhere             anywhere           state 
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere           state 
RELATED,ESTABLISHED
ACCEPT     tcp  --  localnet/24          anywhere           tcp 
spts:1024:65535 dpt:ssh state NEW
ACCEPT     icmp --  anywhere             anywhere           icmp 
source-quench
ACCEPT     icmp --  anywhere             anywhere           icmp 
echo-request state NEW
LOG        icmp --  anywhere             anywhere           limit: avg 
3/hour burst 5 LOG level warning
LOG        udp  --  anywhere             anywhere           LOG level 
warning
LOG        tcp  --  anywhere             anywhere           LOG level 
warning
LOG        icmp --  anywhere             anywhere           limit: avg 1/sec 
burst 5 LOG level warning
LOG        all  --  anywhere             anywhere           limit: avg 
3/hour burst 5 LOG level warning

Chain FORWARD (policy DROP)
target     prot opt source               destination
DROP       tcp  --  anywhere             anywhere           tcp 
flags:FIN,SYN,RST,PSH,ACK,URG/NONE
DROP       tcp  --  anywhere             anywhere           tcp 
flags:FIN,SYN/FIN,SYN
DROP       tcp  --  anywhere             anywhere           tcp 
flags:SYN,RST/SYN,RST
DROP       tcp  --  anywhere             anywhere           tcp 
flags:FIN,RST/FIN,RST
DROP       tcp  --  anywhere             anywhere           tcp 
flags:FIN,ACK/FIN
DROP       tcp  --  anywhere             anywhere           tcp 
flags:PSH,ACK/PSH
DROP       tcp  --  anywhere             anywhere           tcp 
flags:ACK,URG/URG
ACCEPT     all  --  anywhere             anywhere           state 
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere           state 
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere           state 
RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere           tcp 
spts:1024:65535 dpt:5190 state NEW
ACCEPT     icmp --  anywhere             localnet/24        icmp 
source-quench
ACCEPT     icmp --  localnet/24          anywhere           icmp 
source-quench
ACCEPT     udp  --  localnet/24          ns.asm.bellsouth.netudp 
spts:1024:65535 dpt:domain state NEW
ACCEPT     udp  --  localnet/24          ns1.mia.bellsouth.netudp 
spts:1024:65535 dpt:domain state NEW
ACCEPT     tcp  --  localnet/24          ns.asm.bellsouth.nettcp 
spts:1024:65535 dpt:domain state NEW
ACCEPT     tcp  --  localnet/24          ns1.mia.bellsouth.nettcp 
spts:1024:65535 dpt:domain state NEW
ACCEPT     tcp  --  localnet/24          anywhere           tcp 
spts:1024:65535 dpt:www state NEW
LOG        tcp  --  localnet/24          anywhere           tcp 
spts:1024:65535 dpt:https state NEW LOG level warning
ACCEPT     tcp  --  localnet/24          anywhere           tcp 
spts:1024:65535 dpt:https state NEW
ACCEPT     tcp  --  localnet/24          mx.supplies.net    tcp dpt:smtp 
state NEW
ACCEPT     tcp  --  localnet/24          mc6.bay6.hotmail.comtcp dpt:smtp 
state NEW
ACCEPT     udp  --  192.168.1.100        anywhere           udp dpt:ntp 
state NEW
ACCEPT     tcp  --  localnet/24          anywhere           tcp dpt:whois 
state NEW
DROP       tcp  --  anywhere             localnet/24        tcp 
dpts:x11:6009
ACCEPT     tcp  --  localnet/24          anywhere           tcp 
spts:1024:65535 dpts:1024:65535 state NEW
ACCEPT     udp  --  localnet/24          anywhere           udp 
spts:1024:65535 dpts:1024:65535 state NEW
ACCEPT     tcp  --  anywhere             localnet/24        tcp spt:ftp 
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     tcp  --  localnet/24          anywhere           tcp 
spts:1024:65535 dpt:ftp
ACCEPT     tcp  --  localnet/24          anywhere           tcp 
spts:1024:65535 dpt:ftp-data
ACCEPT     tcp  --  anywhere             localnet/24        tcp spt:ftp-data 
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
LOG        icmp --  anywhere             anywhere           limit: avg 1/sec 
burst 5 LOG level warning
LOG        all  --  anywhere             anywhere           limit: avg 
3/hour burst 5 LOG level warning

Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere           state 
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere           state 
RELATED,ESTABLISHED
ACCEPT     udp  --  anywhere             ns.asm.bellsouth.netudp 
spts:1024:65535 dpt:domain state NEW
ACCEPT     udp  --  anywhere             ns1.mia.bellsouth.netudp 
spts:1024:65535 dpt:domain state NEW
ACCEPT     udp  --  anywhere             192.168.1.100      udp dpt:domain 
state NEW
ACCEPT     tcp  --  anywhere             anywhere           tcp 
spts:1024:65535 dpt:www state NEW
ACCEPT     tcp  --  nat                  localnet/24        tcp 
spts:1024:65535 dpt:ssh state NEW
ACCEPT     tcp  --  anywhere             localnet/24        tcp spt:ssh 
dpts:1024:65535 state NEW
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ftp 
state NEW
ACCEPT     icmp --  anywhere             anywhere           icmp 
echo-request state NEW
ACCEPT     icmp --  anywhere             anywhere           icmp echo-reply 
state NEW
ACCEPT     icmp --  anywhere             anywhere           icmp 
source-quench
ACCEPT     icmp --  anywhere             anywhere           icmp echo-reply 
state NEW
LOG        all  --  anywhere             anywhere           limit: avg 
3/hour burst 5 LOG level warning



#######################################################################################################
####################################################################################################
####################################################################################################

		This is the output from my the route command

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
adsl-158-16-1.a *               255.255.255.255 UH    0      0        0 ppp0
192.168.1.102   *               255.255.255.255 UH    0      0        0 eth0
192.168.1.100   *               255.255.255.255 UH    0      0        0 eth0
192.168.1.101   *               255.255.255.255 UH    0      0        0 eth0
localnet        *               255.255.255.0   U     0      0        0 eth0
default         adsl-158-16-1.a 0.0.0.0         UG    0      0        0 ppp0

_________________________________________________________________
Find a broadband plan that fits. Great local deals on high-speed Internet 
access. http://click.atdmt.com/AVE/go/onm00200360ave/direct/01/


