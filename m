From: <Matthieu.Marc@ensam.eu>
Subject: IP NAT and IBM LUM Server
Date: Thu, 21 Apr 2011 11:24:27 +0000
Message-ID: <FAA59F1932AB3D41B9AA8F4C35110F2B24ED6C54@AM-MAIL-1.ensam>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: fr-FR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi All,

I have some trouble to  access to an IBM LUM Server from computer behin=
d NAT. LUM Server =3D licence Server used for Catia for example.

I have a private network : 10.33.2.0/16 with a test computer (10.33.2.1=
05)
I have an iptables firewall=20
Linux an-nat-catia 2.6.35-22-generic-pae #33-Ubuntu SMP Sun Sep 19 22:1=
4:14 UTC 2010 i686 GNU/Linux
iptables v1.4.4

                The internal address on eth2 is 10.33.4.1
                The external address on eth0 is 193.48.196.39 (address =
used for NAT too).

I try to connect to IBM LUM Server IP 193.52.82.50=20

[Client 10.33.2.105] ---------------- [ eth2 10.33.4.1 Firewall Iptable=
s 193.48.196.39 eth0 ] --------------@internet---------- [193.52.82.50 =
- IBM LUM Server]


The particularity of IBM LUM Server and Client is that the LUM Server t=
ry to call back to the client using a different source port, but always=
 on the dest port used by the client at starting.

My iptables configuration is just :=20

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 193.48.196.3=
9
                (and ip forwarding enabled)

root@an-nat-catia:/ # iptables -L

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

root@an-nat-catia:/ # iptables -t nat -L

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  anywhere             anywhere            to:193.48.=
196.39


Using tcpdump, it look like :

Internal Interface :

root@an-nat-catia:~# tcpdump -n -i eth2 host 193.52.82.50

tcpdump: verbose output suppressed, use -v or -vv for full protocol dec=
ode
listening on eth2, link-type EN10MB (Ethernet), capture size 65535 byte=
s

13:13:10.773717 IP 10.33.2.105.1327 > 193.52.82.50.1515: UDP, length 80
13:13:12.761664 IP 10.33.2.105.1327 > 193.52.82.50.1515: UDP, length 80
13:13:12.763466 IP 193.52.82.50.1515 > 10.33.2.105.1327: UDP, length 80


External Interface :

root@an-nat-catia:~# tcpdump -n -i eth0 host 193.52.82.50

tcpdump: verbose output suppressed, use -v or -vv for full protocol dec=
ode
listening on eth0, link-type EN10MB (Ethernet), capture size 65535 byte=
s

13:13:10.774081 IP 193.48.196.39.1327 > 193.52.82.50.1515: UDP, length =
80
13:13:10.776922 IP 193.52.82.50.1044 > 193.48.196.39.1327: UDP, length =
100
13:13:10.776986 IP 193.48.196.39 > 193.52.82.50: ICMP 193.48.196.39 udp=
 port 1327 unreachable, length 136
13:13:12.693093 IP 193.52.82.50.1044 > 193.48.196.39.1327: UDP, length =
80
13:13:12.693115 IP 193.48.196.39 > 193.52.82.50: ICMP 193.48.196.39 udp=
 port 1327 unreachable, length 116
13:13:12.761676 IP 193.48.196.39.1327 > 193.52.82.50.1515: UDP, length =
80
13:13:12.763444 IP 193.52.82.50.1515 > 193.48.196.39.1327: UDP, length =
80
13:13:14.686494 IP 193.52.82.50.1044 > 193.48.196.39.1327: UDP, length =
80
13:13:14.686519 IP 193.48.196.39 > 193.52.82.50: ICMP 193.48.196.39 udp=
 port 1327 unreachable, length 116

As you can see, the second packet on external interface is from port 10=
44 (new port used by server) to port 1327 (used by client at first).

I understand what I need to do violate the IP NAT task. The problem is =
that I know some people who are able to communicate through NAT to IBM =
LUM Server using a cisco firewall (asap) just configuring a simply dyna=
mic NAT.=20

Am I missing a rule ? why is it working for cisco ? are they doing some=
 mysterious NAT ?

PS : I tried with freebsd firewall (pfsense) without success.

Cordialy,

Matthieu MARC

---
Matthieu MARC
Responsable du Service Informatique du Centre d'Angers
Arts et M=E9tiers ParisTech
T=E9l=A0: 02 41 20 73 61

