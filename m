From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: REDIRECT to more than one port does not work
Date: Thu, 03 Mar 2005 10:35:17 +0100
Message-ID: <1109842517.11913.3.camel@nostromo.bgsecm.com>
References: <02eb01c51fcc$b8cb7c60$1416a8c0@lannion.citypassenger.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <02eb01c51fcc$b8cb7c60$1416a8c0@lannion.citypassenger.com>
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

El jue, 03-03-2005 a las 09:40 +0100, olivier escribi=C3=B3:
> thx for your help.
>=20
> without changing the rule I've tried with different IPs, odd and even, =
 but I've got the same behavior. I've also change the rule as you 've sug=
gested, giving this :
>=20
> iptables -t nat -A  PREROUTING -p tcp --dport 8000 -j REDIRECT --to-por=
ts 8080-8081
>=20
> I've made the same test (different IPs odd and even) but nothing has ch=
anged...
>=20
> do you known how REDIRECT target select the destination when more than =
one are given ?
>=20
> olivier.

I've checked the Iptables Tutorial at:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

and your rule it's completely correct, but it's doesn't say
anything about how the ports are selected, if in a round-robin
fashion or how. So no clue about what's happening. Sorry.

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



