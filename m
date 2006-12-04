From: "Matt" <Matt@PlumSoftware.co.uk>
Subject: NAT & Multihoming Problem
Date: Mon, 4 Dec 2006 17:15:10 -0000
Message-ID: <117F5E7DA31C17478948DC39E01B948B400F1F@frost.PlumSoftwareLtd.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I hope someone can help - or at least tell me whether what I'm trying to =
do is possible!

I have set up a linux box with 3 NICs, two external public IPs and one =
internal private IP. I set up the multihoming as per section 4.2 of the =
Advanced Routing HowTo. This seems to work OK without trying to do any =
NAT. (I've successfully pinged each public IP from a dial up connection =
on a laptop whilst the cable for the other NIC is disconnected)

Things don't work when I try to add NAT to the picture. I want to do =
port forwarding on both public IPs to a single private IP. Is this =
possible at all?

The current set up is as follows:

linux router:
eth0: 192.168.0.230/24
eth1: 100.100.251.218/29
eth2: 200.200.108.140/29

internal server:
eth0: 192.168.0.5/24

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D IPCHAINS STUFF =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

#!/bin/sh

IPTABLES=3D"/sbin/iptables"

#Time to clean house

#Clear out any existing firewall rules, and any chains that might have
#been created
$IPTABLES -F
$IPTABLES -F INPUT
$IPTABLES -F OUTPUT
$IPTABLES -F FORWARD
$IPTABLES -F -t mangle
$IPTABLES -F -t nat
$IPTABLES -X

#Setup our policies
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT

#This enables ip forwarding, and thus by extension, NAT
#Turn this on if you're going to be doing NAT or Masquerading
echo 1 > /proc/sys/net/ipv4/ip_forward

/sbin/modprobe ip_conntrack
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp
/sbin/modprobe iptable_nat


#Source NAT everything heading out the external interfaces
$IPTABLES -t nat -A POSTROUTING -o eth1 -j SNAT --to 100.100.251.218
$IPTABLES -t nat -A POSTROUTING -o eth2 -j SNAT --to 200.200.64.140

#This is the rule for publishing the Internal Server
$IPTABLES -t nat -A PREROUTING -i eth1 -p tcp --dport 56100 -j DNAT --to =
192.168.0.5
$IPTABLES -t nat -A PREROUTING -i eth2 -p tcp --dport 56100 -j DNAT --to =
192.168.0.5

#Now, our firewall chain
#We use the limit commands to cap the rate at which it alerts to 15
#log messages per minute
$IPTABLES -N firewall
$IPTABLES -A firewall -m limit --limit 1000/minute -j LOG --log-prefix =
Firewall:
$IPTABLES -A firewall -j DROP

#Now, our dropwall chain, for the final catchall filter
$IPTABLES -N dropwall
$IPTABLES -A dropwall -m limit --limit 1000/minute -j LOG --log-prefix =
Dropwall:
$IPTABLES -A dropwall -j DROP

#Our "hey, them's some bad tcp flags!" chain
$IPTABLES -N badflags
$IPTABLES -A badflags -m limit --limit 1000/minute -j LOG --log-prefix =
Badflags:
$IPTABLES -A badflags -j DROP

#And our silent logging chain
$IPTABLES -N silent
$IPTABLES -A silent -j DROP

#Accept ourselves (loopback interface), 'cause we're all warm and =
friendly
$IPTABLES -A INPUT -i lo -j ACCEPT

#basic state-matching
#This allows us to accept related and established connections, so
#client-side things like ftp work properly, for example.
$IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

#Our final trap. Everything on INPUT goes to the dropwall so we don't =
get silent drops
$IPTABLES -A INPUT -j dropwall

/sbin/ip route flush cache



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D ROUTING STUFF =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

# Set up supplementary routing tables

ip route add 100.100.251.216/29 dev eth1 src 100.100.251.218 table T1
ip route add default via 100.100.251.217 table T1
ip route add 200.200.64.136/29 dev eth2 src 200.200.64.140 table T2
ip route add default via 200.200.64.137 table T2

# set default route for traffic originating from this machine to go via =
a third router
ip route add default via 192.168.0.252

ip rule add from 100.100.251.218 table T1
ip rule add from 200.200.64.140 table T2

ip route add 192.168.0.0/24 dev eth0 table T1
ip route add 200.200.64.136/29 dev eth2 table T1
ip route add 127.0.0.0/8 dev lo table T1
ip route add 192.168.0.0/24 dev eth0 table T2
ip route add 100.100.251.216/29 dev eth1 table T2
ip route add 127.0.0.0/8 dev lo table T2




When type "ip rule add from 192.168.0.5 lookup T2" at the server, it all =
starts working from my laptop and dial up account but this means, of =
course, that all traffic from the internal server is routed through =
200.200.64.140 regardless of which interface it arrived at.

What am I doing wrong? Or am I trying to do something impossible?

Hope you can help,

Matt.

