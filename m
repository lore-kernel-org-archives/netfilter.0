From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Max Concurrent Session
Date: 15 Dec 2004 15:41:42 +0100
Message-ID: <1102796799.29423.2.camel@nostromo.bgsecm.com>
References: <1102705899.4516.50.camel@JOKER.INFOWORLD.CL>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1102705899.4516.50.camel@JOKER.INFOWORLD.CL>
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
Content-Type: text/plain; charset="utf-8"
To: NetFilter Users <netfilter@lists.netfilter.org>

El vie, 10 de 12 de 2004 a las 20:11, Miguel Angel Amador L escribi=C3=B3=
:
> Hi All
>  I need implement a firewall that support 2000 concurrent sessions, it
> is posible with Iptables/Netfiler ??=20
>  What need to do?
>=20
> Thanks for all
>=20
> regards
>  Miguel Angel Amador L.
> =20

In theory you should have no problems or netfilter limitations on
that matter. What you will need it's enough memory and a powerful
CPU. It's very important that you optimize the rules as much as
you can, having in mind how the packets traverse the chains and
the rules and trying that the sessions traverse the minimum number
of rules. You should also use connection tracking so related and
established connections are accepted with just a few rules.


--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


