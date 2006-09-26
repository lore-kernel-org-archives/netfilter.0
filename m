From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: DNAT doesn't work
Date: Tue, 26 Sep 2006 18:05:01 +0200
Message-ID: <45194FAD.4060500@plouf.fr.eu.org>
References: <c936c6b70609260745r40491602uba2aef2c6ae9be34@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c936c6b70609260745r40491602uba2aef2c6ae9be34@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Holger Kinkelin a =E9crit :
>=20
> I'm more or less new to netfilter / iptables; so I've got a question=20
> about DNAT.
>=20
> My problem is, that my DNAT won't work. I want to reroute http-pakets
> to server X to my own server running on localhost.
>=20
> The first command I tried was the following:
>=20
> iptables -A PREROUTING -t nat -p tcp -d [IP OF X] --dport 80 \
>   -j DNAT --to-destination 127.0.0.1:80

Don't DNAT connections from the outside to a loopback address. It won't=20
work because the input routing, which takes place right after the=20
PREROUTING chain, will drop packets to any destination in 127.0.0.0/8=20
received on any interface other than lo. So you can only reach these=20
destinations from the local host. Use the REDIRECT target instead, or=20
DNAT to the local address of the input interface.

> But: There is no effect. When I try to open a page hostet on X, the
> page loads from X, not from localhost...
>=20
> So I tried
>=20
> iptables -A PREROUTING -t nat -p tcp -d [IP OF X] --dport 80 -j REDIREC=
T
>=20
> No effect, too

If the source of the HTTP connection is the local host, you must put=20
this rule in the OUTPUT chain instead of PREROUTING. By the way, you can=20
use "DNAT --to 127.0.0.1" this time, because it's a local host=20
communication. Make sure trafic on the interface lo is allowed.

