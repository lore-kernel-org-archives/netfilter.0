From: "Gary Lee" <gary@leahander.com>
Subject: can't load the script
Date: Thu, 9 Jan 2003 12:22:17 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003401c2b796$b27ae0d0$4900a8c0@knitting.leahander.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0035_01C2B7D9.C09FA770"
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

------=_NextPart_000_0035_01C2B7D9.C09FA770
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,
=20
I got the problem with my script.......every time I try to run my =
script,
the system will say command not found.....what's wrong?....How can I =
check
that I have all components installed for netfilter??....Here is my =
script:
=20
#!/bin/sh
#
# rc.firewall-2.4-stronger
#
=20

echo -e "\nLoading STRONGER rc.firewall - version $FWVER..\n"
=20

#IPTABLES=3D/sbin/iptables
#IPTABLES=3D/usr/local/sbin/iptables
#
LSMOD=3D/sbin/lsmod
DEPMOD=3D/sbin/depmod
INSMOD=3D/sbin/insmod
GREP=3D/bin/grep
AWK=3D/bin/awk
SED=3D/bin/sed
IFCONFIG=3D/sbin/ifconfig
=20
#
EXTIF=3D"eth0"
INTIF=3D"eth1"
echo "  External Interface:  $EXTIF"
echo "  Internal Interface:  $INTIF"
echo "  ---"
=20

#
#EXTIP=3D"`$IFCONFIG $EXTIF | $AWK \
 #/$EXTIF/'{next}//{split($0,a,":");split(a[2],a," ");print =
a[1];exit}'`"
=20

#  STATIC IP addresses:
#
#  # out the EXTIP line above and un-# out the EXTIP line below
#
EXTIP=3D"218.x.x.x"
echo "  External IP: $EXTIP"
echo "  ---"
=20

# Assign the internal TCP/IP network and IP address
INTNET=3D"10.126.0.0/24"
INTIP=3D"10.126.0.63/24"
echo "  Internal Network: $INTNET"
echo "  Internal IP:      $INTIP"
echo "  ---"
=20
# Setting a few other local variables
#
UNIVERSE=3D"0.0.0.0/0"
=20
# Some Servers
MAIL=3D"203.x.x.x"
DNS1=3D"210.x.x.x"
DNS2=3D"210.x.x.x"
DNS3=3D"218.x.x.x"
SERVER1=3D"203.x.x.x"
=20
# ports
UPORTS=3D"1024:65535"
=20

#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
echo "  - Verifying that all kernel modules are ok"
$DEPMOD -a
=20
echo -en "    Loading kernel modules: "
=20
# With the new IPTABLES code, the core MASQ functionality is now either
# modular or compiled into the kernel.  This HOWTO shows ALL IPTABLES
# options as MODULES.  If your kernel is compiled correctly, there is
# NO need to load the kernel modules manually. =20
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
=20

#Load the IPTABLES filtering module - "iptable_filter"=20
#
#  - Loaded automatically when filter policies are activated
=20

#  - Loaded manually to clean up kernel auto-loading timing issues
#
echo -en "ip_conntrack, "
#
#
#
if [ -z "` $LSMOD | $GREP ip_conntrack | $AWK {'print $1'} `" ]; then
   $INSMOD ip_conntrack
fi
=20

#Load the FTP tracking mechanism for full FTP tracking
#
# Enabled by default -- insert a "#" on the next line to deactivate
#
echo -e "ip_conntrack_ftp, "
#
#Verify the module isn't loaded.  If it is, skip it
#
if [ -z "` $LSMOD | $GREP ip_conntrack_ftp | $AWK {'print $1'} `" ]; =
then
   $INSMOD ip_conntrack_ftp
fi
=20

#Load the IRC tracking mechanism for full IRC tracking
#
# Enabled by default -- insert a "#" on the next line to deactivate
#
echo -en "                             ip_conntrack_irc, "
#
#Verify the module isn't loaded.  If it is, skip it
#
if [ -z "` $LSMOD | $GREP ip_conntrack_irc | $AWK {'print $1'} `" ]; =
then
   $INSMOD ip_conntrack_irc
fi
=20

