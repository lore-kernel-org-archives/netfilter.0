From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Urgent Request
Date: 26 Sep 2004 22:34:38 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096229347.31631.44.camel@nostromo.bgsecm.com>
References: <200409231635.AEM39648@mailhost.interdata.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409231635.AEM39648@mailhost.interdata.net>
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

El jue, 23 de 09 de 2004 a las 18:36, Christian von Hausen escribi=C3=B3:
> Hello
>=20
>             Unable to uncompress iptables-1.2.11 file...=20
>=20
> =20
>=20
> [root@sipxpbx src]# uncompress -v iptables-1.2.11.tar.bz2
>=20
> iptables-1.2.11.tar.bz2 - no .Z suffix

The file is compressed with bzip2, you should use bunzip2 to
uncompress it, or just tar -xjvf to unpack the package.

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


