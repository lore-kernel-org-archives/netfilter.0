From: "Lesley Kimmel" <lesley.j.kimmel@cox.net>
Subject: Private IP Getting Past IPTables
Date: Thu, 1 Mar 2012 17:32:00 -0600
Message-ID: <4735183F49074B86A8375F2D6E998E2E@LesKimmelPC>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	reply-type=original"
To: netfilter@vger.kernel.org

All;

We have a Linux virtual server which we use as a NAT/Router (running
IPTables 1.2.11) to front-end a set of virtual machines on a private
(192.168.0.x) network. In this private network are two web servers and =
a few
other application servers. Our intent is to utilize two public IP addre=
sses
on the NAT server to NAT to each back-end web server:

External Interfaces:
eth1 =3D xxx.xxx.xxx.1 =3D> 192.168.0.1 (webserver #1)
eth1:0 =3D xxx.xxx.xxx.2 =3D> 192.168.0.2 (webserver #2)
Internal Interface:
eth0 =3D 192.168.0.3

We had accomplished this with the following IPTables configuration
Table: nat
Chain PREROUTING (policy DROP)
target prot in out source destination
DNAT tcp eth1 any anywhere xxx.xxx.xxx.1 to:192.168.0.1
DNAT tcp eth1 any anywhere xxx.xxx.xxx.2 to:192.168.0.2
ACCEPT all eth0 any 192.168.0.0/24 anywhere #(to allow all outgoing tra=
ffic)

Chain POSTROUTING (policy DROP)
target prot in out source destination
SNAT all any eth1 192.168.0.1 xxx.xxx.xxx.1
SNAT all any eth1 192.168.0.2 xxx.xxx.xxx.2
SNAT all any eth1 192.168.0.0/24 xxx.xxx.xxx.1 #SNAT all other traffic =
to ip
#1

Chain OUTPUT (policy ACCEPT)

Table: filter
Chain Input (policy ACCEPT)
target prot in out source destination

Chain FORWARD (policy ACCEPT)
target prot in out source destination

Chain OUTPUT (policy ACCEPT)
target prot in out source destination

Everything APPEARS to work correctly with this configuration. However,
several times a day network monitoring tools on the public side of the =
NAT
server see packets with source addresses from the private network (e.g.
192.168.0.4). In order to troubleshoot we minimized our configuration t=
o try
to isolate the problem. We took out the NATing for the second IP:

Table: nat
Chain PREROUTING (policy DROP)
target prot in out source destination
DNAT tcp eth1 any anywhere xxx.xxx.xxx.1 to:192.168.0.1
ACCEPT all eth0 any 192.168.0.0/24 anywhere #(to allow all outgoing tra=
ffic)

Chain POSTROUTING (policy DROP)
target prot in out source destination
SNAT all any eth1 192.168.0.1 xxx.xxx.xxx.1

Chain OUTPUT (policy ACCEPT)

Table: filter
Chain Input (policy ACCEPT)
target prot in out source destination

Chain FORWARD (policy ACCEPT)
target prot in out source destination

Chain OUTPUT (policy ACCEPT)
target prot in out source destination

With this configuration the 'leaking' of the private IP addresses seems=
 to
stop. However, we need to have the functionality of the second IP addre=
ss.
Any insight into why the 'leak' is happening and how we can add the sec=
ond
IP back in?

Also, a tcpdump on the NAT box shows that the majority of the TCP conne=
ction
is performing as expected. At some random times a few packets will =E2=80=
=98escape=E2=80=99.
These packets have always been either FIN or RST packets.


