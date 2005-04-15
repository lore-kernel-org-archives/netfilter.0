From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Redirecting internal tcp connections
Date: Fri, 15 Apr 2005 19:57:56 +0200
Message-ID: <1113587876.10134.5.camel@nostromo.bgsecm.com>
References: <425FF61B.9090008@lanhelp.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425FF61B.9090008@lanhelp.com.br>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El vie, 15-04-2005 a las 14:12 -0300, marcus escribi=C3=B3:
> Hi, I have a lpd server on a remote host that ISP blocks port 515. I tr=
y=20
> to use something like "lpr -Plp@remotehost.com:900" but lprng doenst=20
> seems to recognize the port argument. So, I think to use iptables to=20
> redirect TCP requests on port 515 to port 900 but I dont know how. I've=
=20
> tried the following:
>=20
> #iptables -A OUTPUT -p tcp --dport 515 -j REDIRECT --to-port 900
>=20
> This gives me a "iptables: Invalid argument"
>=20
> Any ideas?

You have to do this in the nat table and the prerouting or
output chain, and you should use DNAT instead of REDIRECT,
because REDIRECT is for packets with destination your own
machine. So we have:

iptables -t nat -A PREROUTING -p tcp --dport 515 -j DNAT --to-
destination remotehost.com:900

Regards.

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



