From: "Mario" <mario@limonciello.d2g.com>
Subject: IP Masquerading
Date: Thu, 4 Mar 2004 15:00:43 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1AyzyC-0007GM-Sq@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0000_01C401F9.77AD0A10"
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

------=_NextPart_000_0000_01C401F9.77AD0A10
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Okay here is my setup: 

Gentoo Box running 2.6.3 w/ 4 NICs 
1 NIC is for internal network 
3 NICs are for external network 

The machine has a static address assigned to the internal network nic. This
nic runs dhcp and dns forwarding. The other 3 nics have external dynamic IP
addresses. All will have the same gateway. There are 3 NICs because this is
a very large pipe, that will only allocate a certain ammount to each client
( NIC ). 

The way i set this up is so that internal network clients will be routed
through the 3 nics with their packets sent out in a round robin sort of
fashion. I found a few sites explaining a bit about how to do this, and the
current setup i found that somewhat works is this: 

A virtual device teql0 is created: 
This virtual device teql0 is an imaginary device using QoS Trivial link
equalizer (TeQL). It has a static ip address assigned to it. If you attempt
to ping it from another machine, you wont necessarily be pinging the same
network card every time. 


Code:


 tc qdisc add dev eth0 root teql0 
 tc qdisc add dev eth1 root teql0 
 tc qdisc add dev eth3 root teql0 
 ip link set dev teql0 up 
 ip addr add dev teql0 64.113.86.126



IP Masquerading is Setup 
A file name rc.firewall.2.6 is executed at every startup. This file sets up
a few routing things and the masquerading setup. 


Code:


#!/bin/sh 
# 
# rc.firewall-2.6 
#FWVER=0.75 
# 
#               Initial SIMPLE IP Masquerade test for 2.4.x kernels 
#               using IPTABLES.  
# 
#               Once IP Masquerading has been tested, with this simple 
#               ruleset, it is highly recommended to use a stronger 
#               IPTABLES ruleset either given later in this HOWTO or 
#               from another reputable resource. 
# 
# 
# 
# Log: 
#       0.75 - Added more kernel modules to the comments section 
#       0.74 - the ruleset now uses modprobe vs. insmod 
#       0.73 - REJECT is not a legal policy yet; back to DROP 
#       0.72 - Changed the default block behavior to REJECT not DROP 
#       0.71 - Added clarification that PPPoE users need to use 
#              "ppp0" instead of "eth0" for their external interface 
#       0.70 - Added commented option for IRC nat module 
#            - Added additional use of environment variables 
#            - Added additional formatting 
#       0.63 - Added support for the IRC IPTABLES module 
#       0.62 - Fixed a typo on the MASQ enable line that used eth0 
#              instead of $EXTIF 
#       0.61 - Changed the firewall to use variables for the internal 
#              and external interfaces. 
#       0.60 - 0.50 had a mistake where the ruleset had a rule to DROP 
#              all forwarded packets but it didn't have a rule to ACCEPT 
#              any packets to be forwarded either 
#            - Load the ip_nat_ftp and ip_conntrack_ftp modules by default 
#       0.50 - Initial draft 
# 

echo -e "\n\nLoading simple rc.firewall version $FWVER..\n" 


# The location of the iptables and kernel module programs 
# 
#   If your Linux distribution came with a copy of iptables, 
#   most likely all the programs will be located in /sbin.  If 
#   you manually compiled iptables, the default location will 
#   be in /usr/local/sbin 
# 
# ** Please use the "whereis iptables" command to figure out 
# ** where your copy is and change the path below to reflect 
# ** your setup 
# 
IPTABLES=/sbin/iptables 
DEPMOD=/sbin/depmod 
MODPROBE=/sbin/modprobe 


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
# 
#  NOTE:  If this doesnt EXACTLY fit your configuration, you must 
#         change the EXTIF or INTIF variables above. For example: 
# 
#            If you are a PPPoE or analog modem user: 
# 
#               EXTIF="ppp0" 
# 
# 
TEQLIF="teql0" 
EXTIF="eth0" 
EXTIF2="eth1" 
EXTIF3="eth3" 
INTIF="eth2" 
echo "   TEQL Interface: $TEQLIF" 
echo "   External Interface:  $EXTIF" 
echo "   External Interface:  $EXTIF2" 
echo "   External Interface:  $EXTIF3" 
echo "   Internal Interface:  $INTIF" 


