From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Iptables rules comparation
Date: 30 Oct 2004 23:00:19 +0200
Message-ID: <1099080752.22637.18.camel@nostromo.bgsecm.com>
References: <000d01c4baa2$35a17ae0$023ca8c0@cfg.onat.gov.cu>
	<20041028071525.GD8169@rhum.iomeda.fr> <41811F28.2030103@w3works.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41811F28.2030103@w3works.com>
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

El jue, 28 de 10 de 2004 a las 18:32, Dave Paris escribi=C3=B3:
> > J.R. Barreras (barreras@cfg.onat.gov.cu) wrote:
> >=20
> >Hi all!
> >How can I do compare iptables rule sets produced by different scripts?
> >Any tools? Ideas?
> >
> >Waiting for yours reply, thanks in advance...
>=20
> What if you load the ruleset, then run 'iptables -nvL', normalize the=20
> output a little (under interfaces, a '*' would match any specific=20
> interface specified under a different ruleset) and simply compare the=20
> output of the two?
>=20
> Sounds like a fairly trivial-ish task for someone fluent in Perl.
>=20
> Kind Regards,
> -dsp

I would say that it's better to compare the capabilities of the
scripts and not just the rules. A firewall can make it's work
in a lot of different ways, and diff-ing the rules is not a good
idea.

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


