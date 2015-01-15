From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: TAP interface and iptables forwarding/nat/masquerading
Date: Thu, 15 Jan 2015 22:14:56 +0100
Message-ID: <54B82DD0.2070801@plouf.fr.eu.org>
References: <CA+HxBU+vzVOhY-iCMty=87Mo3yMnzo5Lw=x5E54D3Rud4GXSTA@mail.gmail.com>	<54B6E620.9070800@plouf.fr.eu.org> <CA+HxBUJ81GNZuzweK_KGn+cjs1ho2URZPjLKVF8XOpoOrhPjGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CA+HxBUJ81GNZuzweK_KGn+cjs1ho2URZPjLKVF8XOpoOrhPjGQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-15?Q?St=E9phane_Charette?= <stephanecharette@gmail.com>
Cc: netfilter@vger.kernel.org

St=E9phane Charette a =E9crit :
>=20
> Yes, I have one interface connected to my cable modem which DHCPs a
> 192.168.1.x address, and I'm using the alias (or the TAP interface) t=
o
> bring up a different 10.x network for my local machines.
>=20
>>> But if instead of creating an alias with the ifconfig command, I
>>> instead use a TAP device opened up from some C++ code with the same
>>> 10.0.1.1/24 address, I don't see any traffic coming into the TAP
>>> interface.
>>
>> How do you send trafic through the TAP interface ?
>=20
> This is the part I'm thinking I did wrong.  How should I get traffic
> to flow through the TAP interface?

You just send packets to an address which belongs to the subnet assigne=
d
to the TAP interface (but not the TAP interface address itself).

However your design is broken : assigning 10.0.1.1/24 to the TAP
interface tells the system that the 10.0.1.0/24 subnet is reachable
through the TAP interface. However the subnet is actually connected to
the ethernet interface. That cannot work.

>>> What I eventually want is to have a user-space C++ application that
>>> can examine traffic, and make decisions on what traffic to drop,
>>> modify packets, or packets to log.  Then that C++ application sends
>>> the remaining packets on their way.  Is it possible to use iptables
>>> for this?

It may be possible with advanced routing :
- Create a TUN interface, say "tun0", instead of TAP. You don't need th=
e
ethernet layer.
- Activate it but don't assign any address to it. Leave 10.0.1.1/24 on
the ethernet interface.
- Route forwarded packets received on the ethernet interface to the TUN
interface :

ip rule add iif eth0 lookup 10
ip route add default dev tun0

If I'm correct, packets received on eth0 should be routed to tap0 and
passed to the application, and packets sent back by the application
should be received on tap0 and routed to eth0 using the main routing
table. Note that locally sent or received (not forwarded) packets are
not affected.
