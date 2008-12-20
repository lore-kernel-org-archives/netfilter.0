From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: can't port forward on multihome
Date: Sat, 20 Dec 2008 12:06:51 +0100
Message-ID: <494CD1CB.6040602@plouf.fr.eu.org>
References: <gih0o4$45n$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gih0o4$45n$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

sean darcy a =E9crit :
> I have a multihomed server: eth0 is a static T1, and eth3 is a Verizo=
n=20
> dsl line. I want eth3 as the default for general traffic, and eth0 fo=
r=20
> VOIP traffic.
>=20
> eth1 is the internal interface. eth3 works fine as the masquerade out=
=20
> for NAT'd lan.
>=20
> I've used ip to set up eth0 so I can ssh into it:
>=20
> ## eth0 is static
> ETH0_IP_ADDR=3Dwww.xxx.yyy.zzz
> ip rule add from $ETH0_IP_ADDR/32 table 128 priority 128
> ## this is the route through the gateway ip
> ip route add default via <eth0 gateway ip> table 128
>=20
> and that works. Which is important since that's the static address; t=
he=20
> Verizon dsl address is dynamic.
>=20
> The VOIP server ( asterisk ) is on the lan. I've tried to port forwar=
d=20
> ssh to the voip server:
>=20
> $IPT -t nat -A PREROUTING  -p tcp --dport 2280 -j DNAT --to 10.10.10.=
180:22
> $IPT -A FORWARD -p tcp --dport 22 -m state --state NEW -d 10.10.10.18=
0=20
> -j ACCEPT
>=20
> This works if I ssh to the eth3, the dynamic dsl interface:
>=20
> ssh -p 2280 voip@<dsl ip address>
>=20
> I get an ssh session on the voip server.
>=20
> But:
>=20
> ssh -p 2280 voip@<static ip address>
>=20
> doesn't work. But I need to have others access the voip server using =
a=20
> static ip, but not give them access to the multihomed server.


The ip rule won't work for reply packets sent by the server, because .=20
source address mangling occurs after the routing decision so the source=
=20
address is 10.10.10.180, not (yet) eth0's address. If Verizon drops=20
packets sent with a source address other than the one assigned to eth3,=
=20
then the client won't receive any reply and the connection will fail.

In order to route the reply packets using table 128, you need to=20
identify them. I guess that 10.10.10.180:22 as the source address:port=20
is not discriminant enough, as it matches connections forwarded from=20
eth3 too.

You can use the CONNMARK target to mark the incoming connection on eth0=
=20
and copy the connection mark to the reply packets on eth1. Then you can=
=20
use the packet mark in an ip rule.

iptables -t mangle -A PREROUTING -i eth0 -m state --state NEW \
   -j CONNMARK --set-mark 0x1
iptables -t mangle -A PREROUTING -i eth1 -j CONNMARK --restore-mark
ip rule add fwmark 0x1 table 128 prio 127

As you used DNAT, you may use the --ctorigdst option of the 'conntrack'=
=20
match and mark reply packets based on the original destination address=20
of the connection.

iptables -t mangle -A PREROUTING -i eth1 \
   -m connmark --ctorigdst $ETH0_IP_ADDR -j MARK --set-mark 0x1
ip rule add fwmark 0x1 table 128 prio 127
