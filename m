From: "Hard__warE" <hard__ware@hotmail.com>
Subject: help!! whole in firewall --
Date: Mon, 10 Jun 2002 19:38:36 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <001701c21062$985f0a40$7b0010ac@dynamicaccess.lan>
Reply-To: "Hard__warE" <hard__ware@hotmail.com>
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
Cc: BGrummel@zuendel.de

try this Script out ..... it works great

just modify Address / Ports to suit .... : D





---------------------------------------Start Copy Below this
Line -----------------------------------------
#!/bin/sh
#
# rc.firewall Mid-Strong Based Firewall ..BNI..

########  Revision 5.1 ########## Low Comments ##############
#############################################################
EXTIF="eth1"
INTIF="eth0"
echo "  External Interface:  $EXTIF"
echo "  Internal Interface:  $INTIF"
echo "  ---"

# Determine the external IP automatically:
# ----------------------------------------

#EXTIP="`/sbin/ifconfig $EXTIF | grep 'inet addr' | awk '{print $2}' |
sed -e 's/.*://'`"

############### For STATIC IP addresses: #############

EXTIP="192.168.0.253"

########## New Multiple External IP Access #########
#EXTIP2="192.168.0.212"

echo "  External IP: $EXTIP"
echo "  ---"

# Assign the internal TCP/IP network and IP address
INTNET="172.16.0.0/16"
INTIP="172.16.0.253/32"
echo "  Internal Network: $INTNET"
echo "  Internal IP:      $INTIP"
echo "  ---"

# The location of various iptables and other shell programs
#
IPTABLES=/sbin/iptables
#IPTABLES=/usr/local/sbin/iptables
LSMOD=/sbin/lsmod
GREP=/bin/grep
AWK=/bin/awk

# Setting a few special variables
#
UNIVERSE="0.0.0.0/0"
IRCPORTS="6665,6666,6667,6668,6669,7000"


############# Kernel Modules Section #############

echo "  - Verifying that all kernel modules are ok"
/sbin/depmod -a

echo -en "    Loading kernel modules: "

#Load the main body of the IPTABLES module - "iptable"
#  - Loaded automatically when the "iptables" command is invoked
#
#  - Loaded manually to clean up kernel auto-loading timing issues
#
echo -en "ip_tables, "
#
#Verify the module isn't loaded.  If it is, skip it
#
if [ -z "` $LSMOD | $GREP ip_tables | $AWK {'print $1'} `" ]; then
   /sbin/insmod ip_tables
fi

#Load the stateful connection tracking framework - "ip_conntrack"
#
# The conntrack  module in itself does nothing without other specific
# conntrack modules being loaded afterwards such as the "ip_conntrack_ftp"
# module
#
#  - This module is loaded automatically when MASQ functionality is
#    enabled
#
#  - Loaded manually to clean up kernel auto-loading timing issues
#
echo -en "ip_conntrack, "
#
#Verify the module isn't loaded.  If it is, skip it
#
if [ -z "` $LSMOD | $GREP ip_conntrack | $AWK {'print $1'} `" ]; then
   /sbin/insmod ip_conntrack
fi


#Load the FTP tracking mechanism for full FTP tracking
#
# Enabled by default -- insert a "#" on the next line to deactivate
#
echo -e "ip_conntrack_ftp, "
#
#Verify the module isn't loaded.  If it is, skip it
#
if [ -z "` $LSMOD | $GREP ip_conntrack_ftp | $AWK {'print $1'} `" ]; then
   /sbin/insmod ip_conntrack_ftp
fi


#Load the IRC tracking mechanism for full IRC tracking
#
# Enabled by default -- insert a "#" on the next line to deactivate
#
echo -en "                             ip_conntrack_irc, "
#
#Verify the module isn't loaded.  If it is, skip it
#
if [ -z "` $LSMOD | $GREP ip_conntrack_irc | $AWK {'print $1'} `" ]; then
   /sbin/insmod ip_conntrack_irc ports=$IRCPORTS
fi
if [ -z "` $LSMOD | $GREP ip_nat_irc | $AWK {'print $1'} `" ]; then
   /sbin/insmod ip_nat_irc
fi

#Load the general IPTABLES NAT code - "iptable_nat"
#  - Loaded automatically when MASQ functionality is turned on
#
#  - Loaded manually to clean up kernel auto-loading timing issues
#
echo -en "iptable_nat, "
#
#Verify the module isn't loaded.  If it is, skip it
#
if [ -z "` $LSMOD | $GREP iptable_nat | $AWK {'print $1'} `" ]; then
   /sbin/insmod iptable_nat
fi

#Loads the FTP NAT functionality into the core IPTABLES code
# Required to support non-PASV FTP.
#
# Enabled by default -- insert a "#" on the next line to deactivate
#
echo -en "ip_nat_ftp"
#
#Verify the module isn't loaded.  If it is, skip it
#
if [ -z "` $LSMOD | $GREP ip_nat_ftp | $AWK {'print $1'} `" ]; then
   /sbin/insmod ip_nat_ftp
fi
######### Ip Tables Filter ################
echo -en "                 ip_tables_filter"

if [ -z "` $LSMOD | $GREP iptable_filter | $AWK {'print $1'} `" ]; then
   /sbin/insmod iptable_filter
fi

######### IpT MultiPort  ################

echo -e "  ipt_multiport"
if [ -z "` $LSMOD | $GREP ipt_multiport | $AWK {'print $1'} `" ]; then
   /sbin/insmod ipt_multiport
fi

echo "---"

#CRITICAL:  Enable IP forwarding since it is disabled by default since
#
#           Redhat Users:  you may try changing the options in
#                          /etc/sysconfig/network from:
#
#                       FORWARD_IPV4=false
#                             to
#                       FORWARD_IPV4=true
#
echo "  Enabling forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward

echo "  Enabling Sysctl options."

##### Disable IP Spoof Attack
echo 2 > /proc/sys/net/ipv4/conf/all/rp_filter
##### Stop Smurf Amplifiers
echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
##### Block Source Routing
echo 0 > /proc/sys/net/ipv4/conf/all/accept_source_route
##### Kill Timestamps
echo 0 > /proc/sys/net/ipv4/tcp_timestamps
##### Enable Syn Cookies
echo 1 > /proc/sys/net/ipv4/tcp_syncookies
##### Kill Redirects
echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
##### Enable bad error message protection
echo 1 > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
echo "32768 61000"> /proc/sys/net/ipv4/ip_local_port_range
##### Log Martians (packets with impossible addresses
echo 1 > /proc/sys/net/ipv4/conf/all/log_martians
##### Reduce DoS'ing ability/effect by reducing timeouts
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 2400 > /proc/sys/net/ipv4/tcp_keepalive_time
echo 0 > /proc/sys/net/ipv4/tcp_window_scaling
echo 0 > /proc/sys/net/ipv4/tcp_sack
# Dynamic IP users:
# Uncomment Second Line Below
echo "  Enabling DynamicAddr.."
#echo "1" > /proc/sys/net/ipv4/ip_dynaddr

echo " ---"

echo " Clearing any existing rules and setting default policy to DROP.."

$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT DROP
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -F -t nat
$IPTABLES -F SMB

# Flush the user chain.. if it exists
if [ -n "`$IPTABLES -L | $GREP drop-and-log-it`" ]; then
   $IPTABLES -F drop-and-log-it
fi

# Delete all User-specified chains
$IPTABLES -X

# Reset all IPTABLES counters
$IPTABLES -Z


#Configuring specific CHAINS for later use in the ruleset
#
#  NOTE:  Some users prefer to have their firewall silently
#         "DROP" packets while others prefer to use "REJECT"
#         to send ICMP error messages back to the remote
#         machine.  The default is "REJECT" but feel free to
#         change this below.
#
# NOTE: Without the --log-level set to "info", every single
#       firewall hit will goto ALL vtys.  This is a very big
#       pain.
#

echo "  Creating a DROP chain.."
$IPTABLES -N drop-and-log-it
$IPTABLES -A drop-and-log-it -j LOG --log-level info
$IPTABLES -A drop-and-log-it -j DROP
#
########### Bad ASS Windows/Samba Ports ####################
$IPTABLES -N SMB
$IPTABLES -A SMB -p tcp --dport 135:139 -j REJECT
$IPTABLES -A SMB -p tcp --dport 445 -j REJECT
$IPTABLES -A SMB -p udp --dport 135:139 -j REJECT
$IPTABLES -A SMB -p udp --dport 445 -j REJECT
$IPTABLES -A SMB -p tcp --sport 135:139 -j REJECT
$IPTABLES -A SMB -p tcp --sport 445 -j REJECT
$IPTABLES -A SMB -p udp --sport 135:139 -j REJECT
$IPTABLES -A SMB -p udp --sport 445 -j REJECT

#$IPTABLES -A SMB -p tcp --dport 135:139 -j DROP
#$IPTABLES -A SMB -p tcp --dport 445 -j DROP
#$IPTABLES -A SMB -p udp --dport 135:139 -j DROP
#$IPTABLES -A SMB -p udp --dport 445 -j DROP
#$IPTABLES -A SMB -p tcp --sport 135:139 -j DROP
#$IPTABLES -A SMB -p tcp --sport 445 -j DROP
#$IPTABLES -A SMB -p udp --sport 135:139 -j DROP
#$IPTABLES -A SMB -p udp --sport 445 -j DROP

### Internal Squid Server Redirect ####
$IPTABLES -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
REDIRECT --to-port 3128

### Internal Web Server DNAT ##########
$IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --dport 8888 -j DNAT --to
172.16.0.111:80
$IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --dport 8860 -j DNAT --to
172.16.0.111:443
$IPTABLES -t nat -A PREROUTING -i $EXTIF -p udp --dport 8860 -j DNAT --to
172.16.0.111:443

### NEW Multiple External IP DNAT Done Here, Uncomment and use accordingly
##########
#$IPTABLES -t nat -A PREROUTING -i $EXTIF -d $EXTIP2 -p tcp --dport
0:65535 -j DNAT --to 172.16.0.55
#$IPTABLES -t nat -A PREROUTING -i $EXTIF -d $EXTIP2 -p udp --dport
0:65535 -j DNAT --to 172.16.0.55

echo -e "\n   - Loading INPUT rulesets"
#######################################################################
## INPUT: Incoming traffic from various internfaces.  All rulesets are
#        already flushed and set to a default policy of DROP.

## loopback interfaces are valid.
#
$IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT

## local interface, local machines, going anywhere is valid
#
$IPTABLES -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT

## remote interface, claiming to be local machines, IP spoofing, get lost
#
$IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it

## external interface, from any source, for ICMP traffic is valid
#
#  If you would like your machine to "ping" from the Internet,
#  enable this next line
#
$IPTABLES -A INPUT -i $EXTIF -p ICMP -s $UNIVERSE -d $EXTIP -j ACCEPT

## remote interface, any source, going to permanent PPP address is valid
#
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -j ACCEPT

## NEW Multi EXTIP, Add two lines for each new EXTIP* address below
##########
#$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP2 -j ACCEPT
#$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP2 -m state --state
ESTABLISHED,RELATED -j ACCEPT

## Allow any related traffic coming back to the MASQ serer in
#
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state
ESTABLISHED,RELATED -j ACCEPT

# Catch all rule, all other incoming is denied and logged.
#
$IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it

echo -e "   - Loading OUTPUT rulesets"

#######################################################################
# OUTPUT: Outgoing traffic from various internfaces.  All rulesets are
#         already flushed and set to a default policy of DROP.
#

## loopback interface is valid.
#
$IPTABLES -A OUTPUT -o lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT

## local interface, any source going to local net is valid
#
$IPTABLES -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -j ACCEPT
$IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j ACCEPT

## outgoing to local net on remote interface, stuffed routing, deny
#
$IPTABLES -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j drop-and-log-it

## NEW Multi EXTIP, Add two lines for each new EXTIP* address below
##########
#$IPTABLES -A OUTPUT -o $INTIF -s $EXTIP2 -d $INTNET -j ACCEPT
#$IPTABLES -A OUTPUT -o $EXTIF -s $EXTIP2 -d $UNIVERSE -j ACCEPT

## anything else outgoing on remote interface is valid
#
$IPTABLES -A OUTPUT -o $EXTIF -s $EXTIP -d $UNIVERSE -j ACCEPT

## Catch all rule, all other outgoing is denied and logged.
#
$IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it

echo -e "   - Loading FORWARD rulesets"
#######################################################################
# FORWARD: Enable Forwarding and thus IPMASQ
#
### Allow Port Forwarding on the Ports Specified
$IPTABLES -A FORWARD -p tcp -i $EXTIF -d 172.16.0.111 --dport 80 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -i $EXTIF -d 172.16.0.111 --dport 443 -j ACCEPT
$IPTABLES -A FORWARD -p udp -i $EXTIF -d 172.16.0.111 --dport 443 -j ACCEPT

## NEW Multi EXTIP, Add two lines for each new EXTIP* address below
##########
#$IPTABLES -A FORWARD -p tcp -i $EXTIF -s $EXTIP2 -d 172.16.0.55 --dport
0:65535 -j ACCEPT
#$IPTABLES -A FORWARD -p udp -i $EXTIF -s $EXTIP2 -d 172.16.0.55 --dport
0:65535 -j ACCEPT

$IPTABLES -A FORWARD -i $INTIF -j SMB
$IPTABLES -A FORWARD -o $INTIF -j SMB
$IPTABLES -A FORWARD -i $EXTIF -j SMB
$IPTABLES -A FORWARD -o $EXTIF -j SMB

###
# Specific Defence rules can go here to.
###
#          Flood Protection
$IPTABLES -A FORWARD -i $EXTIF -p tcp --syn -m limit --limit 1/s -j ACCEPT
#          Ports Scanners
$IPTABLES -A FORWARD -i $EXTIF -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m
limit --limit 1/s -j ACCEPT
#          Ping o Death
$IPTABLES -A FORWARD -i $EXTIF -p icmp --icmp-type echo-request -m
limit --limit 1/s -j ACCEPT
echo " -=-=-= DoS Defence is Up -=-=-="
echo "     - FWD: Allow all connections OUT and only existing/related IN"

## NEW Multi EXTIP, Add a lines for each new EXTIP* address below ##########
#$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -d 172.16.0.55 -m state --state
ESTABLISHED,RELATED -j ACCEPT

########## Exisiting Rule (Do Not Delete) #########
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -s $INTNET -j ACCEPT
$IPTABLES -A FORWARD -j drop-and-log-it
$IPTABLES -A FORWARD -j DROP

echo "     - NAT: Enabling SNAT (MASQUERADE) functionality on $EXTIF"
#
## Use this for Dynamic IP connections because it does not keep any of the
old Tracked Conections
###
#$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

#
## Stricter form used mainly on Static IP Connections
########## Uncomment line below to enable SNAT on NEW $EXTIP*
################
#$IPTABLES -t nat -A POSTROUTING -o $EXTIF -s 172.16.0.55 -j SNAT --to
$EXTIP2
########## Existing SNAT Rule, Do Not Delete unless you really know what ya
doing #######
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP

#######################################################################
echo -e "\nDone.\n"

echo -e "\neXecuting Packet Shaping Dont Forget To /etc/rc.wshaper.\n"
/etc/rc.wshaper





