From: Boskey <usergroups@theargoncompany.com>
Subject: Firewall script
Date: Tue, 27 Sep 2005 16:39:33 +0530
Message-ID: <200509271639.33162.usergroups@theargoncompany.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_thSODY5d7GUI+w/"
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
To: netfilter@lists.netfilter.org

--Boundary-00=_thSODY5d7GUI+w/
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi All,

A customer of ours has a firewall script made for there organization.

The customer , even after enabling the firewall script has a huge spammer 
inside the network get across, and spam from the IP.

I have seen the script and feel that his firewall is  good when it comes to 
not allowing people into the system.

But i guess people inside the network  ( local ) can  get across easily.

Can someone help me by confirming this.

The firewall script is attached herewith.

Regards,

Boskey

--Boundary-00=_thSODY5d7GUI+w/
Content-Type: application/x-shellscript;
  name="itm-firewall-script"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="itm-firewall-script"

#!/bin/sh
#
# Fire wall script for controlling spoofing
###########################################################################
#
# Configuration options.
#

#
# Internet Configuration.
#

INET_IP=3D"a.b.c.d"
HTTP_IP=3D"a.b.c.d"
DNS_IP=3D"a.b.c.d"
INET_IFACE=3D"eth0"


#
# Local Area Network configuration.
#

LAN_IP=3D"10.250.0.109"
LAN_IFACE=3D"eth1"


DMZ_HTTP_IP=3D"10.250.0.109"
DMZ_DNS_IP=3D"10.250.0.109"
DMZ_IP=3D"10.250.0.109"
DMZ_IFACE=3D"eth1"

#
# =A0Localhost Configuration.
#

LO_IFACE=3D"lo"
LO_IP=3D"127.0.0.1"

#
# =A0IPTables Configuration
#

IPTABLES=3D"/sbin/iptables"


###########################################################################
#
# =A0Module loading.
#

#
# Needed to initially load modules
#
/sbin/depmod -a



#
# =A0Required modules
#

/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_state

#
# =A0Non-Required modules
#

#/sbin/modprobe ipt_owner
#/sbin/modprobe ipt_REJECT
#/sbin/modprobe ipt_MASQUERADE
#/sbin/modprobe ip_conntrack_ftp
#/sbin/modprobe ip_conntrack_irc
#/sbin/modprobe ip_nat_ftp
#/sbin/modprobe ip_nat_irc

# Flush all the iptables rules and chains --mallik
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
###########################################################################
#
# =A0/proc set up.
#

#
# =A0Required proc configuration
#

echo "1" > /proc/sys/net/ipv4/ip_forward

#
# =A0Non-Required proc configuration
#

#echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter
#echo "1" > /proc/sys/net/ipv4/conf/all/proxy_arp
#echo "1" > /proc/sys/net/ipv4/ip_dynaddr

###########################################################################
#
# =A0rules set up.
#


#
# =A0Set policies
#

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

# Create chain for bad tcp packets


$IPTABLES -N bad_tcp_packets

# Create a rule which counts all the packets/bytes going through the
chain ---mallik Nov 2004
$IPTABLES -t filter -A httpin
#
# Create separate chains for ICMP, TCP and UDP to traverse
#

$IPTABLES -N allowed
$IPTABLES -N icmp_packets

#
# =A0Create content in userspecified chains
#

#
# bad_tcp_packets chain
#

$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK -m
state --state NEW -j REJECT --reject-with tcp-reset
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j
LOG --log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

#
# allowed chain
#

$IPTABLES -A allowed -p TCP --syn -j ACCEPT 		# This rules is allowing Outs=
ide connections to the server on both the interfaces
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A allowed -p TCP -j DROP

#
# ICMP rules
#

# Changed rules totally
#$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
#$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j DROP
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j DROP

#
# =A0INPUT chain
#

#
# Bad TCP packets we don't want
#

$IPTABLES -A INPUT -p tcp -j bad_tcp_packets

#
# Packets from the Internet to this box
#

$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets

#
# Packets from LAN, DMZ or LOCALHOST
#