#====================================================================== 
#== No editing beyond this line is required for initial MASQ testing == 


echo -en "   loading modules: " 

# Need to verify that all modules have all required dependencies 
# 
echo "  - Verifying that all kernel modules are ok" 
$DEPMOD -a 

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

echo
"----------------------------------------------------------------------" 

#Load the main body of the IPTABLES module - "iptable" 
#  - Loaded automatically when the "iptables" command is invoked 
# 
#  - Loaded manually to clean up kernel auto-loading timing issues 
# 
echo -en "ip_tables, " 
$MODPROBE ip_tables 


#Load the IPTABLES filtering module - "iptable_filter" 
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
$MODPROBE ip_conntrack 


#Load the FTP tracking mechanism for full FTP tracking 
# 
# Enabled by default -- insert a "#" on the next line to deactivate 
# 
echo -en "ip_conntrack_ftp, " 
$MODPROBE ip_conntrack_ftp 


#Load the IRC tracking mechanism for full IRC tracking 
# 
# Enabled by default -- insert a "#" on the next line to deactivate 
# 
echo -en "ip_conntrack_irc, " 
$MODPROBE ip_conntrack_irc 


#Load the general IPTABLES NAT code - "iptable_nat" 
#  - Loaded automatically when MASQ functionality is turned on 
# 
#  - Loaded manually to clean up kernel auto-loading timing issues 
# 
echo -en "iptable_nat, " 
$MODPROBE iptable_nat 


#Loads the FTP NAT functionality into the core IPTABLES code 
# Required to support non-PASV FTP. 
# 
# Enabled by default -- insert a "#" on the next line to deactivate 
# 
echo -en "ip_nat_ftp, " 
$MODPROBE ip_nat_ftp 


#Loads the IRC NAT functionality into the core IPTABLES code 
# Required to support NAT of IRC DCC requests 
# 
# Disabled by default -- remove the "#" on the next line to activate 
# 
echo -e "ip_nat_irc" 
$MODPROBE ip_nat_irc 

echo
"----------------------------------------------------------------------" 

# Just to be complete, here is a partial list of some of the other  
# IPTABLES kernel modules and their function.  Please note that most 
# of these modules (the ipt ones) are automatically loaded by the 
# master kernel module for proper operation and don't need to be 
# manually loaded. 
# -------------------------------------------------------------------- 
# 
#    ip_nat_snmp_basic - this module allows for proper NATing of some 
#                        SNMP traffic 
# 
#    iptable_mangle    - this target allows for packets to be 
#                        manipulated for things like the TCPMSS 
#                        option, etc. 
# 
# -- 
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

echo -e "   Done loading modules.\n" 



#CRITICAL:  Enable IP forwarding since it is disabled by default since 
# 
#           Redhat Users:  you may try changing the options in 
#                          /etc/sysconfig/network from: 
# 
#                       FORWARD_IPV4=false 
#                             to 
#                       FORWARD_IPV4=true 
# 
echo "   Enabling forwarding.." 
echo 1 > /proc/sys/net/ipv4/ip_forward 


# Dynamic IP users: 
# 
#   If you get your IP address dynamically from SLIP, PPP, or DHCP, 
#   enable this following option.  This enables dynamic-address hacking 
#   which makes the life with Diald and similar programs much easier. 
# 
echo "   Enabling DynamicAddr.." 
echo "1" > /proc/sys/net/ipv4/ip_dynaddr 


# Enable simple IP forwarding and Masquerading 
# 
#  NOTE:  In IPTABLES speak, IP Masquerading is a form of SourceNAT or SNAT.

# 
#  NOTE #2:  The following is an example for an internal LAN address in the 
#            192.168.0.x network with a 255.255.255.0 or a "24" bit subnet
mask 
#            connecting to the Internet on external interface "eth0".  This 
#            example will MASQ internal traffic out to the Internet but not 
#            allow non-initiated traffic into your internal network. 
# 
#            
#         ** Please change the above network numbers, subnet mask, and your 
#         *** Internet connection interface name to match your setup 
#          


#Clearing any previous configuration 
# 
#  Unless specified, the defaults for INPUT and OUTPUT is ACCEPT 
#    The default for FORWARD is DROP (REJECT is not a valid policy) 
# 
echo "   Clearing any existing rules and setting default policy.." 
$IPTABLES -P INPUT ACCEPT 
$IPTABLES -F INPUT 
$IPTABLES -P OUTPUT ACCEPT 
$IPTABLES -F OUTPUT 
$IPTABLES -P FORWARD DROP 
$IPTABLES -F FORWARD 
$IPTABLES -t nat -F 

