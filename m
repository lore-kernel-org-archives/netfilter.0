From: Jun Sun <jsun@junsun.net>
Subject: Any holes in this firewall script?
Date: Tue, 3 Jun 2003 18:08:49 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030603180849.B2402@gateway.junsun.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="IS0zKkzwUGydFO0o"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I have a pretty standard setup.  A linux gateway connects to Internet 
through cable modem and a subnet behind it.  I run web server, sendmail 
and sshd on the gateway machine.

So far I have been using ipchains and it seems to be OK so far.
I now want to move to redhat 9 and I probably have to use iptables. 
After looking around the net, I come up with the following firewall 
rules.  See the attachment.

I wonder if some security experts here can take a look, just to make sure 
there are no obvious mistakes or holes? 

Thanks in advanced.

Cheers.

Jun

--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=junk2

#!/bin/sh
#
# rc.firewall - Initial SIMPLE IP Firewall script for Linux 2.4.x and iptables
#
# Copyright (C) 2001  Oskar Andreasson &lt;bluefluxATkoffeinDOTnet&gt;
#

# JSUN :
# 	I like all allowed ports to be grouped together, easier to modify
#	later
#

###########################################################################
#
# 1. Configuration options.
#

# debugs
set -x
DEBUG_LEVEL=INFO
# $DEBUG_LEVEL_LEVEL=DEBUG

# interfaces
EXTIF="eth0"
EXTIP=`ifconfig $EXTIF | awk '/inet addr/ { gsub(".*:", "", $2) ; print $2 }'`
EXTBROAD=`ifconfig $EXTIF | awk '/inet addr/ { gsub(".*:", "", $3) ; print $3
}'`
EXTGW=`/sbin/route -n | grep -A 4 UG | awk '{ print $2}'`

echo External IP: $EXTIP
echo External broadcast: $EXTBROAD
echo Default GW: $EXTGW
echo " --- "

INTIP="192.168.0.2"
INTLAN="192.168.0.0/16"
#INTIF="eth1"
INTIF="wlan0"

echo Internal Interface: $INTIF
echo Internal IP: $INTIP
echo Internal LAN: $INTLAN
echo " --- "

LOIF="lo"
LOIP="127.0.0.1"

BROADCAST="255.255.255.255"

#
# 1.5 IPTables Configuration.
#

IPTABLES="/sbin/iptables"


# JSUN: are these necessary?

# /sbin/depmod -a

# /sbin/modprobe ip_tables
# /sbin/modprobe ip_conntrack
# /sbin/modprobe iptable_filter
# /sbin/modprobe iptable_mangle
# /sbin/modprobe iptable_nat
# /sbin/modprobe ipt_LOG
# /sbin/modprobe ipt_limit
# /sbin/modprobe ipt_state

#/sbin/modprobe ipt_owner
#/sbin/modprobe ipt_REJECT
#/sbin/modprobe ipt_MASQUERADE
#/sbin/modprobe ip_conntrack_ftp
#/sbin/modprobe ip_conntrack_irc
#/sbin/modprobe ip_nat_ftp
#/sbin/modprobe ip_nat_irc

###########################################################################
#
# 3. /proc set up.
#

#
# 3.1 Required proc configuration
#

echo "1" > /proc/sys/net/ipv4/ip_forward

#
# 3.2 Non-Required proc configuration
#

#echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter
#echo "1" > /proc/sys/net/ipv4/conf/all/proxy_arp
#echo "1" > /proc/sys/net/ipv4/ip_dynaddr

###########################################################################
#
# 4. rules set up.
#

#
# Cleanup and set initial policies
#

# Set policies
$IPTABLES -t filter -P INPUT DROP
$IPTABLES -t filter -P OUTPUT DROP
$IPTABLES -t filter -P FORWARD DROP

$IPTABLES -t nat -P PREROUTING ACCEPT
$IPTABLES -t nat -P POSTROUTING ACCEPT
$IPTABLES -t nat -P OUTPUT ACCEPT

$IPTABLES -t mangle -P PREROUTING ACCEPT
$IPTABLES -t mangle -P OUTPUT ACCEPT

# flush old chains
$IPTABLES -t filter -F
$IPTABLES -t nat -F
$IPTABLES -t mangle -F

# delete user defined chains
$IPTABLES -t filter -X
$IPTABLES -t nat -X
$IPTABLES -t mangle -X


#
# 4.1.4 INPUT chain
#

# $IPTABLES -A INPUT -p tcp -j bad_tcp_packets

# we trust INTIF and LOIF, to a large degree
$IPTABLES -A INPUT -p ALL -i $INTIF -s $INTLAN -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LOIF -s $LOIP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LOIF -s $INTIP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LOIF -s $EXTIP -j ACCEPT

# we take broadcast packages from INTIF
$IPTABLES -A INPUT -p ALL -i $INTIF -s 0.0.0.0 -d 255.255.255.255 -j ACCEPT

# JSUN: can we just use a simplified version?
#$IPTABLES -A INPUT -p ALL -i $INTIF -j ACCEPT
#$IPTABLES -A INPUT -p ALL -i $LOIF -j ACCEPT


# established connections can go through
$IPTABLES -A INPUT -p ALL -d $EXTIP -m state --state ESTABLISHED,RELATED \
	-j ACCEPT

# initiation packets are allowed on selected TCP ports
$IPTABLES -A INPUT -p TCP --syn -s 0/0 --dport ssh -j ACCEPT
$IPTABLES -A INPUT -p TCP --syn -s 0/0 --dport smtp -j ACCEPT
$IPTABLES -A INPUT -p TCP --syn -s 0/0 --dport http -j ACCEPT
#$IPTABLES -A INPUT -p TCP --sync -s 0/0 --dport https -j allowed

# JSUN: do we need to worry about ntp port?  We will see

# only take echo-request(8), echo-reply(0) and time-exceeded(11) for icmp
$IPTABLES -A INPUT -p ICMP -s 0/0 --icmp-type echo-reply -j ACCEPT
$IPTABLES -A INPUT -p ICMP -s 0/0 --icmp-type echo-request -j ACCEPT
$IPTABLES -A INPUT -p ICMP -s 0/0 --icmp-type time-exceeded -j ACCEPT

#
# If you have a Microsoft Network on the outside of your firewall, you may 
# also get flooded by Multicasts. We drop them so we do not get flooded by 
# logs
#
#$IPTABLES -A INPUT -i $EXTIF -d 224.0.0.0/8 -j DROP

#
# Log weird packets that don't match the above.
#

# exclude some annoying packets from logging
$IPTABLES -A INPUT -d $EXTBROAD -j DROP 
$IPTABLES -A INPUT -d $BROADCAST -j DROP 

$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
	--log-level $DEBUG_LEVEL --log-prefix "IPT INPUT packet died: "

#
# 4.1.5 FORWARD chain
#

# Accept the packets we actually want to forward
$IPTABLES -A FORWARD -i $INTIF -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Log weird packets that don't match the above.
$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG \
	--log-level $DEBUG_LEVEL --log-prefix "IPT FORWARD packet died: "

#
# 4.1.6 OUTPUT chain
#

# Special OUTPUT rules to decide which IP's to allow.
$IPTABLES -A OUTPUT -p ALL -s $LOIP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INTIP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $EXTIP -j ACCEPT

# Log weird packets that don't match the above.
$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
	--log-level $DEBUG_LEVEL --log-prefix "IPT OUTPUT packet died: "

######
# 4.2 nat table
#

$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to-source $EXTIP

--IS0zKkzwUGydFO0o--

