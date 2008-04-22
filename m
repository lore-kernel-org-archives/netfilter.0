From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: Loopback security...
Date: Tue, 22 Apr 2008 20:51:22 +0000 (UTC)
Message-ID: <slrng0sju6.dhr.petr.pisar@album.ics.muni.cz>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net> <480E0CA2.2030902@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On 2008-04-22, Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote:
> Grant Taylor a =E9crit :
>>=20
>> No, you mis-understood me.  What I meant by "Linux considers it secu=
re"=20
>> is that (by default) it will not let any traffic in to our out of th=
e=20
>> loopback interface from / to a different interface.
>
> There is no such traffic forwarded between the loopback interface and=
=20
> another interface, because it just makes no sense. The loopback is=20
> designed for local host communications : all that is sent through it =
is=20
> received back by the host, and all that is received through it was se=
nt=20
> by the host.
>
No. Loopback interface is just another dummy interface to be able to
assign node scope adresses from 127.0.0.0/8 block. The reason for
loopback is somobedy wants to have (node scoped) IP socket on machine w=
ith
no real interfaces. It's just a historical relict because IP address
needs an interface in Linux.

When we talk about address routability, we talk about scopes in real.

E.g. I know about people running IPv6 networks where each router has
globally routable addresses on loopaback interface, real ethernet
interfaces between routers have only link scope addresses and a
dynamic routing protocol (e.g, OSPF) is used to solve routing via
network. And of course it works.

Thus the criteria of address routability should be its scope (and
routing tables) and not type (driver) of interface.

-- Petr


