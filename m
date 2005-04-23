From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: REDIRCT vs. DNAT...
Date: Sat, 23 Apr 2005 10:05:04 +0200
Message-ID: <1114243504.18383.7.camel@nostromo.bgsecm.com>
References: <426976D9.2010009@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426976D9.2010009@riverviewtech.net>
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

El vie, 22-04-2005 a las 17:12 -0500, Taylor, Grant escribi=C3=B3:
> Are there any merits to using REDIRECT over (or under) DNAT when redire=
cting traffic back to the box that is doing the redirecting?  Reference A=
lejandro Villarroel's post (and thread) at https://lists.netfilter.org/pi=
permail/netfilter/2005-April/059942.html.
>=20
> I responded with an email stating to REDIRECT the traffic only moments =
after Jason Opperisano responded stating to DNAT the traffic.  I'm just c=
urious if any one knows of any performance benefits / penalties for using=
 REDIRECT vs. DNAT.

I don't really know for sure, but I suppose that if DNAT to the same=20
machine was better than REDIRECT then REDIRECT would be deprecated. And
as is the preferred method for squid proxies and the like I suppose
REDIRECT is the way to go.

I've always used REDIRECT and it has a very very low performance=20
penalty, so I've never tried DNAT to the same machine.

But I would like to hear Jason Opperisano about this. He knows far
more than I about Netfilter.

> Grant. . . .

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



