From: "Torsten Puls" <debian@pumpum.de>
Subject: WG: SNAT? DNAT? nur wie?
Date: Sun, 6 Apr 2003 14:07:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DHEJIOOJDPNLNFDGOGMGMEMFCDAA.debian@pumpum.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org



-----Urspr=FCngliche Nachricht-----
Von: Torsten Puls [mailto:toto@pumpum.de]
Gesendet: Sonntag, 6. April 2003 14:06
An: toto@pumpum.de
Betreff: SNAT? DNAT? nur wie?


Hallo ich habe ein Debian-Dystem 3.0, Kernel 2.4.18.


+-------------+						+-------------+
| DSL Router  |                                 | ISDN-Router |
| 192.168.0.1 |                                 | 192.168.1.1 |
+-------------+                                 +-------------+
       |                                                |
       |                                                |
       +-----------+                    +---------------+
                   |                    |
             +-----------------------------------+
             |   eth2                  eth0      |
             | 192.168.0.10		192.168.1.10 |
             |                                   |
             |               eth1                |
             |          172.16.3.6               |
             +-----------------------------------+
                             |
                             |
             +-----------------------------------+
             |     interne Netz 172.16.3.0/24    |


Folgendes:

Email-Traffic via ISDN-Router
WWW via DSL-Router

pstree:
qmail
squid
apache

mein firewall skript
!! SNAT Rules
Wie mache ich es richtig?

interne browser =3D> port 3128:eth1
pop/smtp =3D> eth0



#!/bin/sh
route add -net 172.16.1.0/24 gw 172.16.3.2
### eth0 Internet
DTAG_NET=3D"192.168.1.0/24"
DTAG_INTERFACE=3D"eth0"
DTAG_IP=3D"192.168.1.10"
### eth1 intern
INTERN_NET=3D"172.16.3.0/24"
INTERN_INTERFACE=3D"eth1"
INTERN_IP=3D"172.16.3.6"
### eth2 DSL
DMZ01_NET=3D"192.168.0.0/24"
DMZ01_INTERFACE=3D"eth2"
DMZ01_IP=3D"192.168.0.10"
### Kernel-Tuning
echo     1 > /proc/sys/net/ipv4/ip_forward
echo     1 > /proc/sys/net/ipv4/tcp_syncookies
echo "8182" > /proc/sys/net/ipv4/ip_conntrack_max

iptables -F INPUT
iptables -F FORWARD
iptables -F OUTPUT
iptables -t nat -F PREROUTING
iptables -t nat -F OUTPUT
iptables -t nat -F POSTROUTING
iptables -t mangle -F PREROUTING
iptables -t mangle -F OUTPUT

iptables -P FORWARD DROP
iptables -P INPUT DROP
iptables -P OUTPUT DROP

iptables -A INPUT -d $DMZ01_IP -m state --state ESTABLISHED,RELATED -j
ACCEPT
iptables -A OUTPUT -s $DMZ01_IP -m state --state NEW,ESTABLISHED,RELATED -j
ACCEPT

iptables -A INPUT -d $DTAG_IP -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -s $DTAG_IP -m state --state NEW,ESTABLISHED,RELATED -j
ACCEPT

iptables -A INPUT -d $INTERN_IP -m state --state NEW,ESTABLISHED,RELATED -j
ACCEPT
iptables -A OUTPUT -s $INTERN_IP -m state --state NEW,ESTABLISHED,RELATED -j
ACCEPT

iptables -A OUTPUT -o $INTERN_INTERFACE -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT  -i $INTERN_INTERFACE -j ACCEPT
iptables -A OUTPUT -o $INTERN_INTERFACE -j ACCEPT

iptables -A INPUT   -i $DTAG_INTERFACE   -p TCP --dport 25   -j ACCEPT
iptables -A INPUT   -i $INTERN_INTERFACE -p TCP --dport 25   -j ACCEPT
iptables -A INPUT   -i $INTERN_INTERFACE -p TCP --dport 80   -j ACCEPT
iptables -A INPUT   -i $INTERN_INTERFACE -p TCP --dport 110  -j ACCEPT
iptables -A INPUT   -i $INTERN_INTERFACE -p TCP --dport 3128 -j ACCEPT

### SNAT Regeln
#
#  ????????????????????????????????
iptables -t nat -A PREROUTING  -i $INTERN_INTERFACE -p  -j DNAT --to
$DMZ01_IP
iptables -t nat -A POSTROUTING -o $DTAG_INTERFACE   -s $INTERN_NET      -j
SNAT --to $DTAG_IP


### EOF


#route:
192.168.0.10    192.168.0.1     255.255.255.255 UGH   0      0        0 eth2
192.168.0.0     *               255.255.255.0   U     0      0        0 eth0
172.16.3.0      *               255.255.255.0   U     0      0        0 eth1
192.168.0.0     *               255.255.255.0   U     0      0        0 eth2
172.16.1.0      172.16.3.2      255.255.255.0   UG    0      0        0 eth1
default         192.168.1.1     0.0.0.0         UG    0      0        0 eth0

#ip ru ls:
0:      from all lookup local
32765:  from 192.168.0.10 lookup DSL
32766:  from all lookup main
32767:  from all lookup default


#ip ro ls:
192.168.0.10 via 192.168.0.1 dev eth2
192.168.1.0/24 dev eth0  proto kernel  scope link  src 192.168.1.10
172.16.3.0/24 dev eth1  proto kernel  scope link  src 172.16.3.6
192.168.0.0/24 dev eth2  proto kernel  scope link  src 192.168.0.10
172.16.1.0/24 via 172.16.3.2 dev eth1
default via 192.168.1.1 dev eth0
111,1



Hilfe Help

Torsten


