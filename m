From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: not sure if 'iptables -Z' needed/useful/superfluous here..
Date: 17 Jan 2005 14:15:11 +0100
Message-ID: <1105963142.26574.6.camel@nostromo.bgsecm.com>
References: <20050114060327.GA8917@spawar.navy.mil>
	<1105728837.25584.63.camel@nostromo.bgsecm.com>
	<1105831929.8208.1.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105831929.8208.1.camel@hubcap.ljm.dom>
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

El dom, 16 de 01 de 2005 a las 00:32, Jason Opperisano escribi=C3=B3:
> On Fri, 2005-01-14 at 16:38, Jose Maria Lopez wrote:
> > i	El vie, 14 de 01 de 2005 a las 07:03, seberino@spawar.navy.mil
> > escribi=C3=B3:
> >=20
> > > I read man page on iptables but it still was not clear if I need
> > > -Z to 'reset the byte count' and other stuff like it says it will d=
o.
> >=20
> > If you delete your rules there are no counters, so you don't need
> > to reset them.
>=20
> it will still reset the built-in chain counters.
>=20
> -j

You are right. I didn't have in mind that. I will change it in
our bastion-firewall GPL software, because it uses the counters
to get statisticals.

Thanks for the information and regards.

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


