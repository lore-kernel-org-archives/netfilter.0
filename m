From: "Brian French" <bfrench@imageworksstudio.com>
Subject: Trouble with router and iptables
Date: Fri, 14 Jan 2005 11:05:54 -0500
Message-ID: <KJEGIFLIAAKLNBMJNOIJMEHGECAA.bfrench@imageworksstudio.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


In our office we have a router which used iptables to nat our office
computers.

within this we have fort forwarding setup for certian services.
some of them forward ok, yet some (like ssh) will not.

also, our connection to the net goes down intermitantly on a per-computer
basis, and all i can think is that the nat is somehow not setup correctly or
that certian packets are being dropped.

below is the script which sets up iptables, could you guys please look
through it and give me any suggestions at to what i should do.
i would GREATLY appreciate your help!!

i have replaced all origional ip addresses.

200.200.200.x is external ip addresses and 192.168.0.x in internal ip
addresses.


#!/bin/sh
############################################################################
###
# This is iptables, if you need help see:
#
# http://support.imagestream.com/
#
############################################################################
###

echo -n "Setting up firewalling rules..."

############################################################################
###
# Set the variables for this script
#
# Any line with the comment '# BMF' was added by Brian
#
############################################################################
###

# Change this subnet to correspond to your private
# ethernet subnet.  Home will use 192.168.1.0/24 and
# Office will use 192.168.0.0/24.
PRIVATE=192.168.0.0/24

# Loopback address
LOOP=127.0.0.1

# External interface
EXT=Serial0
EXTIP=200.200.200.10
# Internal interface
INT=Ethernet0
INTIP=192.168.0.1

############################################################################
###
# Flushing all rules.
#
# Do not uncomment these lines unless you have NAT rules that require them.
#
############################################################################
###
#modprobe ip_nat_ftp
#modprobe ip_nat_irc

# flush all previous rulesets
iptables -F
############################################################################
###
# Do not uncomment this line unless you have NAT rules below.
#
############################################################################
###
iptables -F -t nat

# Set default policies
iptables -P OUTPUT ACCEPT # BMF
iptables -P INPUT DROP    # BMF
iptables -P FORWARD DROP  # BMF

# Prevent external packets from using loopback addr
iptables -A INPUT -i $EXT -s $LOOP -j DROP    # BMF
iptables -A FORWARD -i $EXT -s $LOOP -j DROP  # BMF
iptables -A INPUT -i $EXT -d $LOOP -j DROP    # BMF
iptables -A FORWARD -i $EXT -d $LOOP -j DROP  # BMF

# Anything coming from the Internet should have a real Internet address
iptables -A FORWARD -i $EXT -s 192.168.0.0/16 -j DROP # BMF
iptables -A FORWARD -i $EXT -s 172.16.0.0/12 -j DROP  # BMF
iptables -A FORWARD -i $EXT -s 10.0.0.0/8 -j DROP     # BMF
iptables -A INPUT -i $EXT -s 192.168.0.0/16 -j DROP   # BMF
iptables -A INPUT -i $EXT -s 172.16.0.0/12 -j DROP    # BMF
iptables -A INPUT -i $EXT -s 10.0.0.0/8 -j DROP       # BMF

# Allow local loopback
iptables -A INPUT -s $LOOP -j ACCEPT  # BMF
iptables -A INPUT -d $LOOP -j ACCEPT  # BMF

############################################################################
###
# If you have NAT rules and get a "ip_conntrack: table full, dropping
packet."#
# message in your kernel message log (dmesg), increase the maximum number of
#
# connections that can be tracked by uncommenting the line below
#
# Each connection uses ~ 350 bytes of memory.  16384 = 5.7 MB
#
############################################################################
###
#echo 16384 > /proc/sys/net/ipv4/ip_conntrack_max

############################################################################
###
# Use this line to masquerade for the 172.16 class B network as 1.2.3.4.
#
############################################################################
###
#iptables -t nat -A POSTROUTING -s 172.16.0.0/16 -j SNAT --to 1.2.3.4

iptables -t nat -A POSTROUTING -o $EXT -j MASQUERADE

########################################################
# Additional firewall rules sensible for most networks #
########################################################
#---- Drop all MSBlaster-type worms with ICMP scans of 92 bytes
#---- For the lowest CPU usage, try this rule before using
#---- the limit rules below
iptables -A FORWARD -p icmp -m length --length 92 -j DROP

#---- Allow all good icmp traffic through the router
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type destination-unreachable -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type source-quench -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type parameter-problem -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A FORWARD -p icmp --icmp-type echo-request -j ACCEPT
#---- Limit inbound echo-request to 5 per second inbound from gateway
#---- Limit outbound echo-request to 10 per second outbound to each gateway
#---- XXXX is the border interface on the router (e.g. "Serial0" or
"Serial3.1")
#---- This helps limit the effect of ICMP scans from worms, etc.
iptables -A FORWARD -i $EXT -m limit --limit 10/s --limit-burst 10 -p
icmp --icmp-type echo-request -j ACCEPT
iptables -A FORWARD -o $EXT -m limit --limit 5/s --limit-burst 30 -p
icmp --icmp-type echo-request -j ACCEPT

