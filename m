From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Multiple inet gw and multipath
Date: Tue, 28 Feb 2006 15:06:57 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582901673AA@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Alpt <alpt@freaknet.org>, netfilter@lists.netfilter.org
Cc: netsukuku@freaknet.org

Well, what we do is to mark a packet coming in an interface and use a
special table based on mark to decide which route to take.  Ours is a
little more complicated as we are nat'ing addresses internal from each
external interface.  We end up having servers with two internal IP's
which are nat'ed to an external IP.  But the logic should still hold
true for you.

Iptables sets the mark in the mangle table.
-A PREROUTING -i eth0 -j MARK --set-mark 0x4=20
-A PREROUTING -i eth1 -j MARK --set-mark 0x8=20

Here is the script to handle the route.
#!/bin/sh

# LAN
LAN_IF=3Deth2
LAN_IP=3D10.94.64.254
LAN_NET=3D10.94.64.0/24

# NET 1
INET1_IF=3Deth0
INET1_IP=3D80.90.100.129
INET1_NET=3D80.90.100.138/29
INET1_GW=3D80.90.100.134

# NET 2
INET2_IF=3Deth1
INET2_IP=3D80.90.100.241
INET2_NET=3D80.90.100.240/29
INET2_GW=3D80.90.100.246


/sbin/ip rule del prio 50 table main
/sbin/ip rule add prio 50 table main
/sbin/ip route del default table main

/sbin/ip rule del prio 201 from $INET1_NET table 201
/sbin/ip rule add prio 201 from $INET1_NET table 201
/sbin/ip route add default via $INET1_GW dev $INET1_IF \
            src $INET1_IP proto static table 201
/sbin/ip route append prohibit default table 201 metric 1 proto static

/sbin/ip rule del prio 202 from $INET2_NET table 202
/sbin/ip rule add prio 202 from $INET2_NET table 202
/sbin/ip route add default via $INET2_GW dev $INET2_IF \
            src $INET2_IP proto static table 202
/sbin/ip route append prohibit default table 202 metric 1 proto static


# Match outgoing packets to their source interface
/sbin/ip rule del prio 221 fwmark 4 table 201
/sbin/ip rule add prio 221 fwmark 4 table 201
/sbin/ip rule del prio 222 fwmark 8 table 202
/sbin/ip rule add prio 222 fwmark 8 table 202

/sbin/ip rule del prio 250 table 250
/sbin/ip rule add prio 250 table 250
# Net 2 will be the default route, Net 1 is for incoming DSL
/sbin/ip route add default table 250 proto static \
            nexthop via $INET1_GW dev $INET1_IF \
            nexthop via $INET2_GW dev $INET2_IF




> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Alpt
> Sent: Tuesday, February 28, 2006 1:45 PM
> To: netfilter@lists.netfilter.org
> Cc: netsukuku@freaknet.org
> Subject: Multiple inet gw and multipath
>=20
> Hi there,
> this is the situation:
>=20
> We have a multipath default route. Each nexthop is an ipip tunnel to
> different
> inet gateways.
>=20
> 	default equalize
>         	nexthop via 10.10.1.1  dev tunl0 weight 1
> 	        nexthop via 10.10.1.2  dev tunl1 weight 1
> 	        nexthop via 10.10.1.3  dev tunl2 weight 1
>=20
> Each inet gw has a different IP on the Internet, therefore the tcp
> connection
> breaks if the packets go first from one gw and then after another one.
> What we need is to use the same gw for all the packets of a
connection.
>=20
> We can use "-o, --out-interface [!] name" to mark the outgoing
packets,
> especially the packets which initialize a new connection, and
associate
> each
> tunX interface to a routing rule.
>=20
> What's your advises?
>=20
> You can understand better the the whole situation here:
> http://archives.free.net.ph/message/20060207.030317.37885ea1.en.html
> http://marc.theaimsgroup.com/?l=3Dlinux-net&m=3D113550638110682&w=3D2
> and here:
> http://marc.theaimsgroup.com/?l=3Dlinux-net&m=3D113636640615375&w=3D2
>=20
> If we can resolve this problem, then it we'll be possible to use at
the
> same
> time multiple inet gw in Netsukuku:
>=20
> http://lab.dyne.org/Ntk_IGS
>=20
> Thanks ^_^
> --
> :wq!
> "I don't know nothing" The One Who reached the Thinking Matter   '.'
>=20
> [ Alpt --- Freaknet Medialab ]
> [ GPG Key ID 441CF0EE ]
> [ Key fingerprint =3D 8B02 26E8 831A 7BB9 81A9  5277 BFF8 037E 441C =
F0EE
]

