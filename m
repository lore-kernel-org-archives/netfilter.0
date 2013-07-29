From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: SNAT (again)
Date: Mon, 29 Jul 2013 23:09:07 +0200
Message-ID: <51F6D9F3.20206@plouf.fr.eu.org>
References: <CAODtcdcOmJ8UYxGetn7M=JEQ1pwgz-104LbBFnJ+OKnDiqeW2g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAODtcdcOmJ8UYxGetn7M=JEQ1pwgz-104LbBFnJ+OKnDiqeW2g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Al Grant <bigal.nz@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

Hello,

Al Grant a =E9crit :
>=20
> I have a network that is setup in the following way:
>=20
> www.dropbox.com/s/dt7q9owe5y997ug/Drawing1%20%282%29.jpg
>=20
> As you can see in the drawing I am trying to access a SMB share over =
a
> port forward (DNAT). The issue is that the source address does not ge=
t
> changed on the packet and when 192.168.150.100 goes to reply to
> 192.168.0.101 it drops the packet as it does not know where to send
> it.
>=20
> I need to add a SNAT rule to iptables in the Air Router.
>=20
> I am not good with iptables but think it would be something like:
>=20
> iptables -t NAT -A POSTROUTING -o Br0 -J SNAT --to-source 192.168.150=
=2E243
>=20
> This should change the source of the packet to 192.168.150.243.

Yes, except for the multiple case typoes (NAT -> nat, -J -> -j, and I
suspect, Br0 -> br0), if the packets reach that rule.

> I KNOW there are better ways to do it with new hardware etc, but ther=
e
> constraints on solving this problem such that I need to NAT/SNAT.

Can't you just add the proper routes on the hosts and/or routers ?
