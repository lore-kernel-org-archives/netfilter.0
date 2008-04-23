From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Loopback security...
Date: Wed, 23 Apr 2008 11:31:53 +0200
Message-ID: <480F0209.4070902@plouf.fr.eu.org>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net> <480E0CA2.2030902@plouf.fr.eu.org> <slrng0sju6.dhr.petr.pisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <slrng0sju6.dhr.petr.pisar@album.ics.muni.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Petr Pisar a =E9crit :
>=20
> No. Loopback interface is just another dummy interface to be able to
> assign node scope adresses from 127.0.0.0/8 block. The reason for
> loopback is somobedy wants to have (node scoped) IP socket on machine=
 with
> no real interfaces. It's just a historical relict because IP address
> needs an interface in Linux.

I disagree. The loopback interface is very different from a dummy=20
interface. A dummy interface is just a black hole, it cannot do what th=
e=20
loopback interface does. The loopback interface loops the traffic back=20
to the host and the kernel knows about it, this is what makes it unique=
=2E

> E.g. I know about people running IPv6 networks where each router has
> globally routable addresses on loopaback interface, real ethernet
> interfaces between routers have only link scope addresses and a
> dynamic routing protocol (e.g, OSPF) is used to solve routing via
> network. And of course it works.

So what ? You can do the same with IPv4 and it will work too, at least=20
on Linux.
