From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: how to log dropped packet
Date: 28 Sep 2004 16:27:44 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096376449.25284.30.camel@nostromo.bgsecm.com>
References: <web-6413785@infinito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-6413785@infinito.it>
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

El mar, 28 de 09 de 2004 a las 12:12, hamals@infinito.it escribi=C3=B3:
> hello
>=20
> I wrote all my firewall rules, and now I would like to log=20
> all packet that will be dropped by my policy rule..
>=20
> ..how can I do it?
>=20
> what kind of rules do I need?..and where have I to write=20
> them?
>=20
> thanks

Just add at the end of your rules a rule like this:

iptables -A INPUT/OUTPUT/FORWARD -j LOG

with all the options you want to have. Then let the
default policy (DROP I suppose) act.

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


