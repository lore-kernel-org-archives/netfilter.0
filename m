From: Christian Unger <chakkerz@optusnet.com.au>
Subject: Re: Beginners Luck??
Date: Tue, 27 Jan 2004 12:23:03 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401271223.03677.chakkerz@optusnet.com.au>
References: <7C9884991ADAE0479C14F10C858BCDF567910C@alderaan.smgtec.com>
Reply-To: chakkerz@optusnet.com.au
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_31bFAATzajqRTPY"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF567910C@alderaan.smgtec.com>
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


--Boundary-00=_31bFAATzajqRTPY
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> It could be that you are blocking traffic to or from 'lo' or localhost.
> Make sure that you leave this alone. I know that java often uses ports
> for various mickel-muck. Anyways, also does port 6000 work correctly?
> Maybe if you described your base rules, I could tell you where you're
> problem is originating from.

That would make sense... as for 6000 not sure.

Forwarning this firewall is based on Robert L. Ziegler's book "Linux 
Firewalls". The book is by and large good, but ... heck I haven't done this 
before :).

Reason it is called stage2 is that i am planning to run a deny be default 
script at startup ... thought that seems useless now that i've been thinking 
about it, since i can just raise the firewall via if-up.

-- 
with kind regards,
  Christian Unger

 - < > - < > - < > - < > - < > - < > - < > - < > -
 
  Alt. Email:  chakkerz_dev@optusnet.com.au
  ICQ:         204184156
  Mobile:      0402 268904
  Web:         http://naiv.sourceforge.net

--Boundary-00=_31bFAATzajqRTPY
Content-Type: application/x-shellscript;
  name="rc.firewall_stage2"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="rc.firewall_stage2"

#!/bin/bash

#modprobe ip_conntrack_ftp         # needed??

##
##
##  BASED ON  
##  Robert L. Ziegler, "Linux Firewalls" Second Edition, (Nov 2001) New Riders Publishing
##
##

CONNECTION_TRACKING="1"
ACCEPT_AUTH="0"
DHCP_CLIENT="0"

INTERNET="ppp0"
LOOPBACK_INTERFACE="lo"
IPADDR=`ifconfig $INTERNET | grep inet | cut -d : -f 2 | cut -d \  -f`		# get my IP dynamically
SUBNET_BASE=""                                      #   <---------------- huh wha?
SUBNET_BROADCAST=""                                 #   <---------------- huh wha?
MY_ISP=`ifconfig $INTERNET | grep P-t-P | cut -d : -f 3 | cut -d \  -f 1` # get ISP's IP dynamically -  P-t-P is on the same line as inet (as above)

NAMESERVER_1="203.2.75.132"
NAMESERVER_2="198.142.0.51"

POP_SERVER="mail.optusnet.com.au"		               # 211.29.132.250
MAIL_SERVER="mail.optusnet.com.au"
NEWS_SERVER="news.optusnet.com.au"
#TIME_SERVER=""
#DHCP_SERVER=""
SSH_CLIENT=""                                       #   <---------------- huh wha?

LOOPBACK="127.0.0.0/8"
CLASS_A="10.0.0.0/8"
CLASS_B="172.16.0.0/12"
CLASS_C="192.168.0.0/16"
CLASS_D_MULTICAST="224.0.0.0/4"
CLASS_E_RESERVED_NET="240.0.0.0/5"
BROADCAST_SRC="0.0.0.0"
BROADCAST_DEST="255.255.255.255"

PRIVPORTS="0:1023"
UNPRIVPORTS="1024:65535"

NFS_PORT="2049"
LOCKD_PORT="4045"
SOCKS_PORT="1080"
OPENWINDOWS_PORT="2000"
XWINDOW_PORTS="6000:6063"
SQUID_PORT="3128"

TRACEROUTE_SRC_PORTS="32769:65535"
TRACEROUTE_DEST_PORTS="33434:33523"

USER_CHAINS="EXT-input                        EXT-output \
            tcp-state-flags                   connection-tracking \
            source-address-check              destination-address-check \
            local-dns-server-query            remote-dns-server-response \
            local-tcp-client-request          local-tcp-server-response \
            remote-tcp-client-request         remote-tcp-server-response \
            local-udp-client-request          remote-udp-server-response \
            local-dhcp-client-query           remote-dhcp-server-response \
            EXT-icmp-out                      EXT-icmp-in \
            EXT-log-in                        EXT-log-out \
            log-tcp-state"
