From: Andreas Scherrer <fortytwo@gmx.ch>
Subject: (Fake?) DHC-Packets penetrating firewall
Date: Wed, 19 May 2004 17:37:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6AE34BD4-A9AA-11D8-959F-000A95AF9DD4@gmx.ch>
Mime-Version: 1.0 (Apple Message framework v613)
Content-Type: multipart/mixed; boundary=Apple-Mail-3--700341325
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


--Apple-Mail-3--700341325
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed

Hi

I am experiencing a strange problem (at least it seems strange to me 
;)).

I have a server which has two NICs (eth0 = external, eth1 = internal) 
running kernel 2.4.18 and performing NAT. I use 10.0.1.x IPs in my 
internal net.
Recently a (fake?) DHCP-Server turned up somewhere (on the same 
broadband link, I use cable?) which sends me _a lot_ of DHCPOFFERS and 
the like _which I don't think I requested_ and (says it has?) a 
10.x.x.x IP.
So I listed it in my dhclient.conf as "reject server". This seems to 
work because I can see log entries in /var/log/daemon.log (see 
attachment "daemon.txt").

So I went on and entered a rule in my iptables which (I thought) would 
keep those packets away from me. But no luck, I can see packets 
"hanging" in the rule (using iptables -v -L) but the log entries in 
/var/log/daemon.log keep showing up! So something is wrong with my 
rule, I thought and closed everything, just to check (see attachement 
"fire.sh", my dummy firewall script and "iptables?.txt").
And now the log entries _still appear_. WHY? I don't get it...

The attachements:
daemon.txt - tail of /var/log/daemon.log, these entries were created 
while the fire.sh ipchains were active
fire.sh - a cut-down version of my real firewall-script (just DROPs 
everything, I think)
iptables.txt - a $iptables -v -L while the fire.sh "firewall" was active
iptables2.txt - like iptables.txt, but a few seconds (10?) later


Can you help me?
greenhorn



--Apple-Mail-3--700341325
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	x-mac-type=54455854;
	x-unix-mode=0644;
	x-mac-creator=74747874;
	name="daemon.txt"
Content-Disposition: attachment;
	filename=daemon.txt

May 19 17:01:34 wgsurf dhclient-2.2.x: DHCPOFFER from 10.224.96.1 rejected.
May 19 17:01:34 wgsurf dhclient-2.2.x: DHCPACK from 10.224.96.1 rejected.
May 19 17:01:35 wgsurf dhclient-2.2.x: DHCPOFFER from 10.224.96.1 rejected.
May 19 17:01:36 wgsurf dhclient-2.2.x: DHCPACK from 10.224.96.1 rejected.
May 19 17:02:07 wgsurf last message repeated 5 times
May 19 17:02:07 wgsurf dhclient-2.2.x: DHCPACK from 10.224.96.1 rejected.
May 19 17:02:17 wgsurf dhclient-2.2.x: DHCPOFFER from 10.224.96.1 rejected.
May 19 17:02:18 wgsurf dhclient-2.2.x: DHCPACK from 10.224.96.1 rejected.
May 19 17:02:18 wgsurf dhclient-2.2.x: DHCPACK from 10.224.96.1 rejected.
May 19 17:02:30 wgsurf dhclient-2.2.x: DHCPOFFER from 10.224.96.1 rejected.

--Apple-Mail-3--700341325
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream;
	x-mac-type=3F3F3F3F;
	x-unix-mode=0644;
	x-mac-creator=3F3F3F3F;
	name="fire.sh"
Content-Disposition: attachment;
	filename=fire.sh

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
AWK=/usr/bin/awk
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
#INTNET="192.168.1.0/24"
#INTIP="192.168.1.1/24"
INTNET="10.0.1.0/24"
INTIP="10.0.1.1"
echo "  Internal Network: $INTNET"
echo "  Internal IP:      $INTIP"
echo "  ---"




# Setting a few other local variables
#
UNIVERSE="0.0.0.0/0"
PRIVATE_NETS="10.0.0.0/8 172.16.0.0/12 192.168.0.0/16"

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

$IPTABLES -N drop-and-log-it
$IPTABLES -A drop-and-log-it -j LOG --log-level warning
$IPTABLES -A drop-and-log-it -j DROP

#$IPTABLES -A INPUT -s $INTNET -i $INTIF -j ACCEPT
# Catch all rule, all other incoming is denied and logged. 
#
$IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it


echo -e "   - Loading OUTPUT rulesets"

# Catch all rule, all other outgoing is denied and logged. 
#
$IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it

# Catch all rule, all other forwarding is denied and logged. 
#
$IPTABLES -A FORWARD -j drop-and-log-it


echo "     - NAT: Enabling SNAT (MASQUERADE) functionality on $EXTIF"
#
#More liberal form
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
#
#Stricter form
#$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP

echo -e "\nDone.\n"

--Apple-Mail-3--700341325
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	x-mac-type=54455854;
	x-unix-mode=0644;
	x-mac-creator=74747874;
	name="iptables.txt"
Content-Disposition: attachment;
	filename=iptables.txt

Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
   55  5382 drop-and-log-it  all  --  any    any     anywhere             anywhere           

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 drop-and-log-it  all  --  any    any     anywhere             anywhere           

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    6   282 drop-and-log-it  all  --  any    any     anywhere             anywhere           

Chain drop-and-log-it (3 references)
 pkts bytes target     prot opt in     out     source               destination         
   61  5664 LOG        all  --  any    any     anywhere             anywhere           LOG level warning 
   61  5664 DROP       all  --  any    any     anywhere             anywhere           

--Apple-Mail-3--700341325
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	x-mac-type=54455854;
	x-unix-mode=0644;
	x-mac-creator=74747874;
	name="iptables2.txt"
Content-Disposition: attachment;
	filename=iptables2.txt

Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
  289 25038 drop-and-log-it  all  --  any    any     anywhere             anywhere           

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
   39  2702 drop-and-log-it  all  --  any    any     anywhere             anywhere           

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
   11   628 drop-and-log-it  all  --  any    any     anywhere             anywhere           

Chain drop-and-log-it (3 references)
 pkts bytes target     prot opt in     out     source               destination         
  339 28368 LOG        all  --  any    any     anywhere             anywhere           LOG level warning 
  339 28368 DROP       all  --  any    any     anywhere             anywhere           

--Apple-Mail-3--700341325--


