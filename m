From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: linux-2.6.9-rc1 compilation and configuration issue (fwd)
Date: 08 Sep 2004 20:19:07 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094667545.11117.30.camel@nostromo.bgsecm.com>
References: <200409072333.i87NXJZA012251@bassett.home.org>
	<413F12D1.3050108@pbl.ca>
	<1094665198.23966.21.camel@nostromo.bgsecm.com>
	<413F4E20.9040807@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <413F4E20.9040807@pbl.ca>
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
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El mi=C3=A9, 08 de 09 de 2004 a las 20:23, Aleksandar Milivojevic escribi=
=C3=B3:
> Jose Maria Lopez wrote:
> > Patches changes the source code of the kernel and iptables in a lot
> > of places, not just a modular place in the code you can separate from
> > the rest, that's why you can't patch code from modules or pieces of
> > code, because many places in the code are changed when you apply the
> > patches.
>=20
> Which is probably the reason why some of the patch-o-matic patches are=20
> failing to install with some versions of kernel, and other patches are=20
> failing to install with some other versions of kernel.  If the things=20
> were designed the right way from the day one, we wouldn't need to=20
> download xyz MB of kernel source, install development environment,=20
> compilers and stuff, going through the hussle of recompiling the kernel=
,=20
> ....  Instead of just downloading one or two additional kernel modules=20
> (couple of kB) that we really need (in either source or object format),=
=20
> and there would be no need to recompile them when upgrading the kernel.=
=20

I don't think that could be possible in any way, not even trying it from
the very day one of the development of the kernel. It's like hoping that
new patches to upgrade the kernel only touch some very modular parts of
the kernel so you don't have to recompile all the kernel to upgrade it.
Some changes in some subsystems, and you can bet the networking one it's
one of the most complex, need changes in many parts of the kernel code.
The kernel is modularized now in almost every way it can be done, but
there are things simply impossible.

>   That was one of the things in which Solaris is light years ahead of=20
> Linux (sorry to have to say that, but it's the hard truth).

I don't see the difference with Solaris. If you want to upgrade your
Solaris you have to apply a lot of upgrades, also to the kernel. That's
the impression I have from the little contact I had with Solaris.

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


