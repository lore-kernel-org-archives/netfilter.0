From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: iptables + squid
Date: 26 Sep 2004 22:33:49 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096227749.7416.18.camel@nostromo.bgsecm.com>
References: <web-453410391@mail01.infosat.net>
	<1096208831.16814.22.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096208831.16814.22.camel@wolfpack.ljm.dom>
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

El dom, 26 de 09 de 2004 a las 16:27, Jason Opperisano escribi=C3=B3:
> On Sun, 2004-09-26 at 01:35, it clown wrote:
> > Hi All,
> >=20
> > I want to run squid on the same box as iptables.I need to
> > setup the client pc's that they have to go through the
> > proxy to get to the internet... port 3128.They must not be
> > able to by pass the proxy to get internet access.What rule
> > do i need to add to iptables to only allow squid to have
> > internet access?
> >=20
> > I want to give the clients internet access through squid,
> > thanks.
> >=20
> > Regards
> > _____________________________________________________________________
> > For super low premiums ,click here http://www.dialdirect.co.za/quote
>=20
> # allow clients to connect to squid proxy
> iptables -A INPUT -i $INSIDE_IF -p tcp --syn --dport 3128 -j ACCEPT
>=20
> # allow squid to fetch web content
> iptables -A OUTPUT -o $OUTSIDE_IF -p tcp --syn --dport 80 -j ACCEPT
>=20
> of course--this assumes that you do not allow clients through the
> FORWARD chain on port 80.
>=20
> -j

I'd like to add that if they need the transparent proxy feature they
need a rule like this:

iptables -t nat -A OUTPUT -A PREROUTING -i $INPUTIP -p tcp \
--dport 80 -j REDIRECT --to-ports 3128

and they need to have the squid proxy properly configured to allow
the transparent proxy feature.

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


