From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: IPv6 routing
Date: Mon, 30 Aug 2010 19:17:31 +0200
Message-ID: <4C7BE7AB.1040500@plouf.fr.eu.org>
References: <4C7B8741.3030908@abpni.co.uk> <4C7B89EB.7090807@abpni.co.uk>	 <alpine.LNX.2.01.1008301242380.15716@obet.zrqbmnf.qr>	 <4C7B8BD2.1060009@abpni.co.uk>  <4C7B91A2.50707@abpni.co.uk> <1283171041.16291.63.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1283171041.16291.63.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Jacob <jacob@internet24.de>
Cc: Jonathan Tripathy <jonnyt@abpni.co.uk>, netfilter@vger.kernel.org

Hello,

Thomas Jacob a =E9crit :
>=20
> (linked to INPUT chain)
>=20
> target     prot opt source               destination        =20
> ACCEPT     ipv6-icmp    anywhere             anywhere
> ipv6-icmp neighbour-solicitation=20
> ACCEPT     ipv6-icmp    anywhere             anywhere
> ipv6-icmp neighbour-advertisement=20
> ACCEPT     ipv6-icmp    anywhere             anywhere
> ipv6-icmp router-solicitation=20
> ACCEPT     ipv6-icmp    anywhere             anywhere
> ipv6-icmp router-advertisement=20
>=20
> (and maybe not even the last two, if you are using
> static routing).

A router accepts router solicitation and ignores router advertisement. =
A
host accepts router advertisement and ignores router solicitation.
