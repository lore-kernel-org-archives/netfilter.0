From: Harry <hari76@omantel.net.om>
Subject: Re: Rules for Blocking Proxies...
Date: Wed, 21 Apr 2004 16:39:32 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004401c427f9$e70b6480$36b4fea9@SABNANIS>
References: <000b01c426f6$cc216f10$36b4fea9@SABNANIS>
 <200404201453.14678.Antony@Soft-Solutions.co.uk>
 <00ba01c426e3$a4d0de40$0c00a8c0@pepelui>
 <200404201537.12472.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_JIDgC2OHa1piCNA528B1xQ)"
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
To: Netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

--Boundary_(ID_JIDgC2OHa1piCNA528B1xQ)
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT

Hey All,

These are loads of recommendations, well I am using Windows 2000 Clients,
what i think should be best for my level of understanding is a simple set of
rules that can be added to my firewall script that will STOP all other
connections except the INTIF connection on which squid and Iptables listens.
I have attached my script, Pls suggest any modifications....

Regards
Harry



"In all this world, there is only you
When all else ceases, there is only you"
-- to my MASTER!
    Harish
harish@sabnanis.com
harish.sabnani@cyberhutoman.com
----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: "Netfilter" <netfilter@lists.netfilter.org>
Sent: Tuesday, April 20, 2004 7:37 AM
Subject: Re: Rules for Blocking Proxies...


> On Tuesday 20 April 2004 3:27 pm, Alexis wrote:
>
> > beside this.
> > You could remove privileges from the clients, even with an active
directory
> > implementation (ajjjj) or i think i saw cybercafe software that block
any
> > settings change on the client box.
>
> That is making some very big assumptions about what Operating System/s are
> running on the clients....
>
> Regards,
>
> Antony.
>
> --
> The truth is rarely pure, and never simple.
>
>  - Oscar Wilde
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>

--Boundary_(ID_JIDgC2OHa1piCNA528B1xQ)
Content-type: application/octet-stream; name=rc.firewall-2.4
Content-transfer-encoding: quoted-printable
Content-disposition: attachment; filename=rc.firewall-2.4

