From: Stewart Thompson <sthompsn@junction.net>
Subject: Port 25 forwarding:
Date: Wed, 15 May 2002 18:37:18 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPOECGCEAA.sthompsn@junction.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: eugenej@centratel.co.za, netfilter@lists.samba.org

Eugene:

	I made a couple of changes to your script. I added the ip_conntrack module.
I rewrote your forwarding rules near the end. I would recommend that you
make all
Your default policies drop, and then open up what you need to. Try those
changes.
If they don't work do a iptables -v -L -t nat and iptables -v -L FORWARDING.
Copy and paste them and send it to the group. The other thing to try is
tcpdump. I
usually use tcpdump -nvi eth0 port 25 and tcpdump -nvi eth1 port 25 on
separate
ssh windows, telnet should work fine as well. See if the packets are being
DNAT'd
and Forwarded. I am assuming everything else works ok. I.e. you can connect
out
via an internal machine etc, preferably the one in question. Let me know how
you make out.

Stu.........



#!/bin/sh

#/usr/sbin/firewall.sh

###Flushing###

iptables -F
iptables -t nat -F
iptables -X
iptables -Z

###Default policies###

iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

###Loading Iptables###

/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack	#Added this module
/sbin/modprobe ip_nat_ftp
/sbin/modprobe ip_conntrack_ftp

###not to sure what this does###

### This is intended for antispoofing filtering
echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter

### This one
echo "1" > /proc/sys/net/ipv4/ip_dynaddr

###Enable NAT/MASQUERADING and IPforwarding###

iptables -t nat -A POSTROUTING -s intip -j MASQUERADE
echo "1" > /proc/sys/net/ipv4/ip_forward

###Disable response to ping###working

echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all

###Tranparent proxy###

iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 80 -j REDIRECT-to-port
3128

###Disable ICMP redirect acceptance###

echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects

###Disable response to broadcasts###

echo "1" /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts

###Don't accept source routed packets###

echo "0" /proc/sys/net/ipv4/conf/all/accept_source_route

###Enable bad error message protection###

echo "1" /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses

###Log spoofed packets, source routed packets, redirect packets###

echo "1" /proc/sys/net/ipv4/conf/all/log_martians

###INPUT Policies###

iptables -A INPUT -p tcp -i eth0 -s 0/0 --dport 79 -j DROP
iptables -A INPUT -p udp -i eth0 -s 0/0 --dport 79 -j DROP
iptables -A INPUT -p tcp -i eth0 -s 0/0 --dport 23 -j DROP
iptables -A INPUT -p udp -i eth0 -s 0/0 --dport 23 -j DROP
iptables -A INPUT -p tcp -i eth0 -s 0/0 --dport 22 -j DROP
iptables -A INPUT -p udp -i eth0 -s 0/0 --dport 22 -j DROP
iptables -A INPUT -p tcp -i eth0 -s 0/0 --dport 21 -j DROP
iptables -A INPUT -p udp -i eth0 -s 0/0 --dport 21 -j DROP
iptables -A INPUT -p tcp -i eth0 -s 0/0 --dport 20 -j DROP

###Block e-mail password sender###

iptables -A OUTPUT -p udp -o eth0 -s 0/0 --dport 25 -j DROP
iptables -A INPUT -p udp -i eth0 -s 0/0 --dport 25 -j DROP

###Deny spoofed IPs###

iptables -A INPUT -i etho -s intip -j DROP

###Port Forwarding Changes by Stu ###

#Rule to DNAT incoming connections
iptables -t nat -A PREROUTING -p tcp -i eth0 -d EXTIP \
-s 0/0 --dport 25 -j DNAT --to intip

#Rule to forward traffic destined to Internal Machine on Port 25
iptables -A FORWARD -p tcp -i eth0 -o eth1 -m state --state
NEW,ESTABLISHED,RELATED \
-d intip --dport 25 -j ACCEPT

#Rule to allow traffic out from the Internal Network
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

# Original Rules Commented out
# iptables -t nat -A PREROUTING -p tcp -d extip --dport 25 -j DNAT-to
intip:port
# iptables -A FORWARD -i eth0 -p tcp -d intip-dport 25 -j ACCEPT

###Allow all connections on the loopback device###

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT





