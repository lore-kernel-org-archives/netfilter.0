From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: traffic forward
Date: 14 Oct 2004 23:39:23 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097778121.21962.6.camel@nostromo.bgsecm.com>
References: <416EA83F.3030503@divx.team.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <416EA83F.3030503@divx.team.lv>
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

El jue, 14 de 10 de 2004 a las 18:24, capsx escribi=C3=B3:
> hello!
>=20
> How can i forward incoming traffic to external ip FROM outside a to=20
> other ip in OUTSIDE ....?

I suppose so. You should do DNAT as if it was an IP from the
internal network and then route the packets back to the
exterior. It's more a problem of routing that one of netfilter.

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


