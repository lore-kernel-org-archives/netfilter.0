From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: iptables: forwarding, masquerading, and high-availability
Date: 09 Sep 2004 18:41:35 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094741582.16110.18.camel@nostromo.bgsecm.com>
References: <E1C57vb-000JD8-00.hayes-mail-ru@f25.mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E1C57vb-000JD8-00.hayes-mail-ru@f25.mail.ru>
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

El mi=C3=A9, 08 de 09 de 2004 a las 21:16, Bill Hayes escribi=C3=B3:
> I have a problem trying to create a high availability firewall/router s=
etup. Multiple servers on the internal network should be masqueraded to a=
ppear as a single server on the external network.
>=20
> The simplest case that fails for me looks like this...
>=20
>=20
> Configuration: SuSE 9.1 (linux 2.6.5, iptables 1.2.9, heartbeat 1.2.0)
>=20
> firewall-1: eth0 =3D 192.168.1.1, eth1 =3D 10.1.1.1
> firewall-2: eth0 =3D 192.168.1.2, eth1 =3D 10.1.1.2
>=20
>          +--------+
>          | server |
>          +----+---+
>               |
>     +---------+---------+
>     |        hub        |
>     +-+---------------+-+
>       |               |
> +-----+------+ +------+-----+
> | firewall-1 | | firewall-2 |
> +-----+------+ +------+-----+
>       |               |
>     +-+---------------+-+
>     |        hub        |
>     +---------+---------+
>               |
>           +---+----+
>           | router |
>           +---+----+
>               |
>=20
> If I configure my servers to use 192.168.1.1 as their gateway, and tell=
 all my clients that 10.1.1.1 is my server, then everything works as desi=
red.
>=20
> On to high availability, I configure my servers to use 192.168.1.3 as t=
heir gateway, and tell all my clients that 10.1.1.3 is my server. I start=
 heartbeat and soon my firewalls now look like...
>=20
> firewall-1: eth0 =3D 192.168.1.1, eth0:1 =3D 192.168.1.3, eth1 =3D 10.1=
.1.1, eth1:1 =3D 10.1.1.3
> firewall-2: eth0 =3D 192.168.1.2, eth1 =3D 10.1.1.2
>=20
> Now, all my outgoing connections are established as before, but all the=
 incoming connections fail with...
>=20
> SFW2-INext-DROP-DEFLT
>=20
> instead of succeeding with...
>=20
> SFW2-FWDext-ACC-REVMASQ
>=20
> I know that iptables treats virtual interfaces as if they are the under=
lying physical interface, thus eth1:1 should be eth1, and outgoing connec=
tions work, thus I have proof that eth0:1 is eth0, so what is happening? =
Why are the packets being dropped?
>=20

What rules apply to each interface? Have in mind that even eth1:1 it's
the same interface (really it's just another IP in the machine) that
eth1 rules that apply to eth1 doesn't apply to eth1:1, because for Linux
both are completely different interfaces.

> Thanks to anyone that can help,
> Bill
>=20
> wjh [at] sympatico [dot] ca
> hayes [at] mail [dot] ru
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