#Load the general IPTABLES NAT code - "iptable_nat"
#  - Loaded automatically when MASQ functionality is turned on
#=20
#  - Loaded manually to clean up kernel auto-loading timing issues
#
echo -en "iptable_nat, "
#
#Verify the module isn't loaded.  If it is, skip it
#
if [ -z "` $LSMOD | $GREP iptable_nat | $AWK {'print $1'} `" ]; then
   $INSMOD iptable_nat
fi
=20

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
=20
echo "  ---"
=20
=20
=20
#  Enable IP forwarding
#
#
echo "  Enabling forwarding.."
echo 1 > /proc/sys/net/ipv4/ip_forward
=20
=20
=20
#########################################################################=
###
#
#
# Enable Stronger IP forwarding and Masquerading
#
=20
#Clearing any previous configuration
#
=20
echo "  Clearing any existing rules and setting default policy to =
DROP.."
iptables -P INPUT DROP =20
iptables -F INPUT=20
iptables -P OUTPUT DROP =20
iptables -F OUTPUT=20
iptables -P FORWARD DROP =20
iptables -F FORWARD=20
iptables -F -t nat
=20
#Not needed and it will only load the unneeded kernel module
#iptables -F -t mangle
#
# Flush the user chain.. if it exists
if [ -n "`iptables -L | $GREP drop-and-log-it`" ]; then
   iptables -F drop-and-log-it
fi
#
# Delete all User-specified chains
iptables -X
#
# Reset all IPTABLES counters
iptables -Z
=20

#Configuring specific CHAINS for later use in the ruleset
#
=20
echo "  Creating a DROP chain.."
iptables -N drop-and-log-it
iptables -A drop-and-log-it -j LOG --log-level info=20
iptables -A drop-and-log-it -j DROP
=20
echo -e "\n   - Loading INPUT rulesets"
=20

#######################################################################
# INPUT: Incoming traffic from various interfaces.  All rulesets are=20
#        already flushed and set to a default policy of DROP.=20
#
=20
# loopback interfaces are valid.
#
iptables -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
=20

# local interface, local machines, going anywhere is valid
#
iptables -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT
=20

# remote interface, claiming to be local machines, IP spoofing, get lost
#
iptables -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it
=20

# external interface, from any source, for ICMP traffic is valid
#
#  If you would like your machine to "ping" from the Internet,=20
#  enable this next line
#
#iptables -A INPUT -i $EXTIF -p ICMP -s $UNIVERSE -d $EXTIP -j ACCEPT
=20

# remote interface, any source, going to permanent PPP address is valid
#
#iptables -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -j ACCEPT
=20

# Allow any related traffic coming back to the MASQ server in
#
iptables -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state \
 ESTABLISHED,RELATED -j ACCEPT
=20
# HTTPd - Enable the following lines if you run an EXTERNAL WWW server
#
#echo -e "      - Allowing EXTERNAL access to the WWW server"
iptables -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \
 -p tcp -s $UNIVERSE -d $EXTIP --dport 80 -j ACCEPT
=20
# SSH - Enable the SSH connection
iptables -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \=20
 -p tcp -s $UNIVERSE -d $EXTIP --dport 22 -j ACCEPT
=20
# VNC connection
iptables -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \
 -p tcp -s $UNIVERSE -d $EXTIP --dport 5900 -j ACCEPT
=20
# DNS=20
iptables -A INPUT -i $EXTIF -m state --state NEW -p udp -s $DNS1 --sport =
53
\
 -d $EXTIP --dport 53 -j ACCEPT
iptables -A INPUT -i $EXTIF -m state --state NEW -p tcp ! --syn -s DNS1 =
\
 --sport 53 -d $EXTIP --dport 53 -j ACCEPT
iptables -A INPUT -i $EXTIF -m state --state NEW -p udp -s $DNS2 --sport =
53
\
 -d $EXTIP --dport 53 -j ACCEPT
iptables -A INPUT -i $EXTIF -m state --state NEW -p tcp ! --syn -s DNS2 =
\
 --sport 53 -d $EXTIP --dport 53 -j ACCEPT
