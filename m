From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: which version of iptables supports iplimit or connlimit?
Date: 25 Jan 2005 13:50:29 +0100
Message-ID: <1106652426.16306.17.camel@nostromo.bgsecm.com>
References: <531442a505012415241a77865c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <531442a505012415241a77865c@mail.gmail.com>
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

El mar, 25 de 01 de 2005 a las 00:24, GiGi Zick escribi=C3=B3:
> Hi all,
>=20
> Can someone please recommend me a version of iptables and linux kernel
> that supports iplimit or connlimit?
>=20
> I'm currently testing kernel 2.6 and iptables 1.2.11 on FC3 and they
> don't seem to support what I need.
> Thanks!

Best you can do it's to download the last vanilla kernel, the
iptables 1.2.11 and the last patch-o-matic, apply the patches
to the kernel and install it.

Or you can try to find an rpm with the kernel compiled with
the options you want. I prefer to compile my own kernels,
but that's only my opinion.

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


