From: "Hard__warE" <hard__ware@hotmail.com>
Subject: Multi External IP SNAT / DNAT works now .. YAY
Date: Mon, 10 Jun 2002 08:31:14 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <000501c21005$5d4fffc0$7b0010ac@dynamicaccess.lan>
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

for anyone thats having troubles with DNAT / SNAT in general have a look at
my

script.. This scipt allso allows you to have multiple External IP's, and
allows you

to DANT them directlly back to internal machines, while that machine when
SNAT'ed

gets its own IP Public Address ... woohooo


#!/bin/sh
#
# rc.firewall Mid-Strong Based Firewall ..BNI..

#         A stronger IPTABLES firewall with IP Masquerade
#         & SNAT support for 2.4.x kernels.

echo -e "\nLoading STRONGER rc.firewall -..\n"

########  Version 3.1 ##########
#############################################################
#Setting the EXTERNAL and INTERNAL interfaces for the network
#
#  Each IP Masquerade network needs to have at least one
#  external and one internal network.  The external network
#  is where the natting will occur and the internal network
#  should preferably be addressed with a RFC1918 private address
#  scheme.
#
#  For this example, "ppp0" is external and "eth0" is internal"
#
#  NOTE:  If this doesnt EXACTLY fit your configuration, you must
#         change the EXTIF or INTIF variables above. For example:
#
#               EXTIF="eth1"
#
#            if you are a ADSL user.
##############
EXTIF="eth1"
INTIF="eth0"
echo "  External Interface:  $EXTIF"
echo "  Internal Interface:  $INTIF"
echo "  ---"

#############
# Specify your Static IP address here or let the script take care of it
# for you.
#
#  If you prefer to use STATIC addresses in your firewalls, un-# out the
#   static example below and # out the dynamic line.  If you don't care,
#   just leave this section alone.
#
#   If you have a DYNAMIC IP address, the ruleset already takes care of
#   this for you.  Please note that the different single and double quote
#   characters and the script MATTER.
#
#   PPP users:
#   ----------
#   If you aren't already aware, the /etc/ppp/ip-up.local script is always
run when
#   a PPP connection comes up.  Because of this, we can make the ruleset go
and
#   get the new PPP IP address and update the strong firewall ruleset.
#
#   Create /etc/ppp/ip-up.local if the file does not exist, then edit the
file
#   and add "exec /etc/rc.firewall >/dev/null" at the end of the file.
#
# Determine the external IP automatically:
# ----------------------------------------
################################################

