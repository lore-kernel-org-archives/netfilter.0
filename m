From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Very basic question
Date: 26 Sep 2004 22:34:31 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096228840.7416.38.camel@nostromo.bgsecm.com>
References: <20040924102247.3335375B@smtp-01.piensasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040924102247.3335375B@smtp-01.piensasolutions.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El vie, 24 de 09 de 2004 a las 12:28, coding@digital-data.co.uk
escribi=C3=B3:
> Hi,
>=20
>             I am very new to trying to use iptables and was wondering i=
f
> someone could help me out with what I should do to solve my current pro=
blem.
>=20
> I have a PC with 3 ethernet cards, one is connected to the internet (et=
h2).
> I want to use network translation to forward all requests to a pair of
> static IP addresses I have to particular locales on an internal network
> (which is accessed through eth1).
>=20
> Ie forward all incoming traffic on eth2 going to address 213.249.230.20=
6 to
> 192.168.10.2 on eth1.
>=20
> =20
>=20
> I have tried the following, but it just seems to redirect all traffic t=
o the
> local firewall:
>=20
> =20
>=20
> iptables -t nat -A POSTROUTING -o eth1 -s 192.168.10.2 -j SNAT --to
> 213.249.230.206
>=20
> iptables -t nat -A PREROUTING -i eth2 -s 213.249.230.206 -j DNAT --to
> 192.168.10.2
>=20

Just change the -s for -d, because it's a destination IP.

> =20
>=20
> What am I doing wrong?
>=20
> =20
>=20
> Tom=20
>=20
> =20
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


