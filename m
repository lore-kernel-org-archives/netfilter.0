From: "Gregory Machin" <gregory.machin@gmail.com>
Subject: nubee ++ using iptables to block bit torrent ..
Date: Tue, 27 Mar 2007 15:10:59 +0200
Message-ID: <30200a940703270610u2d75f17cra4620615ea53a388@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=DPtbtFxJzisFIWw2EUD2Wx2abbu3sVMgmxuv4PjEjyJ0GFCEY1Dy5oo4JDGMwcyjb4KCw0GNN+PzEFZmiIKeQwZjGjtcMlhTOLC/YVdGDaf+fXhw37t9HmPWIXLZnPLlXU6XJiLa+0pEsGMqEnAgNSykMrSDqpg4vEytK+YY690=
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi
I have a routing / firewall box that provides routing for the lan, dmz
some routed vpn, and the internet..

I have been asked to block all traffice going from that lan,then give
limited ip's full access to the internet and other limited access, via
certian ports for say mail and http..

and this seems to be working fine, execpt that, bit torrent and msn
and google talk seem the be slipping by ...

by my understanding everything should be locked down ... appart from
the http/s going via squid, which i'll tackel next ..

here in my script ...

#!/bin/bash

# IP ranges
PUBLIC=196.*.*.144/29
DMZ=192.168.*.0/24
COLTECH=192.168.*.0/24

# Loopback address
LOOP=127.0.0.1

# Delete old iptables rules
# and temporarily block all traffic.
iptables -P OUTPUT DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -F
iptables -X

# Set default policies
iptables -P OUTPUT ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD DROP

# PROXY redirect
iptables -A INPUT -i eth0 -p tcp --dport 80 -j DROP
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080

# Prevent external packets from using loopback addr
iptables -A INPUT -i eth0 -s $LOOP -j DROP
iptables -A FORWARD -i eth0 -s $LOOP -j DROP
iptables -A INPUT -i eth0 -d $LOOP -j DROP
iptables -A FORWARD -i eth0 -d $LOOP -j DROP

# Anything coming from the Internet should have a real Internet address
iptables -A FORWARD -i eth0 -s 192.168.0.0/16 -j DROP
iptables -A FORWARD -i eth0 -s 172.16.0.0/12 -j DROP
iptables -A FORWARD -i eth0 -s 10.0.0.0/8 -j DROP
iptables -A INPUT -i eth0 -s 192.168.0.0/16 -j DROP
iptables -A INPUT -i eth0 -s 172.16.0.0/12 -j DROP
iptables -A INPUT -i eth0 -s 10.0.0.0/8 -j DROP

############################################################################################
###############################   ACLs
##################################################
############################################################################################

## Global Accept
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

## coltech
############## full access ip adresses
iptables -A FORWARD -s 192.168.*.1 -j ACCEPT 	## coltechserver
iptables -A FORWARD -s 192.168.*.3 -j ACCEPT 	## coltserv
iptables -A FORWARD -s 192.168.*.100 -j ACCEPT 	## japie lpt
iptables -A FORWARD -s 192.168.*.101 -j ACCEPT 	## japie
iptables -A FORWARD -s 192.168.*.102 -j ACCEPT 	## almarie
iptables -A FORWARD -s 192.168.*.103 -j ACCEPT 	## almarie lpt
iptables -A FORWARD -s 192.168.*.129 -j ACCEPT 	## japie ipaq
iptables -A FORWARD -s 192.168.*.201 -j ACCEPT 	## greg virtual machine
iptables -A FORWARD -s 192.168.*.202 -j ACCEPT 	## greg virtual machine
iptables -A FORWARD -s 192.168.*.203 -j ACCEPT 	## greg lpt
iptables -A FORWARD -s 192.168.*.204 -j ACCEPT 	## bertie lpt
iptables -A FORWARD -s 192.168.*.205 -j ACCEPT 	## greg lpt
iptables -A FORWARD -s 192.168.*.206 -j ACCEPT 	## greg lpt
############## allowed ports for restrited access ipaddesses
iptables -A FORWARD -s COLTECH -p tcp --dport 21 -j ACCEPT
iptables -A FORWARD -s COLTECH -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -s COLTECH -p tcp --dport 25 -j ACCEPT
iptables -A FORWARD -s COLTECH -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -s COLTECH -p tcp --dport 110 -j ACCEPT
iptables -A FORWARD -s COLTECH -p tcp --dport 137 -j ACCEPT
iptables -A FORWARD -s COLTECH -p tcp --dport 139 -j ACCEPT
iptables -A FORWARD -s COLTECH -p tcp --dport 143 -j ACCEPT
iptables -A FORWARD -s COLTECH -p tcp --dport 443 -j ACCEPT
iptables -A FORWARD -s COLTECH -p tcp --dport 3389 -j ACCEPT


iptables -A FORWARD -s COLTECH -j DROP # coltech

# Block outgoing NetBios (if you have windows machines running
# on the DMZ subnet).  This will not affect any NetBios
# traffic that flows over the VPN tunnel, but it will stop
# local windows machines from broadcasting themselves to
# the internet.
iptables -A FORWARD -p tcp --sport 137:139 -o eth0 -j DROP
iptables -A FORWARD -p udp --sport 137:139 -o eth0 -j DROP
iptables -A OUTPUT -p tcp --sport 137:139 -o eth0 -j DROP
iptables -A OUTPUT -p udp --sport 137:139 -o eth0 -j DROP

# Check source address validity on packets
iptables -A FORWARD -s ! $DMZ -i eth1 -j DROP
iptables -A FORWARD -s ! $COLTECH -i eth2 -j DROP

# Allow local loopback
iptables -A INPUT -s $LOOP -j ACCEPT
iptables -A INPUT -d $LOOP -j ACCEPT

# Allow incoming pings (can be disabled)
#iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

# Allow inbound services
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 1194 -j ACCEPT

# Allow packets from TUN/TAP devices.
iptables -A INPUT -i tun+ -j ACCEPT
iptables -A FORWARD -i tun+ -j ACCEPT
iptables -A INPUT -i tap+ -j ACCEPT
iptables -A FORWARD -i tap+ -j ACCEPT

# Allow packets from DMZ subnets
iptables -A INPUT -i eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -j ACCEPT
iptables -A INPUT -i eth2 -j ACCEPT
iptables -A FORWARD -i eth2 -j ACCEPT

# Keep state of connections from local machine and DMZ subnets
iptables -A OUTPUT -m state --state NEW -o eth0 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state NEW -o eth0 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A OUTPUT -m state --state NEW -o eth1 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state NEW -o eth1 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A OUTPUT -m state --state NEW -o eth2 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state NEW -o eth2 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Masquerade local subnet(s)
iptables -t nat -A POSTROUTING -s $DMZ -o eth0 -j MASQUERADE

iptables -t nat -A POSTROUTING -s $COLTECH -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s $COLTECH -o eth1 -j MASQUERADE


# Save iptables rules and restart iptables

iptables-save > /etc/sysconfig/iptables
service iptables restart

Any advice on killing the rough protocols ?

and any hits on make this script better / more secure ..


Many Thanks


-- 
Gregory Machin
gregory.machin@gmail.com
www.linuxpro.co.za