#!/bin/sh=0A=
#=0A=
# rc.firewall-2.4=0A=
FWVER=3D0.74=0A=
#=0A=
#               Initial SIMPLE IP Masquerade test for 2.4.x kernels=0A=
#               using IPTABLES.  =0A=
#=0A=
#               Once IP Masquerading has been tested, with this simple =0A=
#               ruleset, it is highly recommended to use a stronger =0A=
#               IPTABLES ruleset either given later in this HOWTO or =0A=
#               from another reputable resource.=0A=
#=0A=
#=0A=
#=0A=
# Log:=0A=
#       0.74 - the ruleset now uses modprobe vs. insmod=0A=
#       0.73 - REJECT is not a legal policy yet; back to DROP=0A=
#       0.72 - Changed the default block behavior to REJECT not DROP=0A=
#       0.71 - Added clarification that PPPoE users need to use=0A=
#              "ppp0" instead of "eth0" for their external interface=0A=
#       0.70 - Added commented option for IRC nat module=0A=
#            - Added additional use of environment variables =0A=
#            - Added additional formatting=0A=
#       0.63 - Added support for the IRC IPTABLES module=0A=
#       0.62 - Fixed a typo on the MASQ enable line that used eth0=0A=
#              instead of $EXTIF=0A=
#       0.61 - Changed the firewall to use variables for the internal=0A=
#              and external interfaces.=0A=
#       0.60 - 0.50 had a mistake where the ruleset had a rule to DROP=0A=
#              all forwarded packets but it didn't have a rule to ACCEPT=0A=
#              any packets to be forwarded either=0A=
#            - Load the ip_nat_ftp and ip_conntrack_ftp modules by =
default=0A=
#       0.50 - Initial draft=0A=
#=0A=
=0A=
echo -e "\n\nLoading simple rc.firewall version $FWVER..\n"=0A=
=0A=
=0A=
# The location of the iptables and kernel module programs=0A=
#=0A=
#   If your Linux distribution came with a copy of iptables, =0A=
#   most likely all the programs will be located in /sbin.  If =0A=
#   you manually compiled iptables, the default location will=0A=
#   be in /usr/local/sbin=0A=
#=0A=
# ** Please use the "whereis iptables" command to figure out =0A=
# ** where your copy is and change the path below to reflect =0A=
# ** your setup=0A=
#=0A=
IPTABLES=3D/sbin/iptables=0A=
#IPTABLES=3D/usr/local/sbin/iptables=0A=
DEPMOD=3D/sbin/depmod=0A=
MODPROBE=3D/sbin/modprobe=0A=
=0A=
=0A=
#Setting the EXTERNAL and INTERNAL interfaces for the network=0A=
#=0A=
#  Each IP Masquerade network needs to have at least one=0A=
#  external and one internal network.  The external network=0A=
#  is where the natting will occur and the internal network=0A=
#  should preferably be addressed with a RFC1918 private address=0A=
#  scheme.=0A=
#=0A=
#  For this example, "eth0" is external and "eth1" is internal"=0A=
#=0A=
#=0A=
#  NOTE:  If this doesnt EXACTLY fit your configuration, you must =0A=
#         change the EXTIF or INTIF variables above. For example: =0A=
#=0A=
#            If you are a PPPoE or analog modem user:=0A=
#=0A=
#               EXTIF=3D"ppp0" =0A=
#=0A=
#=0A=
EXTIF=3D"eth0"=0A=
INTIF=3D"eth1"=0A=
echo "   External Interface:  $EXTIF"=0A=
echo "   Internal Interface:  $INTIF"=0A=
=0A=
=0A=
#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
#=3D=3D No editing beyond this line is required for initial MASQ testing =
=3D=3D=0A=
=0A=
=0A=
echo -en "   loading modules: "=0A=
=0A=
# Need to verify that all modules have all required dependencies=0A=
#=0A=
echo "  - Verifying that all kernel modules are ok"=0A=
$DEPMOD -a=0A=
=0A=
# With the new IPTABLES code, the core MASQ functionality is now either=0A=
# modular or compiled into the kernel.  This HOWTO shows ALL IPTABLES=0A=
# options as MODULES.  If your kernel is compiled correctly, there is=0A=
# NO need to load the kernel modules manually.  =0A=
#=0A=
#  NOTE: The following items are listed ONLY for informational reasons.=0A=
#        There is no reason to manual load these modules unless your=0A=
#        kernel is either mis-configured or you intentionally disabled=0A=
#        the kernel module autoloader.=0A=
#=0A=
=0A=
# Upon the commands of starting up IP Masq on the server, the=0A=
# following kernel modules will be automatically loaded:=0A=
#=0A=
# NOTE:  Only load the IP MASQ modules you need.  All current IP MASQ =0A=
#        modules are shown below but are commented out from loading.=0A=
# =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
echo =
"----------------------------------------------------------------------"=0A=
=0A=
#Load the main body of the IPTABLES module - "iptable"=0A=
#  - Loaded automatically when the "iptables" command is invoked=0A=
#=0A=
#  - Loaded manually to clean up kernel auto-loading timing issues=0A=
#=0A=
echo -en "ip_tables, "=0A=
$MODPROBE ip_tables=0A=
=0A=
=0A=
#Load the IPTABLES filtering module - "iptable_filter" =0A=
#  - Loaded automatically when filter policies are activated=0A=
=0A=
=0A=
#Load the stateful connection tracking framework - "ip_conntrack"=0A=
#=0A=
# The conntrack  module in itself does nothing without other specific =0A=
# conntrack modules being loaded afterwards such as the =
"ip_conntrack_ftp"=0A=
# module=0A=
#=0A=
#  - This module is loaded automatically when MASQ functionality is =0A=
#    enabled =0A=
#=0A=
#  - Loaded manually to clean up kernel auto-loading timing issues=0A=
#=0A=
echo -en "ip_conntrack, "=0A=
$MODPROBE ip_conntrack=0A=
=0A=
=0A=
#Load the FTP tracking mechanism for full FTP tracking=0A=
#=0A=
# Enabled by default -- insert a "#" on the next line to deactivate=0A=
#=0A=
echo -en "ip_conntrack_ftp, "=0A=
$MODPROBE ip_conntrack_ftp=0A=
=0A=
=0A=
#Load the IRC tracking mechanism for full IRC tracking=0A=
#=0A=
# Enabled by default -- insert a "#" on the next line to deactivate=0A=
#=0A=
echo -en "ip_conntrack_irc, "=0A=
$MODPROBE ip_conntrack_irc=0A=
=0A=
=0A=
#Load the general IPTABLES NAT code - "iptable_nat"=0A=
#  - Loaded automatically when MASQ functionality is turned on=0A=
# =0A=
#  - Loaded manually to clean up kernel auto-loading timing issues=0A=
#=0A=
echo -en "iptable_nat, "=0A=
$MODPROBE iptable_nat=0A=
=0A=
=0A=
#Loads the FTP NAT functionality into the core IPTABLES code=0A=
# Required to support non-PASV FTP.=0A=
#=0A=
# Enabled by default -- insert a "#" on the next line to deactivate=0A=
#=0A=
echo -en "ip_nat_ftp, "=0A=
$MODPROBE ip_nat_ftp=0A=
=0A=
=0A=
#Loads the IRC NAT functionality into the core IPTABLES code=0A=
# Require to support NAT of IRC DCC requests=0A=
#=0A=
# Disabled by default -- remove the "#" on the next line to activate=0A=
#=0A=
#echo -e "ip_nat_irc"=0A=
#$MODPROBE ip_nat_irc=0A=
=0A=
echo =
"----------------------------------------------------------------------"=0A=
=0A=
# Just to be complete, here is a list of the remaining kernel modules =0A=
# and their function.  Please note that several modules should be only=0A=
# loaded by the correct master kernel module for proper operation.=0A=
# --------------------------------------------------------------------=0A=
#=0A=
#    ipt_mark       - this target marks a given packet for future action.=0A=
#                     This automatically loads the ipt_MARK module=0A=
#=0A=
#    ipt_tcpmss     - this target allows to manipulate the TCP MSS=0A=
#                     option for braindead remote firewalls.=0A=
#                     This automatically loads the ipt_TCPMSS module=0A=
#=0A=
#    ipt_limit      - this target allows for packets to be limited to=0A=
#                     to many hits per sec/min/hr=0A=
#=0A=
#    ipt_multiport  - this match allows for targets within a range=0A=
#                     of port numbers vs. listing each port individually=0A=
#=0A=
#    ipt_state      - this match allows to catch packets with various=0A=
#                     IP and TCP flags set/unset=0A=
#=0A=
#    ipt_unclean    - this match allows to catch packets that have =
invalid=0A=
#                     IP/TCP flags set=0A=
#=0A=
#    iptable_filter - this module allows for packets to be DROPped, =0A=
#                     REJECTed, or LOGged.  This module automatically =0A=
#                     loads the following modules:=0A=
#=0A=
#                     ipt_LOG - this target allows for packets to be =0A=
#                               logged=0A=
#=0A=
#                     ipt_REJECT - this target DROPs the packet and =
returns =0A=
#                                  a configurable ICMP packet back to =
the =0A=
#                                  sender.=0A=
# =0A=
#    iptable_mangle - this target allows for packets to be manipulated=0A=
#                     for things like the TCPMSS option, etc.=0A=
=0A=
echo -e "   Done loading modules.\n"=0A=
=0A=
=0A=
=0A=
#CRITICAL:  Enable IP forwarding since it is disabled by default since=0A=
#=0A=
#           Redhat Users:  you may try changing the options in=0A=
#                          /etc/sysconfig/network from:=0A=
#=0A=
#                       FORWARD_IPV4=3Dfalse=0A=
#                             to=0A=
#                       FORWARD_IPV4=3Dtrue=0A=
#=0A=
echo "   Enabling forwarding.."=0A=
echo "1" > /proc/sys/net/ipv4/ip_forward=0A=
=0A=
=0A=
# Dynamic IP users:=0A=
#=0A=
#   If you get your IP address dynamically from SLIP, PPP, or DHCP, =0A=
#   enable this following option.  This enables dynamic-address hacking=0A=
#   which makes the life with Diald and similar programs much easier.=0A=
#=0A=
#echo "   Enabling DynamicAddr.."=0A=
#echo "1" > /proc/sys/net/ipv4/ip_dynaddr=0A=
=0A=
=0A=
# Enable simple IP forwarding and Masquerading=0A=
#=0A=
#  NOTE:  In IPTABLES speak, IP Masquerading is a form of SourceNAT or =
SNAT.=0A=
#=0A=
#  NOTE #2:  The following is an example for an internal LAN address in =
the=0A=
#            192.168.0.x network with a 255.255.255.0 or a "24" bit =
subnet mask=0A=
#            connecting to the Internet on external interface "eth0".  =
This=0A=
#            example will MASQ internal traffic out to the Internet but =
not=0A=
#            allow non-initiated traffic into your internal network.=0A=
#=0A=
#            =0A=
#         ** Please change the above network numbers, subnet mask, and =
your =0A=
#         *** Internet connection interface name to match your setup=0A=
#         =0A=
=0A=
=0A=
#Clearing any previous configuration=0A=
#=0A=
#  Unless specified, the defaults for INPUT and OUTPUT is ACCEPT=0A=
#    The default for FORWARD is DROP (REJECT is not a valid policy)=0A=
#=0A=
echo "   Clearing any existing rules and setting default policy.."=0A=
$IPTABLES -P INPUT ACCEPT=0A=
$IPTABLES -F INPUT =0A=
$IPTABLES -P OUTPUT ACCEPT=0A=
$IPTABLES -F OUTPUT =0A=
$IPTABLES -P FORWARD DROP=0A=
$IPTABLES -F FORWARD =0A=
$IPTABLES -t nat -F=0A=
=0A=
echo "   FWD: Allow all connections OUT and only existing and related =
ones IN"=0A=
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state =
ESTABLISHED,RELATED -j ACCEPT=0A=
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT=0A=
                                                                         =
                                                    =0A=
