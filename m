From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Port redirection
Date: Wed, 05 Aug 2009 16:04:11 +0200
Message-ID: <4A79915B.7050407@plouf.fr.eu.org>
References: <7d7f2e8c0908042157y4e80136ct82efd1dd2446db2c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7d7f2e8c0908042157y4e80136ct82efd1dd2446db2c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Steve Fink a =E9crit :
> I am trying to redirect all traffic generated on box $SRC to a
> particular UDP port to a different host $SPY. I've done similar thing=
s
> with whole TCP connections using DNAT and SNAT, but this time I want
> UDP and I want to be able to start up the redirection after the
> "connection" has been established. (I never see these packets in the
> 'nat' table.)

You don't see these packets in the 'nat' table because the "connection"=
=20
already exists and has an an entry in the conntrack table. You can=20
delete a conntrack entry with the conntrack command from the=20
conntrack-tools package. You can also prevent the packets to create a=20
conntrack entry by using the NOTRACK target in the 'raw' table until=20
after you add the NAT rules. Make sure to match packets in both=20
directions. After you remove the NOTRACK rules, the next packet will=20
enter the 'nat' chains and hit the NAT rules.

> The only option that seemed viable, me not knowing much about
> networking, was to use the 'mangle' table to set a mark on the
> outgoing packets, then use 'ip' to route the packet to $SPY. I've use=
d
> iptables a fair amount, but ip not at all.
>=20
> On $SRC, I ran:
>  iptables -t mangle -A OUTPUT -p udp --dport 8765 -j MARK --set-mark =
1
>  ip rule add fwmark 1 table 50
>  ip route add via $SPY table 50
>  sysctl net.ipv4.ip_forward=3D1 # Dunno if this matters

It doesn't matter. Packets are locally generated, the box does not act=20
as a router.

>  ip route flush cache
>=20
> On $SPY, I ran:
>  sysctl net.ipv4.ip_forward=3D1 # Makes sense here
>=20
> $SRC, $SPY, and $ORIG_DEST (the original destination) can all reach e=
ach other.
>=20
> According to iptables, the mark is getting set on the packets I want
> redirected. But tcpdump shows packets still going to the original
> destination, not $SPY. I am testing by running this on $SRC
>=20
>   nc -v -u $ORIG_DEST 8765
>=20
> And I trigger packets to be sent by hitting enter in that window. The
> packets are making it to my dummy server on $ORIG_DEST. They do not
> show up to tcpdump on $SPY.
>=20
> I don't know how to read the output of 'ip route show cache', but it =
includes
>=20
> $SPY from $SRC tos lowdelay dev tun0
>     cache  mtu 1412 advmss 1372 hoplimit 64
> local $SRC from $SPY tos lowdelay dev lo  src $SRC
>     cache <local,src-direct>  iif tun0
>=20
> (I'm testing this over a VPN, hence the tun0 device. Both $ORIG_DEST
> and $SPY are accessible via the VPN.)

This matters a lot : for both $ORIG_DEST and $SPY, the actual next hop=20
is the VPN endpoint.

> The only thing I can think of is that $SPY needs to be reachable in a
> single hop

Indeed, otherwise the actual next hop will forward the packets based on=
=20
the destination address. Whether the packet is marked or not, the next=20
hop is the VPN endpoint anyway, and it forwards the packets to=20
$ORIG_DEST, not $SPY.
