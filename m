From: Tom Smith <tom@openadventures.org>
Subject: Port Forwarding Problem
Date: Tue, 25 Feb 2003 11:06:55 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E5BB0BF.2070401@openadventures.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030802020405010708040203"
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

This is a multi-part message in MIME format.
--------------030802020405010708040203
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

RedHat 7.3 w/ Kernel 2.4.9-13
iptables version 1.2.5
rc.firewall-2.4-stronger version 0.77s

Having problem forwarding 216.161.174.4 port 8241 to 192.168.20.246 port 22.

I added the following rule to run DNAT:
$IPTABLES -t nat -A PREROUTING -p tcp -d 216.161.174.4 --dport 8241 -j 
DNAT --to-destination 192.168.20.246:22

What I saw when trying to connect to the port from a remote host was:
uccinet kernel: IN=eth1 OUT=eth0 SRC=64.158.129.226 DST=192.168.20.246 
LEN=60 TOS=0x10 PREC=0x00 TTL=45 ID=63685 DF PROTO=TCP SPT=2030 DPT=22 
WINDOW=5840 RES=0x00 SYN URGP=0

I later learned that I also needed some FORWARD rules to make it work. 
The default script had most of them. I added:
$IPTABLES -A FORWARD -d 192.168.20.246 -p tcp --dport 22 -j ACCEPT

Now, I don't see anything in the logs AND I'm still NOT connecting to 
the internal host.

Attached is both the firewall script and the output from iptables -nL. 
The only lines added to the firewall script are 477-483 and 553-554.

Tom Smith
tom@openadventures.org


--------------030802020405010708040203
Content-Type: text/plain;
 name="iptables"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="iptables"

Chain INPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          
ACCEPT     all  --  192.168.20.0/24      0.0.0.0/0          
drop-and-log-it  all  --  192.168.20.0/24      0.0.0.0/0          
ACCEPT     icmp --  0.0.0.0/0            216.161.174.4      
ACCEPT     all  --  0.0.0.0/0            216.161.174.4      state RELATED,ESTABLISHED 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          multiport dports 21,23,25,53,80,110,199,1994,1998,1999 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0          multiport dports 21,23,25,53,80,110,199,1994,1998,1999 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0          multiport dports 22,47,143,443,993,1723 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0          multiport dports 22,47,143,443,993,1723 
drop-and-log-it  all  --  0.0.0.0/0            0.0.0.0/0          

Chain FORWARD (policy DROP)
target     prot opt source               destination         
ACCEPT     tcp  --  0.0.0.0/0            192.168.20.246     tcp dpt:22 
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED 
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          
drop-and-log-it  all  --  0.0.0.0/0            0.0.0.0/0          

Chain OUTPUT (policy DROP)
target     prot opt source               destination         
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          
ACCEPT     all  --  216.161.174.4        192.168.20.0/24    
ACCEPT     all  --  192.168.20.0/24      192.168.20.0/24    
drop-and-log-it  all  --  0.0.0.0/0            192.168.20.0/24    
ACCEPT     all  --  216.161.174.4        0.0.0.0/0          
drop-and-log-it  all  --  0.0.0.0/0            0.0.0.0/0          

Chain drop-and-log-it (5 references)
target     prot opt source               destination         
LOG        all  --  0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 6 
REJECT     all  --  0.0.0.0/0            0.0.0.0/0          reject-with icmp-port-unreachable 

--------------030802020405010708040203
Content-Type: text/plain;
 name="rc.firewall-2.4-stronger"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="rc.firewall-2.4-stronger"

#!/bin/sh
#
# rc.firewall-2.4-stronger
#
FWVER=0.77s

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
EXTIF="eth1"
INTIF="eth0"
echo "  External Interface:  $EXTIF"
echo "  Internal Interface:  $INTIF"
echo "  ---"

# Specify your Static IP address here or let the script take care of it 
# for you.
#
#   If you prefer to use STATIC addresses in your firewalls, un-# out the
#   static example below and # out the dynamic line.  If you don't care,
#   just leave this section alone.
#
#   If you have a DYNAMIC IP address, the ruleset already takes care of
#   this for you.  Please note that the different single and double quote 
#   characters and the script MATTER.
#
#
#   DHCP users:
#   -----------
#   If you get your TCP/IP address via DHCP, **you will need ** to enable the 
#   #ed out command below underneath the PPP section AND replace the word 
#   "eth0" with the name of your EXTERNAL Internet connection (ppp0, ippp0, 
#   etc) on the lines for "ppp-ip" and "extip".  You should also note that the 
#   DHCP server can and will change IP addresses on you.  To deal with this, 
#   users should configure their DHCP client to re-run the rc.firewall ruleset 
#   everytime the DHCP lease is renewed.
#
#     NOTE #1:  Some DHCP clients like the original "pump" (the newer
#               versions have been fixed) did NOT have the ability to run 
#               scripts after a lease-renew.  Because of this, you need to 
#               replace it with something like "dhcpcd" or "dhclient".
#
#     NOTE #2:  The syntax for "dhcpcd" has changed in recent versions.
#
#               Older versions used syntax like:
#                         dhcpcd -c /etc/rc.d/rc.firewall eth0
#
#               Newer versions execute a file called /etc/dhcpc/dhcpcd-eth0.exe
#
#     NOTE #3:  For Pump users, put the following line in /etc/pump.conf:
#
#                   script /etc/rc.d/rc.firewall
#
#   PPP users:
#   ----------
#   If you aren't already aware, the /etc/ppp/ip-up script is always run when 
#   a PPP connection comes up.  Because of this, we can make the ruleset go and 
#   get the new PPP IP address and update the strong firewall ruleset.
#
#   If the /etc/ppp/ip-up file already exists, you should edit it and add a line
#   containing "/etc/rc.d/rc.firewall" near the end of the file.
#
#   If you don't already have a /etc/ppp/ip-up sccript, you need to create the 
#   following link to run the /etc/rc.d/rc.firewall script.
#
#       ln -s /etc/rc.d/rc.firewall /etc/ppp/ip-up
#
#   * You then want to enable the #ed out shell command below *
#
#
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
INTNET="192.168.20.0/24"
INTIP="192.168.20.1/24"
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
$IPTABLES -A INPUT -i $EXTIF -p ICMP -s $UNIVERSE -d $EXTIP -j ACCEPT


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
#echo -e "      - Allowing EXTERNAL access to the WWW server"
#$IPTABLES -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \
# -p tcp -s $UNIVERSE -d $EXTIP --dport 80 -j ACCEPT
#
echo -e "      - Allowing EXTERNAL access to INSECURE services"
$IPTABLES -A INPUT -p tcp -m multiport --dport 21,23,25,53,80,110,199,1994,1998,1999 -j ACCEPT
$IPTABLES -A INPUT -p udp -m multiport --dport 21,23,25,53,80,110,199,1994,1998,1999 -j ACCEPT

echo -e "      - Allowing EXTERNAL access to SECURE services"
$IPTABLES -A INPUT -p tcp -m multiport --dport 22,47,143,443,993,1723 -j ACCEPT
$IPTABLES -A INPUT -p udp -m multiport --dport 22,47,143,443,993,1723 -j ACCEPT
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
$IPTABLES -A FORWARD -d 192.168.20.246 -p tcp --dport 22 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -p tcp -d 216.161.174.4 --dport 8241 -j DNAT --to-destination 192.168.20.246:22
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


#######################################################################
echo -e "\nStronger rc.firewall-2.4 $FWVER done.\n"


--------------030802020405010708040203--



