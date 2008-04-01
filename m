From: "Eric Estes" <Eric_Estes@aspensquare.com>
Subject: RE: Blocking Bittorrent
Date: Tue, 1 Apr 2008 11:55:45 -0400
Message-ID: <665B03CFBE2C1346A66B0CB9A9A0EE3801C7ED8C@ASM220.aspen.com>
References: <beb91d720804010805q41769e7ah455a59e7eadb4fba@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <beb91d720804010805q41769e7ah455a59e7eadb4fba@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
> owner@vger.kernel.org] On Behalf Of Salatiel Filho
> Sent: Tuesday, April 01, 2008 11:06 AM
> To: Tarak Ranjan
> Cc: netfilter@vger.kernel.org
> Subject: Re: Blocking Bittorrent
>=20
> On 4/1/08, Tarak Ranjan <contacttrm@yahoo.co.in> wrote:
> > Hi List,
> >  How do i block bittorrent using iptables rules in my firewall...
> >
> >
> >  /\
> >  Tarak
> >
> >
> >
> >  --
> >  To unsubscribe from this list: send the line "unsubscribe netfilte=
r" in
> >  the body of a message to majordomo@vger.kernel.org
> >  More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
>=20
>=20
> Do not try to block , if you try do this people will start using
> encryption and you wont be able to track it. I recommend you tu mark
> the packets and send to a shaper device of very low priority.


Using Layer 7 filter via Unknown blocks just about everything I've seen=
 thrown at it (P2P).

Take a look at www.mastershaper.org for doing bandwidth/packet shaping =
via a gui.




> --
> []'s
> Salatiel
>=20
> "O maior prazer do inteligente =E9 bancar o  idiota
>    diante de um  idiota que banca o inteligente".
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

