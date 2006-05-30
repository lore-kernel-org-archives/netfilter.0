From: "JPP" <jpp1@frws.com>
Subject: NAT not being kind... Any ideas?
Date: Tue, 30 May 2006 09:34:45 -0600
Message-ID: <20060530150905.M48794@frws.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Good Day ALL!!

Having a bit of a problem and figured someone on the list may have done this 
and can see the issue.

Setup:
FC4 and iptables 1.3.0
Plenty of memory and bandwidth...

ETH0 points to the Internet
ETH1 points Inside
BR0/TAP0 bridge the interfaces allowing OpenVPN to work

What does work...
We have a Bridge set up for OpenVPN on the same machine and that works fine.
Browsing and accessing the Internet works fine, both with and without the 
Transparent Squid Proxy on the same machine, from inside and from the Gateway.
Accessing the gateway machine from outside and inside works fine (SSH/DNS/etc)

Problem:
The problem is we cannot get NAT to work for any machines - we have 2 servers 
inside that need outside IPs for various reasons.
We assigned them Internet Accessible IPs and used 'ip add . . etc etc' to 
create the virtuals on the gateway machine - those IPs PING (but I suspect 
that it is the gateway responding).
The PREROUTING and POSTROUTING commands are below in the firewall script.

We have rebooted, reset and just about anything else you can think of. That 
included PORT FORWARDING individual ports - nothing seems to work. One server 
inside runs DNS services and we have been using that as a test, but we get "no 
servers responded' or 'no servers could be reached' when querying it from 
outside.

Could it be the bridging stopping/hindering this? What changes need to be made 
to allow this to work using the current configuration? There are no errors 
running the firewall script and through research - this setup SHOULD work.

Thanks in Advance!

Jerome

########################################################################
# FIREALL SCRIPT - IPTABLES

#!/bin/bash 

######################################################################### 
#                                                                       # 
#  I N I T I A L   S E T U P                                            # 
#                                                                       # 
######################################################################### 

PATH=/sbin:/bin        # Only path I need. 

# Interfaces and IPs
#--------------------- 

EXTIF="eth0" 
INTIF="! $EXTIF"        # Any non eth0 interface is trusted 
INTLAN="192.168.68.0/255.255.255.0" 
UNIV="0.0.0.0/0" 
EXTIP="XXX.194.217.190" 

EXTSRVR1="XXX.194.217.191"
EXTSRVR2="XXX.192.217.192"

INTSRVR1="192.168.68.200"
INTSRVR2="192.168.68.201"

# Check our connection 
#--------------------- 
#   echo "Firewall: Check our connection..." 
# 
#CHECK=`ifconfig | grep $EXTIF | awk '{ print $1 }'` 
#if [ -z $CHECK ]; then 
#   echo "Internet connection is down... exiting." 
#   exit 
#fi 

############################### 
# 
# K E R N E L   S E T T I N G S 
# 
############################### 

echo "Firewall: Enable Kernel Settings..." 

# Enable IP Forwarding, if it isn't already 
sysctl -w net.ipv4.ip_forward=1 >/dev/null 

# Enable TCP SYN Cookie protection: 
sysctl -w net.ipv4.tcp_syncookies=1 >/dev/null 

# Enabling dynamic TCP/IP address hacking. 
sysctl -w net.ipv4.ip_dynaddr=1 >/dev/null 

# Required for IPsec VPN 
#sysctl -w net.ipv4.conf.all.rp_filter=0 >/dev/null 
sysctl -w net.ipv4.conf.all.rp_filter=1 >/dev/null 

# Log spoofed, source-routed, and redirect packets 
sysctl -w net.ipv4.conf.all.log_martians=1 >/dev/null 

# Disable ICMP Re-directs 
sysctl -w net.ipv4.conf.all.accept_redirects=0 >/dev/null 
sysctl -w net.ipv4.conf.all.send_redirects=0 >/dev/null 

# Ensure that source-routed packets are dropped 
sysctl -w net.ipv4.conf.all.accept_source_route=0 >/dev/null 

# Disable ICMP broadcast echo protection 
sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1 >/dev/null 

