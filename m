From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Building network
Date: Thu, 06 Aug 2009 14:54:41 +0200
Message-ID: <4A7AD291.5050402@plouf.fr.eu.org>
References: <ca067d757753e0893cbebd61d2c90c8c.squirrel@webmail.vp44.net>    <b4a3339c0908060310p1314e793q8cd3a183cb8f59e3@mail.gmail.com> <a72d2cfe2db630c3ff5a4ddb83062fc2.squirrel@webmail.vp44.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <a72d2cfe2db630c3ff5a4ddb83062fc2.squirrel@webmail.vp44.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org
Cc: debian-firewall@lists.debian.org

Hello,

Jack Knowlton a =E9crit :
>=20
> {Debian}
> ppp0: bridge interface (PPPoE via eth0)

ppp0 is a PPP(oE) interface, not a bridge interface.

> eth1: LAN with public IP interface (xxx.xxx.xxx.153)
> eth2: LAN with private IP interface (10.0.1.2)
>=20
> {server2}
> eth0: LAN with public IP (in /29 subnet)
> eth1: LAN with private IP (10.0.1.3)
>=20
> {server3}
> same as server2

Why do you need some servers to have an interface in the private LAN ?

> {AP}
> eth0: LAN with private IP (10.0.1.5)
>=20
>=20
> What I want is that {Debian} does not do NAT on the LAN with public
> addressing (just route the connections to the appropriate servers) bu=
t do
> it for the LAN with private adresses,

In your iptables ruleset, just add "-s <private_subnet_prefix>" in the=20
SNAT or MASQUERADE rules, so only the private addresses are masqueraded=
=2E

> so that wifi clients can stay secure.

NAT is *not* for security. Netfilter NAT does *not* provide any=20
filtering. The use of private addresses breaks end-to-end connectivity,=
=20
and NAT just allows to restore a partial connectivity. Broken=20
connectivity may be seen as some sort of security, though, but not the=20
NAT itself...