echo "   FWD: Allow all connections OUT and only existing and related ones
IN" 
$IPTABLES -A FORWARD -i $TEQLIF -o $INTIF -m state --state
ESTABLISHED,RELATED -j ACCEPT 
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
ESTABLISHED,RELATED -j ACCEPT 
$IPTABLES -A FORWARD -i $EXTIF2 -o $INTIF -m state --state
ESTABLISHED,RELATED -j ACCEPT 
$IPTABLES -A FORWARD -i $EXTIF3 -o $INTIF -m state --state
ESTABLISHED,RELATED -j ACCEPT 
$IPTABLES -A FORWARD -i $INTIF -o $TEQLIF -j ACCEPT 
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT 
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF3 -j ACCEPT 
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF2 -j ACCEPT 
$IPTABLES -A FORWARD -j LOG 

echo "   Enabling SNAT (MASQUERADE) functionality on $TEQLIF" 
$IPTABLES -t nat -A POSTROUTING -o $TEQLIF -j MASQUERADE 
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE 
$IPTABLES -t nat -A POSTROUTING -o $EXTIF2 -j MASQUERADE 
$IPTABLES -t nat -A POSTROUTING -o $EXTIF3 -j MASQUERADE 

iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
--clamp-mss-to-pmtu 

echo -e "\nrc.firewall-2.6 v$FWVER done.\n" 



Now this works well in most cases, but for some reasons when a computer on
the internal lan wants to visit a site, it may take about 20-30 seconds
longer than it should for the site to come up. If you go back to this
routing machine, and pull up a dmesg, a whole slew of this comes up: 


Quote:


MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
printk: 1 messages suppressed. 
MASQUERADE: Route sent us somewhere else. 
printk: 2 messages suppressed. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 
MASQUERADE: Route sent us somewhere else. 



Now adding the extra lines for the interfaces other than TEQL0 (ex
ETH0,ETH1, ETH3) seemed to lessen how many of these messages were actually
shown and how badly the performance originally was. I can't seem to figure
out why it wants to route through any other device than TEQL0 however, with
those extra lines for the physcial interfaces or without. 

Anyone have any clue what to do?


------=_NextPart_000_0000_01C401F9.77AD0A10
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><span class=3Dpostbody><font size=3D3 face=3D"Times =
New Roman"><span
style=3D'font-size:12.0pt'>Okay here is my setup: =
</span></font></span><br>
<br>
<span class=3Dpostbody>Gentoo Box running 2.6.3 w/ 4 NICs </span><br>
<span class=3Dpostbody>1 NIC is for internal network </span><br>
<span class=3Dpostbody>3 NICs are for external network </span><br>
<br>
<span class=3Dpostbody>The machine has a static address assigned to the =
internal
network nic. This nic runs dhcp and dns forwarding. The other 3 nics =
have
external dynamic IP addresses. All will have the same gateway. There are =
3 NICs
because this is a very large pipe, that will only allocate a certain =
ammount to
each client ( NIC ). </span><br>
<br>
<span class=3Dpostbody>The way i set this up is so that internal network =
clients
will be routed through the 3 nics with their packets sent out in a round =
robin
sort of fashion. I found a few sites explaining a bit about how to do =
this, and
the current setup i found that somewhat works is this: </span><br>
<br>
<span class=3Dpostbody><b><span style=3D'font-weight:bold'>A virtual =
device teql0
is created:</span></b> </span><br>
<span class=3Dpostbody><i><span style=3D'font-style:italic'>This virtual =
device
teql0 is an imaginary device using QoS Trivial link equalizer (TeQL). It =
has a
static ip address assigned to it. If you attempt to ping it from another
machine, you wont necessarily be pinging the same network card every =
time.</span></i>
</span><o:p></o:p></p>

<div align=3Dcenter>

<table class=3DMsoNormalTable border=3D0 cellspacing=3D1 cellpadding=3D0 =
width=3D"90%"
 style=3D'width:90.0%'>
 <tr>
  <td style=3D'padding:2.25pt 2.25pt 2.25pt 2.25pt'>
  <p class=3DMsoNormal><span class=3Dgenmed><b><font size=3D3 =
