From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: postrouting and mac address
Date: Tue, 21 Jul 2009 15:30:32 +0200
Message-ID: <4A65C2F8.2050407@plouf.fr.eu.org>
References: <4A65AF17.70002@duet.it> <c7a3bdd5fcb7f7152ae1a453651aa9d1@localhost> <4A65BE5F.4090007@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A65BE5F.4090007@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

=46abio Marcone a =C3=A9crit :
> Hi!
> there was a misunderstanding: "filter" I mean "recognize". I don't wa=
nt=20
> to drop packets in postrouting, I know it is impossible,

It is possible (DROP exists in all tables), but should not be done.

> but I need to=20
> recognize in postrouting packet of a certain source (by mac address, =
not=20
> by ip).

Can't you MARK packets in earlier chains (PREROUTING or FORWARD) and us=
e=20
the mark in POSTROUTING ?


