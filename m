From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: linux-2.6.9-rc1 compilation and configuration issue (fwd)
Date: 08 Sep 2004 19:39:59 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094665198.23966.21.camel@nostromo.bgsecm.com>
References: <200409072333.i87NXJZA012251@bassett.home.org>
	<413F12D1.3050108@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <413F12D1.3050108@pbl.ca>
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

El mi=C3=A9, 08 de 09 de 2004 a las 16:10, Aleksandar Milivojevic escribi=
=C3=B3:
> James B. Hiller wrote:
> > Hi!
> >=20
> > No takers?  Or have I put this in the wrong forum?  If I have, please
> > let me know where to go with it.
>=20
> Wish I could help you.  But I never seem to get past the point of even=20
> applying the patches ;-)
>=20
> Sure, those I don't need apply clean, those that I'm interested in like=
=20
> tcp windows tracking always fail.
>=20
> BTW, why do we need to recompile entire kernel and iptables, just to ge=
t=20
> one tiny miny module installed?  It kind of beats the hole idea of=20
> modularity and loadable modules, isn't it?  (well, at least half of the=
=20
> idea behind it, anyhow) Why can't we just compile two source files and=20
> place resulting object files into appropriate directories=20
> (kernel/iptables version independent)?  And not to have to worry about=20
> recompiling them when new kernel release is out there.

Patches changes the source code of the kernel and iptables in a lot
of places, not just a modular place in the code you can separate from
the rest, that's why you can't patch code from modules or pieces of
code, because many places in the code are changed when you apply the
patches.

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