face=3D"Times New Roman"><span
  =
style=3D'font-size:12.0pt;font-weight:bold'>Code:</span></font></b></span=
><o:p></o:p></p>
  </td>
 </tr>
 <tr>
  <td style=3D'padding:2.25pt 2.25pt 2.25pt 2.25pt'>
  <p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span
  style=3D'font-size:12.0pt'>&nbsp;tc qdisc add dev eth0 root teql0 <br>
  &nbsp;tc qdisc add dev eth1 root teql0 <br>
  &nbsp;tc qdisc add dev eth3 root teql0 <br>
  &nbsp;ip link set dev teql0 up <br>
  &nbsp;ip addr add dev teql0 64.113.86.126<o:p></o:p></span></font></p>
  </td>
 </tr>
</table>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><br>
<br>
<span class=3Dpostbody><b><span style=3D'font-weight:bold'>IP =
Masquerading is Setup</span></b>
</span><br>
<span class=3Dpostbody><i><span style=3D'font-style:italic'>A file name
rc.firewall.2.6 is executed at every startup. This file sets up a few =
routing
things and the masquerading setup.</span></i> =
</span><o:p></o:p></span></font></p>

<div align=3Dcenter>

<table class=3DMsoNormalTable border=3D0 cellspacing=3D1 cellpadding=3D0 =
width=3D"90%"
 style=3D'width:90.0%'>
 <tr>
  <td style=3D'padding:2.25pt 2.25pt 2.25pt 2.25pt'>
  <p class=3DMsoNormal><span class=3Dgenmed><b><font size=3D3 =
face=3D"Times New Roman"><span
  =
style=3D'font-size:12.0pt;font-weight:bold'>Code:</span></font></b></span=
><o:p></o:p></p>
  </td>
 </tr>
 <tr>
  <td style=3D'padding:2.25pt 2.25pt 2.25pt 2.25pt'>
  <p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span
  style=3D'font-size:12.0pt'>#!/bin/sh <br>
  # <br>
  # rc.firewall-2.6 <br>
  #FWVER=3D0.75 <br>
  # <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Initial SIMPLE =
IP
  Masquerade test for 2.4.x kernels <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;using =
IPTABLES.&nbsp;
  <br>
  # <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Once IP =
Masquerading
  has been tested, with this simple <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ruleset, it is =
highly
  recommended to use a stronger <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;IPTABLES =
ruleset
  either given later in this HOWTO or <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from another
  reputable resource. <br>
  # <br>
  # <br>
  # <br>
  # Log: <br>
  #&nbsp; &nbsp; &nbsp; &nbsp;0.75 - Added more kernel modules to the =
comments
  section <br>
  #&nbsp; &nbsp; &nbsp; &nbsp;0.74 - the ruleset now uses modprobe vs. =
insmod <br>
  #&nbsp; &nbsp; &nbsp; &nbsp;0.73 - REJECT is not a legal policy yet; =
back to
  DROP <br>
  #&nbsp; &nbsp; &nbsp; &nbsp;0.72 - Changed the default block behavior =
to
  REJECT not DROP <br>
  #&nbsp; &nbsp; &nbsp; &nbsp;0.71 - Added clarification that PPPoE =
users need
  to use <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;ppp0&quot; =
instead of
  &quot;eth0&quot; for their external interface <br>
  #&nbsp; &nbsp; &nbsp; &nbsp;0.70 - Added commented option for IRC nat =
module <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - Added additional use of
  environment variables <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - Added additional =
formatting <br>
  #&nbsp; &nbsp; &nbsp; &nbsp;0.63 - Added support for the IRC IPTABLES =
module <br>
  #&nbsp; &nbsp; &nbsp; &nbsp;0.62 - Fixed a typo on the MASQ enable =
line that
  used eth0 <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; instead of $EXTIF =
<br>
  #&nbsp; &nbsp; &nbsp; &nbsp;0.61 - Changed the firewall to use =
variables for
  the internal <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; and external =
interfaces. <br>
  #&nbsp; &nbsp; &nbsp; &nbsp;0.60 - 0.50 had a mistake where the =
ruleset had a
  rule to DROP <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; all forwarded =
packets but
  it didn't have a rule to ACCEPT <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; any packets to be =
forwarded
  either <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - Load the ip_nat_ftp and
  ip_conntrack_ftp modules by default <br>
  #&nbsp; &nbsp; &nbsp; &nbsp;0.50 - Initial draft <br>
  # <br>
  <br>
  echo -e &quot;\n\nLoading simple rc.firewall version $FWVER..\n&quot; =
