From: Garison Piatt <todo@garisonpiatt.com>
Subject: I have no idea why this doesn't work...
Date: Thu, 22 Apr 2004 08:58:54 -1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.0.0.22.0.20040422085041.03eb3ec0@mail.garisonpiatt.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Aloha.

I'm Garison, a web designer in Hawaii.  My client is setting up a dedicated 
server for several of her clients, and instead of hiring an admin guy to 
maintain it, she's insisting that I do it (not that I can't use the extra 
income, but I have no idea what I'm doing).

I'm trying to set up the firewall for the system.  After reading the Linux 
manual, searching the Web, studying tutorials, and comparing examples, I'm 
actually more confused than I was before.  Below is what I have, which is a 
pared-down combination of several example scripts which did something 
reasonably close to what I want.  When I run this, however, I lose FTP, and 
who-knows-what-else.  Worse, when I try to flush the tables (using 
"/sbin/iptables --flush") the whole system locks up, and has to be rebooted.

Sorry for such a long posting.  Any help you can give em will be appreciated.


-garison



#!/bin/sh
#
# IP Firewall script for iptables
echo "Define IP Firewall"

# ################################################## #
#               Configuration section                #
# ################################################## #
echo " setup..."

# Command definitions
#
IPT="/sbin/iptables"
IPTR="/sbin/iptables-restore"
IPTS="/sbin/iptables-save"
INSMOD="/sbin/modprobe"
DEPMOD="/sbin/depmod"

# Internet definitions
#
NET_IFACE="eth0"
NET_IP="207.36.232.90"
#NET_BROADCAST="207.36.232.255"

# Local-Area Network definitions
#
#LAN_IFACE="eth1"
#LAN_IP=""
#LAN_IP_RANGE=""

# Localhost Configuration.
#
LO_IFACE="lo"
LO_IP="127.0.0.1"


# ################################################## #
#               Module Loading section               #
# ################################################## #
echo " load modules..."

# Pre-load modules
#
$DEPMOD -a

# Required modules
$INSMOD ip_tables
$INSMOD ip_conntrack
$INSMOD ip_conntrack_ftp
$INSMOD ip_nat_ftp
$INSMOD iptable_filter
$INSMOD iptable_mangle
$INSMOD iptable_nat
$INSMOD ipt_LOG
$INSMOD ipt_limit
$INSMOD ipt_state

# Non-Required modules (for reference)
#$INSMOD ipt_owner
#$INSMOD ipt_REJECT
#$INSMOD ipt_MASQUERADE
#$INSMOD ip_conntrack_irc
#$INSMOD ip_nat_irc


# ################################################## #
#               Process Set-up section               #
# ################################################## #
echo " process setup..."
# Required process configuration
#
echo "1" > /proc/sys/net/ipv4/ip_forward

# Non-Required proc configuration (for reference)
#
#echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter
#echo "1" > /proc/sys/net/ipv4/conf/all/proxy_arp
#echo "1" > /proc/sys/net/ipv4/ip_dynaddr


# ################################################## #
#                Filter Table section                #
# ################################################## #

# Clear previous policy settings
#
echo " clear policies..."
$IPT -P INPUT DROP
$IPT -P OUTPUT DROP
$IPT -P FORWARD DROP


# ################################ #
#   Create User-Specified Chains   #
# ################################ #
echo " define user chains..."

# Allowed packets
echo " - allowed packets"
$IPT -N allowed
$IPT -A allowed -p TCP --syn -j ACCEPT
$IPT -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A allowed -p TCP -j DROP

# Bad TCP packets
echo " - bad tcp packets"
$IPT -N bad_tcp
$IPT -A bad_tcp -p tcp --tcp-flags SYN,ACK SYN,ACK -m state --state NEW \
      -j REJECT --reject-with tcp-reset
$IPT -A bad_tcp -p tcp ! --syn -m state --state NEW \
      -j LOG --log-prefix "New not syn: "
$IPT -A bad_tcp -p tcp ! --syn -m state --state NEW -j DROP

# TCP packets
echo " - tcp packets"
$IPT -N chktcp
$IPT -A chktcp -p TCP -s 0/0 --dport 21 -j allowed
$IPT -A chktcp -p TCP -s 0/0 --dport 22 -j allowed
$IPT -A chktcp -p TCP -s 0/0 --dport 80 -j allowed
$IPT -A chktcp -p TCP -s 0/0 --dport 113 -j allowed

# UDP packets
echo " - upd packets"
$IPT -N chkudp
#$IPT -A chkudp -p UDP -s 0/0 --destination-port 53 -j ACCEPT
#$IPT -A chkudp -p UDP -s 0/0 --destination-port 123 -j ACCEPT
$IPT -A chkudp -p UDP -s 0/0 --destination-port 2074 -j ACCEPT
$IPT -A chkudp -p UDP -s 0/0 --destination-port 4000 -j ACCEPT

# ICMP packets
echo " - icmp packets"
$IPT -N chkicmp
$IPT -A chkicmp -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPT -A chkicmp -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT


# ####################### #
#   Define INPUT Chains   #
# ####################### #
echo " define input chains..."

# Check for Bad TCP packets, and junk them
$IPT -A INPUT -p tcp -j bad_tcp

# Rules for special networks not part of the Internet
#$IPT -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT
#$IPT -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT
$IPT -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
$IPT -A INPUT -p ALL -i $LO_IFACE -s $NET_IP -j ACCEPT

# Special rule for DHCP requests from LAN,
# which are not caught properly otherwise.
#$IPT -A INPUT -p UDP -i $LAN_IFACE --dport 67 --sport 68 -j ACCEPT

# Rules for incoming packets from the internet.
$IPT -A INPUT -p ALL -d $NET_IP -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A INPUT -p TCP -i $NET_IFACE -j chktcp
$IPT -A INPUT -p UDP -i $NET_IFACE -j chkudp
$IPT -A INPUT -p ICMP -i $NET_IFACE -j chkicmp

# Log weird packets that don't match the above.
$IPT -A INPUT -m limit --limit 3/minute --limit-burst 3 \
      -j LOG --log-level DEBUG --log-prefix "IPT INPUT packet died: "

# ######################### #
#   Define FORWARD Chains   #
# ######################### #
echo " define forward chains..."

# Bad TCP packets we don't want
$IPT -A FORWARD -p tcp -j bad_tcp

# Accept the packets we actually want to forward
#$IPT -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Log weird packets that don't match the above.
$IPT -A FORWARD -m limit --limit 3/minute --limit-burst 3 \
      -j LOG --log-level DEBUG --log-prefix "IPT FORWARD packet died: "

# ######################## #
#   Define OUTPUT Chains   #
# ######################## #
echo " define output chains..."

# Bad TCP packets we don't want.
$IPT -A OUTPUT -p tcp -j bad_tcp

# Special OUTPUT rules to decide which IP's to allow.
$IPT -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPT -A OUTPUT -p ALL -s $NET_IP -j ACCEPT
#$IPT -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT

# Log weird packets that don't match the above.
$IPT -A OUTPUT -m limit --limit 3/minute --limit-burst 3 \
      -j LOG --log-level DEBUG --log-prefix "IPT OUTPUT packet died: "


# ############################# #
#   Define POSTROUTING Chains   #
# ############################# #
echo " define postrouting chains..."

# Enable simple IP Forwarding and Network Address Translation
$IPT -t nat -A POSTROUTING -o $NET_IFACE -j SNAT --to-source $NET_IP


