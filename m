From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: What is the diference between ipfw of *bsd and netfilter of
	linux?
Date: 05 Oct 2004 18:58:24 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096979251.668.2.camel@nostromo.bgsecm.com>
References: <1096920404.658.4.camel@pretorian>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096920404.658.4.camel@pretorian>
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

El lun, 04 de 10 de 2004 a las 22:06, Carlos Mario Mora (c4y0) escribi=C3=
=B3:
> hi!
>=20
> im looking for the diference between ipfw and iptables.   Many people
> say to ipfw is more secure of iptables, but they cant explain why that.
>=20
> How can i found some documentation to create a document to explain that=
s
> diferences?
>=20
> Thanks for your help.

I find netfilter superior in terms of capabilities, it has
more extensions and it's technically superior to ipfw. It
let you do things that you can't do with ipfw. But it's
just an opinion, xBSD supporters would surely say otherwise.
My advice: Try both and use the one that suits you better. You
probably can look into other matters, as the routing
capabilities of both systems.

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