<br>
  <br>
  <br>
  # The location of the iptables and kernel module programs <br>
  # <br>
  #&nbsp; &nbsp;If your Linux distribution came with a copy of iptables, =
<br>
  #&nbsp; &nbsp;most likely all the programs will be located in =
/sbin.&nbsp; If
  <br>
  #&nbsp; &nbsp;you manually compiled iptables, the default location =
will <br>
  #&nbsp; &nbsp;be in /usr/local/sbin <br>
  # <br>
  # ** Please use the &quot;whereis iptables&quot; command to figure out =
<br>
  # ** where your copy is and change the path below to reflect <br>
  # ** your setup <br>
  # <br>
  IPTABLES=3D/sbin/iptables <br>
  DEPMOD=3D/sbin/depmod <br>
  MODPROBE=3D/sbin/modprobe <br>
  <br>
  <br>
  #Setting the EXTERNAL and INTERNAL interfaces for the network <br>
  # <br>
  #&nbsp; Each IP Masquerade network needs to have at least one <br>
  #&nbsp; external and one internal network.&nbsp; The external network =
<br>
  #&nbsp; is where the natting will occur and the internal network <br>
  #&nbsp; should preferably be addressed with a RFC1918 private address =
<br>
  #&nbsp; scheme. <br>
  # <br>
  #&nbsp; For this example, &quot;eth0&quot; is external and =
&quot;eth1&quot;
  is internal&quot; <br>
  # <br>
  # <br>
  #&nbsp; NOTE:&nbsp; If this doesnt EXACTLY fit your configuration, you =
must <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;change the EXTIF or INTIF variables =
above.
  For example: <br>
  # <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; If you are a PPPoE or =
analog modem
  user: <br>
  # <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  &nbsp;EXTIF=3D&quot;ppp0&quot; <br>
  # <br>
  # <br>
  TEQLIF=3D&quot;teql0&quot; <br>
  EXTIF=3D&quot;eth0&quot; <br>
  EXTIF2=3D&quot;eth1&quot; <br>
  EXTIF3=3D&quot;eth3&quot; <br>
  INTIF=3D&quot;eth2&quot; <br>
  echo &quot;&nbsp; &nbsp;TEQL Interface: $TEQLIF&quot; <br>
  echo &quot;&nbsp; &nbsp;External Interface:&nbsp; $EXTIF&quot; <br>
  echo &quot;&nbsp; &nbsp;External Interface:&nbsp; $EXTIF2&quot; <br>
  echo &quot;&nbsp; &nbsp;External Interface:&nbsp; $EXTIF3&quot; <br>
  echo &quot;&nbsp; &nbsp;Internal Interface:&nbsp; $INTIF&quot; <br>
  <br>
  <br>
  =
#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D <br>
  #=3D=3D No editing beyond this line is required for initial MASQ =
testing =3D=3D <br>
  <br>
  <br>
  echo -en &quot;&nbsp; &nbsp;loading modules: &quot; <br>
  <br>
  # Need to verify that all modules have all required dependencies <br>
  # <br>
  echo &quot;&nbsp; - Verifying that all kernel modules are ok&quot; =
<br>
  $DEPMOD -a <br>
  <br>
  # With the new IPTABLES code, the core MASQ functionality is now =
either <br>
  # modular or compiled into the kernel.&nbsp; This HOWTO shows ALL =
IPTABLES <br>
  # options as MODULES.&nbsp; If your kernel is compiled correctly, =
there is <br>
  # NO need to load the kernel modules manually.&nbsp; <br>
  # <br>
  #&nbsp; NOTE: The following items are listed ONLY for informational =
reasons. <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; There is no reason to manual load these =
modules
  unless your <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; kernel is either mis-configured or you
  intentionally disabled <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; the kernel module autoloader. <br>
  # <br>
  <br>
  # Upon the commands of starting up IP Masq on the server, the <br>
  # following kernel modules will be automatically loaded: <br>
  # <br>
  # NOTE:&nbsp; Only load the IP MASQ modules you need.&nbsp; All =
current IP
  MASQ <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; modules are shown below but are commented =
out
  from loading. <br>
  # =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D <br>
  <br>
  echo =
