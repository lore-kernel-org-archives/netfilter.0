From: "mpboden" <mpboden@surfcity.net>
Subject: RE: my ftp problem sovled with response from Joel Newkirk...
Date: Thu, 6 Feb 2003 18:02:24 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b501c2ce4c$f5869730$483918ac@C1006818>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00B2_01C2CE09.E7465950"
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

------=_NextPart_000_00B2_01C2CE09.E7465950
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks to Joel Newkirk, here is the longwinded response he sent me:



Heavily snipped and re-commented script:


IPTABLES=3D/sbin/iptables

LSMOD=3D/sbin/lsmod
DEPMOD=3D/sbin/depmod
INSMOD=3D/sbin/insmod
GREP=3D/bin/grep
AWK=3D/bin/awk
SED=3D/bin/sed
IFCONFIG=3D/sbin/ifconfig

EXTIF=3D"eth0"
INTIF=3D"eth1"

EXTIP=3D"xxx.xxx.xxx.xxx"

INTNET=3D"192.168.1.0/24"
INTIP=3D"192.168.1.1/24"

# This is redundant, since they are both the same number in actual =
usage.
# It is likely that the intention for INTIP is to hold the IP of $INTIF=20
# interface on this machine, which should not have "/24" at the end.

UNIVERSE=3D"0.0.0.0/0"

# for what it is worth, this could be "0/0" and would work, but if you
# leave it out of rules entirely then this is the default anyway.

$DEPMOD -a

if [ -z "` $LSMOD | $GREP ip_tables | $AWK {'print $1'} `" ]; then
   $INSMOD ip_tables
fi

if [ -z "` $LSMOD | $GREP ip_conntrack | $AWK {'print $1'} `" ]; then
   $INSMOD ip_conntrack
fi

if [ -z "` $LSMOD | $GREP ip_conntrack_ftp | $AWK {'print $1'} `" ]; =
then
   $INSMOD ip_conntrack_ftp
fi

if [ -z "` $LSMOD | $GREP ip_conntrack_irc | $AWK {'print $1'} `" ]; =
then
   $INSMOD ip_conntrack_irc
fi

if [ -z "` $LSMOD | $GREP iptable_nat | $AWK {'print $1'} `" ]; then
   $INSMOD iptable_nat
fi

if [ -z "` $LSMOD | $GREP ip_nat_ftp | $AWK {'print $1'} `" ]; then
   $INSMOD ip_nat_ftp
fi

# You would probably find it faster, and much simpler to read, if you
# just use "INSMOD=3D/sbin/modprobe" and then $INSMOD each
# module without the if-fi construct.  modprobe checks if the module
# is loaded, and if not will load it with insmod, and does it silently.

echo "1" > /proc/sys/net/ipv4/ip_forward

# barring catastrophe it is not really an issue, but you shouldn't =
enable
# forwarding until AFTER your rules are in place, or at least until =
after
# you have set the DROP policy for FORWARD.

$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT DROP
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -F -t nat

if [ -n "`$IPTABLES -L | $GREP drop-and-log-it`" ]; then
   $IPTABLES -F drop-and-log-it
fi

# again, you could dispense with the if-fi construct here.  The worst
# that will happen is that you see "no chain/target/match by that name"=20
# either on the console or in the logfile.  Having it the way it is is a =

# more 'proper' approach if the script is re-entrant, but in such a case =

# the "-N drop-and-log-it" below will give you a warning instead if the=20
# "-F drop-and-log-it"... :^)

$IPTABLES -X

$IPTABLES -Z

$IPTABLES -N drop-and-log-it
$IPTABLES -A drop-and-log-it -j LOG --log-level info
$IPTABLES -A drop-and-log-it -j DROP

$IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT

$IPTABLES -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT

### OK, anything in from the LAN is accepted, regardless of what it is.
# Kind of loose, but if you are in control of all the machines it's safe =

# enough.

$IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it

# This is unlikely ever to match, because in the unlikely event that you =

# DO get a packet from the internet that is addressed back to the=20
# internet, it will end up in the FORWARD chain, since it isn't bound =
for=20
# this box's IP...

$IPTABLES -A INPUT -i $EXTIF -p ICMP -s $UNIVERSE -d $EXTIP -j ACCEPT

$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state \
 ESTABLISHED,RELATED -j ACCEPT

### This rule, together with the ip_conntrack_ftp module you loaded=20
### above, will allow both passive and active FTP connections through,=20
### once they are allowed to initiate, IE with the port 20 connection.

