From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: from firewall machine FTP/WGET  is not working  please help me.
Date: Fri, 8 Nov 2002 08:47:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005201c2872d$6a7e10c0$8c01a8c0@sundaram>
References: <1100D69203AAD2118E3C00508B8B9E8A67F13C@mailhost.intech.unu.edu> <005001c284ed$22276d40$8c01a8c0@sundaram> <200211051832.gA5IWhe19780@vulcan.rissington.net>
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

Hi,

I was not able to use the ftp or wget command from my firewall machine. I am
attaching my script please help me.

Thanks
-SR

#!/bin/bash
set -xv

EXT="eth0"
INT="eth1"
INT2="eth2"
LO="lo"

ANY="Any/0"

GW_IP="192.168.1.1"
GW_EXT_IP="xx.xx.xx.xx"
SUB_NET="192.168.1.0/24"

PRIVP="0:1023"
UNPRI="1024:65535"

IPT="/sbin/iptables"

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
 EXT_IP1=$1
 INT_IP1=$2

 #ip addr add $EXT_IP1 dev $EXT
 addip $EXT_IP1  $EXT

 # TCP Port
 PORT=5631
 $IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport $PORT  -j
DNAT --to $INT_IP1
 $IPT -A FORWARD -p tcp  --dport $PORT  -d $INT_IP1 -j ACCEPT

 # UDP Port
 PORT=5632
 $IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p udp --dport $PORT  -j
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
EXT_IP1=xx.xx.xx.xx
INT_IP1=192.168.1.130

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
INT_IP1=192.168.1.191
PORT=21
$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport $PORT -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport $PORT -d $INT_IP1 -j ACCEPT

PORT=2401
$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport $PORT -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport $PORT -d $INT_IP1 -j ACCEPT

# For RemoteAdmin
INT_IP1=192.168.1.12
PORT=4899
$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport $PORT -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport $PORT -d $INT_IP1 -j ACCEPT

$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p udp --dport $PORT -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p udp  --dport $PORT -d $INT_IP1 -j ACCEPT

# Second Server  ( port :  http )
EXT_IP1=xx.xx.xx.xx4
INT_IP1=192.168.1.131

#ip addr add $EXT_IP1 dev $EXT
addip $EXT_IP1  $EXT

$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport 80 -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport 80 -d $INT_IP1 -j ACCEPT
$IPT -t nat -A POSTROUTING -o $EXT -s $INT_IP1  -j SNAT --to  $EXT_IP1

#Third Server  ( port : smtp, pop3, http )
EXT_IP1=xx.xx.xx.xx5
INT_IP1=192.168.1.132

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
EXT_IP1=xx.xx.xx.xx
INT_IP1=192.168.1.140

addip $EXT_IP1  $EXT

$IPT -t nat -A PREROUTING -i $EXT -d $EXT_IP1 -j DNAT --to $INT_IP1
$IPT -t nat -A POSTROUTING -o $EXT -s $INT_IP1 -j SNAT --to-source $EXT_IP1


#  For PC Anywhere to connect outside to insdie
EXT_IP1=xx.xx.xx.xx2
INT_IP1=192.168.1.142
pcAnyWhere ${EXT_IP1} ${INT_IP1}

EXT_IP1=xx.xx.xx.xx3
INT_IP1=192.168.1.143

pcAnyWhere ${EXT_IP1} ${INT_IP1}

EXT_IP1=xx.xx.xx.xx4
INT_IP1=192.168.1.144
pcAnyWhere ${EXT_IP1} ${INT_IP1}

EXT_IP1=xx.xx.xx.xx5
INT_IP1=192.168.1.145
pcAnyWhere ${EXT_IP1} ${INT_IP1}

# for poptop server
$IPT -A INPUT   -i $EXT -p tcp --dport 1723 -j ACCEPT
$IPT -A OUTPUT  -o $EXT -p tcp --dport 1723 -j ACCEPT
$IPT -A INPUT   -i $EXT -p 47 -j ACCEPT
$IPT -A OUTPUT  -o $EXT -p 47 -j ACCEPT

#$IPT -t nat -A PREROUTING -i $EXT -d $GW_EXT_IP -p tcp --dport 1723 -j
DNAT --to $GW_IP
#$IPT -t nat -A PREROUTING -i $EXT -d $GW_EXT_IP  -p 47 -j DNAT --to  $GW_IP


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
SIP=194.234.11.210

$IPT -A INPUT -s $SIP -j LOG --log-prefix="spam: "
$IPT -A INPUT -s $SIP -j DROP

$IPT -A INPUT -s $SIP -j LOG --log-prefix="spam: "
$IPT -A FORWARD -s $SIP -j DROP

# kiwwi.cz - 217.66.160.2
SIP=217.66.160.2
$IPT -A INPUT -s $SIP -j LOG --log-prefix="spam: "
$IPT -A INPUT -s $SIP -j DROP

$IPT -A INPUT -s $SIP -j LOG --log-prefix="spam: "
$IPT -A FORWARD -s $SIP -j DROP

#libero.it - 195.210.91.83
SIP=195.210.91.83
$IPT -A INPUT -s $SIP -j LOG --log-prefix="spam: "
$IPT -A INPUT -s $SIP -j DROP

$IPT -A INPUT -s $SIP -j LOG --log-prefix="spam: "
$IPT -A FORWARD -s $SIP -j DROP


# Log the packet
for chain in INPUT OUTPUT FORWARD PREROUTING POSTROUTING
do
  for table in mangle nat
  do
    $IPT -I $chain -t $table -j LOG --log-prefix="$chain $table "
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
ip_tables              16288   8 [iptable_filter ipt_MASQUERADE ipt_state
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