# Enable bad error message protection 
sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1 >/dev/null 

###################################################### 
# 
#  B A S I C   P O L I C I E S   A N D   M O D U L E S 
# 
###################################################### 

echo "Firewall: Init relevant modules..." 

# Initiate the relevant modules 
#------------------------------ 
modprobe ipt_LOG            # Add LOG target. 
modprobe ipt_REJECT         # Add REJECT target. 
modprobe ipt_MASQUERADE     # Add MASQUERADE target. 
modprobe ipt_owner          # Allows you to match for the owner. 
modprobe ip_conntrack       # Support connection tracking 
modprobe ip_conntrack_ftp   # Support connection tracking of FTP. 
modprobe iptable_filter 
modprobe iptable_mangle 
modprobe ipt_limit 
modprobe ipt_state 
modprobe ip_nat_ftp         # Active FTP 
modprobe ip_nat_irc         # IRC stuff 
modprobe iptable_nat        # Give us NATing 

# First clear everything 
#------------------------ 
echo "Firewall: First clear everything..." 

iptables --flush 
iptables -t nat --flush 
iptables -t mangle --flush 

for TABLE in filter nat mangle; do 
    iptables -t $TABLE -F     # Flush all previous rules. 
    iptables -t $TABLE -X     # Delete user-defined chains. 
done 

## Delete the chains now 
iptables --delete-chain 
iptables -t nat --delete-chain 
iptables -t mangle --delete-chain 

iptables -X 
iptables -t nat -X 
iptables -t mangle -X 

# Default policies 
#----------------- 
echo "Firewall: Set default policies..." 
 
iptables -P INPUT   DROP 
iptables -P OUTPUT  DROP 
iptables -P FORWARD DROP 

######################################## 
# 
#  U S E R  D E F I N E D   C H A I N S 
# 
######################################## 

# 
# Create the chains for valid src and valid dst 
# And verify them 
#------------------------------------------------- 
iptables -N valid-src 
iptables -N valid-dst 

echo "Firewall: Create chain 1 ..." 
iptables -A INPUT -i $EXTIF -j valid-src 
echo "Firewall: Create chain 2 ..." 
iptables -A FORWARD -i $EXTIF -j valid-src 
echo "Firewall: Create chain 3 ..." 
iptables -A OUTPUT -o $EXTIF -j valid-dst 
echo "Firewall: Create chain 4 ..." 
iptables -A FORWARD -o $EXTIF -j valid-dst 

#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# 
# 
# Source and Destination Address Sanity Checks 
# 
# Drop packets from networks covered in RFC 1918 (private nets) 
# Drop packets from external interface IP 
# 
#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=# 
echo "Firewall: valid-src rules ..." 
iptables -A valid-src -s $10.0.0.0/8     -j DROP 
iptables -A valid-src -s $172.16.0.0/12  -j DROP 
##iptables -A valid-src -s $192.168.0.0/16 -j DROP 
iptables -A valid-src -s $224.0.0.0/4    -j DROP 
iptables -A valid-src -s $240.0.0.0/5    -j DROP 
iptables -A valid-src -s $127.0.0.0/8    -j DROP 
iptables -A valid-src -s 0.0.0.0/8       -j DROP 
iptables -A valid-src -d 255.255.255.255 -j DROP 
iptables -A valid-src -s 169.254.0.0/16  -j DROP 
iptables -A valid-src -s $EXTIP          -j DROP 
echo "Firewall: valid-dst rules ..." 
iptables -A valid-dst -d $224.0.0.0/4    -j DROP 

######################################################################### 
#                                                                       # 
# I N P U T   R U L E S                                                 # 
#                                                                       # 
######################################################################### 

#-----------------------------------------------------------------------# 
# Incoming traffic on internal LAN                                      # 
#-----------------------------------------------------------------------# 

# Allow everything on our LAN 
#---------------------------- 
echo "Firewall Input Rules: Allow everything on our LAN..." 

iptables -A INPUT -j ACCEPT -i $INTIF 
iptables -A INPUT -j ACCEPT -i lo  # Somewhat redundant, but leave it. 

