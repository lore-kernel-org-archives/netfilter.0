From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: iptables and SMP performance
Date: 25 Jan 2005 13:50:45 +0100
Message-ID: <1106655752.16306.75.camel@nostromo.bgsecm.com>
References: <1106588554.8961.41.camel@d-phiggins-lnx.rovingplanet.com>
	<1106594540.28221.44.camel@nostromo.bgsecm.com>
	<1106603598.13691.2.camel@d-phiggins-lnx.rovingplanet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106603598.13691.2.camel@d-phiggins-lnx.rovingplanet.com>
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
To: Patrick Higgins <phiggins@rovingplanet.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El lun, 24 de 01 de 2005 a las 22:53, Patrick Higgins escribi=C3=B3:
> We know that there are ways to optimize the rules themselves, but they
> will mostly require new netfilter modules or at least revive some of th=
e
> nf-hipac work. The fact is, our firewall is inherently complex and will
> probably always be our bottleneck. We're just looking for generic ways
> to leverage hardware for short-term speed gains, and are running into a
> wall.

Reading my own post I have realize that maybe I have not explained
myself well. What I propose it's to separate the traffic in multiple
chains, so the traverse of the packets through the chains makes the
Netfilter system have to test the minimum number of rules. We've
did some test while we were designing our bastion-firewall GPL software
and it sure improves the performance of the firewall a lot.

Probably you had understand me, but I wanted to make it clear.

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


