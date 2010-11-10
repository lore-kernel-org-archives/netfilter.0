From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to transfer a IP packet based on ebtables and iptables?
Date: Wed, 10 Nov 2010 10:09:06 +0100
Message-ID: <4CDA6132.5040001@plouf.fr.eu.org>
References: <B6443739-BE5C-44B0-916D-69C4764DBDF6@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <B6443739-BE5C-44B0-916D-69C4764DBDF6@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sumin Xia <xiasumin1984@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Sumin Xia a =E9crit :
>=20
> According to my understanding, if I implement ebtables on my Linux =20
> system, a frame should be passed through ebtables modules.

Ebtables sees only packets on interfaces that are part of a bridge.

> Then, if =20
> ebtables modules find the destination mac address of the frame is the=
 =20
> local mac address, it will transfer the frame to layer-3, that is =20
> iptables, right?

Iptables is normally called from the IP layer, and the layer 3 is the I=
P
layer if the packet is an IP packet. But if the kernel was built with
the option CONFIG_BRIDGE_NETFILTER enabled (which is the most common
AFAICS) and /proc/sys/net/bridge/bridge-nf-call-iptables is set to 1
(the default), things are a bit more complicated : some iptables chains
are called from the bridge and interleaved with ebtables chains, and
won't be called from the IP layer. This is shown on the diagram in the
article about netfilter/iptables at Wikipedia. The purpose is to allow
to use iptables capabilities on purely bridged IP traffic.

> Now I want to do a test, which modifies the destination mac address o=
f =20
> a frame before sending it. Therefore, the frame will be forwarded to =
=20
> another destination instead of the real destination, while its =20
> destination ip address is still the real destination ip address. In =20
> this case, when the frame arrive at pseudo destination machine, will =
=20
> it be transfered to lay-3 of the system?

Yes.

> If it is transfered to lay-3 =20
> of the system, the system will find the destination ip address is not=
 =20
> local ip address. What will happen next? Drop the packet? or send an =
=20
> arp request to find the real destination mac address and forward it?

It depends whether the machine acts as a host or a router. If it acts a=
s
a host, it will discard the packet. If it acts as a router, it will try
to forward the packet to the next hop (which may not be the final
destination) according to its routing table. It will send an ARP reques=
t
only if it is a necessary step in order to reach the next hop.
