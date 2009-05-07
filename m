From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: How to reset everything
Date: Thu, 07 May 2009 13:04:00 +0300
Message-ID: <1241690640.5166.1.camel@casper.meteor.dp.ua>
References: <002c01c9ce96$8336c230$89a44690$@com>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <002c01c9ce96$8336c230$89a44690$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: barich@trisectrix.com
Cc: netfilter@vger.kernel.org

=F7 =F3=D2=C4, 06/05/2009 =D7 18:03 -0400, Barry A Rich =D0=C9=DB=C5=D4=
:
> We use Netfilter to load balance UDP packets across multiple uplinks =
(ppp0,
> ppp1, ppp2, ppp3). Uplinks can be added or removed on the fly. When t=
his
> happens, we reset everything and run the firewall/routing script that
> matches the new uplink configuration. The reset looks like this:
>=20
> ######################### Begin reset #########################
>=20
> iptables -F INPUT
> iptables -P INPUT DROP
> iptables -F OUTPUT
> iptables -P OUTPUT DROP
> iptables -F FORWARD
> iptables -P FORWARD DROP
> iptables -F -t raw
> iptables -F -t nat
> iptables -F -t mangle
>=20
> ip route del default
> ip route flush table uplink1
> ip route flush table uplink2
> ip route flush table uplink3
> ip route flush table uplink4
> ip route flush dev ppp0
> ip route flush dev ppp1
> ip route flush dev ppp2
> ip route flush dev ppp3
>=20
> tc qdisc del dev ppp0 root
> tc qdisc del dev ppp1 root
> tc qdisc del dev ppp2 root
> tc qdisc del dev ppp3 root
>=20
> ip route flush cache
>=20
> ######################### End reset #########################
>=20
> For two uplinks, the setup looks like this:
>=20
> ######################### Begin setup #########################
>=20
> iptables -t raw -A PREROUTING -i eth0 -p udp --sport 6970 -j NOTRACK
>=20
> iptables -t mangle -A PREROUTING -p udp --sport 6970 -m statistic --m=
ode nth
> --every 2 --packet 0 -j MARK --set-mark 1
>=20
> iptables -t mangle -A PREROUTING -p udp --sport 6970 -m statistic --m=
ode nth
> --every 2 --packet 1 -j MARK --set-mark 2
>=20
> tc qdisc add dev ppp0 root handle 1: prio
>=20
> tc qdisc add dev ppp1 root handle 1: prio
>=20
> tc filter add dev ppp0 parent 1:0 protocol ip prio 1 \
>     handle 1 fw flowid 1:1 action nat egress x.x.x.x/32 y.y.y.y
>=20
> tc filter add dev ppp1 parent 1:0 protocol ip prio 1 \
>     handle 2 fw flowid 1:1 action nat egress x.x.x.x/32 z.z.z.z
>=20
> ######################### End setup #########################
>=20
> The UDP stream continues to be received on the LAN interface during t=
he
> reset/setup. The reset/setup works most of the time, but occasionally=
 the
> packets going out ppp0 do not get NAT'd after a reset/setup. Repeatin=
g the
> setup/reset sequence a second time seems to make it work, but I'd rat=
her
> understand what's wrong and fix it.
>=20
> All help is appreciated.
>=20
> Thanks.

Try adding to your reset script:

conntrack -F conntrack
conntrack -F expect

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

