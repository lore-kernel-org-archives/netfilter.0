From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Clarification on the use of the statistic module
Date: Thu, 11 Jul 2013 11:10:47 +0200
Message-ID: <51DE7697.3020204@plouf.fr.eu.org>
References: <51DD79C7.3080707@tiendalinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51DD79C7.3080707@tiendalinux.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Nestor A. Diaz" <nestor@tiendalinux.com>
Cc: netfilter@vger.kernel.org

Hello,

Nestor A. Diaz a =E9crit :
>=20
> /sbin/iptables -t nat -A prerouting_rule -i eth0 -p tcp --dport 7000 =
-m
> state --state NEW -m statistic --mode nth --every 2 --packet 0 -j LOG
> --log-prefix 20130710095901_packet_0
> /sbin/iptables -t nat -A prerouting_rule -i eth0 -p tcp --dport 7000 =
-m
> state --state NEW -m statistic --mode nth --every 2 --packet 0 -j ACC=
EPT
> /sbin/iptables -t nat -A prerouting_rule -i eth0 -p tcp --dport 7000 =
-m
> state --state NEW -m statistic --mode nth --every 2 --packet 1 -j LOG
> --log-prefix 20130710095901_packet_1
> /sbin/iptables -t nat -A prerouting_rule -i eth0 -p tcp --dport 7000 =
-m
> state --state NEW -m statistic --mode nth --every 2 --packet 1 -j ACC=
EPT
> # default
> /sbin/iptables -t nat -A prerouting_rule -i eth0 -p tcp --dport 7000 =
-m
> state --state NEW -j LOG --log-prefix 20130710095901_packet_2
> /sbin/iptables -t nat -A prerouting_rule -i eth0 -p tcp --dport 7000 =
-m
> state --state NEW -j ACCEPT

Note : the state match is useless here : by definition packets in the
nat table cannot have any other state than NEW.

> ./count_packets.sh 20130710093659
> 0: 500
> 1: 250
> 2: 250

Exactly as expected.

> When i was expecting the following result:
>=20
> 0: 500
> 1: 500
> 2: 0
>=20
> What i am doing wrong ?

You ACCEPT the packets matching the first statistic set, so they won't
reach the second one. Therefore the second statistic set matches 50% of
the remaining packets, i.e. 50% * 50% =3D 25%.
