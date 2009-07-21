From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: tc and traffic established,related
Date: Tue, 21 Jul 2009 17:18:37 +0200
Message-ID: <4A65DC4D.1030402@plouf.fr.eu.org>
References: <4A65DB14.2000602@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A65DB14.2000602@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

=46abio Marcone a =E9crit :
>=20
> I have a linux router and I mark packets from lan to wan and I use a =
tc=20
> class to limit datarate (selecting packets by mark).
> but how can I recognize answer packets? How can I know is a packet is=
=20
> about a connection previously established?

See the CONNMARK target and the connmark match.


