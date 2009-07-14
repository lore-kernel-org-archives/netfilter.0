From: "Bo Lynch" <blynch@ameliaschools.com>
Subject: Iptables Forward Issues
Date: Tue, 14 Jul 2009 08:42:17 -0400 (EDT)
Message-ID: <47215.69.21.103.130.1247575337.squirrel@ameliaschools.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello everyone. Having a little bit of a problem forwarding ports to an
internal box. I am using iptables as a firewall. I have 3 NICS with
eth0 = 69.x.x.130
eth1 = 192.168.1.1 ####LAN####
eth2 - 69.x.x.132

I'm trying to forward traffic for specific ports from eth2 to an internal
ip of 192.168.1.3. We also use this as a masquerade for our internal
network using eth0. Is this a problem setting this up like this?? Below is
my rules. Any help would be greatly appreciated.
Thank you

echo "1" > /proc/sys/net/ipv4/ip_forward
IPTABLES=/sbin/iptables
$IPTABLES -F
$IPTABLES -F INPUT
$IPTABLES -F OUTPUT
$IPTABLES -F FORWARD
$IPTABLES -F -t mangle
$IPTABLES -F -t nat
$IPTABLES -X


# eth0 is external, eth1 is internal network
#
############
#
# Policies
#
############
# set INPUT and FORWARD default policies to DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP
#a=$(tail -1 /tmp/lastip)
############
#
# PREROUTING table
#
############
############
#
# INPUT table
#
############
# we do allow ssh to the firewall from the internal network only (not the
dmz)
iptables -A INPUT -p tcp -i eth1 --destination-port 22 -j ACCEPT

#Block bad ports from INPUT

# allow connections from the internal network
iptables -A INPUT -i eth1 -j ACCEPT

# accept established and related external incoming connections to eth0
iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
# allow pings, but limit and log them
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/m -j
LOG
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j
ACCEPT

# internal IP address on external interface -- drop and log
iptables -A INPUT -i eth0 -s 192.168.0.0/16 -m limit --limit 1/m -j LOG
iptables -A INPUT -i eth0 -s 192.168.0.0/16 -j DROP

# drop all external incoming connections to eth0
iptables -A INPUT -i eth0 -m state --state NEW,INVALID -j DROP

# as a final guard, drop all other incoming syn packets
iptables -A INPUT -p tcp --syn -j DROP

# FORWARD table
#
############
# allow internal outgoing net connections except for http
iptables -A FORWARD -i eth1 -o eth0 -p udp -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p udp -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p icmp -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 443 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 21 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 9090 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 591 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 873 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 873 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 7880 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 7880 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p udp --dport 7880 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p udp --dport 7880 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 7080 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 7080 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p udp --dport 7080 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p udp --dport 7080 -j ACCEPT
iptables -A FORWARD -p tcp --dport 5071 -j ACCEPT
iptables -A FORWARD -p udp --dport 5071 -j ACCEPT
#iptables -A FORWARD -i eth0 -o eth1 -p tcp

##FORWARD SETUP FOR NETMEETING

iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 386 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 522 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 1503 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 1720 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 1731 -j ACCEPT
# block ipaddrs from forward for proxy bypass
# block proxy IP's from file
for i in `cat /root/proxies`
do
        iptables -A FORWARD -p tcp -s $i -j REJECT
done

# allow only the proxy for http
iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 192.168.2.2 -j ACCEPT

