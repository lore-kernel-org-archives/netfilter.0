From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: ip alias
Date: 28 Sep 2004 16:27:48 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096376687.25284.35.camel@nostromo.bgsecm.com>
References: <002a01c4a509$74f94b40$936ffea9@alpha>
	<Pine.NEB.4.60.0409280439060.15502@sdf.lonestar.org>
	<006901c4a515$d617d980$936ffea9@alpha>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006901c4a515$d617d980$936ffea9@alpha>
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

El mar, 28 de 09 de 2004 a las 06:44, John Black escribi=C3=B3:
> > > ifconfig eth0:0 192.168.1.23 netmask 255.255.255.0
> >=20
> > not this:
> >=20
> > > iptables -t nat -A PREROUTING -d 192.168.1.23 -i eth0 \
> > >                -j DNAT --to-destination 161.31.31.23
>=20
> but i want eth0:0 to be asigned that particular address to the internet=
. =20

Then I think your rule it's Ok. It will redirect all the traffic
with destination 192.168.1.23 to 161.31.31.23.

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


