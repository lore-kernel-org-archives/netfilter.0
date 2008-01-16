From: Dzianis Kahanovich <mahatma@bspu.unibel.by>
Subject: Re: Per IP maximal speed limit inside HTB class
Date: Wed, 16 Jan 2008 14:04:27 -0200
Message-ID: <478E2B0B.4070600@bspu.unibel.by>
References: <1200483046.5107.17.camel@casper2.meteor.dp.ua>
Reply-To: mahatma@eu.by
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1200483046.5107.17.camel@casper2.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"; format="flowed"
To: netfilter@vger.kernel.org
Cc: casper@meteor.dp.ua

=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB wrote:

> I already have HTB class tree which makes channel division between
> client groups.
> One of those groups now has to have clients with limited maximal spee=
d
> to implement "unlimited" traffic billing.
>=20
> So the question is: is there any queueing discipline which can limit
> maximal speed for any source/destination IP with one rule so that I
> would not have to insert clases for each new IP?

There are not too nefilter questions, but while I experiment with=20
unconditional class 3 of PSPacer 2.1[.1]=20
(http://www.gridmpi.org/pspacer-2.1/index.en.jsp), I remember there are=
 IMHO=20
may (with additional programming) do it. Mode 3 still not complete and =
fall=20
kernel, but I comment out estimate_target_rate() code up to "cl->rate =3D=
=20
cp->rate;" line and do "cl->rate =3D <rate>;" and IMHO rate was reached=
=2E But I=20
not sure about there are warrantied rate. You may try to remove "tcp" c=
ode=20
from PSPacer and make some kind of hash, based on source and|or destina=
tion=20
IP. I just not found way to use it - I prefer to bound rate for my netw=
ork to=20
common channel and use it in concurrent way to fill channel. And not su=
re to=20
commercial-quality of rate (there are high-quality lostless scheduler, =
but=20
"warrantied" rate are not high-quality in this sense, only limited).

Else you must use not QoS (like HTB) anymore, just drop packets up the =
limit=20
with "tc filter ... policy ..." commands. There are not netfilter too.

>=20
> For example it would be perfect if I could make something like this:
>=20
> + HTB class with from 5 Mbit/s to 5 Mbit/s
>   | HTB class with from 1 Mbit/s to 5 Mbit/s prio 2 (for clients with=
out
> unlimited traffic)
>   | HTB class with from 4 Mbit/s to 5 Mbit/s prio 1 (for clients with
> unlimited traffic)
>     + {some limit qdisc}
>       | max speed limit 128 KBit/s (for 128K unlimited traffic) prio =
1
>       | max speed limit 256 KBit/s (for 128K unlimited traffic) prio =
2
>       | max speed limit 512 KBit/s (for 128K unlimited traffic) prio =
3
>=20
> Any hints?
>=20


--=20
WBR,
Denis Kaganovich,  mahatma@eu.by  http://mahatma.bspu.unibel.by