#
# From DMZ Interface to DMZ firewall IP
#

$IPTABLES -A INPUT -p ALL -i $DMZ_IFACE -d $DMZ_IP -j ACCEPT

#
# From LAN Interface to LAN firewall IP
#

$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -d $LAN_IP -j ACCEPT

#
# From Localhost interface to Localhost IP's
#

$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j ACCEPT

#
# Special rule for DHCP requests from LAN, which are not caught properly
# otherwise.
#

$IPTABLES -A INPUT -p UDP -i $LAN_IFACE --dport 67 --sport 68 -j ACCEPT
# Check for correct port number.....
$IPTABLES -A INPUT -p UDP -i $LAN_IFACE --dport 3128 --sport 80 -j ACCEPT

#
# All established and related packets incoming from the internet to the
# firewall
#

$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state
ESTABLISHED,RELATED -j ACCEPT

#
# In Microsoft Networks you will be swamped by broadcasts. These lines
# will prevent them from showing up in the logs.
#
# mallik
#$IPTABLES -A INPUT -p UDP -i $INET_IFACE -d $INET_BROADCAST
=2D-destination-port 135:139 -j DROP

#
# If we get DHCP requests from the Outside of our network, our logs will
# be swamped as well. This rule will block them from getting logged.
#
$IPTABLES -A INPUT -p UDP -i $INET_IFACE -d 255.255.255.255
=2D-destination-port 67:68 -j DROP

#
# If you have a Microsoft Network on the outside of your firewall, you may
# also get flooded by Multicasts. We drop them so we do not get flooded by
# logs
#
# mallik
$IPTABLES -A INPUT -i $INET_IFACE -d 224.0.0.0/8 -j DROP

#
# Log weird packets that don't match the above.
#

$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j LOG
=2D-log-level DEBUG --log-prefix "IPT INPUT packet died: "

#
# 4.1.5 FORWARD chain
#

#
# Bad TCP packets we don't want
#

$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets


#
# DMZ section
#
# General rules
#

$IPTABLES -A FORWARD -i $DMZ_IFACE -o $INET_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -m state --state
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $LAN_IFACE -o $DMZ_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $DMZ_IFACE -o $LAN_IFACE -m state --state
ESTABLISHED,RELATED -j ACCEPT

#
# HTTP server
#

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d
$DMZ_HTTP_IP --dport 80 -j allowed
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d
$DMZ_HTTP_IP -j icmp_packets

#
# DNS server
#

$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d
$DMZ_DNS_IP --dport 53 -j allowed
$IPTABLES -A FORWARD -p UDP -i $INET_IFACE -o $DMZ_IFACE -d
$DMZ_DNS_IP --dport 53 -j ACCEPT
$IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -d
$DMZ_DNS_IP -j icmp_packets

#
# LAN section
#

$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#
# Log weird packets that don't match the above.
#

$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG
=2D-log-level DEBUG --log-prefix "IPT FORWARD packet died: "

#
# =A0OUTPUT chain
#

#
# Bad TCP packets we don't want.
#

$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets

#
# Special OUTPUT rules to decide which IP's to allow.
#

$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT		# this rules means you ar=
e allowinf packets from outside to get accross the network

#
# Log weird packets that don't match the above.
#

$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j LOG
=2D-log-level DEBUG --log-prefix "IPT OUTPUT packet died: "

######
# =A0nat table
#

#
# =A0Set policies
#

#
# =A0Create user specified chains
#

#
# =A0Create content in user specified chains
#

#
# =A0PREROUTING chain
#

$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_IP
=2D-dport 80 -j DNAT --to-destination $DMZ_HTTP_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $DNS_IP
=2D-dport 53 -j DNAT --to-destination $DMZ_DNS_IP
$IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $DNS_IP
=2D-dport 53 -j DNAT --to-destination $DMZ_DNS_IP

#
# =A0POSTROUTING chain
#

#
# Enable simple IP Forwarding and Network Address Translation
#

