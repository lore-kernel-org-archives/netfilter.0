From: =?ISO-8859-1?Q?J=F6rg_L=FCbbert?= <j.luebbert@login-lanstation.de>
Subject: Re: CONNMARK udp comprehension question
Date: Tue, 27 Nov 2007 02:35:20 +0100
Message-ID: <474B7458.1090307@login-lanstation.de>
References: <474B2C65.1060706@endian.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <474B2C65.1060706@endian.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

This might help you without the need to mess with marks.

=46or each uplink interface with an incremental $x

ip route add default via $gateway_ip dev $uplink_interface table $x
ip rule add from $ip_of_interface dev $uplink_interface table $x

alternatively use -j CONNMARK --restore-mark in -t mangle PREROUTING so=
=20
that ip rules can match the mark or as a 3rd option use the ROUTE targe=
t.

- J=F6rg

Peter Warasin schrieb:
> Hi List
>=20
> Have a question in order to understand if i am tilting at windmills o=
r
> if there's an issue with my setup.
>=20
> Here a short description of my scenario to help me to explain myself:
>=20
> I have a box with multiple uplinks running openvpn in udp mode. One o=
f
> the uplinks has the default gateway (no multipath route). Now, whenev=
er
> i connect to an uplink which actually hasn't the default gateway,
> packets go in through that device and exit through another (due to th=
e
> default gateway), which will break the udp-"connection".
>=20
> Now, the question:
> I mark all connections entering a specific uplink with a number using
> CONNMARK, in order to be able to distinguish them and make them leave
> the correct interface using fwmark based ip rules.
>=20
> Shouldn't now the CONNMARK target, mark the connection in such a mann=
er
> that the udp packets coming in have the same mark as the udp packets
> going out whenever they belong to the same "connection"?
> Or is this just not possible due to the connection-less nature of udp=
?
>=20
> Same setup works for me with tcp and it also works with udp when the
> connections going through the box (FORWARD).
>=20
> Kernel is RH'L5.1's kernel-2.6.18-53 with all relevant options enable=
d
> and iptables 1.3.8.
>=20
> Any help would be greatly appreciated!
>=20
> peter
>=20

