From: "Jonathan A. Hagn" <jhagn@mindspring.com>
Subject: Port forwarding (Gnutella & FTP)
Date: Thu, 27 Jun 2002 16:58:07 -0600
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D1B987F.18394EC8@mindspring.com>
References: <20020627200808.170D74DA4@lists.samba.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.samba.org

Okay, I'm stumped. I've read all the docs and FAQ's I can find, as well as
inspected others' iptables config files, and still I cannot seem to figure
out what I'm doing wrong here...

By way of background: My setup uses only the 3 default filter and 3 default
nat tables. The default policy on the filter chains are all set to DROP and
the default policy on the nat chains are all set to ACCEPT. I am attempting
to tunnel Gnutella connections through my firewall to the appropriate
internal machine via the PREROUTING chain:

/sbin/iptables -t nat -A PREROUTING -p tcp -i $EXTERNAL_INTERFACE\
 --dport 6346 -j DNAT --to $INTERNAL_MACHINE:6346

While this seems sufficeint in others' config files, the designated
internal machine does not receive any incoming connections through that
port (outgoing connections work fine thanks to proper SNAT POSTROUTING). I
tried adding the same rule for udp packets with no difference in result.

So is there something else I need to make sure I do (or not do) in order to
assure that this PREROUTING rule is doing the job I am hoping it will do?
For reference, I am attaching the complete iptables config file...

Thanks in advance for any assistance.

Hagn

P.S. I have used a similar command to try tunneling FTP through the
firewall but have not had a chance to test its viability -- I suspect it
will not work either, although everything else in the following config file
seems to work as intended. Please note that eth0 is the external interface
and eth1 is the internal interface.

=====

#!/bin/sh
#
# Set commands
 
IPTABLES="/sbin/iptables"
 
# Set internal machine addresses
 
JBOY="10.0.0.2"
ALEX="10.0.0.3"
BRUCE="10.0.0.4"
 
# Capture firewall address on external network
 
EXT_IP="`ifconfig eth0 | grep inet | cut -d : -f 2 | cut -d " " -f 1`"
 
# Flush filter and nat tables
 
$IPTABLES -F
$IPTABLES -t nat -F
 
# Delete all non-default chains from filter and nat tables
 
$IPTABLES -X
$IPTABLES -t nat -X
 
# Set policies on "filter" and "nat" tables
 
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP
 
$IPTABLES -t nat -P PREROUTING ACCEPT
$IPTABLES -t nat -P POSTROUTING ACCEPT
$IPTABLES -t nat -P OUTPUT ACCEPT
 
# ======================================================
# "Port forwarding" to internal servers (NAT PREROUTING)
# ------------------------------------------------------
#
# 1. Forward all external FTP requests to internal FTP server
 
$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 -d $EXT_IP --dport 20\
 -j DNAT --to $JBOY:20
$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 -d $EXT_IP --dport 21\
 -j DNAT --to $JBOY:21
 
# 2. Forward all external Gnutella requests to appropriate
# internal machines
 
$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 6346 -j DNAT\
 --to $ALEX:6346
$IPTABLES -t nat -A PREROUTING -p udp -i eth0 --dport 6346 -j DNAT\
 --to $ALEX:6346
$IPTABLES -t nat -A PREROUTING -p tcp -i eth0 --dport 6347 -j DNAT\
 --to $JBOY:6347
$IPTABLES -t nat -A PREROUTING -p udp -i eth0 --dport 6347 -j DNAT\
 --to $JBOY:6347
 
# Incoming connection rules (INPUT / FORWARD)
# -------------------------------------------
#
# 1. Accept all packets from the firewall loopback interface
 
$IPTABLES -A INPUT -i lo -j ACCEPT
 
# 2. Accept telnet requests from internal network
 
$IPTABLES -A INPUT -p tcp -i eth1 --dport 23 -j ACCEPT
 
# 3. Accept passive and active FTP connections
 
$IPTABLES -A INPUT -p tcp --sport 20 -j ACCEPT
$IPTABLES -A INPUT -p tcp --sport 21 -j ACCEPT
 
# 4. Accept DNS info
 
$IPTABLES -A INPUT -p udp --sport 53 -j ACCEPT
 
# 5. Accept Half-Life server requests
 
$IPTABLES -A INPUT -p tcp --dport 27015 -j ACCEPT
$IPTABLES -A INPUT -p udp --dport 27015 -j ACCEPT
 
# 6. Accept all ICMP packets from internal network
 
$IPTABLES -A INPUT -p icmp -i eth1 -j ACCEPT
 
# 7. Accept ICMP echo-reply packets (ping return)
 
$IPTABLES -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
 
# 8. Forward existing and related external connections to internal network
 
$IPTABLES -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED\
 -j ACCEPT
 
 
# Outgoing connection rules (OUTPUT / FORWARD / POSTROUTING)
# ----------------------------------------------------------
#
# 1. Allow all packets out through the loopback
 
$IPTABLES -A OUTPUT -o lo -j ACCEPT
 
# 2. Allow all ICMP requests out
 
$IPTABLES -A OUTPUT -p icmp -j ACCEPT
 
# 3. Allow all TCP and UDP packets out to internal network
 
$IPTABLES -A OUTPUT -p tcp -o eth1 -j ACCEPT
$IPTABLES -A OUTPUT -p udp -o eth1 -j ACCEPT
 
# 4. Allow FTP connections out from firewall
 
$IPTABLES -A OUTPUT -p tcp --dport 20 -j ACCEPT
$IPTABLES -A OUTPUT -p tcp --dport 21 -j ACCEPT
 
# 5. Allow DNS requests out from firewall
 
$IPTABLES -A OUTPUT -p udp --dport 53 -j ACCEPT
 
# 6. Internal network "masquerading" rules
#
#       a. Forward internal network packets to external network
 
$IPTABLES -A FORWARD -i eth1 -o eth0 -j ACCEPT
 
#       b. Disguise internal network packets bound for the external network
#       as packets from the firewall machine's IP address
 
$IPTABLES -t nat -A POSTROUTING -o eth0 -j SNAT --to $EXT_IP
$IPTABLES -t nat -A POSTROUTING -o eth1 -j ACCEPT
 
# ============
# Kernel stuff
# ------------
# 1. Enable kernel packet forwarding
 
echo 1 > /proc/sys/net/ipv4/ip_forward
 
# 2. Enable TCP SYN cookie protection (from DOS attacks)
 
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

