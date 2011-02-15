From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Ebtables usage
Date: Tue, 15 Feb 2011 11:47:53 +0100
Message-ID: <4D5A59D9.9040407@plouf.fr.eu.org>
References: <AANLkTikpZ+q-L7AcYPmZzED3QAtNF-mDx47E5kfo41CW@mail.gmail.com>	<AANLkTikBvMercRhMs-rpRBYurGUV4J3FHXigtBXBhdsc@mail.gmail.com> <AANLkTimR2FQfmmnoy6YoYYGCAqs=j26KpvtLTYHHgMQN@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimR2FQfmmnoy6YoYYGCAqs=j26KpvtLTYHHgMQN@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jacky Lam <lamshuyin@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Jacky Lam a =E9crit :
> Yes, my config is like this:
>=20
>     Computer A (10.1.4.1) <-----> (eth0: 10.1.4.5) Linux Switch (eth1=
:
> 11.1.4.5) <-------> Computer B (11.1.4.3)
>=20
> I each ip_forwarding and config the route table of Computer A,B. I ge=
t
> 500Mb/s from iperf while Linux Switch is 100% loaded.
> As I know this switching is done in IP level,

Your box is set up as a router, not a switch/bridge. Routing is done at
the IP level, and switching/bridging is done at the ethernet level.

> I want to do the job in
> data link layer to get higher throughput/lower CPU usage.

Not sure you'll get higher throughput though. Bridging adds its own
overhead.

> Then I tried the following configuration:
>=20
>     Computer A (10.1.4.1) <-----> (eth0) Linux Switch (eth1) <-------=
>
> Computer B (10.1.4.3)
>=20
> I tried to setup a bridge like this as some document said:
>=20
> iptables -t nat -A POSTROUTING -s 10.1.4.0/24 -d 10.1.4.0/24 -j ACCEP=
T
> iptables -t nat -A POSTROUTING -s 10.1.4.0/24 -j MASQUERADE

What do you need these rules for ? They are not needed for pure bridgin=
g.

> brctl addbr br0
> brctl stp br0 off
> brctl addif br0 eth0
> brctl addif br0 eth1
>=20
> ifconfig eth0 0 0.0.0.0
> ifconfig eth1 0 0.0.0.0

Ok.

> ifconfig br0 10.1.4.5 netmask 255.255.255.0 up
>=20
> echo '1' > /proc/sys/net/ipv4/ip_forward

This is IP-related and not required for pure bridging.

> But the throughput is only 200Mb/s and my Linux Switch is 100% loaded=
=2E
> What's wrong with that?

It may be the overhead caused by bridge-nf, netfilter, IPv4 conntrack
and iptables.
Try with /proc/sys/net/bridge/bridge-nf-call-iptables set to 0.

You did not explain what you want to do exactly with this box.
