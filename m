From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: wget/ftp is not working  from firewall machine!!! any help
Date: Mon, 25 Nov 2002 14:13:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002e01c294b6$c48ed950$8c01a8c0@sundaram>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002B_01C2948C.DB87FD50"
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
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_002B_01C2948C.DB87FD50
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I was not able to use the ftp or wget command from my firewall machine. =
I am
attaching my script please help me.

Thanks
-SR

#!/bin/bash
set -xv

EXT=3D"eth0"
INT=3D"eth1"
INT2=3D"eth2"
LO=3D"lo"

ANY=3D"Any/0"

GW_IP=3D"192.168.1.1"
GW_EXT_IP=3D"xx.xx.xx.xx"
SUB_NET=3D"192.168.1.0/24"

PRIVP=3D"0:1023"
UNPRI=3D"1024:65535"

IPT=3D"/sbin/iptables"

modprobe ip_nat_ftp
modprobe ip_conntrack_ftp
modprobe ip_nat_h323
modprobe ip_conntrack_h323

modprobe ipt_LOG
modprobe ipt_REJECT
modprobe ipt_state
modprobe ipt_MASQUERADE
modprobe iptable_nat
modprobe ip_conntrack

modprobe ppp_generic
modprobe ppp_synctty
modprobe ppp_deflate
modprobe zlib_deflate
modprobe ppp_mppe
modprobe ppp_async

