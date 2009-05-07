From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: RE: How to reset everything
Date: Thu, 07 May 2009 18:51:33 +0300
Message-ID: <1241711493.5166.14.camel@casper.meteor.dp.ua>
References: <002c01c9ce96$8336c230$89a44690$@com>
	 <1241690640.5166.1.camel@casper.meteor.dp.ua>
	 <004301c9cf1a$b6f92390$24eb6ab0$@com>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <004301c9cf1a$b6f92390$24eb6ab0$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: barich@trisectrix.com
Cc: netfilter@vger.kernel.org

=F7 =FE=D4=D7, 07/05/2009 =D7 09:49 -0400, Barry A Rich =D0=C9=DB=C5=D4=
:
> > -----Original Message-----
> > From: =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB [mailto:=
casper@meteor.dp.ua]
> > Sent: Thursday, May 07, 2009 6:04 AM
> > To: barich@trisectrix.com
> > Cc: netfilter@vger.kernel.org
> > Subject: Re: How to reset everything
> >=20
> > =F7 =F3=D2=C4, 06/05/2009 =D7 18:03 -0400, Barry A Rich =D0=C9=DB=C5=
=D4:
> > > We use Netfilter to load balance UDP packets across multiple upli=
nks
> (ppp0,
> > > ppp1, ppp2, ppp3). Uplinks can be added or removed on the fly. Wh=
en this
> > > happens, we reset everything and run the firewall/routing script =
that
> > > matches the new uplink configuration. The reset looks like this:
> > >
> > > ######################### Begin reset #########################
> > >
> > > iptables -F INPUT
> > > iptables -P INPUT DROP
> > > iptables -F OUTPUT
> > > iptables -P OUTPUT DROP
> > > iptables -F FORWARD
> > > iptables -P FORWARD DROP
> > > iptables -F -t raw
> > > iptables -F -t nat
> > > iptables -F -t mangle
> > >
> > > ip route del default
> > > ip route flush table uplink1
> > > ip route flush table uplink2
> > > ip route flush table uplink3
> > > ip route flush table uplink4
> > > ip route flush dev ppp0
> > > ip route flush dev ppp1
> > > ip route flush dev ppp2
> > > ip route flush dev ppp3
> > >
> > > tc qdisc del dev ppp0 root
> > > tc qdisc del dev ppp1 root
> > > tc qdisc del dev ppp2 root
> > > tc qdisc del dev ppp3 root
> > >
> > > ip route flush cache
> > >
> > > ######################### End reset #########################
> > >
> > > For two uplinks, the setup looks like this:
> > >
> > > ######################### Begin setup #########################
> > >
> > > iptables -t raw -A PREROUTING -i eth0 -p udp --sport 6970 -j NOTR=
ACK
> > >
> > > iptables -t mangle -A PREROUTING -p udp --sport 6970 -m statistic=
 --mode
> nth
> > > --every 2 --packet 0 -j MARK --set-mark 1
> > >
> > > iptables -t mangle -A PREROUTING -p udp --sport 6970 -m statistic=
 --mode
> nth
> > > --every 2 --packet 1 -j MARK --set-mark 2
> > >
> > > tc qdisc add dev ppp0 root handle 1: prio
> > >
> > > tc qdisc add dev ppp1 root handle 1: prio
> > >
> > > tc filter add dev ppp0 parent 1:0 protocol ip prio 1 \
> > >     handle 1 fw flowid 1:1 action nat egress x.x.x.x/32 y.y.y.y
> > >
> > > tc filter add dev ppp1 parent 1:0 protocol ip prio 1 \
> > >     handle 2 fw flowid 1:1 action nat egress x.x.x.x/32 z.z.z.z
> > >
> > > ######################### End setup #########################
> > >
> > > The UDP stream continues to be received on the LAN interface duri=
ng the
> > > reset/setup. The reset/setup works most of the time, but occasion=
ally
> the
> > > packets going out ppp0 do not get NAT'd after a reset/setup. Repe=
ating
> the
> > > setup/reset sequence a second time seems to make it work, but I'd=
 rather
> > > understand what's wrong and fix it.
> > >
> > > All help is appreciated.
> > >
> > > Thanks.
> >=20
> > Try adding to your reset script:
> >=20
> > conntrack -F conntrack
> > conntrack -F expect
> >=20
> > --
> > =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor=
=2Edp.ua>
>=20
> That did not solve the problem. Could it be packets that get queued u=
p while
> the reset is in progress?

If this is the case the delay shouldn't be long. Also, if this is the
case next packets should behave as you expected and you wouldn't be
reseting second time.

>  Should the uplink queues get flushed? If so, how
> is that done?

tc qdics del && tc qdisc add(???)

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