# accept return connections headed to internal and dmz clients
iptables -A FORWARD -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -t nat -A PREROUTING -p tcp -i eth2 -d 69.21.103.132 --dport 80
-j DNAT --to-destination 192.168.1.3:80
iptables -t nat -A PREROUTING -p tcp -i eth2 -d 69.21.103.132 --dport 5071
-j DNAT --to-destination 192.168.1.3:5071
iptables -t nat -A PREROUTING -p tcp -i eth2 -d 69.21.103.132 --dport 407
-j DNAT --to-destination 192.168.1.3:407
iptables -t nat -A PREROUTING -p tcp -i eth2 -d 69.21.103.132 --dport 1417
-j DNAT --to-destination 192.168.1.3:1417
iptables -t nat -A PREROUTING -p tcp -i eth2 -d 69.21.103.132 --dport 1418
-j DNAT --to-destination 192.168.1.3:1418
iptables -t nat -A PREROUTING -p tcp -i eth2 -d 69.21.103.132 --dport 1419
-j DNAT --to-destination 192.168.1.3:1419
iptables -t nat -A PREROUTING -p tcp -i eth2 -d 69.21.103.132 --dport 1420
-j DNAT --to-destination 192.168.1.3:1420
iptables -t nat -A PREROUTING -p tcp -i eth2 -d 69.21.103.132 --dport 7880
-j DNAT --to-destination 192.168.1.3:7880
iptables -t nat -A PREROUTING -p tcp -i eth2 -d 69.21.103.132 --dport 443
-j DNAT --to-destination 192.168.1.3:443
iptables -t nat -A PREROUTING -p udp -i eth2 -d 69.21.103.132 --dport 407
-j DNAT --to-destination 192.168.1.3:407
iptables -t nat -A PREROUTING -p udp -i eth2 -d 69.21.103.132 --dport 1417
-j DNAT --to-destination 192.168.1.3:1417
iptables -t nat -A PREROUTING -p udp -i eth2 -d 69.21.103.132 --dport 1418
-j DNAT --to-destination 192.168.1.3:1418
iptables -t nat -A PREROUTING -p udp -i eth2 -d 69.21.103.132 --dport 1419
-j DNAT --to-destination 192.168.1.3:1419
iptables -t nat -A PREROUTING -p udp -i eth2 -d 69.21.103.132 --dport 1420
-j DNAT --to-destination 192.168.1.3:1420
iptables -t nat -A PREROUTING -p udp -i eth2 -d 69.21.103.132 --dport 7880
-j DNAT --to-destination 192.168.1.3:7880
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 5071 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 407 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 1417 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 1418 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 1419 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 1420 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 7880 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 443 -j ACCEPT
iptables -A FORWARD -p udp -i eth2 -d 192.168.1.3 --dport 407 -j ACCEPT
iptables -A FORWARD -p udp -i eth2 -d 192.168.1.3 --dport 1417 -j ACCEPT
iptables -A FORWARD -p udp -i eth2 -d 192.168.1.3 --dport 1418 -j ACCEPT
iptables -A FORWARD -p udp -i eth2 -d 192.168.1.3 --dport 1419 -j ACCEPT
iptables -A FORWARD -p udp -i eth2 -d 192.168.1.3 --dport 1420 -j ACCEPT
iptables -A FORWARD -p udp -i eth2 -d 192.168.1.3 --dport 7880 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 5071 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 407 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 1417 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 1418 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 1419 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 1420 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 7880 -j ACCEPT
iptables -A FORWARD -p tcp -i eth2 -d 192.168.1.3 --dport 443 -j ACCEPT
iptables -A FORWARD -p udp -i eth2 -d 192.168.1.3 --dport 407 -j ACCEPT
iptables -A FORWARD -p udp -i eth2 -d 192.168.1.3 --dport 1417 -j ACCEPT
iptables -A FORWARD -p udp -i eth2 -d 192.168.1.3 --dport 1418 -j ACCEPT
iptables -A FORWARD -p udp -i eth2 -d 192.168.1.3 --dport 1419 -j ACCEPT
iptables -A FORWARD -p udp -i eth2 -d 192.168.1.3 --dport 1420 -j ACCEPT
iptables -A FORWARD -p udp -i eth2 -d 192.168.1.3 --dport 7880 -j ACCEPT
iptables -A FORWARD -i eth2 -o eth1 -s 192.168.1.3 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth2 -s 192.168.1.3 -j ACCEPT
#iptables -A FORWARD -p tcp -i eth1 --dport 5071 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.1.3 -j SNAT -o eth2 --to-source
69.21.103.132
iptables -A FORWARD -t filter -o eth2 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -o eth2 -m state --state NEW,ESTABLISHED,RELATED -j
ACCEPT
iptables -A FORWARD -t filter -i eth2 -m state --state ESTABLISHED,RELATED
-j ACCEPT
iptables -A FORWARD -i eth2 -m state --state ESTABLISHED,RELATED -j ACCEPT

#iptables -A FORWARD -s $a -p tcp -i eth0 -d 192.168.5.4 --dport 22 -j ACCEPT
#iptables -t nat -A PREROUTING -p tcp -i eth0  --dport 49125 -j DNAT
--to-destination 192.168.1.234:49125
#iptables -t nat -A PREROUTING -p udp -i eth0  --dport 49125 -j DNAT
--to-destination 192.168.1.234:49125
# internal IP address, external interface -- drop and log
iptables -A FORWARD -i eth0 -s 192.168.0.0/16 -m limit --limit 1/m -j LOG
iptables -A FORWARD -i eth0 -s 192.168.0.0/16 -j DROP

# drop all external incoming connections to eth0 and the internal network
iptables -A FORWARD -i eth0 -m state --state INVALID -j DROP

# as a final guard, drop any syn packets in transit
iptables -A FORWARD -p tcp --syn -j DROP
############
#
# POSTROUTING table
#
############
# set up the masquerade -- eth0 is the external interface
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE


-- 
Bo Lynch


