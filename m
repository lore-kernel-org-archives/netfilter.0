From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Loopback security...
Date: Tue, 22 Apr 2008 18:04:50 +0200
Message-ID: <480E0CA2.2030902@plouf.fr.eu.org>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br> <480DF156.5060801@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480DF156.5060801@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello,

Grant Taylor a =E9crit :
>=20
> No, you mis-understood me.  What I meant by "Linux considers it secur=
e"=20
> is that (by default) it will not let any traffic in to our out of the=
=20
> loopback interface from / to a different interface.

There is no such traffic forwarded between the loopback interface and=20
another interface, because it just makes no sense. The loopback is=20
designed for local host communications : all that is sent through it is=
=20
received back by the host, and all that is received through it was sent=
=20
by the host.

> +---+                  +---+
> | A +-- - - -  - - - --+ B |
> +---+ .1 (10.0.0) .254 +---+
>=20
> Suppose I bind 192.0.2.1 to A's loop back interface and add a route t=
o=20
> 192.0.2/24 to B via 10.0.0.1.  If I try to ping 192.0.2.1 from B, the=
=20
> traffic will leave B and go down the wire just like it should.  Howev=
er=20
> my experience shows that A will not forward the traffic in to the=20
> loopback interface and destination IP.

Of course not. Why would it ? The destination is local (see 'ip route=20
show table local'), and is treated just as any other local destination=20
like 10.0.0.1. Traffic is forwarded only when the destination is remote=
=2E

> Said another way, Linux will not allow foreign traffic (non localhost=
)=20
> on the loopback interface for security reasons.  I believe this to be=
 a=20
> design decision based on security.

I believe it is rather based on common sense.