########################################################################################

##
##
##  Enabling Kernel-Monitoring Support
##
##

# Enable broadcast echo protection
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
# icmp_echo_ignore_broadcast  - instructs kernel to drop ICMP echo-request messages directed
#                               to broadcast or multicast addresses
# icmp_echo_ignore_all        - drops any incoming echo-request messages (not good for ping and DHCP)
#
# >> see man icmp for more


# Disable Source Routed Packets - rarely used legitimately, commonly dropped by firewalls
for f in /proc/sys/net/ipv4/conf/*/accept_source_route; do
  echo 0 > $f
done

# Enable TCP SYN Cookie Protection
## echo 1 > /proc/sys/net/ipv4/tcp_syncookies ####################################DOES NOT EXIST!!!!!!!!!!!!!!!!!!!

# Disable ICMP Redirect Acceptance
for f in /proc/sys/net/ipv4/conf/*/accept_redirects; do
  echo 0 > $f
done

# Don't send Redirect Messages
for f in /proc/sys/net/ipv4/conf/*/send_redirects; do 
  echo 0 > $f
done

# Drop Spoofed Packets coming in on an interface, which if replied to would result in the reply going out a different interface
for f in /proc/sys/net/ipv4/conf/*/rp_filter; do
  echo 1 > $f
done

