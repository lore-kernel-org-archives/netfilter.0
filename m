From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: Re: Accessing machine with public ip address.
Date: Mon, 23 Dec 2002 10:06:56 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ee01c2aa94$ef846c30$8c01a8c0@sundaram>
References: <Pine.SOL.4.43.0212231312460.4174-100000@selene.nat.vu.nl> <003701c2aa8b$6d84c8f0$8c01a8c0@sundaram> <01c001c2aa8e$486bd6a0$13fcc5cb@Housecall>
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
To: hare ram <hareram@sol.net.in>, netfilter@lists.netfilter.org

Here is my iptables rules

#!/bin/bash
set -xv

EXT="eth0"
INT="eth1"
INT2="eth2"
LO="lo"

ANY="Any/0"

GW_IP="192.168.1.1"
GW_EXT_IP="64.140.18.38"
SUB_NET="192.168.1.0/24"

PRIVP="0:1023"
UNPRI="1024:65535"

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


# Second Server web server ( port :  http )
EXT_IP1=216.205.140.8
INT_IP1=192.168.1.130

#ip addr add $EXT_IP1 dev $EXT
addip $EXT_IP1  $EXT

$IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport 80 -j
DNAT --to $
INT_IP1
$IPT -A FORWARD -p tcp  --dport 80 -d $INT_IP1 -j ACCEPT
$IPT -t nat -A POSTROUTING -o $EXT -s $INT_IP1  -j SNAT --to  $EXT_IP1



I have forwarded 216.205.140.8 to 192.168.1.130. I am accessing web page
from 192.168.1.140 machine.


Thanks
-SR





----- Original Message -----
From: "hare ram" <hareram@sol.net.in>
To: "Sundaram Ramasamy" <sun@percipia.com>; <netfilter@lists.netfilter.org>
Sent: Monday, December 23, 2002 9:19 AM
Subject: Re: Accessing machine with public ip address.


> Hi
>
> what is your Present Iptable rules
>
> where are you accessing ?
> what is your PC address ???
>
> what you want to achive
>
> hare
> ----- Original Message -----
> From: "Sundaram Ramasamy" <sun@percipia.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Monday, December 23, 2002 7:28 PM
> Subject: Accessing machine with public ip address.
>
>
> > hi,
> >
> >
> >
> > I have NATed public 216.205.140.8 IP Address into local 192.168.1.130
> > Network address, from my LAN I was not able to access my machine using
> > public IP Address.
> >
> >
> >
> > How will I set my firewall rules? Please help me on this.
> >
> >
> >
> >
> >
> > Thanks
> >
> > SR
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
>
>


