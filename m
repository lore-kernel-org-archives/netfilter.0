From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Differentiating direct, and redirected access?
Date: 18 Oct 2004 20:14:27 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098097784.23550.3.camel@nostromo.bgsecm.com>
References: <20041018021948.48396.qmail@web50902.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041018021948.48396.qmail@web50902.mail.yahoo.com>
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

bl	 -El lun, 18 de 10 de 2004 a las 04:19, J Kim escribi=C3=B3:
> Hello all,
>=20
> I'm running a squid at port 3128 as a transparent proxy.
>=20
> There are requests coming directly to 3128 port and=20
> those coming to 80 port and then redirected to 3128 by=20
> following rule:
>=20
> -t nat -A PREROUTING -i eth0 -p tcp -m tcp \
>    --dport 80 -j REDIRECT --to-ports 3128
>=20
> What I want is block direct requests to 3128, allowing
> redirected access (transparent proxy) only. How do I do it?
>=20
> If I just set up a rule in filter chain like:
>=20
> -t filter -A INPUT -i eth0 -p tcp -m tcp \\=20
>    --dport 3128 -j DROP=20
>=20
> Those requests redirected from port 80 to 3128 are also
> blocked by this rule. It seems that the redirected packets
> come in to this chain once again with the new port number.
>=20
> How can I differentiate these two different kinds of
> request? Any clue will be greatly appreciated.
>=20
> Jinsuk Kim

Insert your DROP rule in the nat table, in the
PREROUTING chain before the rule that does the
redirect.

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


