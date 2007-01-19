From: Bill Tangren <bjt@aa.usno.navy.mil>
Subject: DMZ problems
Date: Fri, 19 Jan 2007 15:51:07 -0500
Message-ID: <45B12F3B.5020306@aa.usno.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hello,

I'm trying to set up a firewall with a DMZ using iptables, but without the use 
of NATing. [This firewall is going to be on the SIPRNet, and I'm told that I 
cannot use NATing.] I think the lack of NATing is what is causing the problems 
here, but I'm not sure. My firewall IP is 10.1.5.94. The server behind the 
firewall should have an IP of 10.1.5.95.

I read the iptables man page, and Oskar Andreasson's web site, using his DMZ 
example as a guide. I think it LOOKS OK, but no packets seem to be getting 
though. The firewall logs don't seem to see any packets coming from the DMZ at 
all. The following is a stripped down version of a script I use to start the 
firewall.

Would someone please take a quick look at this and tell me what I am doing wrong?

#!/bin/sh
# IP for the firewall
INET_IP="10.1.5.94"
# IP for the web server
HTTP_IP="10.1.5.95"
# name of network card
INET_IFACE="eth0"

# 1.3 DMZ Configuration.
DMZ_HTTP_IP="10.1.5.95"
DMZ_IP="10.1.5.94"
DMZ_IFACE="eth1"

# 1.4 Localhost Configuration.
LO_IFACE="lo"
LO_IP="127.0.0.1"

# Create another chain to filter bad tcp packets
$IPT -N icmp_packets
$IPT -N allowed

# allowed chain
$IPT -A allowed -p TCP --syn -j ACCEPT
$IPT -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A allowed -p TCP -j DROP

# icmp_packets
$IPT -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPT -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT

# INPUT chain
$IPT -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets
$IPT -A INPUT -p ALL -i $DMZ_IFACE -d $DMZ_IP -j ACCEPT
$IPT -A INPUT -p ALL -i $INET_IFACE -m state --state ESTABLISHED,RELATED \
      -j ACCEPT

# FORWARD chain
$IPT -A FORWARD -i $DMZ_IFACE -o $INET_IFACE -j ACCEPT
$IPT -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -m state \
    --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_IP \
    --destination-port 80 -j allowed
$IPT -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d $DMZ_HTTP_IP \
    -j icmp_packets

# OUTPUT chain
$IPT -A OUTPUT -p ALL -s $INET_IP -j ACCEPT
$IPT -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG \
     --log-prefix "OUTPUT packet died: "


I get quite a number of packets from eth0 (the internet side) that show up in 
the log as "INPUT packet died:", but NOTHING from eth1. I am running this on a 
Redhat Enterprise Linux ES 4 server, fully patched. I'm using iptablles version 
1.2.11-3.1.RHEL4.

In this post, I removed all the lines I inserted into the script to log each 
rule above, and the lines I used to delete old rules and chains.

Any ideas?

Bill Tangren