$IPTABLES -A INPUT -i $INTIF -p tcp --sport 68 --dport 67 -j ACCEPT
$IPTABLES -A INPUT -i $INTIF -p udp --sport 68 --dport 67 -j ACCEPT

$IPTABLES -A INPUT  -i $EXTIF -p tcp --sport 21 -m state --state
NEW,ESTABLISHED -j ACCEPT

### Ahhh.  You accept "new" connections with SOURCEport 21.
### However, incoming FTP connections will have DESTport 21.

$IPTABLES -A OUTPUT -o $EXTIF -p tcp --dport 21 -m state --state
NEW,ESTABLISHED -j ACCEPT

# This is redundant, since you allow ANY connection out from the local
#  box below.  However, if you ever tighten up the rules to only ACCEPT
# specific traffic, simply match "--dport 21" and skip state match.

# 1) Active ftp.
$IPTABLES -A INPUT  -i $EXTIF -p tcp --sport 20 -m state --state
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT -o $EXTIF -p tcp --dport 20 -m state --state
NEW,ESTABLISHED -j ACCEPT

# 2) Passive ftp.
$IPTABLES -A INPUT  -i $EXTIF -p tcp --sport 1024:65535 --dport=20
1024:65535 \
  -m state --state ESTABLISHED -j ACCEPT
$IPTABLES -A OUTPUT -o $EXTIF -p tcp --sport 1024:65535 --dport=20
1024:65535 \
  -m state --state ESTABLISHED,RELATED -j ACCEPT

### These (and the two for active, above) are also redundant.  You allow
### anything at all outbound anyway, and already have ESTABLISHED
### and RELATED state accepted for inbound.

$IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it


$IPTABLES -A OUTPUT -o lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT

$IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j ACCEPT

$IPTABLES -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -j ACCEPT

$IPTABLES -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j drop-and-log-it

$IPTABLES -A OUTPUT -o $EXTIF -s $EXTIP -d $UNIVERSE -j ACCEPT

$IPTABLES -A OUTPUT -o $INTIF -p tcp -s $INTIP --sport 67 \
 -d 255.255.255.255 --dport 68 -j ACCEPT
$IPTABLES -A OUTPUT -o $INTIF -p udp -s $INTIP --sport 67 \
 -d 255.255.255.255 --dport 68 -j ACCEPT

$IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it

# This rule should be 'safe', since you have the "-s $EXTIP" accept =
above
# However to be precise you'd be better off with:
# $IPTABLES -A OUTPUT -s ! $EXTIP -d $UNIVERSE -j drop-and-log-it
# which says "any source IP that is NOT $EXTIP"

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
ESTABLISHED,RELATED \
 -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

$IPTABLES -A FORWARD -j drop-and-log-it

$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP

# just as an aside, if you're not aware, you need to use
# "iptables -t nat -L" to list this rule.  the iptables command only=20
# deals with one table at a time, and the default is "-t filter".

------=_NextPart_000_00B2_01C2CE09.E7465950
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3502.4856" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Thanks to Joel Newkirk, here is the =
longwinded=20
response he sent me:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><BR>Heavily snipped and re-commented=20
script:<BR><BR><BR>IPTABLES=3D/sbin/iptables<BR><BR>LSMOD=3D/sbin/lsmod<B=
R>DEPMOD=3D/sbin/depmod<BR>INSMOD=3D/sbin/insmod<BR>GREP=3D/bin/grep<BR>A=
WK=3D/bin/awk<BR>SED=3D/bin/sed<BR>IFCONFIG=3D/sbin/ifconfig<BR><BR>EXTIF=
=3D"eth0"<BR>INTIF=3D"eth1"<BR><BR>EXTIP=3D"xxx.xxx.xxx.xxx"<BR><BR>INTNE=
T=3D"192.168.1.0/24"<BR>INTIP=3D"192.168.1.1/24"<BR><BR>#=20
This is redundant, since they are both the same number in actual =
usage.<BR># It=20
is likely that the intention for INTIP is to hold the IP of $INTIF <BR># =