# DROP BROADCAST TRAFFIC=0A=
$IPTABLES -A FORWARD -d 255.255.255.0/24 -j DROP=0A=
# DROP WINDOWS NETBIOS TRAFFIC=0A=
$IPTABLES -A FORWARD -p tcp --dport 135:139 -j DROP=0A=
$IPTABLES -A FORWARD -p udp --dport 135:139 -j DROP=0A=
$IPTABLES -A FORWARD -p tcp --dport 445 -j DROP=0A=
$IPTABLES -A FORWARD -p udp --dport 445 -j DROP=0A=
# DROP UNIX TRAFFIC=0A=
$IPTABLES -A FORWARD -p tcp --dport 111 -j DROP=0A=
$IPTABLES -A FORWARD -p udp --dport 111 -j DROP=0A=
$IPTABLES -A FORWARD -p tcp --dport 113 -j DROP=0A=
$IPTABLES -A FORWARD -p udp --dport 113 -j DROP=0A=
$IPTABLES -A FORWARD -p tcp --dport 513:515 -j DROP=0A=
$IPTABLES -A FORWARD -p udp --dport 513:515 -j DROP=0A=
# DROP LDAP=0A=
$IPTABLES -A FORWARD -p tcp --dport 389 -j DROP=0A=
$IPTABLES -A FORWARD -j LOG=0A=
echo "   Enabling SNAT (MASQUERADE) functionality on $EXTIF"=0A=
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE=0A=
=0A=
$IPTABLES -A INPUT -i lo -p all -j ACCEPT=0A=
$IPTABLES -A OUTPUT -o lo -p all -j ACCEPT=0A=
$IPTABLES -A INPUT -i $EXTIF -m state --state ESTABLISHED,RELATED -j =
ACCEPT=0A=
$IPTABLES -A INPUT -i $INTIF -s 10.10.10.0/24 -j ACCEPT=0A=
$IPTABLES -P INPUT DROP=0A=
=0A=
# IGNORE TCP SYN COOKIES (NOT WEB SITE COOKIES)=0A=
echo 1 > /proc/sys/net/ipv4/tcp_syncookies=0A=
# IGNORE ICMP BROADCASTS=0A=
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts=0A=
# IGNORE SPOOFED PACKETS=0A=
echo 1 >/proc/sys/net/ipv4/conf/$EXTIF/rp_filter=0A=
echo 1 >/proc/sys/net/ipv4/conf/$INTIF/rp_filter=0A=
# IGNORE SOURCE-ROUTED PACKETS (WILL NOT HURT ROUTING)=0A=
echo 0 > /proc/sys/net/ipv4/conf/$EXTIF/accept_source_route=0A=
echo 0 > /proc/sys/net/ipv4/conf/$INTIF/accept_source_route=0A=
# IGNORE ICMP REDIRECTS=0A=
echo 0 > /proc/sys/net/ipv4/conf/$EXTIF/accept_redirects=0A=
echo 0 > /proc/sys/net/ipv4/conf/$INTIF/accept_redirects=0A=
# DISABLE REDIRECT MESSAGES=0A=
echo 0 > /proc/sys/net/ipv4/conf/$INTIF/send_redirects=0A=
echo 0 > /proc/sys/net/ipv4/conf/$EXTIF/send_redirects=0A=
                                                                         =
                                                    =0A=
echo -e "\nDone.\n"=0A=

--Boundary_(ID_JIDgC2OHa1piCNA528B1xQ)--