iptables -A INPUT -i $EXTIF -m state --state NEW -p udp -s $DNS3 --sport =
53
\
 -d $EXTIP --dport 53 -j ACCEPT
iptables -A INPUT -i $EXTIF -m state --state NEW -p tcp ! --syn -s DNS3 =
\
 --sport 53 -d $EXTIP --dport 53 -j ACCEPT
=20
# SUNRPC
iptables -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \
 -p tcp -s $SERVER1 -d $EXTIP --dport 111 -j ACCEPT
iptables -A INPUT -i $EXTIF -m state --state NEW,ESTABLISHED,RELATED \
 -p udp -s $SERVER1 -d $EXTIP --dport 111 -j ACCEPT
=20
#
# ----- End OPTIONAL Section -----
=20
=20
=20
# Catch all rule, all other incoming is denied and logged.=20
#
iptables -A INPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it
=20

echo -e "   - Loading OUTPUT rulesets"
=20
#######################################################################
# OUTPUT: Outgoing traffic from various interfaces.  All rulesets are=20
#         already flushed and set to a default policy of DROP.=20
#
=20
# loopback interface is valid.
#
iptables -A OUTPUT -o lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
=20

# local interfaces, any source going to local net is valid
#
iptables -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j ACCEPT
=20

# local interface, any source going to local net is valid
#
iptables -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -j ACCEPT
=20

# outgoing to local net on remote interface, stuffed routing, deny
#
iptables -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j drop-and-log-it
=20

# anything else outgoing on remote interface is valid
#
iptables -A OUTPUT -o $EXTIF -s $EXTIP -d $UNIVERSE -j ACCEPT
=20

# ----- Begin OPTIONAL Section -----
#
=20
# DHCPd - Enable the following lines if you run an INTERNAL DHCPd server
#         - Remove BOTH #s all the #s if you need this functionality.
#
#iptables -A OUTPUT -o $INTIF -p tcp -s $INTIP --sport 67 \
# -d 255.255.255.255 --dport 68 -j ACCEPT
#iptables -A OUTPUT -o $INTIF -p udp -s $INTIP --sport 67 \
# -d 255.255.255.255 --dport 68 -j ACCEPT
=20
# HTTP
iptables -A OUTPUT -o $EXTIF -m state --state NEW -p tcp -s $EXTIP \
 --sport $UPORTS --dport 80 -j ACCEPT
=20
# DNS
iptables -A OUTPUT -o $EXTIF -p udp -s $EXTIP --sport $UPORTS -d $DNS1 \
 --dport 53 -j ACCEPT
iptables -A OUTPUT -o $EXTIF -p udp -s $EXTIP --sport $UPORTS -d $DNS2 \
 --dport 53 -j ACCEPT
iptables -A OUTPUT -o $EXTIF -p tcp -s $EXTIP --sport $UPORTS -d $DNS1 \
 --dport 53 -j ACCEPT
iptables -A OUTPUT -o $EXTIF -p tcp -s $EXTIP --sport $UPORTS -d $DNS2 \
 --dport 53 -j ACCEPT
iptables -A OUTPUT -o $EXTIF -p udp -s $EXTIP --sport $UPORTS -d $DNS3 \
 --dport 53 -j ACCEPT
iptables -A OUTPUT -o $EXTIF -p tcp -s $EXTIP --sport $UPORTS -d $DNS3 \
 --dport 53 -j ACCEPT
=20
# VNC
iptables -A OUTPUT -o $EXTIF -m state --state NEW -p tcp -s $EXTIP \
 --sport $UPORTS --dport 5900 -j ACCEPT
=20
# SUNRPC
iptables -A OUTPUT -o $EXTIF -p tcp -s $EXTIP -d $UNIVERSE --dport 111 =
-j
ACCEPT
iptables -A OUTPUT -o $EXTIF -p udp -s $EXTIP -d $UNIVERSE --dport 111 =
-j
ACCEPT
=20
#
# ----- End OPTIONAL Section -----
=20
# Catch all rule, all other outgoing is denied and logged.=20
#
iptables -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it
=20

