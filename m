From: ddougal@attbi.com
Subject: Port FW works form LAN but no from Internet
Date: Sun, 27 Apr 2003 14:05:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E199mmm-0007tf-00@kashyyyk.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have two nics eth0 is Internet 12.254.x.x, eth1 is LAN(192.168.0.1) in my 
Linux box that I am using for NAT.

I am trying to forward packets coming in from Internet to my NAT box eth0 
(12.254.x.x) port 8080 which will forward to 192.168.0.6:80 web server (Note 
that 192.168.0.6 is VMware machine running Linux 7.3 but I also tried on 
192.168.0.4 which is just a windows machine. Both failed, however I can use 
Lynx form the NAT box and access 12.254.x.x:8080 and get the web server on 
192.168.0.6:80 so it works on NAT box but not from Internet.  

Running Linux RH 7.3 kernel: 2.4.18-27.7.x
iptables-1.2.5-3
iptables-ipv6-1.2.5-3

Here are logs showing connection attempt from Internet to 
http://12.254.x.x:8080/  

Apr 27 05:34:44 x1-6-00-04-5a-5d-4d-d6 kernel: IN=eth0 OUT=eth1 
SRC=198.178.8.81 DST=192.168.0.6 LEN=48 TOS=0x00 PREC=0x00 TTL=115 ID=31134 DF 
PROTO=TCP SPT=10357 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0
Apr 27 05:34:47 x1-6-00-04-5a-5d-4d-d6 kernel: IN=eth0 OUT=eth1 
SRC=198.178.8.81 DST=192.168.0.6 LEN=48 TOS=0x00 PREC=0x00 TTL=115 ID=31137 DF 
PROTO=TCP SPT=10357 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0
Apr 27 05:34:53 x1-6-00-04-5a-5d-4d-d6 kernel: IN=eth0 OUT=eth1 
SRC=198.178.8.81 DST=192.168.0.6 LEN=48 TOS=0x00 PREC=0x00 TTL=115 ID=31141 DF 
PROTO=TCP SPT=10357 DPT=80 WINDOW=64240 RES=0x00 SYN URGP=0

See the very bottom for port forwarding rules

#!/bin/sh
#
# rc.firewall-2.4-stronger
#
FWVER=0.78s

#          An example of a stronger IPTABLES firewall with IP Masquerade 
#          support for 2.4.x kernels.  
#
# Log:
#
#   0.78s - REJECT is not a legal policy yet; back to DROP
#   0.77s - Changed the default block behavior to REJECT not DROP
#   0.76s - Added a comment about the OPTIONAL WWW ruleset and a comment
#           where to put optional PORTFW commands
#   0.75s - Added clarification that PPPoE users need to use
#           "ppp0" instead of "eth0" for their external interface
#   0.74s - Changed the EXTIP command to work on NON-English distros
#   0.73s - Added comments in the output section that DHCPd is optional
#           and changed the default settings to disabled
#   0.72s - Changed the filter from the INTNET to the INTIP to be
#           stateful; moved the command VARs to the top and made the
#           rest of the script to use them
#   0.70s - Added a disabled examples for allowing internal DHCP  
#           and external WWW access to the server
#   0.63s - Added support for the IRC module
#   0.62s - Initial version based upon the basic 2.4.x rc.firewall


echo -e "\nLoading STRONGER rc.firewall - version $FWVER..\n"


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
DEPMOD=/sbin/depmod
INSMOD=/sbin/insmod
GREP=/bin/grep
AWK=/bin/awk
SED=/bin/sed
IFCONFIG=/sbin/ifconfig


#Setting the EXTERNAL and INTERNAL interfaces for the network
#
#  Each IP Masquerade network needs to have at least one
#  external and one internal network.  The external network
#  is where the natting will occur and the internal network
#  should preferably be addressed with a RFC1918 private address
#  scheme.
#
#  For this example, "eth0" is external and "eth1" is internal"
#
#  NOTE:  If this doesnt EXACTLY fit your configuration, you must 
#         change the EXTIF or INTIF variables above. For example: 
#
#            If you are a PPPoE or analog modem user:
#
#               EXTIF="ppp0" 
#
EXTIF="eth0"
INTIF="eth1"
echo "  External Interface:  $EXTIF"
echo "  Internal Interface:  $INTIF"
echo "  ---"

# Determine the external IP automatically:
# ----------------------------------------
#
#  The following line will determine your external IP address.  This
#  line is somewhat complex and confusing but it will also work for
#  all NON-English Linux distributions:
#
EXTIP="`$IFCONFIG $EXTIF | $AWK \
 /$EXTIF/'{next}//{split($0,a,":");split(a[2],a," ");print a[1];exit}'`"


# For users who wish to use STATIC IP addresses:
#
#  # out the EXTIP line above and un-# out the EXTIP line below
#
#EXTIP="your.static.PPP.address"
echo "  External IP: $EXTIP"
echo "  ---"


# Assign the internal TCP/IP network and IP address
INTNET="192.168.0.0/24"
INTIP="192.168.0.1/24"
echo "  Internal Network: $INTNET"
echo "  Internal IP:      $INTIP"
echo "  ---"




# Setting a few other local variables
#
UNIVERSE="0.0.0.0/0"

#======================================================================
#== No editing beyond this line is required for initial MASQ testing ==

# Need to verify that all modules have all required dependencies
#
echo "  - Verifying that all kernel modules are ok"
$DEPMOD -a

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

#Load the main body of the IPTABLES module - "ip_tables"
#  - Loaded automatically when the "iptables" command is invoked
#
#  - Loaded manually to clean up kernel auto-loading timing issues
#
echo -en "ip_tables, "
#
#Verify the module isn't loaded.  If it is, skip it
#
if [ -z "` $LSMOD | $GREP ip_tables | $AWK {'print $1'} `" ]; then
   $INSMOD ip_tables
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
   $INSMOD ip_conntrack
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
   $INSMOD ip_conntrack_ftp
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
   $INSMOD ip_conntrack_irc
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
   $INSMOD iptable_nat
fi


#Loads the FTP NAT functionality into the core IPTABLES code
# Required to support non-PASV FTP.
#
# Enabled by default -- insert a "#" on the next line to deactivate
#
echo -e "ip_nat_ftp"
#
#Verify the module isn't loaded.  If it is, skip it
#
if [ -z "` $LSMOD | $GREP ip_nat_ftp | $AWK {'print $1'} `" ]; then
   $INSMOD ip_nat_ftp
fi

echo "  ---"


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


# Dynamic IP users:
#
#   If you get your IP address dynamically from SLIP, PPP, or DHCP, 
#   enable the following option.  This enables dynamic-address hacking
#   which makes the life with Diald and similar programs much easier.
#
echo "  Enabling DynamicAddr.."
echo "1" > /proc/sys/net/ipv4/ip_dynaddr

echo "  ---"

#############################################################################
#
# Enable Stronger IP forwarding and Masquerading
#
#  NOTE:  In IPTABLES speak, IP Masquerading is a form of SourceNAT or SNAT.
#
#  NOTE #2:  The following is an example for an internal LAN address in the
#            192.168.1.x network with a 255.255.255.0 or a "24" bit subnet 
#            mask connecting to the Internet on external interface "eth0".  
#            This example will MASQ internal traffic out to the Internet 
#            but not allow non-initiated traffic into your internal network.
#
#            
#         ** Please change the above network numbers, subnet mask, and your 
#         *** Internet connection interface name to match your setup
#         

#Clearing any previous configuration
#
#  Unless specified, the defaults for INPUT, OUTPUT, and FORWARD to DROP
#
#    You CANNOT change this to REJECT as it isn't a vaild policy setting.
#    If you want REJECT, you must explictly REJECT at the end of a giving 
#    INPUT, OUTPUT, or FORWARD chain
#
echo "  Clearing any existing rules and setting default policy to REJECT.."
$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT 
$IPTABLES -P OUTPUT DROP
$IPTABLES -F OUTPUT 
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD 
$IPTABLES -F -t nat

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
$IPTABLES -A drop-and-log-it -j REJECT

echo -e "\n   - Loading INPUT rulesets"


#######################################################################
# INPUT: Incoming traffic from various interfaces.  All rulesets are 
#        already flushed and set to a default policy of DROP. 
#

# loopback interfaces are valid.
#
$IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT


# local interface, local machines, going anywhere is valid
#
$IPTABLES -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT


# remote interface, claiming to be local machines, IP spoofing, get lost
#
$IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it


# external interface, from any source, for ICMP traffic is valid
#
#  If you would like your machine to "ping" from the Internet, 
#  enable this next line
#
#$IPTABLES -A INPUT -i $EXTIF -p ICMP -s $UNIVERSE -d $EXTIP -j ACCEPT


# remote interface, any source, going to permanent PPP address is valid
#
#$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -j ACCEPT


# Allow any related traffic coming back to the MASQ server in
#
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state \
 ESTABLISHED,RELATED -j ACCEPT





# ----- Begin OPTIONAL INPUT Section -----
#

# DHCPd - Enable the following lines if you run an INTERNAL DHCPd server
#
#$IPTABLES -A INPUT -i $INTIF -p tcp --sport 68 --dport 67 -j ACCEPT
#$IPTABLES -A INPUT -i $INTIF -p udp --sport 68 --dport 67 -j ACCEPT

# HTTPd - Enable the following lines if you run an EXTERNAL WWW server
#
#    NOTE:  This is NOT needed for simply enabling PORTFW.  This is ONLY 
#           for users that plan on running Apache on the MASQ server itself
#
echo -e "      - Allowing EXTERNAL access to the WWW server"
$IPTABLES -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \
 -p tcp -s $UNIVERSE -d $EXTIP --dport 80 -j ACCEPT


# port FW on port 8080
echo -e "      - Allowing EXTERNAL access to whatever
$IPTABLES -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \
 -p tcp -s $UNIVERSE -d $EXTIP --dport 8080 -j ACCEPT


#
# ----- End OPTIONAL INPUT Section -----

















# Catch all rule, all other incoming is denied and logged. 
#
$IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it


echo -e "   - Loading OUTPUT rulesets"

#######################################################################
# OUTPUT: Outgoing traffic from various interfaces.  All rulesets are 
#         already flushed and set to a default policy of DROP. 
#

# loopback interface is valid.
#
$IPTABLES -A OUTPUT -o lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT


# local interfaces, any source going to local net is valid
#
$IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j ACCEPT


# local interface, any source going to local net is valid
#
$IPTABLES -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -j ACCEPT


# outgoing to local net on remote interface, stuffed routing, deny
#
$IPTABLES -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j drop-and-log-it


# anything else outgoing on remote interface is valid
#
$IPTABLES -A OUTPUT -o $EXTIF -s $EXTIP -d $UNIVERSE -j ACCEPT


# ----- Begin OPTIONAL OUTPUT Section -----
#

# DHCPd - Enable the following lines if you run an INTERNAL DHCPd server
#         - Remove BOTH #s all the #s if you need this functionality.
#
#$IPTABLES -A OUTPUT -o $INTIF -p tcp -s $INTIP --sport 67 \
# -d 255.255.255.255 --dport 68 -j ACCEPT
#$IPTABLES -A OUTPUT -o $INTIF -p udp -s $INTIP --sport 67 \
# -d 255.255.255.255 --dport 68 -j ACCEPT

#
# ----- End OPTIONAL OUTPUT Section -----


# Catch all rule, all other outgoing is denied and logged. 
#
$IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it


echo -e "   - Loading FORWARD rulesets"

#######################################################################
# FORWARD: Enable Forwarding and thus IPMASQ
#
# ----- Begin OPTIONAL FORWARD Section -----
#
# ----- End OPTIONAL FORWARD Section -----


echo "     - FWD: Allow all connections OUT and only existing/related IN"
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED,RELATED \
 -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

# Catch all rule, all other forwarding is denied and logged. 
#
$IPTABLES -A FORWARD -j drop-and-log-it


echo "     - NAT: Enabling SNAT (MASQUERADE) functionality on $EXTIF"
#
#More liberal form
#$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
#
#Stricter form
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP


#iptables ip forwarding
# Linux 2.4
# Append a rule pre-routing (-A PREROUTING) to the NAT table (-t nat) that
# TCP packets (-p tcp) going to 1.2.3.4 (-d 1.2.3.4) port 8080 (--dport 8080)
# have their destination mapped (-j DNAT) to 192.168.1.1, port 80
# (--to 192.168.1.1:80).

# -s source IP 
# -p protocol
# -A Append one or more rules to the end of chain

#test line
#/sbin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
#/sbin/iptables -A FORWARD -d 192.168.0.6 -p tcp --dport 8080 -j ACCEPT
# end test

echo -e "      - Allowing port forwarding"
#/sbin/iptables -A PREROUTING -t nat -p tcp -d 12.254.x.x --dport 8080 \
#-j DNAT --to 192.168.0.6:80

# testing 
echo -e "testing"
#/sbin/iptables -t nat -A PREROUTING -p tcp -s 12.254.x.x -d 192.168.0.6 \
#--dport 8080 -j DNAT --to 192.168.0.6:80

#/sbin/iptables -A FORWARD -i eth1 -p tcp --dport 80 -j ACCEPT
#/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to \
#-destination 192.168.0.6:80

# almost worked logs are now showing 192.168.0.6
/sbin/iptables -A FORWARD -i eth0 -p tcp -d 12.254.x.x --dport 8080 -j ACCEPT
/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp -d 12.254.x.x --dport 8080 -
j DNAT --to-destination 192.168.0.6:80
/sbin/iptables -A FORWARD -i eth0 -p tcp -d 12.254.x.x --dport 10000 -j ACCEPT
/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp -d 12.254.x.x --dport 10000 -
j DNAT --to-destination 192.168.0.6:80

/sbin/iptables -t nat -A PREROUTING -d 12.254.x.x -p tcp --dport 8080 -j DNAT --
to 192.168.0.6

# another test
#/sbin/iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
#/sbin/iptables -A FORWARD -i eth0 -d 192.168.0.4 -p tcp --dport 8080 \
# -j ACCEPT

#/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 \
# -j DNAT --to-destination 192.168.0.4:80

#If you want this rule to alter local connections as well (i.e., even on
#the NAT box itself, trying to telnet to 1.2.3.4's port 8080 will get you
#to 192.168.1.1's port 80), you can insert the same rule in the OUTPUT
#chain (which is for local outgoing packets):

# Linux 2.4 
/sbin/iptables -A OUTPUT -t nat -p tcp -d 12.254.x.x --dport 8080 \
-j DNAT --to 192.168.0.6:80

echo -e "\nStronger rc.firewall-2.4 $FWVER done.\n"