#-----------------------------------------------------------------------# 
# Incoming traffic on Internet interface                                # 
#-----------------------------------------------------------------------# 

# Add any real IPs behind the gateway here 
#----------------------------------------- 

# - If this box is sitting on an internal network, don't block these IPs 
# - Don't log these as drop-reserved... funny ISPs (@Home) to blame 
echo "Firewall: Check special IPs on internal network to NOT block..." 

#if [ "$CHKINT1" != "192.168" ]; then 
#     iptables -A INPUT -j DROP -i $EXTIF -s 192.168.0.0/16 
#fi 

# Allow some ICMP (ping) 
#----------------------- 
# ICMP can be used for attacks.. we allow as little as possible. 
# The following are necessary ports we can't do without: 
# 0  Needed to ping hosts outside the network. 
# 3  Needed by all networks. 
# 11 Needed by the traceroute program.      
echo "Firewall Input Rules: Allow some ICMP (ping)..." 

iptables -A INPUT -i $EXTIF -d $EXTIP -j ACCEPT -p icmp --icmp-type 0 
iptables -A INPUT -i $EXTIF -d $EXTIP -j ACCEPT -p icmp --icmp-type 3 
iptables -A INPUT -i $EXTIF -d $EXTIP -j ACCEPT -p icmp --icmp-type 11 

# This allows other hosts to ping you.  Remove it if you wish. 
iptables -A INPUT -i $EXTIF -d $EXTIP -j ACCEPT -p icmp --icmp-type 8 

# Allow DHCP client to respond 
#----------------------------- 
echo "Firewall Input Rules: Allow DHCP client to respond..." 

#iptables -A INPUT -j ACCEPT -i $EXTIF -p udp -d $EXTIP --dport 68 --sport 67 
#iptables -A INPUT -j ACCEPT -i $EXTIF -p tcp -d $EXTIP --dport 68 --sport 67 

iptables -A INPUT -j ACCEPT -i $EXTIF -p udp -d $EXTIP --dport 123 --sport 123 
iptables -A INPUT -j ACCEPT -i $EXTIF -p tcp -d $EXTIP --dport 123 --sport 123 

# Allow Sonicwall VPN client to respond 
#----------------------------- 
echo "Firewall Input Rules: Allow VPN client to respond..." 

#iptables -A INPUT -j ACCEPT -i $EXTIF -p udp -d $EXTIP \
#--dport 500 --sport 500 
#iptables -A INPUT -j ACCEPT -i $EXTIF -p tcp -d $EXTIP \
#--dport 50 --sport 50 

# 
# Allow DNS 
#---------------------------------------------------------------------- 
echo "Firewall Input Rules: Allow DNS to respond..." 

iptables -A INPUT -p udp -i $EXTIF --sport 53 --dport 1024:65535 \ 
        -j ACCEPT 

#iptables -A INPUT -p udp -i br0 --sport 53 --dport 1024:65535 \ 
#         -j ACCEPT 

iptables -A INPUT -p udp -i $INTIF --sport 53 --dport 1024:65535 \ 
        -j ACCEPT 

# 
# Allow SSH in from certain IPs 
#----------------------------------------------------------------------- 
echo "Firewall Input Rules: Allow SSH to respond..." 

iptables -A INPUT -j ACCEPT -i $EXTIF -p tcp -d $EXTIP \ 
        --dport 22 --sport 1024:65535 

iptables -A INPUT -j ACCEPT -i $EXTIF -p tcp -d $EXTIP \ 
        --dport ftp --sport 1024:65535 

iptables -A INPUT -j ACCEPT -i $EXTIF -p tcp -d $EXTIP \ 
        --dport ftp-data --sport 1024:65535 

# Allow ports for web server 
#--------------------------------------------------------- 
# 
# For advanced firewall configuration, feel free to add rules to your 
# liking... but be careful about security! 
# 
# This section of the firewall allows incoming connections on the 
# Internet interface.  You may also have to allow connections _out_... that 
# section is further below. 
# 
# - You may need to make changes to /etc/hosts.allow and /etc/xinetd.d. 
# - If you follow the same format and add your rules between the 
#   start/end tags, your changes will be reflected in the interface. 
# 
# start_input_rules (Do not delete this line - used by the interface) 
echo "Firewall Input Rules: Allow ports for web server..." 