&quot;-------------------------------------------------------------------=
---&quot;
  <br>
  <br>
  #Load the main body of the IPTABLES module - &quot;iptable&quot; <br>
  #&nbsp; - Loaded automatically when the &quot;iptables&quot; command =
is
  invoked <br>
  # <br>
  #&nbsp; - Loaded manually to clean up kernel auto-loading timing =
issues <br>
  # <br>
  echo -en &quot;ip_tables, &quot; <br>
  $MODPROBE ip_tables <br>
  <br>
  <br>
  #Load the IPTABLES filtering module - &quot;iptable_filter&quot; <br>
  #&nbsp; - Loaded automatically when filter policies are activated <br>
  <br>
  <br>
  #Load the stateful connection tracking framework - =
&quot;ip_conntrack&quot; <br>
  # <br>
  # The conntrack&nbsp; module in itself does nothing without other =
specific <br>
  # conntrack modules being loaded afterwards such as the
  &quot;ip_conntrack_ftp&quot; <br>
  # module <br>
  # <br>
  #&nbsp; - This module is loaded automatically when MASQ functionality =
is <br>
  #&nbsp; &nbsp; enabled <br>
  # <br>
  #&nbsp; - Loaded manually to clean up kernel auto-loading timing =
issues <br>
  # <br>
  echo -en &quot;ip_conntrack, &quot; <br>
  $MODPROBE ip_conntrack <br>
  <br>
  <br>
  #Load the FTP tracking mechanism for full FTP tracking <br>
  # <br>
  # Enabled by default -- insert a &quot;#&quot; on the next line to =
deactivate
  <br>
  # <br>
  echo -en &quot;ip_conntrack_ftp, &quot; <br>
  $MODPROBE ip_conntrack_ftp <br>
  <br>
  <br>
  #Load the IRC tracking mechanism for full IRC tracking <br>
  # <br>
  # Enabled by default -- insert a &quot;#&quot; on the next line to =
deactivate
  <br>
  # <br>
  echo -en &quot;ip_conntrack_irc, &quot; <br>
  $MODPROBE ip_conntrack_irc <br>
  <br>
  <br>
  #Load the general IPTABLES NAT code - &quot;iptable_nat&quot; <br>
  #&nbsp; - Loaded automatically when MASQ functionality is turned on =
<br>
  # <br>
  #&nbsp; - Loaded manually to clean up kernel auto-loading timing =
issues <br>
  # <br>
  echo -en &quot;iptable_nat, &quot; <br>
  $MODPROBE iptable_nat <br>
  <br>
  <br>
  #Loads the FTP NAT functionality into the core IPTABLES code <br>
  # Required to support non-PASV <a href=3D"http://FTP." =
target=3D"_blank">FTP.</a>
  <br>
  # <br>
  # Enabled by default -- insert a &quot;#&quot; on the next line to =
deactivate
  <br>
  # <br>
  echo -en &quot;ip_nat_ftp, &quot; <br>
  $MODPROBE ip_nat_ftp <br>
  <br>
  <br>
  #Loads the IRC NAT functionality into the core IPTABLES code <br>
  # Required to support NAT of IRC DCC requests <br>
  # <br>
  # Disabled by default -- remove the &quot;#&quot; on the next line to
  activate <br>
  # <br>
  echo -e &quot;ip_nat_irc&quot; <br>
  $MODPROBE ip_nat_irc <br>
  <br>
  echo =
&quot;-------------------------------------------------------------------=
---&quot;
  <br>
  <br>
  # Just to be complete, here is a partial list of some of the =
other&nbsp; <br>
  # IPTABLES kernel modules and their function.&nbsp; Please note that =
most <br>
  # of these modules (the ipt ones) are automatically loaded by the <br>
  # master kernel module for proper operation and don't need to be <br>
  # manually loaded. <br>
  # -------------------------------------------------------------------- =
<br>
  # <br>
  #&nbsp; &nbsp; ip_nat_snmp_basic - this module allows for proper =
NATing of
  some <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
  &nbsp; SNMP traffic <br>
  # <br>
  #&nbsp; &nbsp; iptable_mangle&nbsp; &nbsp; - this target allows for =
packets
  to be <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
  &nbsp; manipulated for things like the TCPMSS <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
  &nbsp; option, etc. <br>
  # <br>
  # -- <br>
  # <br>
  #&nbsp; &nbsp; ipt_mark&nbsp; &nbsp; &nbsp; &nbsp;- this target marks =
