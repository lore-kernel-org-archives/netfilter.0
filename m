From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 17:52:11 +0200
Message-ID: <47050C2B.8020607@plouf.fr.eu.org>
References: <1191424890.25752.27.camel@localhost.localdomain>	 <47042728.1060508@riverviewtech.net>	 <1191503642.13379.12.camel@localhost.localdomain>	 <4704F5F5.7010601@plouf.fr.eu.org> <1191507779.13379.50.camel@localhost.localdomain> <4704FFD6.8050304@plouf.fr.eu.org> <47050570.7010609@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47050570.7010609@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor a =E9crit :
> On 10/04/07 09:59, Pascal Hambourg wrote:
>=20
>> Do you mean that they are in different subnets ?
>=20
> I doubt that the OPs systems are on different subnets, nor do I think=
=20
> that it really matters for what s/he is wanting to do.

It does matter. Granted, maybe should I say "broadcast domain" instead=20
of "subnet" but they usually overlap. A router can be used as a gateway=
=20
in a route only if it is directly reachable, which implies it is in the=
=20
same subnet/broadcast domain. You mentionned bridging, which also=20
implies the same broadcast domain.

PS : thanks for the explanation about LVS.
