From: Maarten Vanraes <maarten@ba.be>
Subject: Re: advanced routing with NAT: returning UDP traffic
Date: Wed, 24 Sep 2014 12:16:10 +0200
Message-ID: <2942322.0b85jGZzF5@localhost>
References: <1955116.aThXd60LEg@localhost.localdomain> <4623776.NNCmRlCAkc@localhost> <5422938E.2030104@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5422938E.2030104@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Op woensdag 24 september 2014 11:49:02 schreef Pascal Hambourg:
> Maarten Vanraes a =E9crit :
> > so, even some kind of odd udp reply will still be the same connecti=
on if
> > it's within 30seconds?
>=20
> Not odd. The reply packet has to match the addresses and ports in the
> original packet (with source and destination swapped).
>=20
> > so, i can use connmark on not just TCP, but on all protocols?
>=20
> Not all protocols, but any protocol implementation which behaves in t=
he
> way expected by conntrack.

ok, thanks,

so, this is why streaming/voip stuff will still have issues...
--=20
BA NV
IT & Security
