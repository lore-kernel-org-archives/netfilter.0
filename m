From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: LAN Proxy - iptables gateway
Date: 10 Sep 2004 18:37:51 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094820617.30362.16.camel@nostromo.bgsecm.com>
References: <20040910053613.5C11C576@smtp-01.piensasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040910053613.5C11C576@smtp-01.piensasolutions.com>
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

El vie, 10 de 09 de 2004 a las 07:36, Manikandan escribi=C3=B3:
> Hi all,
>=20
> =20
>=20
> I have a local LAN (10.35.50.0/24) which is connected to my linux
> firewall/gateway running iptables for internet access using an internet
> link. My LAN is connected to other subnets using a leased line.=20
>=20
> =20
>=20
> I had to add a few routes in my linux gateway (running iptables) to ena=
ble
> my LAN clients to access servers in other subnets and networks which ar=
e in
> the range of 10.0.0.0/8 and 97.0.0.0/8.=20
>=20
>            =20
>=20
> Everything seems to be working fine. But recently I found that one of m=
y LAN
> clients is running an Analog proxy. Few users sitting in other networks=
 are
> using this proxy and able to access internet.=20
>=20
> =20
>=20
> My firewall is configured to allow traffic to internet from LAN only
> (10.35.50.0/24). As the proxy is inside this network, firewall allows t=
he
> traffic.
>=20
> =20
>=20
> How do I stop this? I don't want users in other network to access inter=
net
> through my iptables. Please help me. Thanks in advance.=20
>=20
> =20

You could look at your logs and find the port analog is using. If it's
not a port you want to have opened then you should close it in the
firewall. If it's a port you need, let's say port 80, then it's a little
more complicated. You could use some kind of application proxy to stop
people from using this kind of applications.

>=20
> Regards,
>=20
> Manikandan
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


