From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: problem applying dscp.patch(iptables)
Date: 08 Sep 2004 19:37:26 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094665045.11117.18.camel@nostromo.bgsecm.com>
References: <D855E501E69F9A4FBA902D10A630482B146F2D@hermes2.aegean.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D855E501E69F9A4FBA902D10A630482B146F2D@hermes2.aegean.gr>
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

El mi=C3=A9, 08 de 09 de 2004 a las 18:33, Reklitis Georgios escribi=C3=B3=
:
> kernel 2.4.20
> iptables-1-2-4-0.2-dscp
>=20

What patch-o-matic are you using? You are using very old kernel and
iptables versions. At least you should upgrade your iptables and use
the las patch-o-matic. Patch both the kernel source and the iptables
source and compile them. It should work that way.

>  I'm trying to install iptables,using command "make patch-o-matic", I'm=
 being asked about some patches to install, but dscp.patch which I need, =
cannot be applied-I receive an error (failed to patch copy of /usr/src/li=
nux-2.4.20). Also I'm not being questioned about applying or not ftos.pat=
ch.
> Why did that happened?
> Thank you=20
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


