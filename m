From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Problem with 2 NAT and 2 ROUTE
Date: 24 Aug 2004 07:24:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093325084.22468.16.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El lun, 23 de 08 de 2004 a las 16:42, Cristian Seva (VOIPLAB) escribi=C3=B3=
:
> have a problem with mi linux BOX
>=20
> Eth0 =3D  192.168.0.254  (RED A)
> Eth1 =3D  200.69.123.177/130  (LINK A)
> Eth2 =3D  192.168.0.100  (RED B)
> Eth3 =3D  192.168.1.1 para el PPPOE
> ppp0=3D  DynamicIP (LINK B)
> -------------------------------------------------------------------
> -DEFAULT ROUTE
> 200.69.123.178 (LINKA)
> ppp0 (cdo establece el PPPOE)
> -------------------------------------------------------------------
> -IPTABLES  NAT RULES
> iptables -t nat -A POSTROUTING -s 192.168.0.0/255.255.255.128 -o ppp0
-j
> MASQUERADE
> iptables -t nat -A POSTROUTING -s 192.168.0.128/255.255.255.128 -o
eth1 -j
> MASQUERADE
> -------------------------------------------------------------------
>=20
> My problem is the only NAT works is the NAT with march with de default
> route..
>=20
> Can any one helme?
>=20

I think you need Advanced Routing using iproute2 nexthop facility
to send the traffic to both routers, and then masquerade the
connections, masquerading does know who to send the traffic but
it doesn't know how to do it.

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


