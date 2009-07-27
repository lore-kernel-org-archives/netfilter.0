From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: info on IMQ and routing
Date: Mon, 27 Jul 2009 11:11:56 +0300
Message-ID: <1248682316.4090.11.camel@casper.meteor.dp.ua>
References: <4A6840A4.5080206@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A6840A4.5080206@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

=F7 =FE=D4=D7, 23/07/2009 =D7 12:51 +0200, Fabio Marcone =D0=C9=DB=C5=D4=
:
> Hi!
> I need to understand how are routed packets outgoing from a imq=20
> interface, because I have a router with some eth interfaces and I nee=
d=20
> to undestand:
> - if I have to set up a imq for each eth, or
> - if I can set up just one eth and then use tc to create some classes=
=20
> and related filters.
>=20
> What are pros and cons of these choices?
>=20
> I'm googled around but without success.


In case of using IMQ things works as usual, except:

- you can direct traffic from many interfaces to one imq virtual device=
,
for example to direct incoming traffic to imq0 and outgoing to imq1:

iptables -t mangle -A PREROUTING -i eth0 -j IMQ --todev 0
iptables -t mangle -A PREROUTING -i eth1 -j IMQ --todev 0

iptables -t mangle -A POSTROUTING -o eth0 -j IMQ --todev 1
iptables -t mangle -A POSTROUTING -o eth1 -j IMQ --todev 1

- you can shape on imq (imq0 and imq1) device with tc just as usual
- after traffic has been shaped it's being reinjected back to the place
it has been taken for shaping (just after -t mangle, POSTROUTING or
PREROUTING).

The main purpose of IMQ is the ability to shape several interfaces by
one tc qdisc. So the is probably very less sense of setting up one imq
per one interface.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