# $IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_=
IP
=A0 =A0#******************* natting using the DSL OR CABLE ****************=
********
=A0 =A0iptables --table nat --append POSTROUTING --out-interface eth0 -j MA=
SQUERADE
=A0 =A0iptables --append FORWARD --in-interface eth1 -j ACCEPT
=A0 =A0#*******************************************************************=
********


=A0 =A0#*******************************************************************=
********
=A0 =A0#****************** Port forwarding using the sqid porxy running on
port 8080********
=A0 =A0iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT
=2D-to-port 8080
=A0 =A0iptables -t nat -A PREROUTING -i localhost -p tcp --dport 80 -j
REDIRECT --to-port 8080
=A0 =20
=A0 =A0#*******************************************************************=
*****************
=A0 =A0iptables -A INPUT -i lo -p all -j ACCEPT
=A0 =A0=20
=A0 =A0=20
=2Dj DNAT --to-destination 10.240.0.10
=20

=A0=20

=A0 =A0=20
=A0 =A0# =A0MAC address filtering
=A0 =A0iptables -I INPUT -p all -m mac --mac-source 00:0D:60:74:D3:2B -j AC=
CEPT

=20
=A0 =A0# =A0- This rule is essential if you want your own computer to be
able to access itself throught the loopback interface
=A0 =A0/sbin/iptables -A OUTPUT -o lo -p all -j ACCEPT
=A0 =A0# - Block NFS
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 2049 -j ACCEPT
=A0 =A0#- Block NFS
=A0 =A0/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 2049 -j ACCEPT
=A0 =A0# =A0- Block X-Windows
=A0 ############################ MSN YAHOO CHAT BLOCKS ####################=
##
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 1:79 -j DROP
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 81:442 -j DROP
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 444:3127 -j DROP
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 3129:7999 -j DR=
OP
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 6891:6900 -j DR=
OP
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 8002:8079 -j DR=
OP
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 8079:34463 -j D=
ROP
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 1863 =A0 =A0 =
=A0 -j DROP
=A0 =A0/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 1863 =A0 =A0 =
=A0 -j DROP
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 6901 =A0 =A0 =
=A0 -j DROP
=A0 =A0/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 6901 =A0 =A0 =
=A0 -j DROP

=A0 #######################################################################=
###
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 6000:6009 -j DR=
OP
=A0 =A0# =A0- Block X-Windows font server
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 7100 -j DROP
=A0 =A0# =A0- Block printer port
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 515 -j DROP
=A0 =A0# =A0 =A0 =A0 =A0- Block printer port
=A0 =A0/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 515 -j DROP
=A0 =A0# =A0 =A0 =A0 =A0- Block Sun rpc/NFS
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 111 -j DROP
=A0 =A0# =A0 =A0 =A0 =A0- Block Sun rpc/NFS
=A0 =A0/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 111 -j DROP
=A0 =A0# =A0 =A0 =A0- Block port 0
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 0 -j DROP
=A0 =A0# =A0 =A0 =A0- Block port udp 0
=A0 =A0/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 0 -j DROP
=A0 =A0# =A0 =A0-Block ftp
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 21 -j DROP
=A0 =A0/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 21 -j DROP
=A0 =A0# =A0 =A0-Block ssh
=A0 # /sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 22 -j ACCEPT
=A0 # /sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 22 -j ACCEPT

=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 22 -j ACCEPT
=A0 =A0/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 22 -j ACCEPT


=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 5100 -j ACCEPT
=A0 =A0/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 53 -j ACCEPT
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 25 -j ACCEPT
=A0 =A0/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 25 -j ACCEPT
=A0 =A0/sbin/iptables -A INPUT -p tcp -s 0/0 -d 0/0 --dport 110 -j ACCEPT
=A0 =A0/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 110 -j ACCEPT
=A0 =A0/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 443 -j DROP
=A0 =A0/sbin/iptables -A INPUT -p udp -s 0/0 -d 0/0 --dport 443 -j DROP
CT#------------------------------------------------------------------------=
=2D-------------------



--Boundary-00=_thSODY5d7GUI+w/--

