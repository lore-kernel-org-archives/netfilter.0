From: Rudi Starcevic <tech@wildcash.com>
Subject: Re: dumb question...route from local eth1 to eth2 and vice versa
Date: Thu, 01 Dec 2005 16:59:37 +1000
Message-ID: <438E9F59.9030007@wildcash.com>
References: <000001c5f642$ab8b8890$0101000a@sterenborg.info>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030205090100050202010204"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c5f642$ab8b8890$0101000a@sterenborg.info>
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
--------------030205090100050202010204
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I have two scripts I use to do something similar to this.

I figured this out just reading howto's on the web so
it could be fully wrong and I may get flamed for posting them.

What the scipts does is connect two networks and is
an internet gateway for both.

I think this setup should work OK for your gaming setup.
Just edit the networks to suit what you need.

The Linux router box has 2 NICs

eth0: 192.168.1.0/24
eth1: 192.168.3.0/24

The default gateway is the ADSL modem: 192.168.1.254

Both networks can see each other, the machines on the
192.168.3.0/24 network set their gateway as the Linux box
which in turn forwards their traffic to it default gw 192.168.1.254.

The script uses 'iproute' and 'iptables'.

Any feedback much appreciated.

Thanks.
Kind regards,
Rudi.


 




--------------030205090100050202010204
Content-Type: text/plain;
 name="ip_b_firewall_1.sh"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ip_b_firewall_1.sh"

#!/bin/bash

echo "Firewall Setup Start"

## Our "die" function (think perl)
function die () { echo "$@" 1>&2 ; exit 1 ; }

## Test we have what we need
hash iptables date modprobe || die $0: required binaries not present

## Some key IP addresses
IMPIP1=220.245.105.25
IMPIP2=203.144.16.126

################################################################################
echo -n "Firewall: sysctl "

# Enable additional kernel security
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo 1 > /proc/sys/net/ipv4/tcp_syncookies
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
echo 1 > /proc/sys/net/ipv4/conf/eth1/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/eth1/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/eth1/accept_source_route
echo 0 > /proc/sys/net/ipv4/conf/eth1/bootp_relay
echo 1 > /proc/sys/net/ipv4/conf/eth1/log_martians

# ECN isn't handled correctly on the Internet.
echo 0 > /proc/sys/net/ipv4/tcp_ecn

# Activate window scaling according to RFC 1323
# Activate timestamps according to RFC 1323
echo 1 > /proc/sys/net/ipv4/tcp_window_scaling
echo 1 > /proc/sys/net/ipv4/tcp_timestamps

# Enable forwarding
echo "Enable Kernel Forwarding"
echo 1 > /proc/sys/net/ipv4/ip_forward

################################################################################
echo -n "reset "

for chain in INPUT FORWARD OUTPUT ; do
iptables --policy $chain DROP
done

for table in filter nat mangle ; do
iptables --table $table --flush
iptables --table $table --delete-chain
done

modprobe ip_nat_ftp

################################################################################
echo -n "INPUT "

# accept everything from ws202 box
iptables -A INPUT -i eth0 -s 192.168.3.110 -j ACCEPT

# allows HTTP connections from anywhere

#iptables -A INPUT -p tcp --syn --dport 80 -j ULOG
#iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s $IMPIP1 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s $IMPIP2 -j ACCEPT

# java cambozola web camera
#iptables -A INPUT -p tcp --dport 8081 -j ACCEPT
iptables -A INPUT -p tcp --dport 8081 -s $IMPIP1 -j ACCEPT
iptables -A INPUT -p tcp --dport 8081 -s $IMPIP2 -j ACCEPT

# allow FTP connections restricted by IP
#iptables -A INPUT -p tcp --dport 21 -s $IMPIP1 -j ACCEPT
#iptables -A INPUT -p tcp --dport 21 -s $IMPIP2 -j ACCEPT
#iptables -A INPUT -p tcp --dport 21 -s $IMPIP3 -j ACCEPT

# allows SSH connections restricted by IP

#iptables -A INPUT -p tcp --syn --dport 22 -j ULOG

#iptables -A INPUT -p tcp --dport 22 -s $IMPIP1 -j ACCEPT
#iptables -A INPUT -p tcp --dport 22 -s $IMPIP2 -j ACCEPT
#iptables -A INPUT -p tcp --dport 22 -s $IMPIP3 -j ACCEPT
#iptables -A INPUT -i eth1 -p tcp --dport 22 -j ACCEPT

# ssh access
iptables -A INPUT -i eth1 -p tcp --dport 22 -j ACCEPT

# bittorrent
iptables -A INPUT -i eth1 -p tcp --dport 6881 -j ACCEPT

# allows MYSQL connections restricted by IP
#iptables -A INPUT -p tcp --dport 3306 -s $IMPIP1 -j ACCEPT

# allows unrestricted connections over the local interface
# allows conections from lan
# allows established connections
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i eth1 -s 192.168.1.0/24 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allows helpful ICMP packets (first four are really needed)
iptables -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
iptables -A INPUT -p icmp --icmp-type source-quench -j ACCEPT
iptables -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A INPUT -p icmp --icmp-type parameter-problem -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT

################################################################################
echo -n "FORWARD " 
iptables -A FORWARD -i eth0 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -t mangle -A POSTROUTING -p tcp -s 192.168.3.110 -j CLASSIFY --set-class 1:10

################################################################################
echo -n "OUTPUT "

# allows unrestricted output from this machine
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -o eth0 -j ACCEPT
iptables -A OUTPUT -o eth1 -j ACCEPT

################################################################################
echo done.

--------------030205090100050202010204
Content-Type: text/plain;
 name="ip_a_route_1.sh"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ip_a_route_1.sh"

#!/bin/sh

echo "Network Setup Start"

echo "Flushing NICs"
ip addr flush eth0
ip addr flush eth1

ip link set eth0 down
ip link set eth1 down

ip link set eth0 up
ip link set eth1 up

echo "Routing Tables:"
cat /etc/iproute2/rt_tables 
### example file ###
## reserved values
##
#255	local
#254	main
#253	default
#0	unspec
##
## local
##
##1	inr.ruhep
#200	implan
#201	inet
### example end ###

echo "Setup NIC 0"
ip addr add 192.168.3.10/24 dev eth0 brd +

echo "Setup NIC 1"
ip addr add 192.168.1.1/24 dev eth1 brd +

ip addr list
ip route list

echo "Setup Default Route [ inet table ]"
ip route add default via 192.168.1.254 proto static table inet

echo "Setup LAN Route [ implan table ]"
ip route add 192.168.3/24 via 192.168.3.10 proto static table implan

ip route list

echo "Setup LAN ip rule"
ip rule add to 192.168.3/24 prio 16000 table implan

echo "Setup Internet ip rule"
ip rule add to 0/0 prio 17000 table inet

echo "Flushing ip route cache"
ip route flush cache

--------------030205090100050202010204--

