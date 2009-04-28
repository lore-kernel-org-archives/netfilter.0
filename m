From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: drop all packet on one interface of a bridge.
Date: Tue, 28 Apr 2009 11:36:47 +0200
Message-ID: <49F6CE2F.3040501@plouf.fr.eu.org>
References: <6EFFAB74-FFB0-4793-B702-1BA3DC56545D@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6EFFAB74-FFB0-4793-B702-1BA3DC56545D@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: mopsosforum <mopsosforum@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

mopsosforum a =E9crit :
>=20
> But I want to add another interface, eth3 on the bridge and for the=20
> moment, drop all the packet.
>=20
> I tried :
>=20
> ebtables -A INPUT -i eth3 -j DROP
> ebtables -A OUPUT -o eth3 -j DROP
> ebtables -A FORWARD -i eth3 -j DROP
> ebtables -A FORWARD -o eth3 -j DROP
>=20
> But I have always some packet :
> arp and msdns what always allow.
>=20
> How is it possible?

Thes packets may be sent directly on eth3, not on the bridge. ebtables=20
sees only packets which enter the bridge.

> How Can I drop this type on packet?

You can drop outgoing IP traffic on eth3 with iptables, or stop the=20
application or service sending this trafic from doing so.
