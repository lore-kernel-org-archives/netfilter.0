From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: Re: from firewall machine wget is not working
Date: Tue, 5 Nov 2002 17:36:15 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005b01c2851b$c044a2d0$8c01a8c0@sundaram>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org


Here is my script. Can you please verify this script also.

Thanks

#!/bin/bash
set -xv

EXT="eth0"
INT="eth1"
INT2="eth2"
LO="lo"

ANY="Any/0"

GW_IP="192.168.1.1"
GW_EXT_IP="XX.XX.18.38"
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

# First Server  ( port : smtp, pop3, http )
EXT_IP1=XX.XX.18.33
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

# Second Server ( port :  http )
EXT_IP1=XX.XX.XX.XX
INT_IP1=192.168.1.131

#ip addr add $EXT_IP1 dev $EXT
addip $EXT_IP1  $EXT

$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport 80 -j
DNAT --to $INT_IP1
$IPT -A FORWARD -p tcp  --dport 80 -d $INT_IP1 -j ACCEPT
$IPT -t nat -A POSTROUTING -o $EXT -s $INT_IP1  -j SNAT --to  $EXT_IP1


# Netmeeting from outside to inside  PC ( Port All Netmeeting ports )
EXT_IP1=XX.XX.18.40
INT_IP1=192.168.1.140

addip $EXT_IP1  $EXT

$IPT -t nat -A PREROUTING -i $EXT -d $EXT_IP1 -j DNAT --to $INT_IP1
$IPT -t nat -A POSTROUTING -o $EXT -s $INT_IP1 -j SNAT --to-source $EXT_IP1

# for poptop server
$IPT -A INPUT   -i $EXT -p tcp --dport 1723 -j ACCEPT
$IPT -A OUTPUT  -o $EXT -p tcp --dport 1723 -j ACCEPT
$IPT -A INPUT   -i $EXT -p 47 -j ACCEPT
$IPT -A OUTPUT  -o $EXT -p 47 -j ACCEPT

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



----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, November 05, 2002 1:32 PM
Subject: Re: from firewall machine wget is not working


> On Tuesday 05 November 2002 5:02 pm, Sundaram Ramasamy wrote:
>
> > Hi,
> >
> > wget command is not working form my firewall machine, But inside my
network
> > I was able to use wget command
> >
> > What is the problem?
>
> Please can you post your ruleset as the iptables commands you use to set
up
> the rules, not the output of iptables -L ?
>
> The latter doesn't give us all the information we'd like to see, and I for
> one find it much more difficult to understand...
>
> Antony.
>
> --
>
> If at first you don't succeed, destroy all the evidence that you tried.
>