addip() {
 if [ $# -ne 2 ] ; then
  echo hello
  return 1
 fi

 if ` ip add show | grep "$1/" > /dev/null` ; then
  return 0
 fi

 ip addr add $1 dev $2
 return 0
}

pcAnyWhere() {

 if [ $# -ne 2 ] ; then
  echo "Usage: <Public IP>  <LAN IP>"
  return 1
 fi

 #  For PC Anywhere to connect outside to insdie
 EXT_IP1=3D$1
 INT_IP1=3D$2

 #ip addr add $EXT_IP1 dev $EXT
 addip $EXT_IP1  $EXT

 # TCP Port
 PORT=3D5631
 $IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport $PORT  =
-j
DNAT --to $INT_IP1
 $IPT -A FORWARD -p tcp  --dport $PORT  -d $INT_IP1 -j ACCEPT

 # UDP Port
 PORT=3D5632
 $IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p udp --dport $PORT  =
-j
DNAT --to $INT_IP1
 $IPT -A FORWARD -p udp  --dport $PORT  -d $INT_IP1 -j ACCEPT

 $IPT -t nat -A POSTROUTING -o $EXT -s $INT_IP1  -j SNAT --to  $EXT_IP1
}

# Gateway IP
addip 192.168.1.2 eth1
addip 192.168.1.189 eth1

echo 1 > /proc/sys/net/ipv4/tcp_syncookies

for f in /proc/sys/net/ipv4/conf/*/rp_filter; do
        echo 1 > $f
done

echo 1 > /proc/sys/net/ipv4/ip_forward

$IPT -P INPUT DROP
$IPT -P OUTPUT ACCEPT
$IPT -P FORWARD DROP

$IPT -X
$IPT -F
$IPT -t nat -F
$IPT -t nat -X

#Fisrt inside Interface
$IPT -A INPUT   -i $INT -j ACCEPT
$IPT -A OUTPUT  -o $INT -j ACCEPT
$IPT -A FORWARD -i $INT -j ACCEPT
$IPT -A FORWARD -o $INT -j ACCEPT

#Second inside Interface
$IPT -A INPUT   -i $INT2 -j ACCEPT
$IPT -A OUTPUT  -o $INT2 -j ACCEPT
$IPT -A FORWARD -i $INT2 -j ACCEPT
$IPT -A FORWARD -o $INT2 -j ACCEPT

$IPT -A INPUT  -i $LO -j ACCEPT
$IPT -A OUTPUT -o $LO -j ACCEPT

$IPT -t nat -A POSTROUTING -o $EXT -j MASQUERADE

$IPT -A FORWARD -i $EXT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A FORWARD -i $EXT -m state --state NEW -j ACCEPT

: For NetMeeting
$IPT -A OUTPUT -o $EXT -p udp --sport 1024:65535 --dport 53 -j ACCEPT
$IPT -A INPUT  -i $EXT -p udp --sport 53 --dport 1024:65535 -j ACCEPT
$IPT -A OUTPUT -o $EXT -p tcp --sport $UNPRI --dport 53 -j ACCEPT
$IPT -A INPUT  -i $EXT -p tcp --sport 53 --dport $UNPRI -j ACCEPT

$IPT -A FORWARD -i $EXT -p tcp --dport 113 --syn -j REJECT


# allow certain inbound ICMP types
$IPT -A INPUT -p icmp --icmp-type 0 -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type 3 -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type 5 -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type 11 -j ACCEPT
$IPT -A INPUT -p icmp -j DROP
$IPT -A INPUT -p icmp -j DROP

# First Server ( port : smtp, pop3, http )
EXT_IP1=3Dxx.xx.xx.xx
INT_IP1=3D192.168.1.130

#ip addr add $EXT_IP1 dev $EXT
addip $EXT_IP1 $EXT

$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport 80 -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport 80 -d $INT_IP1 -j ACCEPT

$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport 110 -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport 110 -d $INT_IP1 -j ACCEPT

$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport 25 -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport 25 -d $INT_IP1 -j ACCEPT

# For ftp and CVS
INT_IP1=3D192.168.1.191
PORT=3D21
$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport $PORT -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport $PORT -d $INT_IP1 -j ACCEPT

PORT=3D2401
$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport $PORT -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport $PORT -d $INT_IP1 -j ACCEPT

# For RemoteAdmin
INT_IP1=3D192.168.1.12
PORT=3D4899
$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport $PORT -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport $PORT -d $INT_IP1 -j ACCEPT

$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p udp --dport $PORT -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p udp  --dport $PORT -d $INT_IP1 -j ACCEPT

# Second Server  ( port :  http )
EXT_IP1=3Dxx.xx.xx.xx4
INT_IP1=3D192.168.1.131

#ip addr add $EXT_IP1 dev $EXT
addip $EXT_IP1  $EXT

$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport 80 -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport 80 -d $INT_IP1 -j ACCEPT
$IPT -t nat -A POSTROUTING -o $EXT -s $INT_IP1  -j SNAT --to  $EXT_IP1

#Third Server  ( port : smtp, pop3, http )
EXT_IP1=3Dxx.xx.xx.xx5
INT_IP1=3D192.168.1.132

#ip addr add $EXT_IP1 dev $EXT
addip $EXT_IP1  $EXT

$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport 80 -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport 80 -d $INT_IP1 -j ACCEPT

$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport 110 -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport 110 -d $INT_IP1 -j ACCEPT

$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport 25 -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport 25 -d $INT_IP1 -j ACCEPT
$IPT -t nat -A POSTROUTING -o $EXT -s $INT_IP1  -j SNAT --to  $EXT_IP1

# Netmeeting from outside to inside  PC ( Port All Netmeeting ports )
EXT_IP1=3Dxx.xx.xx.xx
INT_IP1=3D192.168.1.140

addip $EXT_IP1  $EXT

$IPT -t nat -A PREROUTING -i $EXT -d $EXT_IP1 -j DNAT --to $INT_IP1
$IPT -t nat -A POSTROUTING -o $EXT -s $INT_IP1 -j SNAT --to-source =
$EXT_IP1


#  For PC Anywhere to connect outside to insdie
EXT_IP1=3Dxx.xx.xx.xx2
INT_IP1=3D192.168.1.142
pcAnyWhere ${EXT_IP1} ${INT_IP1}

EXT_IP1=3Dxx.xx.xx.xx3
INT_IP1=3D192.168.1.143

pcAnyWhere ${EXT_IP1} ${INT_IP1}

EXT_IP1=3Dxx.xx.xx.xx4
INT_IP1=3D192.168.1.144
pcAnyWhere ${EXT_IP1} ${INT_IP1}

EXT_IP1=3Dxx.xx.xx.xx5
INT_IP1=3D192.168.1.145
pcAnyWhere ${EXT_IP1} ${INT_IP1}

# for poptop server
$IPT -A INPUT   -i $EXT -p tcp --dport 1723 -j ACCEPT
$IPT -A OUTPUT  -o $EXT -p tcp --dport 1723 -j ACCEPT
$IPT -A INPUT   -i $EXT -p 47 -j ACCEPT
$IPT -A OUTPUT  -o $EXT -p 47 -j ACCEPT

#$IPT -t nat -A PREROUTING -i $EXT -d $GW_EXT_IP -p tcp --dport 1723 -j
DNAT --to $GW_IP
#$IPT -t nat -A PREROUTING -i $EXT -d $GW_EXT_IP  -p 47 -j DNAT --to  =
$GW_IP


# Block "Linux.Slapper.Worm" or "apache/mod_ssl worm"
#
# log & drop any inbound packets for UDP port 2002,
# prevents already infected system receiving instructions.
# this should only happen if we are/were infected.
# If we're feeling charitable, let the source of any 2002
# packets know that they are probably infected as well.  :^)
$IPT -A INPUT -p UDP --dport 2002 -j LOG
$IPT -A INPUT -p UDP --dport 2002 -j DROP
#
# Block inbound port 443 (Infection point) ONLY if you don't
# need to serve HTTPS from machine.
$IPT -A INPUT -p TCP --dport 443 -j REJECT
#
# Block outbound port 443 ONLY if you don't need to browse
# to HTTPS from this machine.
# This blocks an already infected system from propogating.
$IPT -A OUTPUT -p TCP --dport 443 -j REJECT


# Block SPAM Mail

# mailme.mk - 194.234.11.210
SIP=3D194.234.11.210

$IPT -A INPUT -s $SIP -j LOG --log-prefix=3D"spam: "
$IPT -A INPUT -s $SIP -j DROP

$IPT -A INPUT -s $SIP -j LOG --log-prefix=3D"spam: "
$IPT -A FORWARD -s $SIP -j DROP

# kiwwi.cz - 217.66.160.2
SIP=3D217.66.160.2
$IPT -A INPUT -s $SIP -j LOG --log-prefix=3D"spam: "
$IPT -A INPUT -s $SIP -j DROP

$IPT -A INPUT -s $SIP -j LOG --log-prefix=3D"spam: "
$IPT -A FORWARD -s $SIP -j DROP

#libero.it - 195.210.91.83
SIP=3D195.210.91.83
$IPT -A INPUT -s $SIP -j LOG --log-prefix=3D"spam: "
$IPT -A INPUT -s $SIP -j DROP

$IPT -A INPUT -s $SIP -j LOG --log-prefix=3D"spam: "
$IPT -A FORWARD -s $SIP -j DROP


# Log the packet
for chain in INPUT OUTPUT FORWARD PREROUTING POSTROUTING
do
  for table in mangle nat
  do
    $IPT -I $chain -t $table -j LOG --log-prefix=3D"$chain $table "
  done
done



lsmod output: ( it shows ip_nat_ftp              4640   0 (unused))


ip_nat_ftp              4640   0 (unused)
iptable_nat            26676   3 [ipt_MASQUERADE ip_nat_h323 ip_nat_ftp]
ip_conntrack_ftp        5504   1 [ip_nat_ftp]
ip_conntrack           32108   4 [ipt_MASQUERADE ipt_state ip_nat_h323
ip_conntr
ack_h323 ip_nat_ftp iptable_nat ip_conntrack_ftp]
[gw@gw tmp]$ /sbin/lsmod
Module                  Size  Used by    Tainted: P
iptable_filter          2624   1 (autoclean)
ppp_async               8128   0 (unused)
ppp_mppe               25120   0 (unused)
ppp_deflate             4032   0 (unused)
zlib_deflate           21344   0 [ppp_deflate]
ppp_synctty             6528   0 (unused)
ppp_generic            24076   0 [ppp_async ppp_mppe ppp_deflate
ppp_synctty]
slhc                    6348   0 [ppp_generic]
ipt_MASQUERADE          2816   1
ipt_state               1408   2
ipt_REJECT              3872   3
ipt_LOG                 4608   7
ip_nat_h323             4352   0 (unused)
ip_conntrack_h323       4352   1 [ip_nat_h323]
ip_nat_ftp              4640   0 (unused)
iptable_nat            26676   3 [ipt_MASQUERADE ip_nat_h323 ip_nat_ftp]
ip_tables              16288   8 [iptable_filter ipt_MASQUERADE =
ipt_state
ipt_RE
JECT ipt_LOG iptable_nat]
ip_conntrack_ftp        5504   1 [ip_nat_ftp]
ip_conntrack           32108   4 [ipt_MASQUERADE ipt_state ip_nat_h323
ip_conntr
ack_h323 ip_nat_ftp iptable_nat ip_conntrack_ftp]
autofs                 11812   0 (autoclean) (unused)
3c59x                  28392   2
8139too                16288   1
mii                     2280   0 [8139too]
ide-cd                 30208   0 (autoclean)
cdrom                  32096   0 (autoclean) [ide-cd]
usb-uhci               24420   0 (unused)
usbcore                72736   1 [usb-uhci]
ext3                   66272   2
jbd                    48824   2 [ext3]

------=_NextPart_000_002B_01C2948C.DB87FD50
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3>Hi,<BR><BR>I=20
was not able to use the ftp or wget command from my firewall machine. I=20
am<BR>attaching my script please help=20
me.<BR><BR>Thanks<BR>-SR<BR><BR>#!/bin/bash<BR>set=20
-xv<BR><BR>EXT=3D"eth0"<BR>INT=3D"eth1"<BR>INT2=3D"eth2"<BR>LO=3D"lo"<BR>=
<BR>ANY=3D"Any/0"<BR><BR>GW_IP=3D"192.168.1.1"<BR>GW_EXT_IP=3D"xx.xx.xx.x=
x"<BR>SUB_NET=3D"192.168.1.0/24"<BR><BR>PRIVP=3D"0:1023"<BR>UNPRI=3D"1024=
:65535"<BR><BR>IPT=3D"/sbin/iptables"<BR><BR>modprobe=20
ip_nat_ftp<BR>modprobe ip_conntrack_ftp<BR>modprobe =
ip_nat_h323<BR>modprobe=20
ip_conntrack_h323<BR><BR>modprobe ipt_LOG<BR>modprobe =
ipt_REJECT<BR>modprobe=20
ipt_state<BR>modprobe ipt_MASQUERADE<BR>modprobe iptable_nat<BR>modprobe =

ip_conntrack<BR><BR>modprobe ppp_generic<BR>modprobe =
ppp_synctty<BR>modprobe=20
ppp_deflate<BR>modprobe zlib_deflate<BR>modprobe ppp_mppe<BR>modprobe=20
ppp_async<BR><BR>addip() {<BR>&nbsp;if [ $# -ne 2 ] ; then<BR>&nbsp; =
echo=20
hello<BR>&nbsp; return 1<BR>&nbsp;fi<BR><BR>&nbsp;if ` ip add show | =
grep "$1/"=20
&gt; /dev/null` ; then<BR>&nbsp; return 0<BR>&nbsp;fi<BR><BR>&nbsp;ip =
addr add=20
$1 dev $2<BR>&nbsp;return 0<BR>}<BR><BR>pcAnyWhere() {<BR><BR>&nbsp;if [ =
$# -ne=20
2 ] ; then<BR>&nbsp; echo "Usage: &lt;Public IP&gt;&nbsp; &lt;LAN=20
IP&gt;"<BR>&nbsp; return 1<BR>&nbsp;fi<BR><BR>&nbsp;#&nbsp; For PC =
Anywhere to=20
connect outside to=20
insdie<BR>&nbsp;EXT_IP1=3D$1<BR>&nbsp;INT_IP1=3D$2<BR><BR>&nbsp;#ip addr =
add=20
$EXT_IP1 dev $EXT<BR>&nbsp;addip $EXT_IP1&nbsp; $EXT<BR><BR>&nbsp;# TCP=20
Port<BR>&nbsp;PORT=3D5631<BR>&nbsp;$IPT -t nat -A PREROUTING&nbsp; -i =
$EXT -d=20
$EXT_IP1&nbsp; -p tcp --dport $PORT&nbsp; -j<BR>DNAT --to =
$INT_IP1<BR>&nbsp;$IPT=20
-A FORWARD -p tcp&nbsp; --dport $PORT&nbsp; -d $INT_IP1 -j =
ACCEPT<BR><BR>&nbsp;#=20
UDP Port<BR>&nbsp;PORT=3D5632<BR>&nbsp;$IPT -t nat -A PREROUTING&nbsp; =
-i $EXT -d=20
$EXT_IP1&nbsp; -p udp --dport $PORT&nbsp; -j<BR>DNAT --to =
$INT_IP1<BR>&nbsp;$IPT=20
-A FORWARD -p udp&nbsp; --dport $PORT&nbsp; -d $INT_IP1 -j=20
ACCEPT<BR><BR>&nbsp;$IPT -t nat -A POSTROUTING -o $EXT -s $INT_IP1&nbsp; =
-j SNAT=20
--to&nbsp; $EXT_IP1<BR>}<BR><BR># Gateway IP<BR>addip 192.168.1.2 =
eth1<BR>addip=20
192.168.1.189 eth1<BR><BR>echo 1 &gt;=20
/proc/sys/net/ipv4/tcp_syncookies<BR><BR>for f in=20
/proc/sys/net/ipv4/conf/*/rp_filter;=20
do<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo 1 &gt;=20
$f<BR>done<BR><BR>echo 1 &gt; /proc/sys/net/ipv4/ip_forward<BR><BR>$IPT =
-P INPUT=20
DROP<BR>$IPT -P OUTPUT ACCEPT<BR>$IPT -P FORWARD DROP<BR><BR>$IPT =
-X<BR>$IPT=20
-F<BR>$IPT -t nat -F<BR>$IPT -t nat -X<BR><BR>#Fisrt inside =
Interface<BR>$IPT -A=20
INPUT&nbsp;&nbsp; -i $INT -j ACCEPT<BR>$IPT -A OUTPUT&nbsp; -o $INT -j=20
ACCEPT<BR>$IPT -A FORWARD -i $INT -j ACCEPT<BR>$IPT -A FORWARD -o $INT =
-j=20
ACCEPT<BR><BR>#Second inside Interface<BR>$IPT -A INPUT&nbsp;&nbsp; -i =
$INT2 -j=20
ACCEPT<BR>$IPT -A OUTPUT&nbsp; -o $INT2 -j ACCEPT<BR>$IPT -A FORWARD -i =
$INT2 -j=20
ACCEPT<BR>$IPT -A FORWARD -o $INT2 -j ACCEPT<BR><BR>$IPT -A INPUT&nbsp; =
-i $LO=20
-j ACCEPT<BR>$IPT -A OUTPUT -o $LO -j ACCEPT<BR><BR>$IPT -t nat -A =
POSTROUTING=20
-o $EXT -j MASQUERADE<BR><BR>$IPT -A FORWARD -i $EXT -m state --state=20
ESTABLISHED,RELATED -j ACCEPT<BR>$IPT -A FORWARD -i $EXT -m state =
--state NEW -j=20
ACCEPT<BR><BR>: For NetMeeting<BR>$IPT -A OUTPUT -o $EXT -p udp --sport=20
1024:65535 --dport 53 -j ACCEPT<BR>$IPT -A INPUT&nbsp; -i $EXT -p udp =
--sport 53=20
--dport 1024:65535 -j ACCEPT<BR>$IPT -A OUTPUT -o $EXT -p tcp --sport =
$UNPRI=20
--dport 53 -j ACCEPT<BR>$IPT -A INPUT&nbsp; -i $EXT -p tcp --sport 53 =
--dport=20
$UNPRI -j ACCEPT<BR><BR>$IPT -A FORWARD -i $EXT -p tcp --dport 113 --syn =
-j=20
REJECT<BR><BR><BR># allow certain inbound ICMP types<BR>$IPT -A INPUT -p =
icmp=20
--icmp-type 0 -j ACCEPT<BR>$IPT -A INPUT -p icmp --icmp-type 3 -j =
ACCEPT<BR>$IPT=20
-A INPUT -p icmp --icmp-type 5 -j ACCEPT<BR>$IPT -A INPUT -p icmp =
--icmp-type 11=20
-j ACCEPT<BR>$IPT -A INPUT -p icmp -j DROP<BR>$IPT -A INPUT -p icmp -j=20
DROP<BR><BR># First Server ( port : smtp, pop3, http=20
)<BR>EXT_IP1=3Dxx.xx.xx.xx<BR>INT_IP1=3D192.168.1.130<BR><BR>#ip addr =
add $EXT_IP1=20
dev $EXT<BR>addip $EXT_IP1 $EXT<BR><BR>$IPT -t nat -A PREROUTING&nbsp; =
-i $EXT=20
-d $EXT_IP1&nbsp; -p tcp --dport 80 -j<BR>DNAT --to $INT_IP1<BR>$IPT -A =
FORWARD=20
-p tcp&nbsp; --dport 80 -d $INT_IP1 -j ACCEPT<BR><BR>$IPT -t nat -A=20
PREROUTING&nbsp; -i $EXT -d $EXT_IP1&nbsp; -p tcp --dport 110 -j<BR>DNAT =
--to=20
$INT_IP1<BR>$IPT -A FORWARD -p tcp&nbsp; --dport 110 -d $INT_IP1 -j=20
ACCEPT<BR><BR>$IPT -t nat -A PREROUTING&nbsp; -i $EXT -d $EXT_IP1&nbsp; =
-p tcp=20
--dport 25 -j<BR>DNAT --to $INT_IP1<BR>$IPT -A FORWARD -p tcp&nbsp; =
--dport 25=20
-d $INT_IP1 -j ACCEPT<BR><BR># For ftp and=20
CVS<BR>INT_IP1=3D192.168.1.191<BR>PORT=3D21<BR>$IPT -t nat -A =
PREROUTING&nbsp; -i=20
$EXT -d $EXT_IP1&nbsp; -p tcp --dport $PORT -j<BR>DNAT --to =
$INT_IP1<BR>$IPT -A=20
FORWARD -p tcp&nbsp; --dport $PORT -d $INT_IP1 -j=20
ACCEPT<BR><BR>PORT=3D2401<BR>$IPT -t nat -A PREROUTING&nbsp; -i $EXT -d=20
$EXT_IP1&nbsp; -p tcp --dport $PORT -j<BR>DNAT --to $INT_IP1<BR>$IPT -A =
FORWARD=20
-p tcp&nbsp; --dport $PORT -d $INT_IP1 -j ACCEPT<BR><BR># For=20
RemoteAdmin<BR>INT_IP1=3D192.168.1.12<BR>PORT=3D4899<BR>$IPT -t nat -A=20
PREROUTING&nbsp; -i $EXT -d $EXT_IP1&nbsp; -p tcp --dport $PORT =
-j<BR>DNAT --to=20
$INT_IP1<BR>$IPT -A FORWARD -p tcp&nbsp; --dport $PORT -d $INT_IP1 -j=20
ACCEPT<BR><BR>$IPT -t nat -A PREROUTING&nbsp; -i $EXT -d $EXT_IP1&nbsp; =
-p udp=20
--dport $PORT -j<BR>DNAT --to $INT_IP1<BR>$IPT -A FORWARD -p udp&nbsp; =
--dport=20
$PORT -d $INT_IP1 -j ACCEPT<BR><BR># Second Server&nbsp; ( port :&nbsp; =
http=20
)<BR>EXT_IP1=3Dxx.xx.xx.xx4<BR>INT_IP1=3D192.168.1.131<BR><BR>#ip addr =
add $EXT_IP1=20
dev $EXT<BR>addip $EXT_IP1&nbsp; $EXT<BR><BR>$IPT -t nat -A =
PREROUTING&nbsp; -i=20
$EXT -d $EXT_IP1&nbsp; -p tcp --dport 80 -j<BR>DNAT --to =
$INT_IP1<BR>$IPT -A=20
FORWARD -p tcp&nbsp; --dport 80 -d $INT_IP1 -j ACCEPT<BR>$IPT -t nat -A=20
POSTROUTING -o $EXT -s $INT_IP1&nbsp; -j SNAT --to&nbsp; =
$EXT_IP1<BR><BR>#Third=20
Server&nbsp; ( port : smtp, pop3, http=20
)<BR>EXT_IP1=3Dxx.xx.xx.xx5<BR>INT_IP1=3D192.168.1.132<BR><BR>#ip addr =
add $EXT_IP1=20
dev $EXT<BR>addip $EXT_IP1&nbsp; $EXT<BR><BR>$IPT -t nat -A =
PREROUTING&nbsp; -i=20
$EXT -d $EXT_IP1&nbsp; -p tcp --dport 80 -j<BR>DNAT --to =
$INT_IP1<BR>$IPT -A=20
FORWARD -p tcp&nbsp; --dport 80 -d $INT_IP1 -j ACCEPT<BR><BR>$IPT -t nat =
-A=20
PREROUTING&nbsp; -i $EXT -d $EXT_IP1&nbsp; -p tcp --dport 110 -j<BR>DNAT =
--to=20
$INT_IP1<BR>$IPT -A FORWARD -p tcp&nbsp; --dport 110 -d $INT_IP1 -j=20
ACCEPT<BR><BR>$IPT -t nat -A PREROUTING&nbsp; -i $EXT -d $EXT_IP1&nbsp; =
-p tcp=20
--dport 25 -j<BR>DNAT --to $INT_IP1<BR>$IPT -A FORWARD -p tcp&nbsp; =
--dport 25=20
-d $INT_IP1 -j ACCEPT<BR>$IPT -t nat -A POSTROUTING -o $EXT -s =
$INT_IP1&nbsp; -j=20
SNAT --to&nbsp; $EXT_IP1<BR><BR># Netmeeting from outside to =
inside&nbsp; PC (=20
Port All Netmeeting ports=20
)<BR>EXT_IP1=3Dxx.xx.xx.xx<BR>INT_IP1=3D192.168.1.140<BR><BR>addip =
$EXT_IP1&nbsp;=20
$EXT<BR><BR>$IPT -t nat -A PREROUTING -i $EXT -d $EXT_IP1 -j DNAT --to=20
$INT_IP1<BR>$IPT -t nat -A POSTROUTING -o $EXT -s $INT_IP1 -j SNAT =
--to-source=20
$EXT_IP1<BR><BR><BR>#&nbsp; For PC Anywhere to connect outside to=20
insdie<BR>EXT_IP1=3Dxx.xx.xx.xx2<BR>INT_IP1=3D192.168.1.142<BR>pcAnyWhere=
 ${EXT_IP1}=20
