From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT for multiple non-directly connected subnets
Date: Sat, 10 Nov 2007 00:08:17 +0100
Message-ID: <4734E861.3030106@plouf.fr.eu.org>
References: <e97f32c10711081353t5602912fr560386581cd39c7@mail.gmail.com>	 <1194559495.19115.105.camel@grateful.d.umn.edu>	 <e97f32c10711081417s19405b28p39cdf353ac2731cb@mail.gmail.com>	 <1194560755.19115.110.camel@grateful.d.umn.edu>	 <e97f32c10711081434p52358fbcs6a22619fba121bb9@mail.gmail.com>	 <e97f32c10711090243m277b0bfcyc9e0015780c210f5@mail.gmail.com> <e97f32c10711090742h45794a40me7207df8d0d98473@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e97f32c10711090742h45794a40me7207df8d0d98473@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Bradley Kite <bradley.kite@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Bradley Kite a =E9crit :
>=20
> the connection-tracking needs to be turned off on the bridges in orde=
r
> to make this work:
>=20
> iptables --table raw -A PREROUTING -i [BRIDGE] -j NOTRACK

This may have undesirable side effects unless you add "-m physdev=20
--physdev-is-bridged" to ensure that this rule matches only bridged=20
traffic and not forwarded traffic received on the bridge interface.
If you just don't want Netfilter (including the conntrack and iptables)=
=20
to see the bridged IP traffic, you can do this by setting the sysctl=20
net.bridge.bridge-nf-call-iptables to 0.

echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables
or
sysctl -w net.bridge.bridge-nf-call-iptables=3D0

Add the following line in /etc/sysctl.conf to make it persistent across=
=20
reboots :

net.bridge.bridge-nf-call-iptables=3D0

--=20