## We do not run Web inside 
#iptables -A INPUT -j ACCEPT -i $EXTIF -p tcp -d $EXTIP --dport 80 
#iptables -A INPUT -j ACCEPT -i $EXTIF -p tcp -d $EXTIP --dport 81 
#iptables -A INPUT -j ACCEPT -i $EXTIF -p tcp -d $EXTIP --dport 8080 

iptables -A INPUT -j ACCEPT -i $EXTIF -p tcp -d $EXTIP --dport https 

# SSH 
iptables -A INPUT -j ACCEPT -i $EXTIF -p tcp -d $EXTIP --dport 22 

# end_input_rules (Do not delete this line - used by the interface) 

# Block & log common drop-trojans and flooders - this list should be updated 

## REJECT IDENT and send back a nice message  :>) 
iptables -A INPUT -p tcp -m tcp --dport 113 -m limit --limit 1/min \
-j REJECT --reject-with icmp-proto-unreachable 

# Allow high ports 
#----------------- 
# Now that the services above have been blocked, we can enable the 
# high unprivileged ports to reply to TCP/UDP traffic. 
echo "Firewall Input Rules: Allow high ports..." 

iptables -A INPUT -j ACCEPT -p udp --dport 1024:65535 -d $EXTIP 
iptables -A INPUT -j ACCEPT -p tcp --dport 1024:65535 -d $EXTIP \ 
    -m state --state ESTABLISHED,RELATED 

# TAP BR Rules 
#----------------------- 
iptables -A INPUT -i tap0 -j ACCEPT 
iptables -A INPUT -i br0 -j ACCEPT 

# Block everything else 
#---------------------- 
echo "Firewall Input Rules: Block everything else..." 

iptables -A INPUT -j DROP -i $EXTIF -s $UNIV -d $UNIV 

######################################################################### 
#                                                                       # 
# O U T P U T   R U L E S                                               # 
#                                                                       # 
######################################################################### 

iptables -A OUTPUT -o $EXTIF -m state --state ESTABLISHED,RELATED \ 
    -j ACCEPT 

# Block drop-stuffed routing and masquerading packets 

#-----------------------------------------------------------------------# 
# Outgoing traffic on internal LAN                                      # 
#-----------------------------------------------------------------------# 

# Allow everything on the loopback, and LAN interface 
#---------------------------------------------------- 
echo "Firewall Output Rules: Allow everything on the loopback and LAN 
interface..." 

iptables -A OUTPUT -j ACCEPT -o lo 
iptables -A OUTPUT -j ACCEPT -o $INTIF 

#-----------------------------------------------------------------------# 
# Outgoing traffic on Internet interface                                # 
#-----------------------------------------------------------------------# 

# Allow all ICMP out 
#------------------- 
echo "Firewall Output Rules: Allow all ICMP out..." 

iptables -A OUTPUT -j ACCEPT -o $EXTIF -p icmp -s $EXTIP 

# Allow DHCP client to respond 
#----------------------------- 
echo "Firewall Output Rules: Allow DHCP client to respond..." 

#iptables -A OUTPUT -j ACCEPT -o $EXTIF -p tcp -s $EXTIP --sport 68 --dport 67 
#iptables -A OUTPUT -j ACCEPT -o $EXTIF -p udp -s $EXTIP --sport 68 --dport 67 

# Time protocol 
iptables -A OUTPUT -j ACCEPT -o $EXTIF -p tcp -s $EXTIP \
--sport 123 --dport 123 
iptables -A OUTPUT -j ACCEPT -o $EXTIF -p udp -s $EXTIP \
--sport 123 --dport 123 

# Allow Sonicwall VPN client to respond 
#----------------------------- 
  echo "Firewall Input Rules: Allow VPN client to respond..." 

