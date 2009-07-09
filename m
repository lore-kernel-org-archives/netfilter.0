From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Problem with IPv6 tunnel
Date: Thu, 09 Jul 2009 17:30:37 +0200
Message-ID: <4A560D1D.1070707@plouf.fr.eu.org>
References: <9948385e0906190131q58ba27c6ye625b662945f63ac@mail.gmail.com> <200906191218.03217.ben@differentialschokolade.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200906191218.03217.ben@differentialschokolade.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Benedikt Gollatz a =C3=A9crit :
>=20
> That's absolutely true. The rule from the FAQ is meant to replace you=
r=20
> original rule, exempting proto-41 traffic from masquerading and thus=20
> connection tracking.

This idea is totally wrong. Not masquerading a connection has no=20
influence about whether it is tracked or not. As soon as the conntrack=20
is enabled (and it is necessary for NAT/masquerading), all connections=20
are tracked. The only way to prevent a connection from being tracked is=
=20
to use the NOTRACK target in the 'raw' table, which is not available in=
=20
standard 2.4 kernels.


