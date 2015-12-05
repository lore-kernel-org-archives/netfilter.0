From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Marking frames with ebtables for iptables
Date: Sat, 05 Dec 2015 12:30:20 +0100
Message-ID: <5662CACC.9010809@plouf.fr.eu.org>
References: <loom.20151202T145721-935@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20151202T145721-935@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Oliver Graute <oliver.graute@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Oliver Graute a =E9crit :
>=20
> I try to mark some frames with ebtables on MAC Layer to pass these ma=
rk to=20
> iptables network layer.
>=20
> I build up a bridge interface br0, cleared all ebtables and iptables =
tables=20
> as preparation. Then I try something like this:  =20
>=20
> ebtables -t filter -A INPUT -p IPv4 -s 00:11:22:33:44:55 -i eth0 -j m=
ark --
> mark-set 0xffff --mark-target ACCEPT
> ebtables -t filter -A INPUT --log-level info --log-ip --log-prefix EB=
=46W
> iptables -t mangle -A PREROUTING -m mark --mark 0xffff

What's the use of this rule with no target ?

> iptables -t mangle -A PREROUTING -m mark --mark 0xffff -j LOG --log-l=
evel=20
> info --log-prefix MARKED
>=20
> i would expect that iptables log show me the marked packages from ebt=
ables.=20
> But i see no mark 0xffff

Check the packet flow diagram at
<https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-f=
low.svg>

You can see that if the packet is received on a bridge (blue
background), ebtables/INPUT (blue header) comes after
iptables/PREROUTING (green header). To avoid the iptables/ebtables mix,
you must disable iptables call by bridge-nf :

echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables

What is your goal ? If you just need to match the source MAC address,
you don't need ebtables. Iptables has the "mac" match.
