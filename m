From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: OT - rule based system for a fire wall
Date: 16 Oct 2004 19:52:46 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097940989.1326.10.camel@nostromo.bgsecm.com>
References: <Pine.LNX.4.56.0410151216210.2188@pali.cps.cmich.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.56.0410151216210.2188@pali.cps.cmich.edu>
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

El vie, 15 de 10 de 2004 a las 18:16, Ishwar Rattan escribi=C3=B3:
> It is a little off-topic but some one here may
> know something about.
>=20
> I have seen an idea being floated:
>=20
> - A firewall uses a set of rules to filter packets (a fact)
>=20
> - Proposal: possibility of desigaingn a rule based system
>   (call it rule-system) that will insert correct rules in the
>   firewall (sounds ambiguous)
>=20

Maybe what your are looking for it's something like guardian
that uses snort to insert the proper rules into iptables when
it detects an attack.

> - Is there such a thing out there? if the propser won't
>   part with any more details, what kind of gusses can be
>   made?
>=20
>   1. Rule-system can interact with a user and then insert
>      rules in the firewall -- I think this has already been
>      accomplished??
>=20
>   2. Rule-system could look at logged information (firewall
>      logs) and come up with better/new rules?
>=20
>   3. Is there any other facet/issue that I am missing here..
>=20
> It still bugs me to think of a rule-system that will insert
> rules into another rule based system :-|
>=20
> Any feedback will be appreciated.
>=20
> -ishwar

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


