From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Port Forwarding and opening ports.
Date: Tue, 4 Mar 2003 17:59:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303041759.28133.netfilter@newkirk.us>
References: <6F70EFF3.4675E661.0256A0D0@netscape.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_4JY8ZT5FQTUE9HM5YC13"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6F70EFF3.4675E661.0256A0D0@netscape.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: ImpulseFG@netscape.net, netfilter@lists.netfilter.org


--------------Boundary-00=_4JY8ZT5FQTUE9HM5YC13
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Tuesday 04 March 2003 03:56 pm, ImpulseFG@netscape.net wrote:
> I have iptables setup to port forward ftp , web, and a game server to
> another server on the local network. It works great. I have also set
> it up so it only accepts incoming and outgoing connections on port 22.
> I'm having 2 problems and a couple of questions.
>
> 1. I can ssh into the machine which is 192.168.1.1 from any computer
> on the local network. But I can't run X programs without allowing all
> incoming and outgoing connections on this machine. I've tried:
> $iptables -A INPUT -i eth1 -j ACCEPT
>             $iptables -A OUTPUT -o eth1 -j ACCEPT
>
> This wouldn't fix the problem. So I tried.
>             $iptables -A INPUT -s 192.168.1.2-192.168.1.255 -j ACCEPT
>             $iptables -A OUTPUT -d 192.168.1.2-192.68.1.255 -j ACCEPT
>
> This didn't work either. Only only accepting all incomeing and
> outgoing connections would.

Try

$iptables -A INPUT -i lo -j ACCEPT
$iptables -A OUTPUT -o lo --j ACCEPT

to let the box talk to itself...

> 2. I'm having problems with the nat features.
>     I want to be able to ssh into the routing machine from of the
> local network but I can't. I have it set to accept local connections
> on port 22 for udp and tcp. But nat is nating the packets before it
> can accept them.
>     The only way I am able to get them to accept them is to disable
> nat. I tried natting all the ports around 22. See the attache script
> but for some reason that wouln't work either.
>
> Does anyone have any idea how to do this?

In your script you have lots of rules with "-j DNAT --to=20
192.168.1.2-192.168.1.255" - do you really want to spread all this=20
traffic out across all these addresses?  This construction will take any=20
connection coming in on a matching port and send it to the first address=20
in that list that doesn't currently have traffic, or the one with the=20
lowest traffic.

My impression of what you want is that you want to DNAT a handful of=20
specific connections to specific destinations, and then allow return=20
traffic from the internet to reach the proper client, am I right?  I've=20
attached your original script trimmed to the essentials and then=20
commented by myself, and also attached a proposed replacement script=20
that will allow the local machines to connect out, and outside=20
connections only to SSH on the gateway or the three DNATs to "charlee". =20
If I'm way off-base on your intentions here I apologize.

j

--------------Boundary-00=_4JY8ZT5FQTUE9HM5YC13
Content-Type: application/x-shellscript;
  name="ImpulseFG.rc.firewall-2.4.mailing"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ImpulseFG.rc.firewall-2.4.mailing"

#!/bin/sh
#
# rc.firewall-2.4
FWVER=0.72
#

IPTABLES=/sbin/iptables
#IPTABLES=/usr/local/sbin/iptables
DEPMOD=/sbin/depmod
INSMOD=/sbin/insmod

EXTIF="eth0"
INTIF="eth1"

$DEPMOD -a
$INSMOD ip_tables
$INSMOD ip_conntrack
$INSMOD ip_conntrack_ftp
$INSMOD ip_conntrack_irc
$INSMOD iptable_nat
$INSMOD ip_nat_ftp
#$INSMOD ip_nat_irc

echo "1" > /proc/sys/net/ipv4/ip_forward
# A purist would insist this should be done last, to close the security 'hole' that
# may exist from this point until FORWARD rules are fully in place.

$IPTABLES -F INPUT
$IPTABLES -F OUTPUT
$IPTABLES -F FORWARD
$IPTABLES -t nat -F 
$IPTABLES -F block
$IPTABLES -X block
$IPTABLES -F openPort
$IPTABLES -X openPort
$IPTABLES -F reply
$IPTABLES -X reply

$IPTABLES -N openPort
$IPTABLES -A openPort -p tcp --dport 22 -j ACCEPT
$IPTABLES -A openPort -p udp --dport 22 -j ACCEPT
$IPTABLES -A openPort -s 192.168.1.2/24 -j ACCEPT
$IPTABLES -A openPort -j ACCEPT
# Well, after specifying that SSH is allowed, then anything from
# 192.168.1.x is allowed, you go on and accept EVERYTHING...

$IPTABLES -N reply
$IPTABLES -A reply -p tcp --sport 22 -j ACCEPT
$IPTABLES -A reply -p udp --sport 22 -j ACCEPT
$IPTABLES -A reply -d 192.168.1.2/24 -j ACCEPT
$IPTABLES -A reply -j ACCEPT
# Same here...

