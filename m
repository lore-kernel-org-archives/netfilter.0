From: "mpboden" <mpboden@surfcity.net>
Subject: i need a little help with ftp please...
Date: Wed, 5 Feb 2003 18:50:53 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004501c2cd8a$90751b90$483918ac@C1006818>
References: <20030205232733.8532.43059.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello, this is my first time posting and my first time asking for help with
linux. I started playing around with linux for the first time several months
back and have been rather successful thus far with getting things to work.
And just to let you know, I generally prefer not asking for help. I like to
figure things out on my own, becuase that's how I learn. But I'm simply
stumped on this one!!! Thus I would more than appreciate some assistance.
Thanks in advance.

To start, I'm running Redhat 7.3 with 2.4.18-3 kernel, and I installed
everything. (Why?...cuz i'm still learning.) Anyway, I got the OS from the
CD's provided with the Linux 7.3 Bible. I don't have the source code and
have yet to get involved with compiling the kernel myself. Of course, I will
if this is a necessary step. I'm using the server as a firewall, router,
dhcp server, ftp server, and in the future an http server. I'm not doing
this for a business, it's just for the house and for fun. I have two
ethernet cards, one for the WAN and one for the LAN. I have a static IP with
DSL service.

Basically, my problem centers around connecting to my ftp server from the
internet. To start, I've installed wu-ftpd and have the ftp server operating
properly when connecting to it via my internal network. I can have guest
users log in successfully and upload/download properly. However, with the
current iptables ruleset in place, no one can connect to the server from the
internet. The packets are being dropped immediately, and users are not even
being promted to enter in their user name and password; they get a
connection timed out error. As a test, if I stop iptables (basically flush
out all the chains and make the default policy ACCEPT with #service iptables
stop) users can log in with no problem. Obviously, this is not what I want.

So...my iptables ruleset is based after the literature I read in the IP
Masquerade HOWTO. I pretty much understand what the script is doing and I
think I've added the proper rules to allow packets through on ports 20 & 21
for FTP(although, that could be where I'm wrong). But for some reason I
still can't get it to work to allow users to connect via the internet. Can
someone please offer some advice and a little education?


Here is the output of the following command:  #iptables --list

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  192.168.1.0/24       anywhere
drop-and-log-it  all  --  192.168.1.0/24       anywhere
ACCEPT     icmp --  anywhere             cip-70-62.bbs.surfcity.net
ACCEPT     all  --  anywhere             cip-70-62.bbs.surfcity.netstate
RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:bootpc
dpt:bootps
ACCEPT     udp  --  anywhere             anywhere           udp spt:bootpc
dpt:bootps
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:ftp
state NEW,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:ftp-data
state RELATED,ESTABLISHED
drop-and-log-it  all  --  anywhere             anywhere
Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere
drop-and-log-it  all  --  anywhere             anywhere

Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ftp
state NEW,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ftp-data
state NEW,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  cip-70-62.bbs.surfcity.net  192.168.1.0/24
ACCEPT     all  --  192.168.1.0/24       192.168.1.0/24
drop-and-log-it  all  --  anywhere             192.168.1.0/24
ACCEPT     all  --  cip-70-62.bbs.surfcity.net  anywhere
ACCEPT     tcp  --  192.168.1.0/24       255.255.255.255    tcp spt:bootps
dpt:bootpc
ACCEPT     udp  --  192.168.1.0/24       255.255.255.255    udp spt:bootps
dpt:bootpc
drop-and-log-it  all  --  anywhere             anywhere

Chain drop-and-log-it (5 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere           LOG level info
DROP       all  --  anywhere             anywhere



------------------------------------------------------------------



And here is my firewall script. I've taken the liberty to exclude my actual
static IP address, but note that it is normally specified. Also note, that I
thought about excluding all the # comments to streamline things for you
guys. But instead, I thought that I'd leave them in to offer more insight;
most of my decisions and rules throughout the script are based after of
these comments, which were provided within the default script from the IP
Masquerade HOWTO(except for the ftp related # comments.) Here goes:


#!/bin/sh
#
# rc.firewall-2.4-stronger
#
FWVER=0.74s-4

#          An example of a stronger IPTABLES firewall with IP Masquerade
#          support for 2.4.x kernels.
#
# Log:
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
#               EXTIF="ppp0"
#
#            if you are a modem user.
#
EXTIF="eth0"
INTIF="eth1"
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
#   If you get your TCP/IP address via DHCP, **you will need ** to enable
the
#   #ed out command below underneath the PPP section AND replace the word
#   "eth0" with the name of your EXTERNAL Internet connection (ppp0, ippp0,
#   etc) on the lines for "ppp-ip" and "extip".  You should also note that
the
#   DHCP server can and will change IP addresses on you.  To deal with this,
#   users should configure their DHCP client to re-run the rc.firewall
ruleset
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
#               Newer versions execute a file called
/etc/dhcpc/dhcpcd-eth0.exe
#
#     NOTE #3:  For Pump users, put the following line in /etc/pump.conf:
#
#                   script /etc/rc.d/rc.firewall
#
#   PPP users:
#   ----------
#   If you aren't already aware, the /etc/ppp/ip-up script is always run
when
#   a PPP connection comes up.  Because of this, we can make the ruleset go
and
#   get the new PPP IP address and update the strong firewall ruleset.
#
#   If the /etc/ppp/ip-up file already exists, you should edit it and add a
line
#   containing "/etc/rc.d/rc.firewall" near the end of the file.
#
#   If you don't already have a /etc/ppp/ip-up sccript, you need to create
the
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
#EXTIP="`$IFCONFIG $EXTIF | $AWK \
# /$EXTIF/'{next}//{split($0,a,":");split(a[2],a," ");print a[1];exit}'`"


# For users who wish to use STATIC IP addresses:
#
#  # out the EXTIP line above and un-# out the EXTIP line below
#
EXTIP="xxx.xxx.xxx.xxx"        #my static IP is actually specified here, but
not included for purposes of this newsgroup
echo "  External IP: $EXTIP"
echo "  ---"


# Assign the internal TCP/IP network and IP address
INTNET="192.168.1.0/24"
INTIP="192.168.1.1/24"
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
#echo "  Enabling DynamicAddr.."
#echo "1" > /proc/sys/net/ipv4/ip_dynaddr

#echo "  ---"

############################################################################
#
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


# ----- Begin OPTIONAL Section -----
#

# DHCPd - Enable the following lines if you run an INTERNAL DHCPd server
#
$IPTABLES -A INPUT -i $INTIF -p tcp --sport 68 --dport 67 -j ACCEPT
$IPTABLES -A INPUT -i $INTIF -p udp --sport 68 --dport 67 -j ACCEPT



## FTP
# Allow ftp outbound.
#
$IPTABLES -A INPUT  -i $EXTIF -p tcp --sport 21 -m state --state
NEW,ESTABLISHED -j ACCEPT
$IPTABLES -A OUTPUT -o $EXTIF -p tcp --dport 21 -m state --state
NEW,ESTABLISHED -j ACCEPT
#
# Now for the connection tracking part of ftp. This is discussed more
completely in my section
# on connection tracking to be found here.

# 1) Active ftp.
# This involves a connection INbound from port 20 on the remote machine, to
a local port
# passed over the ftp channel via a PORT command. The ip_conntrack_ftp
module recognizes
# the connection as RELATED to the original outgoing connection to port 21
so we don't
# need NEW as a state match.
#
$IPTABLES -A INPUT  -i $EXTIF -p tcp --sport 20 -m state --state
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT -o $EXTIF -p tcp --dport 20 -m state --state
NEW,ESTABLISHED -j ACCEPT

# 2) Passive ftp.
# This involves a connection outbound from a port >1023 on the local
machine, to a port >1023
# on the remote machine previously passed over the ftp channel via a PORT
command. The
# ip_conntrack_ftp module recognizes the connection as RELATED to the
original outgoing
# connection to port 21 so we don't need NEW as a state match.
#
$IPTABLES -A INPUT  -i $EXTIF -p tcp --sport 1024:65535 --dport 1024:65535 \
  -m state --state ESTABLISHED -j ACCEPT
$IPTABLES -A OUTPUT -o $EXTIF -p tcp --sport 1024:65535 --dport 1024:65535 \
  -m state --state ESTABLISHED,RELATED -j ACCEPT





# HTTPd - Enable the following lines if you run an EXTERNAL WWW server
#
#echo -e "      - Allowing EXTERNAL access to the WWW server"
#$IPTABLES -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \
# -p tcp -s $UNIVERSE -d $EXTIP --dport 80 -j ACCEPT

#
# ----- End OPTIONAL Section -----



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


# ----- Begin OPTIONAL Section -----
#

# DHCPd - Enable the following lines if you run an INTERNAL DHCPd server
#         - Remove BOTH #s all the #s if you need this functionality.
#
$IPTABLES -A OUTPUT -o $INTIF -p tcp -s $INTIP --sport 67 \
 -d 255.255.255.255 --dport 68 -j ACCEPT
$IPTABLES -A OUTPUT -o $INTIF -p udp -s $INTIP --sport 67 \
 -d 255.255.255.255 --dport 68 -j ACCEPT

#
# ----- End OPTIONAL Section -----

# Catch all rule, all other outgoing is denied and logged.
#
$IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it


echo -e "   - Loading FORWARD rulesets"

#######################################################################
# FORWARD: Enable Forwarding and thus IPMASQ
#

echo "     - FWD: Allow all connections OUT and only existing/related IN"
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
ESTABLISHED,RELATED \
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


------------------------------------------------------

And one last thing I don't understand. In the above firewall script, I have
the variable, EXTIP, set to my static IP address and that variable is placed
in several rules throughout the script, thus inserting my external static IP
address. But where I'm confused is why does that particular IP address not
show up in the output of #iptables --list? Instead, the host name from my
ISP shows up, cip-70-62.bbs.surfcity.net. I really don't understand this one
because I have never entered in that host name anywhere on my computer.
Somehow, the computer is grabbing it from my ISP and using that instead. Is
this normal and beyond my knowledge, or is it another problem I have to deal
with?

-----------------------------------------------