#iptables -A OUTPUT -j ACCEPT -o $EXTIF -p udp -s $EXTIP --dport 500 --sport 
500 
#iptables -A OUTPUT -j ACCEPT -o $EXTIF -p tcp -s $EXTIP --dport 50 --sport 50 

# Allow ports configured in the interface 
#--------------------------------------------------------- 
# 
# This section of the firewall allows outgoing connections on the 
# Internet interface.  You also have to allow connections _in_... that 
# section is above. 
# 
# See comments above. 
# 
# start_output_rules (Do not delete this line - used by the interface) 
echo "Firewall Output Rules: Allow outgoing connections on the internet 
interface..." 

#iptables -A OUTPUT -j ACCEPT -o $EXTIF -p tcp --dport 113 

iptables -A OUTPUT -j ACCEPT -o $EXTIF -p tcp -s $EXTIP --sport http 
iptables -A OUTPUT -j ACCEPT -o $EXTIF -p tcp -s $EXTIP --sport https 
iptables -A OUTPUT -j ACCEPT -o $EXTIF -p tcp -s $EXTIP --sport tproxy 
iptables -A OUTPUT -j ACCEPT -o $EXTIF -p tcp -s $EXTIP --sport 8080 

iptables -A OUTPUT -j ACCEPT -o $EXTIF -p tcp -s $EXTIP --sport 22 

# 
# Allow DNS 
#------------------------------------------------------------------ 
echo "Firewall Output Rules: Allow DNS to respond..." 

iptables -A OUTPUT -p udp -o $EXTIF --dport 53 --sport 1024:65535 \ 
        -j ACCEPT 
      
iptables -A OUTPUT -p udp -o $INTIF --dport 53 --sport 1024:65535 \ 
        -j ACCEPT 

iptables -A OUTPUT -p udp -o $EXTIF --dport 1024:65535 --sport 53 \ 
        -j ACCEPT 

iptables -A OUTPUT -p udp -o $INTIF --dport 1024:65535 --sport 53 \ 
        -j ACCEPT 

# 
# Allow SSH in from certain IPs 
#----------------------------------------------------------------------- 

#iptables -A OUTPUT -p tcp -o $EXTIF --dport 22 --sport 1024:65535 \ 
#         -j ACCEPT 

# 
# Allow FTP Out 
#--------------------------------------------------------------------- 
iptables -A OUTPUT -p tcp -o $EXTIF --dport ftp --sport 1024:65535 \ 
        -j ACCEPT 

iptables -A OUTPUT -p tcp -o $EXTIF --dport ftp-data --sport 1024:65535 \ 
        -j ACCEPT 

# end_output_rules (Do not delete this line - used by the interface) 

# Allow high ports 
#----------------- 
# Allow unprivileged ports to reply to TCP/UDP traffic. 
echo "Firewall Output Rules: Allow high ports..." 

iptables -A OUTPUT -o $EXTIF -p tcp -j ACCEPT -s $EXTIP --sport 1024:65535 
iptables -A OUTPUT -o $EXTIF -p udp -j ACCEPT -s $EXTIP --sport 1024:65535 

# TAP Rules 
#------------------- 
iptables -A FORWARD -i br0 -j ACCEPT 

# Block everything else 
#---------------------- 
echo "Firewall Output Rules: Block everything else..." 

iptables -A OUTPUT -j DROP -o $EXTIF -s $UNIV -d $UNIV 

############################################################################ 
#                                                                          # 
#                            F O R W A R D I N G                           # 
#                                                                          # 
############################################################################ 

# Block services from leaving the LAN (low port numbers) 
# Snort will log suspicious traffic in high port ranges 

# Enable masquerading 
#-------------------- 
echo "Firewall Forwarding: Enable masquerading..." 

iptables -A POSTROUTING -t nat -j MASQUERADE -o $EXTIF 
iptables -A FORWARD -i $INTIF -j ACCEPT 
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT 
iptables -A FORWARD -m limit --limit 5/minute --limit-burst 5 \ 
    -j LOG --log-level 4 --log-prefix "IPT FORWARD packet died: " 

#----------------------------------------------------------------------------- 
# NAT Forwarding 
# 
#----------------------------------------------------------------------------- 
echo "Firewall NAT Rules: PREROUTING NAT rules..." 

