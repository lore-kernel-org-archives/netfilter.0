From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Understanding --tcp-flags option
Date: Thu, 04 Jul 2013 14:58:38 +0200
Message-ID: <51D5717E.60604@plouf.fr.eu.org>
References: <CAJZVxRkQmbFdi32VRu7jg4aoJoYgQmhjfMoGii5u-Jai_dAvHg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJZVxRkQmbFdi32VRu7jg4aoJoYgQmhjfMoGii5u-Jai_dAvHg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter mailing list <netfilter@vger.kernel.org>

Hello,

Aaron Lewis a =E9crit :
>=20
> How should I understand --tcp-flags option?
>=20
> 1) There's two parameters, why need two of them?

It allows to match packets with some flags cleared.

> e.g I might just need to match a packet with SYN and RST bit set,
>  why do I need to place it for twice (--tcp-flags SYN RST, SYN RST

Wrong syntax.

> 2) What does this mean? I don't really get what "mask" and "comp" do =
here

The mask specifies which flags must be examined, and the comp which
flags must be set. Therefore flags in the mask but not in the comp must
be cleared. Flags not in the mask may have any value.

> --tcp-flags FIN,SYN,RST,PSH,ACK,URG FIN,SYN

This means match if FIN,SYN set and RST,PSH,ACK,URG cleared.