a given
  packet for future action. <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  &nbsp;This automatically loads the ipt_MARK module <br>
  # <br>
  #&nbsp; &nbsp; ipt_tcpmss&nbsp; &nbsp; &nbsp;- this target allows to
  manipulate the TCP MSS <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  &nbsp;option for braindead remote firewalls. <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  &nbsp;This automatically loads the ipt_TCPMSS module <br>
  # <br>
  #&nbsp; &nbsp; ipt_limit&nbsp; &nbsp; &nbsp; - this target allows for =
packets
  to be limited to <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  &nbsp;to many hits per sec/min/hr <br>
  # <br>
  #&nbsp; &nbsp; ipt_multiport&nbsp; - this match allows for targets =
within a
  range <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  &nbsp;of port numbers vs. listing each port individually <br>
  # <br>
  #&nbsp; &nbsp; ipt_state&nbsp; &nbsp; &nbsp; - this match allows to =
catch
  packets with various <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  &nbsp;IP and TCP flags set/unset <br>
  # <br>
  #&nbsp; &nbsp; ipt_unclean&nbsp; &nbsp; - this match allows to catch =
packets
  that have invalid <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  &nbsp;IP/TCP flags set <br>
  # <br>
  #&nbsp; &nbsp; iptable_filter - this module allows for packets to be =
DROPped,
  <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  &nbsp;REJECTed, or LOGged.&nbsp; This module automatically <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  &nbsp;loads the following modules: <br>
  # <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  &nbsp;ipt_LOG - this target allows for packets to be <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;logged <br>
  # <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  &nbsp;ipt_REJECT - this target DROPs the packet and returns <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; a configurable ICMP packet =
back to
  the <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sender. <br>
  # <br>
  <br>
  echo -e &quot;&nbsp; &nbsp;Done loading modules.\n&quot; <br>
  <br>
  <br>
  <br>
  #CRITICAL:&nbsp; Enable IP forwarding since it is disabled by default =
since <br>
  # <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Redhat Users:&nbsp; you may =
try
  changing the options in <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
  &nbsp; &nbsp; /etc/sysconfig/network from: <br>
  # <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
  &nbsp;FORWARD_IPV4=3Dfalse <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
  &nbsp; &nbsp; &nbsp; &nbsp;to <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
  &nbsp;FORWARD_IPV4=3Dtrue <br>
  # <br>
  echo &quot;&nbsp; &nbsp;Enabling forwarding..&quot; <br>
  echo 1 &gt; /proc/sys/net/ipv4/ip_forward <br>
  <br>
  <br>
  # Dynamic IP users: <br>
  # <br>
  #&nbsp; &nbsp;If you get your IP address dynamically from SLIP, PPP, =
or DHCP,
  <br>
  #&nbsp; &nbsp;enable this following option.&nbsp; This enables
  dynamic-address hacking <br>
  #&nbsp; &nbsp;which makes the life with Diald and similar programs =
much
  easier. <br>
  # <br>
  echo &quot;&nbsp; &nbsp;Enabling DynamicAddr..&quot; <br>
  echo &quot;1&quot; &gt; /proc/sys/net/ipv4/ip_dynaddr <br>
  <br>
  <br>
  # Enable simple IP forwarding and Masquerading <br>
  # <br>
  #&nbsp; NOTE:&nbsp; In IPTABLES speak, IP Masquerading is a form of =
SourceNAT
  or SNAT. <br>
  # <br>
  #&nbsp; NOTE #2:&nbsp; The following is an example for an internal LAN
  address in the <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 192.168.0.x network with a
  255.255.255.0 or a &quot;24&quot; bit subnet mask <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; connecting to the Internet =
on
  external interface &quot;eth0&quot;.&nbsp; This <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; example will MASQ internal =
traffic
  out to the Internet but not <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; allow non-initiated traffic =
into
  your internal network. <br>
  # <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;** Please change the above network
  numbers, subnet mask, and your <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*** Internet connection interface =
name to
  match your setup <br>
  #&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br>
  <br>
  <br>
  #Clearing any previous configuration <br>
  # <br>
  #&nbsp; Unless specified, the defaults for INPUT and OUTPUT is ACCEPT =
<br>
  #&nbsp; &nbsp; The default for FORWARD is DROP (REJECT is not a valid =
policy)
  <br>
  # <br>
  echo &quot;&nbsp; &nbsp;Clearing any existing rules and setting =
