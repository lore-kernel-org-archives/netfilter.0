From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Multi source/destination ip address
Date: Mon, 21 Feb 2005 16:59:53 +0100
Message-ID: <1109001593.12544.2.camel@nostromo.bgsecm.com>
References: <200502211533.19645.marcin.giedz@eulerhermes.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200502211533.19645.marcin.giedz@eulerhermes.pl>
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

El lun, 21-02-2005 a las 15:33 +0100, Marcin Giedz escribi=C3=B3:
> Hello...
>=20
> Today I have stopped on next problem. I've just want to block almost al=
l=20
> connection on 80 port in my router with destination list's addresses.=20
> "Almost" because some connection are forwarded to another router in my =
LAN.=20
> So this is the rule:
>=20
> iptables -A FORWARD -p tcp -port 80 -d ! 192.168.131.0/24 && 192.168.11=
0.0/24=20
> -j  DROP
>=20
> But it doesn't work.... in iptables spec. -d is only connect with singl=
e=20
> address not list. I found also iprange extension but it doesn't suit me=
. Is=20
> it possible to have list destination/source addresses in iptables rule?
>=20
> Thanks,
> Marcin

iptables -N MYDROPCHAIN
iptables -A FORWARD -p tcp -port 80 -j MYDROPCHAIN
iptables -A MYDROPCHAIN -d 192.168.131.0/24 -j RETURN
iptables -A MYDROPCHAIN -d 192.168.110.0/24 -j RETURN
iptables -A MYDROPCHAIN -j DROP

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