${INT_IP1}<BR><BR>EXT_IP1=3Dxx.xx.xx.xx3<BR>INT_IP1=3D192.168.1.143<BR><B=
R>pcAnyWhere=20
${EXT_IP1}=20
${INT_IP1}<BR><BR>EXT_IP1=3Dxx.xx.xx.xx4<BR>INT_IP1=3D192.168.1.144<BR>pc=
AnyWhere=20
${EXT_IP1}=20
${INT_IP1}<BR><BR>EXT_IP1=3Dxx.xx.xx.xx5<BR>INT_IP1=3D192.168.1.145<BR>pc=
AnyWhere=20
${EXT_IP1} ${INT_IP1}<BR><BR># for poptop server<BR>$IPT -A =
INPUT&nbsp;&nbsp; -i=20
$EXT -p tcp --dport 1723 -j ACCEPT<BR>$IPT -A OUTPUT&nbsp; -o $EXT -p =
tcp=20
--dport 1723 -j ACCEPT<BR>$IPT -A INPUT&nbsp;&nbsp; -i $EXT -p 47 -j=20
ACCEPT<BR>$IPT -A OUTPUT&nbsp; -o $EXT -p 47 -j ACCEPT<BR><BR>#$IPT -t =
nat -A=20
PREROUTING -i $EXT -d $GW_EXT_IP -p tcp --dport 1723 -j<BR>DNAT --to=20
$GW_IP<BR>#$IPT -t nat -A PREROUTING -i $EXT -d $GW_EXT_IP&nbsp; -p 47 =
-j DNAT=20
--to&nbsp; $GW_IP<BR><BR><BR># Block "Linux.Slapper.Worm" or =
"apache/mod_ssl=20
worm"<BR>#<BR># log &amp; drop any inbound packets for UDP port =
2002,<BR>#=20
prevents already infected system receiving instructions.<BR># this =
should only=20
happen if we are/were infected.<BR># If we're feeling charitable, let =
the source=20
of any 2002<BR># packets know that they are probably infected as =
well.&nbsp;=20
:^)<BR>$IPT -A INPUT -p UDP --dport 2002 -j LOG<BR>$IPT -A INPUT -p UDP =
--dport=20
2002 -j DROP<BR>#<BR># Block inbound port 443 (Infection point) ONLY if =
you=20
don't<BR># need to serve HTTPS from machine.<BR>$IPT -A INPUT -p TCP =
--dport 443=20
-j REJECT<BR>#<BR># Block outbound port 443 ONLY if you don't need to=20
browse<BR># to HTTPS from this machine.<BR># This blocks an already =
infected=20
system from propogating.<BR>$IPT -A OUTPUT -p TCP --dport 443 -j=20
REJECT<BR><BR><BR># Block SPAM Mail<BR><BR># mailme.mk -=20
194.234.11.210<BR>SIP=3D194.234.11.210<BR><BR>$IPT -A INPUT -s $SIP -j =
LOG=20
--log-prefix=3D"spam: "<BR>$IPT -A INPUT -s $SIP -j DROP<BR><BR>$IPT -A =
INPUT -s=20
$SIP -j LOG --log-prefix=3D"spam: "<BR>$IPT -A FORWARD -s $SIP -j =
DROP<BR><BR>#=20
kiwwi.cz - 217.66.160.2<BR>SIP=3D217.66.160.2<BR>$IPT -A INPUT -s $SIP =
-j LOG=20
--log-prefix=3D"spam: "<BR>$IPT -A INPUT -s $SIP -j DROP<BR><BR>$IPT -A =
INPUT -s=20
$SIP -j LOG --log-prefix=3D"spam: "<BR>$IPT -A FORWARD -s $SIP -j=20
DROP<BR><BR>#libero.it - 195.210.91.83<BR>SIP=3D195.210.91.83<BR>$IPT -A =
INPUT -s=20
$SIP -j LOG --log-prefix=3D"spam: "<BR>$IPT -A INPUT -s $SIP -j =
DROP<BR><BR>$IPT=20
-A INPUT -s $SIP -j LOG --log-prefix=3D"spam: "<BR>$IPT -A FORWARD -s =
$SIP -j=20
DROP<BR><BR><BR># Log the packet<BR>for chain in INPUT OUTPUT FORWARD =
PREROUTING=20
POSTROUTING<BR>do<BR>&nbsp; for table in mangle nat<BR>&nbsp;=20
do<BR>&nbsp;&nbsp;&nbsp; $IPT -I $chain -t $table -j LOG =
--log-prefix=3D"$chain=20
$table "<BR>&nbsp; done<BR>done<BR><BR><BR><BR>lsmod output: ( it shows=20
ip_nat_ftp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4640&nbsp;&nbsp; 0=20
(unused))<BR><BR><BR>ip_nat_ftp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
4640&nbsp;&nbsp; 0=20
(unused)<BR>iptable_nat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
26676&nbsp;&nbsp; 3 [ipt_MASQUERADE ip_nat_h323=20
ip_nat_ftp]<BR>ip_conntrack_ftp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20
5504&nbsp;&nbsp; 1=20
[ip_nat_ftp]<BR>ip_conntrack&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
32108&nbsp;&nbsp; 4 [ipt_MASQUERADE ipt_state=20
ip_nat_h323<BR>ip_conntr<BR>ack_h323 ip_nat_ftp iptable_nat=20
ip_conntrack_ftp]<BR>[gw@gw tmp]$=20
/sbin/lsmod<BR>Module&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Size&nbsp; Used by&nbsp;&nbsp;&nbsp; Tainted:=20
P<BR>iptable_filter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20
2624&nbsp;&nbsp; 1=20
(autoclean)<BR>ppp_async&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
8128&nbsp;&nbsp; 0=20
(unused)<BR>ppp_mppe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
25120&nbsp;&nbsp; 0=20
(unused)<BR>ppp_deflate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;=20
4032&nbsp;&nbsp; 0=20
(unused)<BR>zlib_deflate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
21344&nbsp;&nbsp; 0=20
[ppp_deflate]<BR>ppp_synctty&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
6528&nbsp;&nbsp; 0=20
(unused)<BR>ppp_generic&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
24076&nbsp;&nbsp; 0 [ppp_async ppp_mppe=20
ppp_deflate<BR>ppp_synctty]<BR>slhc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;=20
6348&nbsp;&nbsp; 0=20
[ppp_generic]<BR>ipt_MASQUERADE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;=20
2816&nbsp;&nbsp;=20
1<BR>ipt_state&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;=20
1408&nbsp;&nbsp;=20
2<BR>ipt_REJECT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
3872&nbsp;&nbsp;=20
3<BR>ipt_LOG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
4608&nbsp;&nbsp;=20
7<BR>ip_nat_h323&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4352&nbsp;&nbsp; 0=20
(unused)<BR>ip_conntrack_h323&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
4352&nbsp;&nbsp; 1=20
[ip_nat_h323]<BR>ip_nat_ftp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
4640&nbsp;&nbsp; 0=20
(unused)<BR>iptable_nat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
26676&nbsp;&nbsp; 3 [ipt_MASQUERADE ip_nat_h323=20
ip_nat_ftp]<BR>ip_tables&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
16288&nbsp;&nbsp; 8 [iptable_filter ipt_MASQUERADE =
ipt_state<BR>ipt_RE<BR>JECT=20
ipt_LOG=20
iptable_nat]<BR>ip_conntrack_ftp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
5504&nbsp;&nbsp; 1=20
[ip_nat_ftp]<BR>ip_conntrack&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
32108&nbsp;&nbsp; 4 [ipt_MASQUERADE ipt_state=20
ip_nat_h323<BR>ip_conntr<BR>ack_h323 ip_nat_ftp iptable_nat=20
ip_conntrack_ftp]<BR>autofs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
11812&nbsp;&nbsp; 0 (autoclean)=20
(unused)<BR>3c59x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
28392&nbsp;&nbsp;=20
2<BR>8139too&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
16288&nbsp;&nbsp;=20
1<BR>mii&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2280&nbsp;&nbsp; 0=20
[8139too]<BR>ide-cd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
30208&nbsp;&nbsp; 0=20
(autoclean)<BR>cdrom&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
32096&nbsp;&nbsp; 0 (autoclean)=20
[ide-cd]<BR>usb-uhci&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
24420&nbsp;&nbsp; 0=20
(unused)<BR>usbcore&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
72736&nbsp;&nbsp; 1=20
[usb-uhci]<BR>ext3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
66272&nbsp;&nbsp;=20
2<BR>jbd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
48824&nbsp;&nbsp; 2 [ext3]</FONT><BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_002B_01C2948C.DB87FD50--