# PREROUTING statements for 1:1 NAT 

# (Connections originating from the Internet) 
iptables -t nat -A PREROUTING -p TCP -i $EXTIF -d $EXTSRVR1 \ 
-j DNAT --to-destination $INTSRVR1 

#iptables -t nat -A PREROUTING -p UDP -i $EXTIF -d $EXTSRVR1 \ 
#-j DNAT --to-destination $INTSRVR1 

iptables -t nat -A PREROUTING -p TCP -i $EXTIF -d $EXTSRVR2 \ 
-j DNAT --to-destination $INTSRVR2 

iptables -t nat -A PREROUTING -p UDP -i $EXTIF -d $EXTSRVR2 \ 
-j DNAT --to-destination $INTSRVR2 
      
# POSTROUTING statements for 1:1 NAT 
# (Connections originating from the home network servers) 
echo "Firewall NAT Rules: POSTROUTING NAT rules..." 

iptables -t nat -A POSTROUTING -s $INTSRVR1 -o $EXTIF \ 
     -j SNAT --to-source $EXTSRVR1 

iptables -t nat -A POSTROUTING -s $INTSRVR2 -o $EXTIF \ 
     -j SNAT --to-source $EXTSRVR2 
          
# POSTROUTING statements for Many:1 NAT 
# (Connections originating from the entire home network) 

#iptables -t nat -A POSTROUTING -s $INTLAN \ 
#       -j SNAT -o $INTIF --to-source $EXTIP 

iptables -t nat -A POSTROUTING -o $EXTIF -j SNAT --to-source $EXTIP 

# Allow forwarding to each of the servers configured for 1:1 NAT 
# (For connections originating from the Internet. Notice how you 
# use the real IP addresses here) 
echo "Firewall NAT Rules: FORWARD NAT rules..." 

iptables -A FORWARD -p tcp -i $EXTIF -o $INTIF -d $INTSRVR1 \ 
      -m multiport --dport 53,1433,1434,3389,3390,1720,1503,80,21,22 \ 
      -m state --state NEW -j ACCEPT 

#iptables -A FORWARD -p tcp -i $EXTIF -o $INTIF -d $INTSRVR2 \ 
#       -m multiport --dport 1433,1434,1720,1503,22 \ 
#       -m state --state NEW -j ACCEPT 
                              
# Allow forwarding for all New and Established SNAT connections 
# originating on the home network AND already established 
# DNAT connections 

iptables -A FORWARD -t filter -o $EXTIF -m state \ 
      --state NEW,ESTABLISHED,RELATED -j ACCEPT 

# Allow forwarding for all 1:1 NAT connections originating on 
# the Internet that have already passed through the NEW forwarding 
# statements above 

iptables -A FORWARD -t filter -i $EXTIF -m state \ 
       --state ESTABLISHED,RELATED -j ACCEPT 

#-----------------------------------------------------------------------------
- 
# Port Forwarding 
# 
# For basic firewall configuration, use the interface! 
#-----------------------------------------------------------------------------
- 

# start_portfw_rules (Do not delete this line - used by the interface) 
iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE 

# end_portfw_rules (Do not delete this line - used by the interface) 

## SQUID proxy 
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 \
-j REDIRECT --to-port 3128 

# Allow all other forwarding 
#--------------------------- 
# - You need this rule if you port forward packets to machines behind the 
#   gateway. 
echo "Firewall Forwarding: Allow all other forwarding..." 

iptables -A FORWARD -j ACCEPT 

#-----------------------------------------------------------------------------
- 
# 
# Allow the admin to block certain services (ICQ, etc) 
# 
#-----------------------------------------------------------------------------
- 

# start_blockport_rules (Do not delete this line - used by the interface) 
# end_blockport_rules (Do not delete this line - used by the interface) 

# start_blockurl_rules (Do not delete this line - used by the interface) 
# end_blockurl_rules (Do not delete this line - used by the interface) 


--
FRWS WebMail (http://www.frws.com)
Cause you deserve Spam and Virus free email...


