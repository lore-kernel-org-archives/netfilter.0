From: Ryan Barr <ryan@ryanbarr.com>
Subject: FTP Passive mode Connection Loss - iptables rh9
Date: Tue, 18 May 2004 10:29:27 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <sprk21ar8e7ksw8.180520041029@mail.xaconsulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

 (If my perevious message regarding this topic hits the list, I=
 appologize.  It didn't show up in the digest from yesterday, so=
 I am resending with a few more details.)

Hey all, I have a question for you.  I've got a rh9 box sitting=
 at the front of my network acting as a router/firewall for my=
 dmz as well as internal network.

I have 3 public ip addresses, that route to either the dns box=
 (same as router/firewall) or to internal network nodes.

HTTP, SMTP, POP, and Active FTP are all working just fine, I am=
 able to route packets from extneral IP addresses into internal=
 addresses, and nat them right back out. 

However, as soon as I setup PASV mode FTP, things go south.  I am=
 attaching the output of lsmod as well as the iptable script that=
 I use to build my rules.  Please let me know if there is=
 anything I can do to fix this!  Thanks in advance!

-Ryan Barr

------------------------------------------
lsmod
------------------------------------------
Module                  Size  Used by    Not tainted
parport_pc             19076   1  (autoclean)
lp                      8996   0  (autoclean)
parport                37056   1  (autoclean) [parport_pc lp]
autofs                 13268   0  (autoclean) (unused)
natsemi                19552   3
ipt_REJECT              3928   1  (autoclean)
ipt_LOG                 4152   3  (autoclean)
ipt_limit               1560   3  (autoclean)
ipt_state               1048   8  (autoclean)
iptable_mangle          2776   0  (autoclean) (unused)
iptable_filter          2412   1  (autoclean)
sg                     36524   0  (autoclean)
sr_mod                 18136   0  (autoclean)
ide-scsi               12208   0
scsi_mod              107160   3  [sg sr_mod ide-scsi]
ide-cd                 35708   0
cdrom                  33728   0  [sr_mod ide-cd]
ipt_owner               1976   0  (unused)
ipt_MASQUERADE          2200   0  (unused)
ip_nat_ftp              4112   0  (unused)
iptable_nat            21720   2  [ipt_MASQUERADE ip_nat_ftp]
ip_tables              15096  11  [ipt_REJECT ipt_LOG ipt_limit=
 ipt_state iptable_mangle iptable_filter ipt_owner ipt_MASQUERADE=
 iptable_nat]
ip_conntrack_ftp        5296   1
ip_conntrack           26976   3  [ipt_state ipt_MASQUERADE=
 ip_nat_ftp iptable_nat ip_conntrack_ftp]
keybdev                 2944   0  (unused)
mousedev                5492   1
hid                    22148   0  (unused)
input                   5856   0  [keybdev mousedev hid]
usb-uhci               26348   0  (unused)
usbcore                78784   1  [hid usb-uhci]
ext3                   70784   2
jbd                    51892   2  [ext3]

-------------------------------------
iptables script
 - using `service iptables save` to save the chains into iptables=
 and rh

This script has been hacked together from bits and pieces of=
 sample scripts all over the internet, I appricate all of the=
 samples that are out there.  I couldn't have stuck this thing=
 together without it!
-------------------------------------
#!/bin/sh
#=
 ----------------------------------------------------------------=
-----
# Created using base framework from:
#=
 ----------------------------------------------------------------=
-----
# rc.DMZ.firewall - DMZ IP Firewall script for Linux 2.4.x and=
 iptables
#
# Copyright (C) 2001  Oskar Andreasson <bluefluxATkoffeinDOTnet>
#
#=
 ----------------------------------------------------------------=
-----
#
# This program is free software; you can redistribute it and/or=
 modify
# it under the terms of the GNU General Public License as=
 published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be=
 useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public=
 License
# along with this program or from the site that you downloaded=
 it
# from; if not, write to the Free Software Foundation, Inc., 59=
 Temple
# Place, Suite 330, Boston, MA  02111-1307   USA
#

#################################################################=
##########
#
# Global Parameters
#
INET1_IP=3D"66.42.86.216"
INET2_IP=3D"66.42.86.220"
INET3_IP=3D"66.42.86.221"

INET_IFACE=3D"eth2"

#################################################################=
##########
#
# Public Addresses
#

HTTP1_IP=3D"66.42.86.220"
HTTP2_IP=3D"66.42.86.221"