echo -e "   - Loading FORWARD rulesets"
=20
#######################################################################
# FORWARD: Enable Forwarding and thus IPMASQ
#
=20
echo "     - FWD: Allow all connections OUT and only existing/related =
IN"
iptables -A FORWARD -i $EXTIF -o $INTIF -m state --state =
ESTABLISHED,RELATED
\
 -j ACCEPT
iptables -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
=20
# Catch all rule, all other forwarding is denied and logged.=20
#
iptables -A FORWARD -j drop-and-log-it
=20

echo "     - NAT: Enabling SNAT (MASQUERADE) functionality on $EXTIF"
#
#More liberal form
#iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
#
#Stricter form
iptables -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP
=20

#######################################################################
=20

echo -e "\nDone.\n"
=20
=20
=20
Best regards,
Gary Lee
=20
=20

------=_NextPart_000_0035_01C2B7D9.C09FA770
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3D"Times New Roman" size=3D2><SPAN =
class=3D679460804-09012003>Hi=20
all,</SPAN></FONT></DIV>
<DIV><FONT face=3D"Times New Roman" size=3D2><SPAN=20
class=3D679460804-09012003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Times New Roman" size=3D2><SPAN =
class=3D679460804-09012003>I got=20
the problem with my script.......every time I try to run my script, the =
system=20
will say command not found.....what's wrong?....How can I check that I =
have all=20
components installed for netfilter??....Here is my =
script:</SPAN></FONT></DIV>
<DIV><FONT face=3D"Times New Roman" size=3D2><SPAN=20
class=3D679460804-09012003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Times New Roman" size=3D2><SPAN=20
class=3D679460804-09012003>#!/bin/sh<BR>#<BR>#=20
rc.firewall-2.4-stronger<BR>#</SPAN></FONT></DIV>
<DIV>&nbsp;</DIV><FONT face=3D"Times New Roman" size=3D2><SPAN=20
class=3D679460804-09012003>
<DIV><BR>echo -e "\nLoading STRONGER rc.firewall - version =
$FWVER..\n"</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>#IPTABLES=3D/sbin/iptables<BR>#IPTABLES=3D/usr/local/sbin/iptabl=
es<BR>#<BR>LSMOD=3D/sbin/lsmod<BR>DEPMOD=3D/sbin/depmod<BR>INSMOD=3D/sbin=
/insmod<BR>GREP=3D/bin/grep<BR>AWK=3D/bin/awk<BR>SED=3D/bin/sed<BR>IFCONF=
IG=3D/sbin/ifconfig</DIV>
<DIV>&nbsp;</DIV>
<DIV>#<BR>EXTIF=3D"eth0"<BR>INTIF=3D"eth1"<BR>echo "&nbsp; External =
Interface:&nbsp;=20
$EXTIF"<BR>echo "&nbsp; Internal Interface:&nbsp; $INTIF"<BR>echo =
"&nbsp;=20
---"</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>#<BR>#EXTIP=3D"`$IFCONFIG $EXTIF | $AWK=20
\<BR>&nbsp;#/$EXTIF/'{next}//{split($0,a,":");split(a[2],a," ");print=20
a[1];exit}'`"</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>#&nbsp; STATIC IP addresses:<BR>#<BR>#&nbsp; # out the EXTIP =
line above=20
and un-# out the EXTIP line below<BR>#<BR>EXTIP=3D"218.x.x.x"<BR>echo =
"&nbsp;=20
External IP: $EXTIP"<BR>echo "&nbsp; ---"</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR># Assign the internal TCP/IP network and IP=20
address<BR>INTNET=3D"10.126.0.0/24"<BR>INTIP=3D"10.126.0.63/24"<BR>echo =
"&nbsp;=20
Internal Network: $INTNET"<BR>echo "&nbsp; Internal=20
IP:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $INTIP"<BR>echo "&nbsp; ---"</DIV>
<DIV>&nbsp;</DIV>
<DIV># Setting a few other local =
variables<BR>#<BR>UNIVERSE=3D"0.0.0.0/0"</DIV>
<DIV>&nbsp;</DIV>
<DIV># Some=20
Servers<BR>MAIL=3D"203.x.x.x"<BR>DNS1=3D"210.x.x.x"<BR>DNS2=3D"210.x.x.x"=
<BR>DNS3=3D"218.x.x.x"<BR>SERVER1=3D"203.x.x.x"</DIV>
<DIV>&nbsp;</DIV>
<DIV># ports<BR>UPORTS=3D"1024:65535"</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<=
/DIV>
<DIV>&nbsp;</DIV>
<DIV>echo "&nbsp; - Verifying that all kernel modules are ok"<BR>$DEPMOD =