default
  policy..&quot; <br>
  $IPTABLES -P INPUT ACCEPT <br>
  $IPTABLES -F INPUT <br>
  $IPTABLES -P OUTPUT ACCEPT <br>
  $IPTABLES -F OUTPUT <br>
  $IPTABLES -P FORWARD DROP <br>
  $IPTABLES -F FORWARD <br>
  $IPTABLES -t nat -F <br>
  <br>
  echo &quot;&nbsp; &nbsp;FWD: Allow all connections OUT and only =
existing and
  related ones IN&quot; <br>
  $IPTABLES -A FORWARD -i $TEQLIF -o $INTIF -m state --state
  ESTABLISHED,RELATED -j ACCEPT <br>
  $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state =
ESTABLISHED,RELATED
  -j ACCEPT <br>
  $IPTABLES -A FORWARD -i $EXTIF2 -o $INTIF -m state --state
  ESTABLISHED,RELATED -j ACCEPT <br>
  $IPTABLES -A FORWARD -i $EXTIF3 -o $INTIF -m state --state
  ESTABLISHED,RELATED -j ACCEPT <br>
  $IPTABLES -A FORWARD -i $INTIF -o $TEQLIF -j ACCEPT <br>
  $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT <br>
  $IPTABLES -A FORWARD -i $INTIF -o $EXTIF3 -j ACCEPT <br>
  $IPTABLES -A FORWARD -i $INTIF -o $EXTIF2 -j ACCEPT <br>
  $IPTABLES -A FORWARD -j LOG <br>
  <br>
  echo &quot;&nbsp; &nbsp;Enabling SNAT (MASQUERADE) functionality on
  $TEQLIF&quot; <br>
  $IPTABLES -t nat -A POSTROUTING -o $TEQLIF -j MASQUERADE <br>
  $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE <br>
  $IPTABLES -t nat -A POSTROUTING -o $EXTIF2 -j MASQUERADE <br>
  $IPTABLES -t nat -A POSTROUTING -o $EXTIF3 -j MASQUERADE <br>
  <br>
  iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
  --clamp-mss-to-pmtu <br>
  <br>
  echo -e &quot;\nrc.firewall-2.6 v$FWVER done.\n&quot; =
<o:p></o:p></span></font></p>
  </td>
 </tr>
</table>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><br>
<br>
<span class=3Dpostbody>Now this works well in most cases, but for some =
reasons
when a computer on the internal lan wants to visit a site, it may take =
about
20-30 seconds longer than it should for the site to come up. If you go =
back to
this routing machine, and pull up a dmesg, a whole slew of this comes =
up: </span><o:p></o:p></span></font></p>

<div align=3Dcenter>

<table class=3DMsoNormalTable border=3D0 cellspacing=3D1 cellpadding=3D0 =
width=3D"90%"
 style=3D'width:90.0%'>
 <tr>
  <td style=3D'padding:2.25pt 2.25pt 2.25pt 2.25pt'>
  <p class=3DMsoNormal><span class=3Dgenmed><b><font size=3D3 =
face=3D"Times New Roman"><span
  =
style=3D'font-size:12.0pt;font-weight:bold'>Quote:</span></font></b></spa=
n><o:p></o:p></p>
  </td>
 </tr>
 <tr>
  <td style=3D'padding:2.25pt 2.25pt 2.25pt 2.25pt'>
  <p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span
  style=3D'font-size:12.0pt'>MASQUERADE: Route sent us somewhere else. =
<br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  printk: 1 messages suppressed. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  printk: 2 messages suppressed. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. <br>
  MASQUERADE: Route sent us somewhere else. =
<o:p></o:p></span></font></p>
  </td>
 </tr>
</table>

</div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><br>
<br>
<span class=3Dpostbody>Now adding the extra lines for the interfaces =
other than
TEQL0 (ex ETH0,ETH1, ETH3) seemed to lessen how many of these messages =
were
actually shown and how badly the performance originally was. I can't =
seem to
figure out why it wants to route through any other device than TEQL0 =
however,
with those extra lines for the physcial interfaces or without. =
</span><br>
<br>
<span class=3Dpostbody>Anyone have any clue what to =
do?</span></span></font><font
size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;font-family:Arial'><o:p></o:p></span></font></p=
>

</div>

</body>

</html>

------=_NextPart_000_0000_01C401F9.77AD0A10--