$IPTABLES -N block
$IPTABLES -A block -j DROP

$IPTABLES -A INPUT -j openPort
$IPTABLES -A OUTPUT -j reply
$IPTABLES -A INPUT -j block
$IPTABLES -A OUTPUT -j block
# Nothing will ever reach your 'block' chain since you ACCEPT all earlier

$IPTABLES -t nat -A PREROUTING -d 128.x.x.x -p tcp --dport 21 -j DNAT --to 192.168.1.2
$IPTABLES -t nat -A PREROUTING -d 128.x.x.x  -p udp --dport 20 -j DNAT --to 192.168.1.2

$IPTABLES -t nat -A PREROUTING -d 128.x.x.x -p tcp --dport 80 -j DNAT --to 192.168.1.2
$IPTABLES -t nat -A PREROUTING -d 128.x.x.x -p udp --dport 80 -j DNAT --to 192.168.1.2

$IPTABLES -t nat -A PREROUTING -d 128.x.x.x -p tcp --dport 27015 -j DNAT --to 192.168.1.2
$IPTABLES -t nat -A PREROUTING -d 128.x.x.x -p udp --dport 27015 -j DNAT --to 192.168.1.2

$IPTABLES -t nat -A PREROUTING -i $EXTIF -p udp --sport :19 -j DNAT --to 192.168.1.2-192.168.1.255

$IPTABLES -t nat -A PREROUTING -i $EXTIF -p udp --sport 23:79 -j DNAT --to 192.168.1.2-192.168.1.255

$IPTABLES -t nat -A PREROUTING -i $EXTIF -p udp --sport 81:27014 -j DNAT --to 192.168.1.2-192.168.1.255

$IPTABLES -t nat -A PREROUTING -i $EXTIF -p udp --sport 27016: -j DNAT --to 192.168.1.2-192.168.1.255

$IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --sport :20 -j DNAT --to 192.168.1.2-192.168.1.255

$IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --sport 22:79 -j DNAT --to 192.168.1.2-192.168.1.255
$IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --sport 81:27014 -j DNAT --to 192.168.1.2-192.168.1.255
$IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --sport 27016: -j DNAT --to 192.168.1.2-192.168.1.255
# All these DNAT rules with "192.168.1.2=192.168.1.255" will spread ALL incoming traffic across
# those destination IPs - either to the first IP with no traffic, or the IP with the lowest traffic...  Is that really
# what you are trying to accomplish?

$IPTABLES -t nat -A POSTROUTING -s 192.168.1.0/24 -j SNAT --to 128.x.x.x
# You should limit this to ONLY perform SNAT on traffic going out to the internet....
--------------Boundary-00=_4JY8ZT5FQTUE9HM5YC13
Content-Type: application/x-shellscript;
  name="ImpulseFG.revised"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="ImpulseFG.revised"

#!/bin/sh
# description: firewall revised by netfilter@newkirk.us :^)
#
# rc.firewall-2.4
FWVER=0.73
#

IPTABLES=/sbin/iptables
DEPMOD=/sbin/depmod
INSMOD=/sbin/insmod

EXTIF="eth0"
INTIF="eth1"

$DEPMOD -a
$INSMOD ip_tables
$INSMOD ip_conntrack
$INSMOD ip_conntrack_ftp
$INSMOD ip_conntrack_irc
$INSMOD iptable_nat
$INSMOD ip_nat_ftp
$INSMOD ip_nat_irc

$IPTABLES --t filter -F
$IPTABLES -t nat -F

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

$IPTABLES -A FORWARD -i $INTIF -j ACCEPT
$IPTABLES -A FORWARD -i $EXTIF -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -d 192.168.1.2 -p tcp --multiport --dport 21,80,27015 -j ACCEPT

echo "1" > /proc/sys/net/ipv4/ip_forward

$IPTABLES -A INPUT -s 192.168.1.0/24 -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 22 -j ACCEPT
$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -i lo -j ACCEPT
$IPTABLES -A OUTPUT -o lo -j ACCEPT

$IPTABLES -t nat -A PREROUTING -d 128.x.x.x -p tcp --dport 21 -j DNAT --to 192.168.1.2

$IPTABLES -t nat -A PREROUTING -d 128.x.x.x -p tcp --dport 80 -j DNAT --to 192.168.1.2

$IPTABLES -t nat -A PREROUTING -d 128.x.x.x -p tcp --dport 27015 -j DNAT --to 192.168.1.2

$IPTABLES -t nat -A POSTROUTING -s 192.168.1.0/24 -j SNAT --to 128.x.x.x

--------------Boundary-00=_4JY8ZT5FQTUE9HM5YC13--