FTP1_IP=3D"66.42.86.220"
FTP2_IP=3D"66.42.86.221"

DNS1_IP=3D"66.42.86.216"
DNS2_IP=3D"66.42.86.221"

MAIL1_IP=3D"66.42.86.220"
MAIL2_IP=3D"66.42.86.221"

WIN_TERM_SRV1_IP=3D"66.42.86.221"

#################################################################=
##########
#
# Protected Settings
#

LAN_IP=3D"10.10.1.1"
LAN_IFACE=3D"eth0"

LO_IFACE=3D"lo"
LO_IP=3D"127.0.0.1"

#################################################################=
##########
#
# DMZ Settings
#

DMZ_HTTP1_IP=3D"10.2.1.50"
DMZ_HTTP2_IP=3D"10.2.1.51"

DMZ_FTP1_IP=3D"10.2.1.50"
DMZ_FTP2_IP=3D"10.2.1.51"

DMZ_MAIL1_IP=3D"10.2.1.50"
DMZ_MAIL2_IP=3D"10.2.1.51"

DMZ_WIN_TERM_SRV1_IP=3D"10.2.1.51"


DMZ_IP=3D"10.2.1.1"
DMZ_IFACE=3D"eth1"

IPTABLES=3D"/sbin/iptables"

echo "Flushing iptables..."
$IPTABLES -F

echo "Setting up rules, starting..."
#################################################################=
##########
#
# Default Rules
#
echo "Setting up default rules to DROP"

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

###########################################
# 
# Custom chains for filtering of packets
#

echo "Creating new chain, bad tcp packets..."
$IPTABLES -N bad_tcp_packets

echo "Creating new chains for allowed, and icmp_packets"
$IPTABLES -N allowed
$IPTABLES -N icmp_packets

#
# bad_tcp_packets chain
#
$IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK=
 \
-m state --state NEW -j REJECT --reject-with tcp-reset

$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW=
 -j DROP

#
# allowed chain
#
$IPTABLES -A allowed -p TCP --syn -j ACCEPT
$IPTABLES -A allowed -p TCP -m state --state ESTABLISHED,RELATED=
 -j ACCEPT
$IPTABLES -A allowed -p TCP -j DROP

#
# ICMP rules
#
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT
$IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j=
 ACCEPT

###########################################################
#
# Firewall rules
#
# INPUT chain

# Bad TCP packets we don't want
$IPTABLES -A INPUT -p tcp -j bad_tcp_packets

# Handle ICMP Packets
$IPTABLES -A INPUT -p ICMP -i $INET_IFACE -j icmp_packets

#
# Packets from LAN, DMZ or LOCALHOST
#

$IPTABLES -A INPUT -p ALL -i $DMZ_IFACE -d $DMZ_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -d $LAN_IP -j ACCEPT

# From Localhost interface to Localhost IP's
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET1_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET2_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET3_IP -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $DMZ_IP -j ACCEPT

# Special rule for DHCP requests from LAN, which are not caught=
 properly otherwise.
$IPTABLES -A INPUT -p UDP -i $LAN_IFACE --dport 67 --sport 68 -j=
 ACCEPT

########################
## Very Important
## All established and related packets incoming from the internet=
 to the firewall
########################
$IPTABLES -A INPUT -p ALL -i $INET_IFACE -m state --state=
 ESTABLISHED,RELATED -j ACCEPT

# If we get DHCP requests from the Outside of our network, our=
 logs will be swamped as well. This rule will block them from=
 getting logged.
$IPTABLES -A INPUT -p UDP -i $INET_IFACE -d 255.255.255.255 \
--destination-port 67:68 -j DROP

# If you have a Microsoft Network on the outside of your=
 firewall, you may also get flooded by Multicasts. We drop them=
 so we do not get flooded by logs
$IPTABLES -A INPUT -i $INET_IFACE -d 224.0.0.0/8 -j DROP

#######################
##
## Special Rules to get Local DNS Working Correctly
##
$IPTABLES -A INPUT -p TCP -d $DNS1_IP --dport 53 -j ACCEPT
$IPTABLES -A INPUT -p UDP -d $DNS1_IP --dport 53 -j ACCEPT
$IPTABLES -A INPUT -p TCP -d $DNS2_IP --dport 53 -j ACCEPT
$IPTABLES -A INPUT -p UDP -d $DNS2_IP --dport 53 -j ACCEPT

#
# Log packets that we don't accept
#

