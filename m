From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: OT - rule based system for a fire wall
Date: Mon, 18 Oct 2004 09:08:58 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <29F6FAF7F2C0D41190980002A513591E0E1707CB@FSNSAB30>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

all,

	good idea, but not original thought cisco and  other
	firewall pros have  been  doing reflexive acl and other
	stateful related thingsz awhile now.

	q&a,,,

	what are the correct rules?

	wouldn't  those be security policy and as such cnt be canned
	by a vendor.

	netsec is always a work in progress and IMHO anything that starts
	to point to a 'set it and forget it' mind set is dangerous to
	a firms information assurance efforts.

~piranha


riginal Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Jose Maria
Lopez
Sent: Saturday, October 16, 2004 10:53 AM
To: netfilter@lists.netfilter.org
Subject: Re: OT - rule based system for a fire wall


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

The only people for me are the mad ones -- the ones who are mad to =
live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, =
burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


