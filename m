From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: postrouting and mac address
Date: Tue, 21 Jul 2009 15:59:11 +0200
Message-ID: <4A65C9AF.9040504@plouf.fr.eu.org>
References: <4A65AF17.70002@duet.it> <c7a3bdd5fcb7f7152ae1a453651aa9d1@localhost> <4A65BE5F.4090007@duet.it> <4A65C2F8.2050407@plouf.fr.eu.org> <4A65C470.60301@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A65C470.60301@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

=46abio Marcone a =C3=A9crit :
>=20
>> It is possible (DROP exists in all tables), but should not be done.
> I know that drop is only in INPUT, FORWARD and OUTPUT chain...

This is not quite correct. DROP is available in all tables and chains.=20
However the "orthodoxy" is to do filtering only in the 'filter' table.

>> Can't you MARK packets in earlier chains (PREROUTING or FORWARD) and=
=20
>> use the mark in POSTROUTING ?
>=20
> perhaps it is the only solution but I would to recognize packets in=20
> POSTROUTING to send them in a IMQ virtual interface.

What is the problem in using a mark to do this ?


