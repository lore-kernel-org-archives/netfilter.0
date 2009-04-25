From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Should "Transparent web-caching" work with ppp0/pptp? (It doesn't...)
Date: Sat, 25 Apr 2009 12:11:33 +0200
Message-ID: <49F2E1D5.1060302@plouf.fr.eu.org>
References: <d17c5b140904250034x4b73cd8dsf91846eb5f9dda32@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d17c5b140904250034x4b73cd8dsf91846eb5f9dda32@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Aleksey Tsalolikhin a =E9crit :
>=20
> I've tried following the example at
> http://lartc.org/howto/lartc.cookbook.squid.html
> but from the remote web site's viewpoint, the request comes from the
> eth0 address of my server, instead of through the VPN.

Oops, I forgot to comment on this. The default source address of a=20
locally generated datagram or connection is selected before the OUTPUT=20
chain, before the mark was set :

1) initial routing without using the mark selects the output interface=20
and source address
2) iptables changes the mark in the OUTPUT chain
3) rerouting using the mark updates the output interface but not the=20
source address

Rerouting through a different interface does not change the source=20
address accordingly, so it is normal that packets have eth0's address a=
s=20
source even though they are rerouted through ppp0. If you want to chang=
e=20
the source address, you may use iptables' SNAT or MASQUERADE. (I fear=20
this will be a problem with IPv6 which has no - and must not have - NAT=
).
