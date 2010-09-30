From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: fwmark in the OUTPUT chain
Date: Thu, 30 Sep 2010 23:53:50 +0200
Message-ID: <4CA506EE.1030809@plouf.fr.eu.org>
References: <AANLkTinezQJPvc-WaBt9L64Z-cEGqm9ugSeaL6xTnA3W@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinezQJPvc-WaBt9L64Z-cEGqm9ugSeaL6xTnA3W@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Christopher Piggott a =E9crit :
>=20
> I am trying to mark packets with a certain fwmark for routing
> purposes.  The examples all say this is done in table "mangle" in the
> "prerouting" chain; but in my case, the packets I want marked are fro=
m
> the local system.  I have been marking them in the mangle table of th=
e
> OUTPUT chain.
>=20
> This does, in fact, seem to set the correct mark on the packet, but,
> unfortunately, the packet's source address seems to have already been
> picked by this point.  In other words, if your user code calls
> socket() then connect(), at some point a local address has been
> chosen.  On the IPTables canonical packet flow diagram, I believet hi=
s
> happens in the "Routing" block that comes just after "Firewall Reply.=
"
>  (Is that true?)

This is all correct.

> THE GOOD NEWS: the packet goes out interface wlan0
> THE BAD NEWS: the packet's source address is ppp0's network address
> (not wlan0's)
>=20
> I don't see a way out of this.  Anyone?

SNAT or MASQUERADE. Yeah, NAT sucks but I don't see any other way.