#echo "Logging other packets, that need to DIE!"
$IPTABLES -A INPUT -m limit --limit 3/minute --limit-burst 3 -j=
 LOG \
--log-level info --log-prefix "IPT INPUT packet died: "


###########################################
# PREROUTING chain in the nat table
#
# Enable IP Destination NAT for DMZ zone

#################
## HTTP Servers
#################
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP1_IP=
 --dport 80 \
-j DNAT --to-destination $DMZ_HTTP1_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP2_IP=
 --dport 80 \
-j DNAT --to-destination $DMZ_HTTP2_IP

#################
## HTTP Mail Client
#################
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP1_IP=
 --dport 8080 \
-j DNAT --to-destination $DMZ_HTTP1_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP2_IP=
 --dport 8080 \
-j DNAT --to-destination $DMZ_HTTP2_IP

#################
## FTP Servers
#################
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $FTP1_IP=
 --dport 21 \
-j DNAT --to-destination $DMZ_FTP1_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $FTP2_IP=
 --dport 21 \
-j DNAT --to-destination $DMZ_FTP2_IP
####### --> Non Standard FTP Port
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $FTP2_IP=
 --dport 10101 \
-j DNAT --to-destination $DMZ_FTP2_IP


#################
## Mail Servers
#################
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $MAIL1_IP=
 --dport 25 \
-j DNAT --to-destination $DMZ_MAIL1_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $MAIL1_IP=
 --dport 110 \
-j DNAT --to-destination $DMZ_MAIL1_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $MAIL2_IP=
 --dport 25 \
-j DNAT --to-destination $DMZ_MAIL2_IP
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $MAIL2_IP=
 --dport 110 \
-j DNAT --to-destination $DMZ_MAIL2_IP

#################
## Windows Terminal Services
#################
$IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d=
 $WIN_TERM_SRV1_IP --dport 3389 \
-j DNAT --to-destination $DMZ_WIN_TERM_SRV1_IP


###########################################
# POSTROUTING chain in the nat table
#
# Enable IP SNAT for all internal networks trying to get out on=
 the Internet
#
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT=
 --to-source $INET1_IP


###########################################
#
# FORWARD chain
#
$IPTABLES -A FORWARD -p tcp -j bad_tcp_packets
# DMZ section

$IPTABLES -A FORWARD -i $DMZ_IFACE -o $INET_IFACE -j ACCEPT
$IPTABLES -A FORWARD -i $INET_IFACE -o $DMZ_IFACE -m state=
 --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $DMZ_IFACE -o $LAN_IFACE -m state --state=
 ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j=
 ACCEPT 

#############
# HTTP servers
#############
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d=
 $DMZ_HTTP1_IP --dport 80 -j allowed
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d=
 $DMZ_HTTP2_IP --dport 80 -j allowed

#############
# HTTP Mail Servers
#############
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d=
 $DMZ_HTTP1_IP --dport 8080 -j allowed
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d=
 $DMZ_HTTP2_IP --dport 8080 -j allowed

#############
# FTP servers
#############
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d=
 $DMZ_FTP1_IP --dport 21 -j allowed
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d=
 $DMZ_FTP2_IP --dport 21 -j allowed
####### --> Non Standard FTP Port
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d=
 $DMZ_FTP2_IP --dport 10101 -j allowed

#############
# MAIL server
#############
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d=
 $DMZ_MAIL1_IP --dport 25 -j allowed
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d=
 $DMZ_MAIL1_IP --dport 110 -j allowed
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d=
 $DMZ_MAIL2_IP --dport 25 -j allowed
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d=
 $DMZ_MAIL2_IP --dport 110 -j allowed

#################
## Windows Terminal Services
#################
$IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -d=
 $DMZ_WIN_TERM_SRV1_IP --dport 3389 -j allowed

# Log weird packets that don't match the above.

$IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j=
 LOG \
--log-level debug --log-prefix "IPT FWD INPUT packet died:"

###########################################################
#
# OUTPUT chain
$IPTABLES -A OUTPUT -p tcp -j bad_tcp_packets

$IPTABLES -A OUTPUT -p tcp -m state --state ESTABLISHED,RELATED=
 -j ACCEPT

# Special OUTPUT rules to decide which IP's to allow.
$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET1_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $DMZ_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET2_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET3_IP -j ACCEPT

# Log weird packets that don't match the above.
$IPTABLES -A OUTPUT -m limit --limit 3/minute --limit-burst 3 -j=
 LOG \
--log-level debug --log-prefix "IPT OUTPUT packet died: "


