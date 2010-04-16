From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Possible IPTables bug in INPUT interface filtering?
Date: Fri, 16 Apr 2010 17:23:12 +0200
Message-ID: <4BC880E0.3070100@plouf.fr.eu.org>
References: <p2l464fbb2d1004152012p719184c9g57ac7c7562994929@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <p2l464fbb2d1004152012p719184c9g57ac7c7562994929@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

John Engelke a =E9crit :
> Hello IPFilter Guru World,

This list is about Netfilter, not IPFilter.

> I've encountered some strangeness in filtering on a multihomed Linux
> box, CentOS 5, x86_64, 2.6.18-164.15.1.el5, where using the interface
> flag (-i) does not work.
>=20
> So this box has two interfaces on the local subnet, eth0 and eth1.

Are both interfaces connected to the same subnet ? If so, I don't call
this "multihomed".

> I
> would like to restrict VNC to only one of the interfaces, eth1. At th=
e
> start, VNC does not work. So I add this:
>=20
> -A INPUT -i eth1 -p tcp -m multiport --port 5900 -j ACCEPT
>=20
> Then, VNC starts working on eth0 AND eth1.

Are you sure ? How do you know ?

> Since I know the address of eth1, I then put it in explicitly as:
>=20
> -A INPUT -i eth1 -p tcp -d 192.168.1.34 -m multiport --port 5900 -j A=
CCEPT
>=20
> Amazingly, this works and now VNC traffic is only allowed on eth1
> (address 192.168.1.34). So I believe I am concluding correctly that
> interface filtering *does not work* for INPUT statements in multihome=
d
> machines. I also wonder if it does not work at all for any interface.

It works for lots of people - including myself - who run multihomed
boxes such as routers.

If both interfaces are connected to the same subnet, by default your bo=
x
accepts packets destined to any local non-loopback address on any
interface, including packets destined to the address assigned to eth1 o=
n
eth0 and vice versa. This is because Linux enforces the "weak" host mod=
el.
