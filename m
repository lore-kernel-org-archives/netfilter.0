From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Alias reference in iptables
Date: Fri, 01 Feb 2008 15:10:08 +0100
Message-ID: <47A32840.60201@plouf.fr.eu.org>
References: <1201872114.25131.14.camel@wtprcwbti01002>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1201872114.25131.14.camel@wtprcwbti01002>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter ML <netfilter@vger.kernel.org>

Hello,

Cloves Pereira Costa Jr a =E9crit :
>=20
> I'm configuring a linux router and i will create some alias in the LA=
N
> interface (eth1) for a network 10.1.1.0/27. For example:
> eth1 --> 10.1.1.33
> eth1:0 --> 10.1.1.65
> eth1:1 --> 10.1.1.97
> ...
>=20
> My question is: I can use in iptables rules the reference to the alia=
s
> interfaces (eth1:0, eth1:1, ...)

No. IP aliases are just extra addresses, not interfaces. IP aliases are=
=20
some kind of old IPv4-specific legacy used by ifconfig. They are not=20
required to add extra IPv4 addresses to an interface and do not even=20
exist in IPv6.

> or I can only refer to the main interface (eth1)?

Yes. Same with routing : you won't find any alias name in the routing t=
able.
