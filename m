From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Linux kernel module and -m owner match
Date: 16 Sep 2004 18:14:30 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095342371.12579.19.camel@nostromo.bgsecm.com>
References: <20040916093755.87684.qmail@web21007.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040916093755.87684.qmail@web21007.mail.yahoo.com>
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

El jue, 16 de 09 de 2004 a las 11:37, Nicolas Boiteux escribi=C3=B3:
> Hello,
>=20
> What is the module required into the linux kernel to
> enable the use of the -m owner match ? The name of
> this module isn t write into the howto ;(
>=20
> I have parse all the modules in netfilter
> configuration section of the kernel 2.4.27, and i didn
> t see anything about this rule .
>=20
> Greetings,
> Nicolas

The module you need is called ipt_owner, but it needs to be
compiled at kernel compilation time, using the patch-o-matic.

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


