From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Outbound SNAT on non-local connections
Date: Sun, 15 Mar 2015 15:49:07 +0100
Message-ID: <55059BE3.4030702@plouf.fr.eu.org>
References: <1426368540.2642076.240424705.3B907A6A@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1426368540.2642076.240424705.3B907A6A@webmail.messagingengine.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ryan <ryan_gerstenkorn@fastmail.fm>
Cc: netfilter@vger.kernel.org

Hello,

Ryan a =E9crit :
>=20
> The client sends a TCP (in my testing i'm using ICMP though) to the l=
oad
> balancer. The load balancer then does DNAT to rewrite the destination
> address to the server.
>=20
> So now the server has a connection coming in from the load balancer
> however it has the source IP of the client.
>=20
> The server will respond directly to the client (which is what I want)

Why ?

> however because the client see's the connection coming from a differe=
nt
> IP it will ignore it.

As expected.

> I think the simplest solution here is to have SNAT on the server that
> rewrites the source address to the load balancer IP however this does
> not seem to work.

Indeed.

> If I understand correctly the nat table won't be consulted if a
> connection exists in conntrack already.

Correct.

> However because I can't have
> SNAT in PREROUTING I can't really do what I want.

I do not see how SNAT in PREROUTING would help in any way. Recent
kernels can do SNAT in INPUT, however it wouldn't help either.

> Am I doing something wrong

Yes, this :

"The server will respond directly to the client (which is what I want)"

Stateful NAT (DNAT, SNAT) needs connection tracking and requires
symmetric routing. If you break symmetric routing, you break stateful N=
AT.

> If so is there a way to work around this issue?

As you found out, you can use stateless NAT on the server (RAWSNAT) and
also on the load balancer (RAWDNAT, no need to waste resources for
stateful NAT). Or you can just make the routing symmetric and route the
reply traffic through the load balancer.
