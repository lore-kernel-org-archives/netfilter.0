From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: advanced routing with NAT: returning UDP traffic
Date: Wed, 24 Sep 2014 11:49:02 +0200
Message-ID: <5422938E.2030104@plouf.fr.eu.org>
References: <1955116.aThXd60LEg@localhost.localdomain> <5421B0B4.4040106@ngtech.co.il> <4623776.NNCmRlCAkc@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4623776.NNCmRlCAkc@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Maarten Vanraes <maarten@ba.be>
Cc: netfilter@vger.kernel.org

Maarten Vanraes a =E9crit :
>=20
> so, even some kind of odd udp reply will still be the same connection=
 if it's=20
> within 30seconds?

Not odd. The reply packet has to match the addresses and ports in the
original packet (with source and destination swapped).

> so, i can use connmark on not just TCP, but on all protocols?

Not all protocols, but any protocol implementation which behaves in the
way expected by conntrack.