# Log packets with impossible addresses
for f in /proc/sys/net/ipv4/conf/*/log_martians; do
  echo 1 > $f
done

########################################################################################

##
##
##  Remove existing rules from all chains
##
##

# Remove existing rules from all chains
iptables --flush
iptables -t nat --flush
iptables -t mangle --flush

##
##
##  Enabled loopback traffic for local network-based services
##
##

# unlimited trafic on loopback interface
iptables -A INPUT  -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

##
##
##  Defining the Default Policy
##
##

# Set default policy to drop
iptables --policy INPUT   DROP
iptables --policy OUTPUT  DROP
iptables --policy FORWARD DROP        #for systems with more than one network interface - precaution for the future.

# precaution for the future
iptables -t nat --policy PREROUTING   DROP
iptables -t nat --policy OUTPUT       DROP
iptables -t nat --policy POSTROUTING  DROP

iptables -t mangle --policy PREROUTING  DROP
iptables -t mangle --policy OUTPUT      DROP

# remove any pre-existing user-defined chains
iptables --delete-chain
iptables -t nat     --delete-chain
iptables -t mangle  --delete-chain

# Create the user-defined chains
for i in $USER_CHAINS; do
  iptables -N $i
done

########################################################################################

##
##  DNS Traffic
##

# match on queries from the local cache and forward name server, and responses from the remote DNS server
iptables -A EXT-output -p udp --sport 53 --dport 53 -j local-dns-server-query
iptables -A EXT-input  -p udp --sport 53 --dport 53 -j remote-dns-server-response

# match on standard DNS client lookup requests over TCP, when the server's response is too large to fit UDP
iptables -A EXT-output -p tcp         --sport $UNPRIVPORTS --dport 53 -j local-dns-server-query
iptables -A EXT-input  -p tcp ! --syn --sport 53 --dport $UNPRIVPORTS -j remote-dns-server-response

########################################################################################
# DNS Forwarding Name Server or client requests
if [ "$CONNECTION_TRACKING" = "1" ]; then
  iptables -A local-dns-server-query -d $NAMESERVER_1 -m state --state NEW -j ACCEPT
  iptables -A local-dns-server-query -d $NAMESERVER_2 -m state --state NEW -j ACCEPT
fi

iptables -A local-dns-server-query -d $NAMESERVER_1 -j ACCEPT
iptables -A local-dns-server-query -d $NAMESERVER_2 -j ACCEPT

# DNS server responses to local requests
iptables -A remote-dns-server-response -s $NAMESERVER_1 -j ACCEPT
iptables -A remote-dns-server-response -s $NAMESERVER_2 -j ACCEPT

########################################################################################
##
##  Local Client Traffic over TCP
##                                pg 197

iptables -A EXT-output -p tcp         --sport $UNPRIVPORTS -j local-tcp-client-request
iptables -A EXT-input  -p tcp ! --syn --dport $UNPRIVPORTS -j remote-tcp-server-response

########################################################################################
# local TCP client output and remote server input chains

# SSH client
#if [ "$CONNECTION_TRACKING" = "1" ]; then
#  iptables -A local-tcp-client-request -p tcp -d $SSH_CLIENT --dport 22 -m state --state NEW -j ACCEPT
#fi
#iptables -A local-tcp-client-request -p tcp -d $SSH_CLIENT --dport 22 -j ACCEPT
#iptables -A remote-tcp-server-response -p tcp ! --syn -s $SSH_CLIENT --sport 22 -j ACCEPT

#.......................................................................................
# Client rules for HTTP, HTTPS, AUTH and FTP control requests
if [ "$CONNECTION_TRACKING" = "1" ]; then
  iptables -A local-tcp-client-request  -p tcp -m multiport --destination-port 80,443,113,21 --syn -m state --state NEW -j ACCEPT 
fi

iptables -A local-tcp-client-request    -p tcp -m multiport --destination-port 80,443,113,21         -j ACCEPT

iptables -A remote-tcp-server-response  -p tcp -m multiport --source-port 80,443,113,21      ! --syn -j ACCEPT

#.......................................................................................
# POP client
if [ "$CONNECTION_TRACKING" = "1" ]; then
  iptables -A local-tcp-client-request -p tcp -d $POP_SERVER --dport 110 -m state --state NEW -j ACCEPT
fi

iptables -A local-tcp-client-request    -p tcp          -d $POP_SERVER --dport 110 -j ACCEPT

iptables -A remote-tcp-server-response  -p tcp ! --syn  -s $POP_SERVER --sport 110 -j ACCEPT

#.......................................................................................
# SMTP mail client
if [ "$CONNECTION_TRACKING" = "1" ]; then
  iptables -A local-tcp-client-request -p tcp -d $MAIL_SERVER --dport 25 -m state --state NEW -j ACCEPT
fi

iptables -A local-tcp-client-request    -p tcp          -d $MAIL_SERVER --dport 25 -j ACCEPT

iptables -A remote-tcp-server-response  -p tcp ! --syn  -s $MAIL_SERVER --sport 25 -j ACCEPT

#.......................................................................................
# Usenet news client
#if [ "$CONNECTION_TRACKING" = "1" ]; then
#  iptables -A local-tcp-client-request -p tcp -d $NEWS_SERVER --dport 119 -m state --state NEW -j ACCEPT
#fi
#iptables -A local-tcp-client-request    -p tcp         -d $NEWS_SERVER --dport 119 -j ACCEPT
#iptables -A remote-tcp-server-response  -p tcp ! --syn -s $NEWS_SERVER --sport 119 -j ACCEPT

#.......................................................................................
# FTP client - passive mode data chanel connection
if [ "$CONNECTION_TRACKING" = "1" ]; then
  iptables -A local-tcp-client-request -p tcp --dport $UNPRIVPORTS -m state --state NEW -j ACCEPT
fi

iptables -A local-tcp-client-request   -p tcp          --dport $UNPRIVPORTS -j ACCEPT

iptables -A remote-tcp-server-response -p tcp ! --syn  --sport $UNPRIVPORTS -j ACCEPT

########################################################################################
##
##  local server traffic over TCP
##

# standard local server traffic to remote clients over TCP
iptables -A EXT-input  -p tcp         --sport $UNPRIVPORTS -j remote-tcp-client-request
iptables -A EXT-output -p tcp ! --syn --dport $UNPRIVPORTS -j local-tcp-server-response

# Kludge for incoming FTP data channel connections 
# from remote servers using port mode.                              FTP PORT MODE
# The state module treats thius connection as RELATED 
# if the ip_conntrack_ftp module is loaded
iptables -A EXT-input  -p tcp         --sport 20 --dport $UNPRIVPORTS -j ACCEPT
iptables -A EXT-output -p tcp ! --syn --sport $UNPRIVPORTS --dport 20 -j ACCEPT

########################################################################################
# Remote TCP client input and local server output chains

# SSH server
#if [ "$CONNECTION_TRACKING" = "1" ]; then
#  iptables -A remote-tcp-client-request -p tcp -s $SSH_CLIENT --destination-port 22 -m state --state NEW -j ACCEPT
#fi
#iptables -A remote-tcp-client-request -p tcp          -s $SSH_CLIENT --destination-port 22  -j ACCEPT
#iptables -A local-tcp-server-response -p tcp ! --syn  --source-port 22 -d $SSH_CLIENT       -j ACCEPT

#.......................................................................................
# AUTH ident server
if [ "$ACCEPT_AUTH" = "0" ]; then
  iptables -A remote-tcp-client-request -p tcp --syn --destination-port 113 -j REJECT --reject-with tcp-reset
else
  iptables -A remote-tcp-client-request -p tcp       --destination-port 113 -j ACCEPT
  
  iptalbes -A local-tcp-server-response -p tcp ! --syn --source-port 113    -j ACCEPT
fi

########################################################################################
##
##  local client traffic over UDP
##

# Local UDP cleint, remote server
iptables -A EXT-output -p udp --sport $UNPRIVPORTS -j local-udp-client-request
iptables -A EXT-input  -p udp --dport $UNPRIVPORTS -j remote-udp-server-response

####### PAGE 201 - Spoofing rules eg for when NOT using state module ############################################

########################################################################################
# NTP time client
#if [ "$CONNECTION_TRACKING" = "1" ]; then
#  iptables -A local-udp-client-request -p udp -d $TIME_SERVER --dport 123 -m state --state NEW -j ACCEPT
#fi
#iptables -A local-udp-client-request    -p udp -d $TIME_SERVER --dport 123 -j ACCEPT
#iptables -A remote-udp-server-response  -p udp -s $TiME_SERVER --sport 123 -j ACCEPT

########################################################################################
# ICMP
iptables -A EXT-input  -p icmp -j EXT-icmp-in
iptables -A EXT-output -p icmp -j EXT-icmp-out

#######################################################################################
# EXT-icmp-in and EXT-icmp-out

# Log and drop initial ICMP fragments
iptables -A EXT-icmp-in  --fragment -j LOG --log-prefix "Fragmented incoming ICMP: "
iptables -A EXT-icmp-in  --fragment -j DROP
iptables -A EXT-icmp-out --fragment -j LOG --log-prefix "Fragmented outgoing ICMP: "
iptables -A EXT-icmp-out --fragment -j DROP

# Outgoing ping
if [ "$CONNECTION_TRACKING" = "1" ]; then
  iptables -A EXT-icmp-out -p icmp --icmp-type echo-request -m state --state NEW -j ACCEPT
fi

iptables -A EXT-icmp-out -p icmp --icmp-type echo-request -j ACCEPT

iptables -A EXT-icmp-in  -p icmp --icmp-type echo-reply   -j ACCEPT

# Incoming ping
if [ "$CONNECTION_TRACKING" = "1" ]; then
  iptables -A EXT-icmp-in -p icmp -s $MY_ISP --icmp-type echo-request -m state --state NEW -j ACCEPT
fi

iptables -A EXT-icmp-in  -p icmp --icmp-type echo-request -s $MY_ISP -j ACCEPT

iptables -A EXT-icmp-out -p icmp --icmp-type echo-reply   -d $MY_ISP -j ACCEPT

# Destination unreachable type 3
iptables -A EXT-icmp-out -p icmp --icmp-type fragmentation-needed    -j ACCEPT
iptables -A EXT-icmp-in  -p icmp --icmp-type destination-unreachable -j ACCEPT

# Parameter problem
iptables -A EXT-icmp-out -p icmp --icmp-type parameter-problem -j ACCEPT
iptables -A EXT-icmp-in  -p icmp --icmp-type parameter-problem -j ACCEPT

# Time Exceeded
iptables -A EXT-icmp-in  -p icmp --icmp-type time-exceeded -j ACCEPT

# Source Quench
iptables -A EXT-icmp-out -p icmp --icmp-type source-quench -j ACCEPT
iptables -A EXT-icmp-in  -p icmp --icmp-type source-quench -j ACCEPT

########################################################################################
# TCP-state-flags
iptables -A tcp-state-flags -p tcp --tcp-flags ALL NONE        -j log-tcp-state       # all bits in the stateflag are cleared
iptables -A tcp-state-flags -p tcp --tcp-flags SYN,FIN SYN,FIN -j log-tcp-state       # SYN and FIN are both set
iptables -A tcp-state-flags -p tcp --tcp-flags SYN,RST SYN,RST -j log-tcp-state       # SYN and RST are both set
iptables -A tcp-state-flags -p tcp --tcp-flags FIN,RST FIN,RST -j log-tcp-state       # FIN and RST are both set
iptables -A tcp-state-flags -p tcp --tcp-flags ACK,FIN FIN     -j log-tcp-state       # FIN is set, but ACK is not
                                                                                      # implicitly includes xmastree packets
iptables -A tcp-state-flags -p tcp --tcp-flags ACK,PSH PSH     -j log-tcp-state       # PSH is set, but ACK is not
iptables -A tcp-state-flags -p tcp --tcp-flags ACK,URG URG     -j log-tcp-state       # URG is set, but ACK is not

########################################################################################
# log-tcp-state
iptables -A log-tcp-state -p tcp -j LOG --log-prefix "Illegal TCP state: " --log-ip-options --log-tcp-options
iptables -A log-tcp-state -j DROP

########################################################################################
# Bypass rule checking for ESTABLISHED exchanges

if [ "$CONNECTION_TRACKING" = "1" ]; then
  # By-pass the firewall filters for established exchanges
  iptables -A connection-tracking -m state --state ESTABLISHED,RELATED -j ACCEPT
  iptables -A connection-tracking -m state --state INVALID             -j LOG --log-prefix "Invalid packet: "
  iptables -A connection-tracking -m state --state INVALID             -j DROP
fi

########################################################################################
# DHCP traffic

# local_dhcp_client_query and remote_dhcp_server_response
# Some broadcast packets are explicitly ignored by the firewall.
# Others are dropped by the default policy.
# DHCP tests must precede broadcast-related rules, as DHCP relies
# on broadcast traffic initially

if [ "$DHCP_CLIENT" = "1" ]; then
  DHCP_SERVER=""
  
  # Initialization or rebinding: No lease or lease time expired
  iptables -A local-dhcp-client-query -s $BROADCAST_SRC -d $BROADCAST_DEST -j ACCEPT
  
  # Incoming DHCPOFFER from availables DHCP servers
  iptables -A remote-dhcp-server-response -s $BROADCAST_SRC -d $BROADCAST_DEST -j ACCEPT

  # Fall back to initialization
  # The client knows its server, but has either lost its lease,
  # or else needs to reconfirm the IP address after rebooting
  iptables -A local-dhcp-client-query     -s $BROADCAST_SRC -d $DHCP_SERVER     -j ACCEPT
  iptables -A remote-dhcp-server-response -s $DHCP_SERVER   -d $BROADCAST_DEST  -j ACCEPT

  # As a result of the above, we are suposed to change our IP 
  # address with this message, which is addressed to our new 
  # address before the dhcp client has received the update.
  # Depending on the server implementation, the destination 
  # address can be the new IP address, the subnet address, 
  # or the limited broadcast address
  
  # If the network subnet address is used as the destination, 
  # the next rule must allow incoming packets destined to the 
  # subnet address, and the rule must precede any general roles 
  # that block such incomming broadcast packets
  iptables -A remote-dhcp-server-response -s $DHCP_SERVER -j ACCEPT
  
  # lease renewal
  iptables -A local-dhcp-client-query -s $IPADDR -d $DHCP_SERVER -j ACCEPT
fi

########################################################################################
# Source Address Spoofing Checks

# Drop packets pretending to be originating from the recieving interface
iptables -A source-address-check -s $IPADDR               -j DROP

#refuse packets claiming to be from private networks
iptables -A source-address-check -s $CLASS_A              -j DROP
iptables -A source-address-check -s $CLASS_B              -j DROP  
iptables -A source-address-check -s $CLASS_C              -j DROP
iptables -A source-address-check -s $CLASS_D_MULTICAST    -j DROP
iptables -A source-address-check -s $CLASS_E_RESERVED_NET -j DROP
iptables -A source-address-check -s $LOOPBACK             -j DROP

iptables -A source-address-check -s 0.0.0.0/8             -j DROP
iptables -A source-address-check -s 169.254.0.0/16        -j DROP
iptables -A source-address-check -s 192.0.2.0/24          -j DROP

########################################################################################
# Bad Destination Address and Port Checks

# Block directed broadcast from the internet
iptables -A destination-address-check           -d $BROADCAST_DEST    -j DROP
iptables -A destination-address-check           -d $SUBNET_BASE       -j DROP
iptables -A destination-address-check           -d $SUBNET_BROADCAST  -j DROP
iptables -A destination-address-check -p ! udp  -d $CLASS_D_MULTICAST -j DROP

# Avoid ports subject to protocol and system administration problems

# TCP unpriviledged ports
# Deny connection request to NFS, SOCKS and X Window ports
iptables -A destination-address-check -p tcp -m multiport --destination-port $NFS_PORT,$OPENWINDOWS_PORT,$SOCKS_PORT,$SQUID_PORT --syn -j DROP

iptables -A destination-address-check -tcp --syn --destination-port $XWINDOW_PORTS -j DROP

# UDP unpiviledged ports
# Deny connection requests to NFS and lockd pors
iptables -A destination-address-check -p udp -m multiport --destination_port $NFS_PORT,$LOCKD_PORT -j DROP

########################################################################################
# Logging Dropped Packets
# ICMP rules
iptables -A EXT-log-in -p icmp --icmp-type ! echo-request -m limit -j LOG

# TCP rules
iptables -A EXT-log-in -p tcp --dport 0:19 -j LOG

# skip ft, telnet, ssh
iptables -A EXT-log-in -p tcp --dport 24 -j LOG

# skip smtp
iptables -A EXT-log-in -p tcp --dport 26:78 -j LOG

# skip finger, www
iptables -A EXT-log-in -p tcp --dport 81:109 -j LOG

# skip pop-3, sunrpc
iptables -A EXT-log-in -p tcp --dport 112:136 -j LOG

#skip NetBIOS
iptables -A EXT-log-in -p tcp --dport 140:142 -j LOG

#skip imap
iptables -A EXT-log-in -p tcp --dport 144:442 -j LOG

# skip secure_web/SSL
iptables -A EXT-log-in -p tcp --dport 444:65535 -j LOG

# UDP rules
iptables -A EXT-log-in -p udp --dport 0:110 -j LOG

#skip sunrpc
iptables -A EXT-log-in -p udp --dport 112:160 -j LOG

#skip snmp
iptables -A EXT-log-in -p udp --dport 163:634 -j LOG

#skip NFS mountd
iptables -A EXT-log-in -p udp --dport 636:5631 -j LOG

#skip pcAnywhere
iptables -A EXT-log-in -p udp --dport 5633:31336 -j LOG

#skip traceroute's default ports
iptables -A EXT-log-in -p udp --sport $TRACEROUTE_SRC --dport $TRACEROUTE_DEST -j LOG

#skip the rest
iptables -A EXT-log-in -p udp --dport 33434:65535 -j LOG

# Outgoing packets
# Don't log rejected outgoing ICMP destination-unreachable packets
iptables -A EXT-log-out -p icmp --icmp-type destination-unreachable -j DROP

iptables -A EXT-log-out -j LOG

########################################################################################
# Install the User-defined chains on the built-in INPUT and OUTPUT chains

# if TCP: check for common stealth scan TCP state patterns
iptables -A INPUT  -p tcp -j tcp-state-flags
iptables -A OUTPUT -p tcp -j tcp-state-flags

# if state module enabled, bypass the firewall, if the packet 
# is part of an ongoing, previously accepted exchange
if [ "$CONNECTION_TRACKING" = "1" ]; then
  #By-pass the firewal filters for established exchanges
  iptables -A INPUT  -j connection-tracking
  iptables -A OUTPUT -j connection-tracking
fi

# if system is a DHCP client a provision must be made for initialisation messages
if [ "$DHCP_CLIENT" = "1" ]; then
  iptables -A INPUT  -i $INTERNET -p udp --sport 67 --dport 68 -j remote-dhcp-server-response
  iptables -A OUTPUT -i $INTERNET -p udp --sport 68 --dport 67 -j local-dhcp-client-query 
fi

# Test for illegal source and destination addresses in incoming packets
iptables -A INPUT  -p ! tcp     -j source-address-check
iptables -A INPUT  -p tcp --syn -j source-address-check
iptables -A INPUT               -j destination-address-check

# Test for illegal destination addresses in outgoing packets
iptables -A OUTPUT              -j destination-address-check

# Begin standard firewall tests for packets addressed to this host
iptables -A INPUT  -i $INTERNET -d $IPADDR -j EXT-input

# Multicast traffic
iptables -A INPUT  -i $INTERNET -p udp            -d $CLASS_D_MULTICAST -j DROP     ##or ACCEPT
iptables -A OUTPUT -o $INTERNET -p udp -s $IPADDR -d $CLASS_D_MULTICAST -j DROP     ##or ACCEPT

# Begin standard firewall tests for packets sent from this host
# Source address spoofing by this host is not allowed due to the test on source address in this rule
iptables -A OUTPUT -o $INTERNET -s $IPADDR -j EXT-output

# All remaining packets are dropped

# Log anything of interest that fell through before the default policy drops the packet
iptables -A INPUT  -j EXT-log-in
iptables -A OUTPUT -j EXT-log-out


exit 0

--Boundary-00=_31bFAATzajqRTPY--