#---- Drop any icmp traffic over the limits specified above
iptables -A FORWARD -p icmp -j DROP

#---- Block common worm traffic coming in via External interfaces
#---- where "XXXX" is your Internet gateway interface
iptables -A FORWARD -j DROP -i $EXT -p tcp --dport 135:139
iptables -A FORWARD -j DROP -i $EXT -p udp --dport 135:139
iptables -A FORWARD -j DROP -i $EXT -p tcp --dport 444
iptables -A FORWARD -j DROP -i $EXT -p udp --dport 444
iptables -A FORWARD -j DROP -i $EXT -p udp --dport 995:999
iptables -A FORWARD -j DROP -o $EXT -p udp --dport 8998

#---- Block access to backdoor on system infected by W32.Novarg.A@mm Worm
iptables -A FORWARD -p tcp --dport 3127:3149 -j DROP

#################################################
#
# below is not part of the origional file.
# added by Brian French 10.22.2004
#
#################################################

## Since i was unable to get openvpn to work here
## i have set it up on the fileserver and forward

## Allow connection from Brians home to his work computer
iptables -t nat -A PREROUTING -p tcp -i $EXT \
        --dport 3389 -s 200.200.200.90 --sport 1024:65535 -j DNAT --to
192.168.0.250:3389
iptables -A FORWARD -p tcp -i $EXT \
        -o $INT -d 192.168.0.250 --dport 3389 -s 200.200.200.90 --sport
1024:65535 -m state --state NEW -j ACCEPT

## Allow rheanna to connect to her computer
iptables -t nat -A PREROUTING -p tcp -i $EXT \
        --dport 3389 -s 200.200.200.53 --sport 1024:65535 -j DNAT --to
192.168.0.210:3389
iptables -A FORWARD -p tcp -i $EXT \
        -o $INT -d 192.168.0.210 --dport 3389 -s 200.200.200.53 --sport
1024:65535 -m state --state NEW -j ACCEPT

## Allow Brian to SSH to the fileserver
iptables -t nat -A PREROUTING -p tcp -i $EXT \
        --dport 222 -s 200.200.200.90 --sport 1024:65535 -j DNAT --to
192.168.0.2:22
iptables -A FORWARD -p tcp -i $EXT \
        -o $INT -d 192.168.0.2 --dport 222 -s 200.200.200.90 --sport
1024:65535 -m state --state NEW -j ACCEPT


iptables -A FORWARD -t filter -i $INT -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -t filter -i $EXT -m state  --state
ESTABLISHED,RELATED -j ACCEPT

# Allow services such as www and ssh (can be disabled)
iptables -A INPUT -p tcp --dport ssh -j ACCEPT

# Block outgoing NetBios (if you have windows machines running
# on the private subnet).  This will not affect any NetBios
# traffic that flows over the VPN tunnel, but it will stop
# local windows machines from broadcasting themselves to
# the internet.
iptables -A FORWARD -p tcp --sport 137:139 -o $EXT -j DROP
iptables -A FORWARD -p udp --sport 137:139 -o $EXT -j DROP
iptables -A OUTPUT -p tcp --sport 137:139 -o $EXT -j DROP
iptables -A OUTPUT -p udp --sport 137:139 -o $EXT -j DROP

# Allow incoming OpenVPN packets
# Duplicate the line below for each
# OpenVPN tunnel, changing --dport n
# to match the OpenVPN UDP port.
#
# In OpenVPN, the port number is
# controlled by the --port n option.
# If you put this option in the config
# file, you can remove the leading '--'
#
# If you taking the stateful firewall
# approach (see the OpenVPN HOWTO),
# then comment out the line below.

iptables -A INPUT -p udp --dport 5000 -j ACCEPT

# Allow packets from TUN/TAP devices.
# When OpenVPN is run in a secure mode,
# it will authenticate packets prior
# to their arriving on a tun or tap
# interface.  Therefore, it is not
# necessary to add any filters here,
# unless you want to restrict the
# type of packets which can flow over
# the tunnel.

iptables -A INPUT -i tun+ -j ACCEPT
iptables -A FORWARD -i tun+ -j ACCEPT
iptables -A INPUT -i tap+ -j ACCEPT
iptables -A FORWARD -i tap+ -j ACCEPT

# Allow packets from private subnets
iptables -A INPUT -i $INT -j ACCEPT
iptables -A FORWARD -i $INT -j ACCEPT

# Keep state of connections from local machine and private subnets
iptables -A OUTPUT -m state --state NEW -o $EXT -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state NEW -o $EXT -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT



