From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: assigning alias ip address
Date: 10 Sep 2004 18:37:55 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094820804.26973.20.camel@nostromo.bgsecm.com>
References: <003c01c496e3$b6416c60$f82ffea9@black>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <003c01c496e3$b6416c60$f82ffea9@black>
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

El vie, 10 de 09 de 2004 a las 05:10, John Black escribi=C3=B3:
> How does assigning alias IP address work?
>=20
> I have one network jack coming into my server room.=20
> eth0  10.10.10.10
>=20
> I have two servers with public IP address.
> this assigns them, right?
> ifconfig eth0:10 192.168.1.10 netmask 255.255.255.0
> ifconfig eth0:11 192.168.2.11 netmask 255.255.255.0
>=20
> iptables -t nat -A PREROUTING -d 192.168.1.10 -i eth0 \
>                 -j DNAT --to-destination 10.10.10.11
> iptables -t nat -A PREROUTING -d 192.168.2.11 -i eth0 \
>                 -j DNAT --to-destination 10.10.10.12
>=20
> When a mail or web request is made from the internet. =20
> How does it know where the servers are?
>=20
> thanks
> John

The new kernel networking code named iproute2 doesn't make
any differences between IPs assigned to an interfaces or
aliased IPs. You can assign any number of IPs to an interface,
and this can be primary IPs or secundary IPs, but for the
kernel it's just another IP assigned to the machine (really
it's more complex, the IPs are assigned to services, not any
hardware in particular).

So when a request is made from the internet the routing code
just looks in it's tables what routes it have to use, and
as the IPs are assigned to the same machine it sends the
request to the machine you have assigned the IPs.

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


