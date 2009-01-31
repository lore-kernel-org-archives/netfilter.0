From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ebtables without bridge
Date: Sat, 31 Jan 2009 11:11:02 +0100
Message-ID: <498423B6.3060706@plouf.fr.eu.org>
References: <20090131024543.M20230@mail.csu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090131024543.M20230@mail.csu.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Michail Zhilkin a =E9crit :
>=20
> I have no bridge interfaces at all, only one physical Ethernet card.
>=20
> Is it possible to filter incoming and outgoing Layer2 traffic using=20
> ebtables in this case?

No. ebtables rules work only on bridges.

> I tried to load simple rules to test ebtables firewall:
>=20
> [root@space]# ebtables -P INPUT DROP
> [root@space]# ebtables -P OUTPUT DROP
> [root@space]# ebtables -P FORWARD DROP
[...]
> All traffic should be blocked, but I can send and receive everything.=
=2E.=20
[...]
> What is wrong? Are ebtables really designed for bridges only?

Yes.

> If so, what cat I do?

You can create a bridge and add the ethernet interface to it.

> I would like to drop all Layer2 traffic except Ethernet frames with I=
Pv4=20
> and ARP protocols.

May I ask why ? If you enable only IPv4 support the networking stack=20
won't accept or send packets with ethertypes other than IPv4 and ARP.

> In addition, i need only allow frames with my=20
> MAC-address (incoming and outgoing, i.e. locally generated).

An ethernet interface accepts only packets sent to its own MAC address=20
or the broadcast address anyway, unless you set it in promiscuous mode=20
or use some multicast.
