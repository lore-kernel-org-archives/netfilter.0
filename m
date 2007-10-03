From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 01:50:40 +0200
Message-ID: <47042AD0.2080806@plouf.fr.eu.org>
References: <1191424890.25752.27.camel@localhost.localdomain> <47042728.1060508@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47042728.1060508@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello,

Grant Taylor a =E9crit :
>=20
> Um, correct me if I'm wrong, but Destination NATing should not alter =
the=20
> source IP address of the packet that is being NATed.

To be exhaustive, the only exception is in the OUTPUT chain on kernel=20
versions less than 2.6.11, when DNAT changes the output interface the=20
source address is also changed in order to match the new interface.=20
However DNAT in the PREROUTING chain never changes the source address.
