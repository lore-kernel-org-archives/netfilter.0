From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT overlaps with ports
Date: Wed, 23 Sep 2009 12:46:10 +0200
Message-ID: <4AB9FC72.9000906@plouf.fr.eu.org>
References: <4AB9EF8F.4020307@edu.physics.uoc.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AB9EF8F.4020307@edu.physics.uoc.gr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Kapetanakis Giannis a =E9crit :
>=20
> 192.168.1.0/24 is my public  IP range (eth0)

This IP range is private, not public.
If you made it up, please use the 192.0.2.0/24 range reserved for
examples and documentation instead.

> 10.0.0.0/24 is my private IP range (eth1)
> 192.168.1.1 public IP of server
> 10.0.0.1 private IP of server
>=20
> I'd like to add the following rules in the nat table:
>=20
> [1] -A PREROUTING -i eth0 -d 192.168.1.1 -p tcp --dport 8080 -j DNAT=20
> --to-destination 10.0.0.1:8080
> [2] -A POSTROUTING -o eth0 -s 10.0.0.1 -p tcp --sport 8080 -j SNAT=20
> --to-source 192.168.1.1:8080
> [3] -A POSTROUTING -o eth0 -s 10.0.0.0/24 --to-source=20
> 192.168.1.1-192.168.1.10

Rule [2] is pointless. Packets with source port 8080 are obviously
replies, and Netfilter NAT implicitly takes care of reply packets
packets. Actually, the 'nat' chains don't even see reply packets.

> According to http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-6=
=2Ehtml
> iptables is clever enough to avoid overlaps and clashes.
> Are we sure that there isn't any chance to map a random packet (not f=
rom=20
> the server)
> to 192.168.1.1:8080 in rule [3]?

No. That could happen as long as it does not create a collision with an
existing mapping. Why do you worry about it ?
The important point is that netfilter avoids collisions between existin=
g
NAT mappings. Rules do not create mappings by themselves, a mapping is
created only for each new connection created by a packet.

> I mean, does rule [2] reserve port 8080 of 192.168.1.1 ?

No. NAT rules do not reserve anything.
