From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: unexpected behavior of ebtables' BROUTING target redirect
Date: Fri, 29 Aug 2014 00:21:47 +0200
Message-ID: <53FFAB7B.2060108@plouf.fr.eu.org>
References: <50558c54090512288e32c423bbf06fb4@digmore.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50558c54090512288e32c423bbf06fb4@digmore.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: k-yo@digmore.net
Cc: netfilter@vger.kernel.org

Hello,

k-yo@digmore.net a =E9crit :
>=20
> I have a bridge with a single ebtables rule to redirect all=20
> IPv4-containing frames to layer 3 filtering:
>=20
> # ebtables -t broute -A BROUTING -p IPV4 -j redirect --redirect-targe=
t=20
> DROP --log-level notice --log-prefix "br_br_br:   "
>=20
> then, if I send a frame containing IPv4 from one host to another one=20
> connected on another port of the bridge, I am supposed to get the=20
> destination MAC address to be the one of the bridge port it entered t=
he=20
> bridge if I believe the documentation.
>=20
> Or, logging packets with iptables, I see the source MAC address to=20
> become the bridge port address, and the destination MAC address the o=
ne=20
> of the host the message came from.
>=20
> ---- log on the bridge -----
>=20
> Aug 28 11:15:08 spy kernel: [ 4952.682369] br_br_br:   IN=3Deth0 OUT=3D=
 MAC=20
> source =3D 08:00:27:d5:24:36 MAC dest =3D 08:00:27:17:49:6d proto =3D=
 0x0800
> Aug 28 11:15:08 spy kernel: [ 4952.682406] ip_raw_pre: IN=3Deth0 OUT=3D=
=20
> MAC=3D08:00:27:df:b7:98:08:00:27:d5:24:36:08:00 SRC=3D192.168.142.103=
=20

> ---- ip a on bridge ----
>=20
> 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast=20
> master br0 state UP qlen 1000
>      link/ether 08:00:27:df:b7:98 brd ff:ff:ff:ff:ff:ff

I see nothing wrong here. The value following MAC=3D is the Ethernet
header in network order, i.e. destination:source:protocol.