interface on this machine, which should not have "/24" at the=20
end.<BR><BR>UNIVERSE=3D"0.0.0.0/0"<BR><BR># for what it is worth, this =
could be=20
"0/0" and would work, but if you<BR># leave it out of rules entirely =
then this=20
is the default anyway.<BR><BR>$DEPMOD -a<BR><BR>if [ -z "` $LSMOD | =
$GREP=20
ip_tables | $AWK {'print $1'} `" ]; then<BR>&nbsp;&nbsp; $INSMOD=20
ip_tables<BR>fi<BR><BR>if [ -z "` $LSMOD | $GREP ip_conntrack | $AWK =
{'print=20
$1'} `" ]; then<BR>&nbsp;&nbsp; $INSMOD ip_conntrack<BR>fi<BR><BR>if [ =
-z "`=20
$LSMOD | $GREP ip_conntrack_ftp | $AWK {'print $1'} `" ]; =
then<BR>&nbsp;&nbsp;=20
$INSMOD ip_conntrack_ftp<BR>fi<BR><BR>if [ -z "` $LSMOD | $GREP =
ip_conntrack_irc=20
| $AWK {'print $1'} `" ]; then<BR>&nbsp;&nbsp; $INSMOD=20
ip_conntrack_irc<BR>fi<BR><BR>if [ -z "` $LSMOD | $GREP iptable_nat | =
$AWK=20
{'print $1'} `" ]; then<BR>&nbsp;&nbsp; $INSMOD =
iptable_nat<BR>fi<BR><BR>if [ -z=20
"` $LSMOD | $GREP ip_nat_ftp | $AWK {'print $1'} `" ]; =
then<BR>&nbsp;&nbsp;=20
$INSMOD ip_nat_ftp<BR>fi<BR><BR># You would probably find it faster, and =
much=20
simpler to read, if you<BR># just use "INSMOD=3D/sbin/modprobe" and then =
$INSMOD=20
each<BR># module without the if-fi construct.&nbsp; modprobe checks if =
the=20
module<BR># is loaded, and if not will load it with insmod, and does it=20
silently.<BR><BR>echo "1" &gt; /proc/sys/net/ipv4/ip_forward<BR><BR># =
barring=20
catastrophe it is not really an issue, but you shouldn't enable<BR># =
forwarding=20
until AFTER your rules are in place, or at least until after<BR># you =
have set=20
the DROP policy for FORWARD.<BR><BR>$IPTABLES -P INPUT DROP<BR>$IPTABLES =
-F=20
INPUT<BR>$IPTABLES -P OUTPUT DROP<BR>$IPTABLES -F OUTPUT<BR>$IPTABLES -P =
FORWARD=20
DROP<BR>$IPTABLES -F FORWARD<BR>$IPTABLES -F -t nat<BR><BR>if [ -n =
"`$IPTABLES=20
-L | $GREP drop-and-log-it`" ]; then<BR>&nbsp;&nbsp; $IPTABLES -F=20
drop-and-log-it<BR>fi<BR><BR># again, you could dispense with the if-fi=20
construct here.&nbsp; The worst<BR># that will happen is that you see =
"no=20
chain/target/match by that name" <BR># either on the console or in the=20
logfile.&nbsp; Having it the way it is is a <BR># more 'proper' approach =
if the=20
script is re-entrant, but in such a case <BR># the "-N drop-and-log-it" =
below=20
will give you a warning instead if the <BR># "-F drop-and-log-it"...=20
:^)<BR><BR>$IPTABLES -X<BR><BR>$IPTABLES -Z<BR><BR>$IPTABLES -N=20
drop-and-log-it<BR>$IPTABLES -A drop-and-log-it -j LOG --log-level=20
info<BR>$IPTABLES -A drop-and-log-it -j DROP<BR><BR>$IPTABLES -A INPUT =
-i lo -s=20
$UNIVERSE -d $UNIVERSE -j ACCEPT<BR><BR>$IPTABLES -A INPUT -i $INTIF -s =
$INTNET=20
-d $UNIVERSE -j ACCEPT<BR><BR>### OK, anything in from the LAN is =
accepted,=20
regardless of what it is.<BR># Kind of loose, but if you are in control =
of all=20
the machines it's safe <BR># enough.<BR><BR>$IPTABLES -A INPUT -i $EXTIF =
-s=20
$INTNET -d $UNIVERSE -j drop-and-log-it<BR><BR># This is unlikely ever =
to match,=20
because in the unlikely event that you <BR># DO get a packet from the =
internet=20
that is addressed back to the <BR># internet, it will end up in the =
FORWARD=20
chain, since it isn't bound for <BR># this box's IP...<BR><BR>$IPTABLES =
-A INPUT=20
-i $EXTIF -p ICMP -s $UNIVERSE -d $EXTIP -j ACCEPT<BR><BR>$IPTABLES -A =
INPUT -i=20
$EXTIF -s $UNIVERSE -d $EXTIP -m state --state =
\<BR>&nbsp;ESTABLISHED,RELATED -j=20
ACCEPT<BR><BR>### This rule, together with the ip_conntrack_ftp module =
you=20
loaded <BR>### above, will allow both passive and active FTP connections =

through, <BR>### once they are allowed to initiate, IE with the port 20=20
connection.<BR><BR>$IPTABLES -A INPUT -i $INTIF -p tcp --sport 68 =
--dport 67 -j=20
ACCEPT<BR>$IPTABLES -A INPUT -i $INTIF -p udp --sport 68 --dport 67 -j=20
ACCEPT<BR><BR>$IPTABLES -A INPUT&nbsp; -i $EXTIF -p tcp --sport 21 -m =
state=20
--state<BR>NEW,ESTABLISHED -j ACCEPT<BR><BR>### Ahhh.&nbsp; You accept =
"new"=20
connections with SOURCEport 21.<BR>### However, incoming FTP connections =
will=20
have DESTport 21.<BR><BR>$IPTABLES -A OUTPUT -o $EXTIF -p tcp --dport 21 =
-m=20
state --state<BR>NEW,ESTABLISHED -j ACCEPT<BR><BR># This is redundant, =
since you=20
allow ANY connection out from the local<BR>#&nbsp; box below.&nbsp; =
However, if=20
you ever tighten up the rules to only ACCEPT<BR># specific traffic, =
simply match=20
"--dport 21" and skip state match.<BR><BR># 1) Active ftp.<BR>$IPTABLES =
-A=20
INPUT&nbsp; -i $EXTIF -p tcp --sport 20 -m state =
--state<BR>ESTABLISHED,RELATED=20
-j ACCEPT<BR>$IPTABLES -A OUTPUT -o $EXTIF -p tcp --dport 20 -m state=20
--state<BR>NEW,ESTABLISHED -j ACCEPT<BR><BR># 2) Passive =
ftp.<BR>$IPTABLES -A=20
INPUT&nbsp; -i $EXTIF -p tcp --sport 1024:65535 --dport <BR>1024:65535=20
\<BR>&nbsp; -m state --state ESTABLISHED -j ACCEPT<BR>$IPTABLES -A =
OUTPUT -o=20
$EXTIF -p tcp --sport 1024:65535 --dport <BR>1024:65535 \<BR>&nbsp; -m =
state=20
--state ESTABLISHED,RELATED -j ACCEPT<BR><BR>### These (and the two for =
active,=20
above) are also redundant.&nbsp; You allow<BR>### anything at all =
outbound=20
anyway, and already have ESTABLISHED<BR>### and RELATED state accepted =
for=20
inbound.<BR><BR>$IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j=20
drop-and-log-it<BR><BR><BR>$IPTABLES -A OUTPUT -o lo -s $UNIVERSE -d =
$UNIVERSE=20
-j ACCEPT<BR><BR>$IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j=20
ACCEPT<BR><BR>$IPTABLES -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -j=20
ACCEPT<BR><BR>$IPTABLES -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j=20
drop-and-log-it<BR><BR>$IPTABLES -A OUTPUT -o $EXTIF -s $EXTIP -d =
$UNIVERSE -j=20
ACCEPT<BR><BR>$IPTABLES -A OUTPUT -o $INTIF -p tcp -s $INTIP --sport 67=20
\<BR>&nbsp;-d 255.255.255.255 --dport 68 -j ACCEPT<BR>$IPTABLES -A =
OUTPUT -o=20
$INTIF -p udp -s $INTIP --sport 67 \<BR>&nbsp;-d 255.255.255.255 --dport =
68 -j=20
ACCEPT<BR><BR>$IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j=20
drop-and-log-it<BR><BR># This rule should be 'safe', since you have the =
"-s=20
$EXTIP" accept above<BR># However to be precise you'd be better off =
with:<BR>#=20
$IPTABLES -A OUTPUT -s ! $EXTIP -d $UNIVERSE -j drop-and-log-it<BR># =
which says=20
"any source IP that is NOT $EXTIP"<BR><BR>$IPTABLES -A FORWARD -i $EXTIF =
-o=20
$INTIF -m state --state<BR>ESTABLISHED,RELATED \<BR>&nbsp;-j =
ACCEPT<BR>$IPTABLES=20
-A FORWARD -i $INTIF -o $EXTIF -j ACCEPT<BR><BR>$IPTABLES -A FORWARD -j=20
drop-and-log-it<BR><BR>$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT =
--to=20
$EXTIP<BR><BR># just as an aside, if you're not aware, you need to =
use<BR>#=20
"iptables -t nat -L" to list this rule.&nbsp; the iptables command only =
<BR>#=20
deals with one table at a time, and the default is "-t=20
filter".</FONT></DIV></BODY></HTML>

------=_NextPart_000_00B2_01C2CE09.E7465950--


