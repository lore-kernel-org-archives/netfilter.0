From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: brouting different VLANs
Date: Sun, 03 Mar 2013 12:44:26 +0100
Message-ID: <5133379A.7060803@plouf.fr.eu.org>
References: <CAB_DuvBof5krc-1J2iCA0zn4qc6vgOGD6O9OsmY+7oEfNfrv3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAB_DuvBof5krc-1J2iCA0zn4qc6vgOGD6O9OsmY+7oEfNfrv3Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dovydas Sankauskas <laisve@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Dovydas Sankauskas a =E9crit :
> Hi,
>=20
> I am having some troubles with brouter setup.

Why are you using brouting in this setup ?

> I have customers on different VLANS but on the same subnet. I want to
> allow access between customers and to allow access to internet.
> Unfortunatelly I can't make customers on VLAN 10 to ping customers on
> VLAN 20. Both VLANS 10 and 20 are on the _same_subnet_ 10.0.0.0/24.
>=20
> Here is my current setup:
>=20
>                 INTERNET
>                     |
>   +-----------+------------+----------+
>   |           |    eth2    |          |
>   |           | 1.2.3.4/30 |          |
>   |           +------------+          |
>   |                                   |
>   |   +---------------------------+   |
>   |   |            br0            |   |
>   |   |        10.0.0.1/24        |   |
>   |   +-------------+-------------+   |
>   |   |   bond0.10  |  bond0.20   |   |
>   |   |   vlan 10   |  vlan 20    |   |
>   +---+-------------+-------------+---+
>            |                 |
>          10.0.0.10     10.0.0.20
>=20
>=20
> I have eth0 and eth1 bonded into bond0. On bond0 I have VLAN
> interfaces bond0.10 and bond0.20 for VLAN 10 and VLAN 20 respectively=
=2E
> These bond0.10 and bond0.20 interfaces are bridged into interface br0=
=2E
> br0 address 10.0.0.1 is default gateway IP for customer1 10.0.0.10/24
> on VLAN 10 and for customer2 10.0.0.20/24 on VLAN 20.
> eth2 is my internet facing interface. There is no NAT.
>=20
> Internet access for both customers is working just fine with the
> following ebtables rules:
> ebtables -A FORWARD -i bond0.10 -j DROP
> ebtables -A FORWARD -i bond0.20 -j DROP
> ebtables -t broute -A BROUTING -p ! arp -i bond0.10 -j DROP
> ebtables -t broute -A BROUTING -p ! arp -i bond0.20 -j DROP
>=20
> However I am struggling to enable access between customer 10.0.0.10
> and customer 10.0.0.20.
> Please can you advise?

According to your ebtables rules, your drop all bridged traffic on
bond0.10 and bond0.20 and you force routing of all traffic except ARP o=
n
these interfaces. Why is that so, and can you explain how local direct
communication between these VLANs would be possible ?