#EXTIP="`/sbin/ifconfig $EXTIF | grep 'inet addr' | awk '{print $2}' |
sed -e 's/.*://'`"

################################################
# For users who with to use STATIC IP addresses:
#
#  # out the EXTERN line above and un-# out the EXTIP line below
#

EXTIP="192.168.0.253"
EXTIP2="192.168.0.212"
echo "  External IP: $EXTIP"
echo "  ---"

# Assign the internal TCP/IP network and IP address
INTNET="172.16.0.0/12"
INTIP="172.16.0.253/32"
echo "  Internal Network: $INTNET"
echo "  Internal IP:      $INTIP"
echo "  ---"


# The location of various iptables and other shell programs
#
#   If your Linux distribution came with a copy of iptables, most
#   likely it is located in /sbin.  If you manually compiled
#   iptables, the default location is in /usr/local/sbin
#
# ** Please use the "whereis iptables" command to figure out
# ** where your copy is and change the path below to reflect
# ** your setup
#
IPTABLES=/sbin/iptables
#IPTABLES=/usr/local/sbin/iptables
#
LSMOD=/sbin/lsmod
GREP=/bin/grep
AWK=/bin/awk

# Setting a few special variables
#
UNIVERSE="0.0.0.0/0"
IRCPORTS="6665,6666,6667,6668,6669,7000"

#======================================================================
#== No editing beyond this line is required for initial MASQ testing ==

# Need to verify that all modules have all required dependencies
#
echo "  - Verifying that all kernel modules are ok"
/sbin/depmod -a

echo -en "    Loading kernel modules: "

# With the new IPTABLES code, the core MASQ functionality is now either
# modular or compiled into the kernel.  This HOWTO shows ALL IPTABLES
# options as MODULES.  If your kernel is compiled correctly, there is
# NO need to load the kernel modules manually.
#
#  NOTE: The following items are listed ONLY for informational reasons.
#        There is no reason to manual load these modules unless your
#        kernel is either mis-configured or you intentionally disabled
#        the kernel module autoloader.
#

# Upon the commands of starting up IP Masq on the server, the
# following kernel modules will be automatically loaded:
#
# NOTE:  Only load the IP MASQ modules you need.  All current IP MASQ
#        modules are shown below but are commented out from loading.
# ===============================================================

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


#Load the IPTABLES filtering module - "iptable_filter"
#
#  - Loaded automatically when filter policies are activated


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
######### Ip Tables Filter

echo -e "  ipt_multiport"
if [ -z "` $LSMOD | $GREP ipt_multiport | $AWK {'print $1'} `" ]; then
   /sbin/insmod ipt_multiport
fi

echo "  ---"

# Just to be complete, here is a list of the remaining kernel modules
# and their function.  Please note that several modules should be only
# loaded by the correct master kernel module for proper operation.
# --------------------------------------------------------------------
#
#    ipt_mark       - this target marks a given packet for future action.
#                     This automatically loads the ipt_MARK module
#
#    ipt_tcpmss     - this target allows to manipulate the TCP MSS
#                     option for braindead remote firewalls.
#                     This automatically loads the ipt_TCPMSS module
#
#    ipt_limit      - this target allows for packets to be limited to
#                     to many hits per sec/min/hr
#
#    ipt_multiport  - this match allows for targets within a range
#                     of port numbers vs. listing each port individually
#
#    ipt_state      - this match allows to catch packets with various
#                     IP and TCP flags set/unset
#
#    ipt_unclean    - this match allows to catch packets that have invalid
#                     IP/TCP flags set
#
#    iptable_filter - this module allows for packets to be DROPped,
#                     REJECTed, or LOGged.  This module automatically
#                     loads the following modules:
#
#                     ipt_LOG - this target allows for packets to be
#                               logged
#
#                     ipt_REJECT - this target DROPs the packet and returns
#                                  a configurable ICMP packet back to the
#                                  sender.
#
#    iptable_mangle - this target allows for packets to be manipulated
#                     for things like the TCPMSS option, etc.


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
#
#   If you get your IP address dynamically from SLIP, PPP, or DHCP,
#   enable this following option.  This enables dynamic-address hacking
#   which makes the life with Diald and similar programs much easier.
#
echo "  Enabling DynamicAddr.."
#echo "1" > /proc/sys/net/ipv4/ip_dynaddr

echo "  ---"

############################################################################
#
#  NOTE:  In IPTABLES speak, IP Masquerading is a form of SourceNAT or SNAT.
#
#  NOTE #2:  The following is an example for an internal LAN address in the
#            192.168.0.x network with a 255.255.255.0 or a "24" bit subnet
#            mask connecting to the Internet on external interface "ppp0".
#            This example will MASQ internal traffic out to the Internet
#            not not allow non-initiated traffic into your internal network.

#Clearing any previous configuration
#
#  Unless specified, the defaults for INPUT, OUTPUT, and FORWARD to DROP.
#
#    You CANNOT change this to REJECT as it isn't a vaild setting for a
#    policy.  If you want REJECT, you must explictly REJECT at the end
#    of a giving INPUT, OUTPUT, or FORWARD chain
#
echo "  Clearing any existing rules and setting default policy to DROP.."

$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT DROP
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -F -t nat
$IPTABLES -F SMB

#Not needed and it will only load the unneeded kernel module
#$IPTABLES -F -t mangle
#
# Flush the user chain.. if it exists
if [ -n "`$IPTABLES -L | $GREP drop-and-log-it`" ]; then
   $IPTABLES -F drop-and-log-it
fi
#
# Delete all User-specified chains
$IPTABLES -X
#
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

$IPTABLES -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
REDIRECT --to-port 3128

### Internal Web Server DNAT
$IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --dport 8888 -j DNAT --to
172.16.0.111:80

echo -e "\n   - Loading INPUT rulesets"

$IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --dport 8860 -j DNAT --to
172.16.0.111:443
$IPTABLES -t nat -A PREROUTING -i $EXTIF -p udp --dport 8860 -j DNAT --to
172.16.0.111:443

$IPTABLES -t nat -A PREROUTING -i $EXTIF -d $EXTIP2 -p tcp --dport
0:65535 -j DNAT --to 172.16.0.55
$IPTABLES -t nat -A PREROUTING -i $EXTIF -d $EXTIP2 -p udp --dport
0:65535 -j DNAT --to 172.16.0.55


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

$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP2 -j ACCEPT

## Allow any related traffic coming back to the MASQ serer in
#
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state \
ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP2 -m state --state \
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

## outgoing to local net on remote interface, stuffed routing, deny
#
$IPTABLES -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j drop-and-log-it

## anything else outgoing on remote interface is valid
#
$IPTABLES -A OUTPUT -o $EXTIF -s $EXTIP -d $UNIVERSE -j ACCEPT

$IPTABLES -A OUTPUT -o $EXTIF -s $EXTIP2 -d $UNIVERSE -j ACCEPT

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
$IPTABLES -A FORWARD -p tcp -i $EXTIF -s $EXTIP2 -d 172.16.0.55 --dport
0:65535 -j ACCEPT
$IPTABLES -A FORWARD -p udp -i $EXTIF -s $EXTIP2 -d 172.16.0.55 --dport
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

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -d 172.16.0.55 -m state --state
ESTABLISHED,RELATED \
-j ACCEPT
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
ESTABLISHED,RELATED \
-j ACCEPT

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
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -s 172.16.0.55 -j SNAT --to
$EXTIP2
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP

#######################################################################
echo -e "\nDone.\n"

echo -e "\neXecuting Packet Shaping Dont Forget To Edit /etc/rc.wshaper.\n"
/etc/rc.wshaper



