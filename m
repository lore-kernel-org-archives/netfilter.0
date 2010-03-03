From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How does netfilter decide which in/out-interface a packet has
Date: Wed, 03 Mar 2010 18:09:14 +0100
Message-ID: <4B8E97BA.9070103@plouf.fr.eu.org>
References: <20100303165422.18973x8p8ccy6s84@webmail.physik.uni-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100303165422.18973x8p8ccy6s84@webmail.physik.uni-muenchen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Christoph Anton Mitterer a =E9crit :
>=20
> How does netfilter decide which in/out-interface a packet has?

It doesn't. The packet decides which input interface is arrives on, and
the routing decision decides which output interface it leaves.

> I mean the following:
> Image I have a host with the following interfaces and addresses:
> lo: 127.x.x.x and :1/128
> eth0: 88.88.88.88
> 99.99.99.99 is a remote address (packets come in via eth0)
>=20
> Now consider the following cases (source --> destination):
> "internal traffic":
> 127.x.x.x   --> 127.x.x.x     =3D> quite clear, in=3Dlo out=3Dlo
> 127.x.x.x   --> 88.88.88.88   =3D> in=3D??? out=3D???
> 88.88.88.88 --> 88.88.88.88   =3D> in=3D??? out=3D???
> 88.88.88.88 --> 127.x.x.x     =3D> in=3D??? out=3D???

lo in all cases.

> "incoming traffic (from remote):
> 99.99.99.99 --> 127.x.x.x     =3D> is that possible at all? how would=
 =20
> the in=3D/out=3D be?

eth0, but the packet is discarded after PREROUTING by the input routing
decision which prohibits receiving a packet with a loopback address fro=
m
outside (a non loopback interface).

> 99.99.99.99 --> 88.88.88.88   =3D> quite clear, in=3Deth0 out=3Dn/a

Yup.

> "outgoing traffic (to remote):
> 127.x.x.x --> 99.99.99.99     =3D> is that possible at all?

Not possible, the output routing decision prohibits sending a packet
with a loopback address outside the host (on a non loopback interface).

> 88.88.88.88 --> 99.99.99.99   =3D> quite clear, in=3Dn/a out=3Deth0

Yup.
