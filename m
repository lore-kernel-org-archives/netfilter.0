From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: RE: problem applying dscp.patch(iptables)
Date: 09 Sep 2004 18:41:24 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094740668.16110.10.camel@nostromo.bgsecm.com>
References: <D855E501E69F9A4FBA902D10A630482B30836C@hermes2.aegean.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D855E501E69F9A4FBA902D10A630482B30836C@hermes2.aegean.gr>
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

El jue, 09 de 09 de 2004 a las 13:45, Reklitis Georgios escribi=C3=B3:
> I'm trying to setup a platform which needs that partikular kernel(2.4.2=
0, can't upgrade it) and the patch-o-matic I'm using comes with iptables =
(http://dsmpls.atlantis.ugent.be/files/iptables-1.2.4-0.2-dscp.tgz) (I do=
n't know if newer versions of iptables can be used with no problem).That'=
s why I choosed that old versions.
>=20
>=20

I would try a newer version of iptables and patch-o-matic, but if you
can't upgrade your kernel you must find a version of iptables and
patch-o-matic suitable for your kernel. I would find what version of
iptables and patch-o-matic was used with your version of the kernel
and use that version.

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


