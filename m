From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: REDIRECT to more than one port does not work
Date: Wed, 02 Mar 2005 18:58:42 +0100
Message-ID: <1109786323.6490.4.camel@nostromo.bgsecm.com>
References: <1109784929.4225f9611dd4a@imp2-q.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1109784929.4225f9611dd4a@imp2-q.free.fr>
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

El mi=C3=A9, 02-03-2005 a las 18:35 +0100, odanes@free.fr escribi=C3=B3:
> Hi,
>=20
> I would like to forward tcp connection to port 8000 to ports 8080 and 8=
081 on
> the same machine in order to load balance HTTP request to two processes=
. So
> I'va add the following rule
>=20
> iptables -t nat -A  PREROUTING -p tcp --dport 8000 -m state --state NEW=
 -j
> REDIRECT --to-ports 8080-8081
>=20
> I think that the first connection will be forwarded to 8080 and the sen=
cond to
> 8081 and so on. But when I connect to the port 8000 the connection is a=
lways
> redirected to the same port 8080.
>=20
> Is my thought wrong ?

The rule seems to be OK, but maybe you are testing your system from
one IP only, and -m state --state NEW it's not watching your connections
as NEW, but as ESTABLISHED. Have you tried it from some different IPs?

Anyway I think you should remove the -m state --state NEW, so all the
packets from the connection are DNATed.

> regads, olivier.

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