-a</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo -en "&nbsp;&nbsp;&nbsp; Loading kernel modules: "</DIV>
<DIV>&nbsp;</DIV>
<DIV># With the new IPTABLES code, the core MASQ functionality is now=20
either<BR># modular or compiled into the kernel.&nbsp; This HOWTO shows =
ALL=20
IPTABLES<BR># options as MODULES.&nbsp; If your kernel is compiled =
correctly,=20
there is<BR># NO need to load the kernel modules manually.&nbsp;=20
<BR>#<BR>#&nbsp; - Loaded manually to clean up kernel auto-loading =
timing=20
issues<BR>#<BR>echo -en "ip_tables, "<BR>#<BR>#Verify the module isn't=20
loaded.&nbsp; If it is, skip it<BR>#<BR>if [ -z "` $LSMOD | $GREP =
ip_tables |=20
$AWK {'print $1'} `" ]; then<BR>&nbsp;&nbsp; $INSMOD =
ip_tables<BR>fi</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>#Load the IPTABLES filtering module - "iptable_filter" =
<BR>#<BR>#&nbsp;=20
- Loaded automatically when filter policies are activated</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>#&nbsp; - Loaded manually to clean up kernel auto-loading =
timing=20
issues<BR>#<BR>echo -en "ip_conntrack, "<BR>#<BR>#<BR>#<BR>if [ -z "` =
$LSMOD |=20
$GREP ip_conntrack | $AWK {'print $1'} `" ]; then<BR>&nbsp;&nbsp; =
$INSMOD=20
ip_conntrack<BR>fi</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>#Load the FTP tracking mechanism for full FTP =
tracking<BR>#<BR>#=20
Enabled by default -- insert a "#" on the next line to =
deactivate<BR>#<BR>echo=20
-e "ip_conntrack_ftp, "<BR>#<BR>#Verify the module isn't loaded.&nbsp; =
If it is,=20
skip it<BR>#<BR>if [ -z "` $LSMOD | $GREP ip_conntrack_ftp | $AWK =
{'print $1'}=20
`" ]; then<BR>&nbsp;&nbsp; $INSMOD ip_conntrack_ftp<BR>fi</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>#Load the IRC tracking mechanism for full IRC =
tracking<BR>#<BR>#=20
Enabled by default -- insert a "#" on the next line to =
deactivate<BR>#<BR>echo=20
-en=20
"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=20
ip_conntrack_irc, "<BR>#<BR>#Verify the module isn't loaded.&nbsp; If it =
is,=20
skip it<BR>#<BR>if [ -z "` $LSMOD | $GREP ip_conntrack_irc | $AWK =
{'print $1'}=20
`" ]; then<BR>&nbsp;&nbsp; $INSMOD ip_conntrack_irc<BR>fi</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>#Load the general IPTABLES NAT code - "iptable_nat"<BR>#&nbsp; =
- Loaded=20
automatically when MASQ functionality is turned on<BR># <BR>#&nbsp; - =
Loaded=20
manually to clean up kernel auto-loading timing issues<BR>#<BR>echo -en=20
"iptable_nat, "<BR>#<BR>#Verify the module isn't loaded.&nbsp; If it is, =
skip=20
it<BR>#<BR>if [ -z "` $LSMOD | $GREP iptable_nat | $AWK {'print $1'} `" =
];=20
then<BR>&nbsp;&nbsp; $INSMOD iptable_nat<BR>fi</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>#Loads the FTP NAT functionality into the core IPTABLES =
code<BR>#=20
Required to support non-PASV FTP.<BR>#<BR># Enabled by default -- insert =
a "#"=20
on the next line to deactivate<BR>#<BR>echo -e =
"ip_nat_ftp"<BR>#<BR>#Verify the=20
module isn't loaded.&nbsp; If it is, skip it<BR>#<BR>if [ -z "` $LSMOD | =
$GREP=20
ip_nat_ftp | $AWK {'print $1'} `" ]; then<BR>&nbsp;&nbsp; $INSMOD=20
ip_nat_ftp<BR>fi</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo "&nbsp; ---"</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>#&nbsp; Enable IP forwarding<BR>#<BR>#<BR>echo "&nbsp; Enabling=20
forwarding.."<BR>echo 1 &gt; /proc/sys/net/ipv4/ip_forward</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>####################################################################=
#########<BR>#<BR>#=20
Enable Stronger IP forwarding and Masquerading<BR>#</DIV>
<DIV>&nbsp;</DIV>
<DIV>#Clearing any previous configuration<BR>#</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo "&nbsp; Clearing any existing rules and setting default policy =
to=20
DROP.."<BR>iptables -P INPUT DROP&nbsp; <BR>iptables -F INPUT =
<BR>iptables -P=20
OUTPUT DROP&nbsp; <BR>iptables -F OUTPUT <BR>iptables -P FORWARD =
DROP&nbsp;=20
<BR>iptables -F FORWARD <BR>iptables -F -t nat</DIV>
<DIV>&nbsp;</DIV>
<DIV>#Not needed and it will only load the unneeded kernel =
module<BR>#iptables=20
-F -t mangle<BR>#<BR># Flush the user chain.. if it exists<BR>if [ -n =
"`iptables=20
-L | $GREP drop-and-log-it`" ]; then<BR>&nbsp;&nbsp; iptables -F=20
drop-and-log-it<BR>fi<BR>#<BR># Delete all User-specified =
chains<BR>iptables=20
-X<BR>#<BR># Reset all IPTABLES counters<BR>iptables -Z</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>#Configuring specific CHAINS for later use in the =
ruleset<BR>#</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo "&nbsp; Creating a DROP chain.."<BR>iptables -N=20
drop-and-log-it<BR>iptables -A drop-and-log-it -j LOG --log-level info=20
<BR>iptables -A drop-and-log-it -j DROP</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo -e "\n&nbsp;&nbsp; - Loading INPUT rulesets"</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>################################################################=
#######<BR>#=20
INPUT: Incoming traffic from various interfaces.&nbsp; All rulesets are=20
<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; already flushed and set =
to a=20
default policy of DROP. <BR>#</DIV>
<DIV>&nbsp;</DIV>
<DIV># loopback interfaces are valid.<BR>#<BR>iptables -A INPUT -i lo -s =

$UNIVERSE -d $UNIVERSE -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR># local interface, local machines, going anywhere is=20
valid<BR>#<BR>iptables -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j=20
ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR># remote interface, claiming to be local machines, IP spoofing, =
get=20
lost<BR>#<BR>iptables -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j=20
drop-and-log-it</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR># external interface, from any source, for ICMP traffic is=20
valid<BR>#<BR>#&nbsp; If you would like your machine to "ping" from the=20
Internet, <BR>#&nbsp; enable this next line<BR>#<BR>#iptables -A INPUT =
-i $EXTIF=20
-p ICMP -s $UNIVERSE -d $EXTIP -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR># remote interface, any source, going to permanent PPP address =
is=20
valid<BR>#<BR>#iptables -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -j=20
ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR># Allow any related traffic coming back to the MASQ server=20
in<BR>#<BR>iptables -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state =
--state=20
\<BR>&nbsp;ESTABLISHED,RELATED -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV># HTTPd - Enable the following lines if you run an EXTERNAL WWW=20
server<BR>#<BR>#echo -e "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Allowing =
EXTERNAL=20
access to the WWW server"<BR>iptables -A INPUT -i $EXTIF -m state =
--state=20
NEW,ESTABLISHED,RELATED \<BR>&nbsp;-p tcp -s $UNIVERSE -d $EXTIP --dport =
80 -j=20
ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV># SSH - Enable the SSH connection<BR>iptables -A INPUT -i $EXTIF -m =
state=20
--state NEW,ESTABLISHED,RELATED \ <BR>&nbsp;-p tcp -s $UNIVERSE -d =
$EXTIP=20
--dport 22 -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV># VNC connection<BR>iptables -A INPUT -i $EXTIF -m state --state=20
NEW,ESTABLISHED,RELATED \<BR>&nbsp;-p tcp -s $UNIVERSE -d $EXTIP --dport =
5900 -j=20
ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV># DNS <BR>iptables -A INPUT -i $EXTIF -m state --state NEW -p udp =
-s $DNS1=20
--sport 53 \<BR>&nbsp;-d $EXTIP --dport 53 -j ACCEPT<BR>iptables -A =
INPUT -i=20
$EXTIF -m state --state NEW -p tcp ! --syn -s DNS1 \<BR>&nbsp;--sport 53 =
-d=20
$EXTIP --dport 53 -j ACCEPT<BR>iptables -A INPUT -i $EXTIF -m state =
--state NEW=20
-p udp -s $DNS2 --sport 53 \<BR>&nbsp;-d $EXTIP --dport 53 -j =
ACCEPT<BR>iptables=20
-A INPUT -i $EXTIF -m state --state NEW -p tcp ! --syn -s DNS2=20
\<BR>&nbsp;--sport 53 -d $EXTIP --dport 53 -j ACCEPT<BR>iptables -A =
INPUT -i=20
$EXTIF -m state --state NEW -p udp -s $DNS3 --sport 53 \<BR>&nbsp;-d =
$EXTIP=20
--dport 53 -j ACCEPT<BR>iptables -A INPUT -i $EXTIF -m state --state NEW =
-p tcp=20
! --syn -s DNS3 \<BR>&nbsp;--sport 53 -d $EXTIP --dport 53 -j =
ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV># SUNRPC<BR>iptables -A INPUT -i $EXTIF -m state --state=20
NEW,ESTABLISHED,RELATED \<BR>&nbsp;-p tcp -s $SERVER1 -d $EXTIP --dport =
111 -j=20
ACCEPT<BR>iptables -A INPUT -i $EXTIF -m state --state =
NEW,ESTABLISHED,RELATED=20
\<BR>&nbsp;-p udp -s $SERVER1 -d $EXTIP --dport 111 -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV>#<BR># ----- End OPTIONAL Section -----</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV># Catch all rule, all other incoming is denied and logged.=20
<BR>#<BR>iptables -A INPUT -s $UNIVERSE -d $UNIVERSE -j =
drop-and-log-it</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>echo -e "&nbsp;&nbsp; - Loading OUTPUT rulesets"</DIV>
<DIV>&nbsp;</DIV>
<DIV>####################################################################=
###<BR>#=20
OUTPUT: Outgoing traffic from various interfaces.&nbsp; All rulesets are =

<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; already flushed =
and set to=20
a default policy of DROP. <BR>#</DIV>
<DIV>&nbsp;</DIV>
<DIV># loopback interface is valid.<BR>#<BR>iptables -A OUTPUT -o lo -s=20
$UNIVERSE -d $UNIVERSE -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR># local interfaces, any source going to local net is=20
valid<BR>#<BR>iptables -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j =
ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR># local interface, any source going to local net is=20
valid<BR>#<BR>iptables -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -j =
ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR># outgoing to local net on remote interface, stuffed routing,=20
deny<BR>#<BR>iptables -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j=20
drop-and-log-it</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR># anything else outgoing on remote interface is =
valid<BR>#<BR>iptables=20
-A OUTPUT -o $EXTIF -s $EXTIP -d $UNIVERSE -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR># ----- Begin OPTIONAL Section -----<BR>#</DIV>
<DIV>&nbsp;</DIV>
<DIV># DHCPd - Enable the following lines if you run an INTERNAL DHCPd=20
server<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Remove =
BOTH #s all=20
the #s if you need this functionality.<BR>#<BR>#iptables -A OUTPUT -o =
$INTIF -p=20
tcp -s $INTIP --sport 67 \<BR># -d 255.255.255.255 --dport 68 -j=20
ACCEPT<BR>#iptables -A OUTPUT -o $INTIF -p udp -s $INTIP --sport 67 =
\<BR># -d=20
255.255.255.255 --dport 68 -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV># HTTP<BR>iptables -A OUTPUT -o $EXTIF -m state --state NEW -p tcp =
-s=20
$EXTIP \<BR>&nbsp;--sport $UPORTS --dport 80 -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV># DNS<BR>iptables -A OUTPUT -o $EXTIF -p udp -s $EXTIP --sport =
$UPORTS -d=20
$DNS1 \<BR>&nbsp;--dport 53 -j ACCEPT<BR>iptables -A OUTPUT -o $EXTIF -p =
udp -s=20
$EXTIP --sport $UPORTS -d $DNS2 \<BR>&nbsp;--dport 53 -j =
ACCEPT<BR>iptables -A=20
OUTPUT -o $EXTIF -p tcp -s $EXTIP --sport $UPORTS -d $DNS1 =
\<BR>&nbsp;--dport 53=20
-j ACCEPT<BR>iptables -A OUTPUT -o $EXTIF -p tcp -s $EXTIP --sport =
$UPORTS -d=20
$DNS2 \<BR>&nbsp;--dport 53 -j ACCEPT<BR>iptables -A OUTPUT -o $EXTIF -p =
udp -s=20
$EXTIP --sport $UPORTS -d $DNS3 \<BR>&nbsp;--dport 53 -j =
ACCEPT<BR>iptables -A=20
OUTPUT -o $EXTIF -p tcp -s $EXTIP --sport $UPORTS -d $DNS3 =
\<BR>&nbsp;--dport 53=20
-j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV># VNC<BR>iptables -A OUTPUT -o $EXTIF -m state --state NEW -p tcp =
-s $EXTIP=20
\<BR>&nbsp;--sport $UPORTS --dport 5900 -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV># SUNRPC<BR>iptables -A OUTPUT -o $EXTIF -p tcp -s $EXTIP -d =
$UNIVERSE=20
--dport 111 -j ACCEPT<BR>iptables -A OUTPUT -o $EXTIF -p udp -s $EXTIP =
-d=20
$UNIVERSE --dport 111 -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV>#<BR># ----- End OPTIONAL Section -----</DIV>
<DIV>&nbsp;</DIV>
<DIV># Catch all rule, all other outgoing is denied and logged.=20
<BR>#<BR>iptables -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j =
drop-and-log-it</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>echo -e "&nbsp;&nbsp; - Loading FORWARD rulesets"</DIV>
<DIV>&nbsp;</DIV>
<DIV>####################################################################=
###<BR>#=20
FORWARD: Enable Forwarding and thus IPMASQ<BR>#</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo "&nbsp;&nbsp;&nbsp;&nbsp; - FWD: Allow all connections OUT and =
only=20
existing/related IN"<BR>iptables -A FORWARD -i $EXTIF -o $INTIF -m state =
--state=20
ESTABLISHED,RELATED \<BR>&nbsp;-j ACCEPT<BR>iptables -A FORWARD -i =
$INTIF -o=20
$EXTIF -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV># Catch all rule, all other forwarding is denied and logged.=20
<BR>#<BR>iptables -A FORWARD -j drop-and-log-it</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>echo "&nbsp;&nbsp;&nbsp;&nbsp; - NAT: Enabling SNAT =
(MASQUERADE)=20
functionality on $EXTIF"<BR>#<BR>#More liberal form<BR>#iptables -t nat =
-A=20
POSTROUTING -o $EXTIF -j MASQUERADE<BR>#<BR>#Stricter form<BR>iptables =
-t nat -A=20
POSTROUTING -o $EXTIF -j SNAT --to $EXTIP</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>################################################################=
#######</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>echo -e "\nDone.\n"</DIV>
<DIV>&nbsp;</DIV>
<DIV></SPAN></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV align=3Dleft><FONT face=3D"Times New Roman" size=3D2>Best =
regards,</FONT></DIV>
<DIV align=3Dleft><FONT face=3D"Times New Roman" size=3D2>Gary =
Lee</FONT></DIV>
<DIV align=3Dleft><FONT face=3D"Times New Roman" =
size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Times New Roman" =
size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0035_01C2B7D9.C09FA770--


