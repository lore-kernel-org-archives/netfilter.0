From: hyperbatus@gmx.de
Subject: Re: Netfilter internal packet flow
Date: Wed, 07 Apr 2010 10:59:08 +0200
Message-ID: <20100407085908.64960@gmx.net>
References: <20100325090329.11170@gmx.net> <4BAB377A.5090107@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BAB377A.5090107@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org


-------- Original-Nachricht --------
> Datum: Thu, 25 Mar 2010 11:14:18 +0100
> Von: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
> An: netfilter@vger.kernel.org
> Betreff: Re: Netfilter internal packet flow

> > According to my testing so far (linux kernel 2.6.26 / debian lenny)=
,
> > the behaviour of these packets seems to contradict the documents an=
d
> > graphics I have seen. Such packets seem to go through the INPUT and
> > OUTPUT chains of the FILTER table and through one or two chains of =
the
> > NAT table (I just can't remember exactly at the moment), but not th=
rough
> > the PREROUTING chain of the NAT table. This is confusing ...
>=20
[...]
> When a packet is looped back, it reaches the conntrack confirm after
> POSTROUTING, so it skips the nat PREROUTING chain. Anyway that makes
> sense : if the destination could be changed in PREROUTING, the packet
> may need to be re-routed through another interface but I don't think
> there is a routing decision after PREROUTING for the loopback (routin=
g
> decision already took place on output). If you need DNAT on loopback,
> you can do it in OUTPUT.

Pascal,

thank you very much for your valuable time and the comprehensive explan=
ation. I think I have got it now. Nevertheless, it would be nice to hav=
e some sort of graphics comprising really all of the packet flow for fu=
ture reference and for showing to others.

I have seen many kinds of such pictures, from obviously wrong to (what =
I would consider) high quality. But none of these pictures seems to ori=
ginate from the netfilter / iptables developers, and I am still not sur=
e if the graphics I have mentioned in my original post are correct in e=
very aspect.

So does anyone know about "official" graphics or an "official" complete=
 explanation of the packet flow in netfilter? Or a good book? The refer=
ence material which is mentioned on the netfilter homepage doesn't help=
 me; it seems to be mostly outdated and incomplete.

Thank you very much,

Peter

--=20
GRATIS f=FCr alle GMX-Mitglieder: Die maxdome Movie-FLAT!
Jetzt freischalten unter http://portal.gmx.net/de/go/maxdome01
