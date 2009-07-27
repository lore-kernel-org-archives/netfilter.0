From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Different routes decided by source and/or dest. port
Date: Mon, 27 Jul 2009 12:51:56 +0300
Message-ID: <1248688316.11438.3.camel@casper.meteor.dp.ua>
References: <cffd2ab0907270216o625c4934p2fcda2cc843e81f9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cffd2ab0907270216o625c4934p2fcda2cc843e81f9@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Michael Mattsson <michael.mattsson@gmail.com>
Cc: netfilter@vger.kernel.org

=F7 =F0=CE=C4, 27/07/2009 =D7 11:16 +0200, Michael Mattsson =D0=C9=DB=C5=
=D4:
> Hi!
> I'm trying to determine if it's possible to have different routes
> (interfaces) of traffic through an iptables NAT firewall.
>=20
> The use case is that I've recently bought a VPN service to protect ou=
r
> privacy due to the EU directive IPRED.
> (http://en.wikipedia.org/wiki/IPRED) I have several hosts on my
> network and I'm not interested in sending all traffic through the
> tunnel, only traffic I'm interested in protecting. The only way I can
> determine that is by looking at port ranges in and some cases source
> host on my network.
>=20
> I'm interested in getting pointers to what documentation that might b=
e
> relevant in accomplishing what I want to do. I'm quite novice in usin=
g
> iptables as I use firewall builder to deploy my rules.

One solution could be to use iptables marks and ip rules (ip rule help)
to use different routing tables for packets with different iptables
marks.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

