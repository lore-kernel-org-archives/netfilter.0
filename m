From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: linux-2.6.9-rc1 compilation and configuration issue (fwd)
Date: Wed, 08 Sep 2004 21:26:06 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094671566.3884.9.camel@anduril.intranet.cartel-securite.net>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Cc: Jose Maria Lopez <jkerouac@bgsec.com>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Le mer 08/09/2004 =E0 20:23, Aleksandar Milivojevic a =E9crit :=20
> ....  Instead of just downloading one or two additional kernel modules=20
> (couple of kB) that we really need (in either source or object format),=
=20
> and there would be no need to recompile them when upgrading the kernel.=
=20

That would imply that everybody would have the same kernel, which is far
from being the case, from one distro to another, and from one's build to
other's, for anyone can build its own kernel, with its own options,
optimizations and architecture.

>   That was one of the things in which Solaris is light years ahead of=20
> Linux (sorry to have to say that, but it's the hard truth).

The hard truth is that Solaris is closed source and has a few
architectures to maintain. Which means they just have to produce a
couple of modules to please their all users. If you consider a single
Linux distro, it will be the same. You can download packages, that
contains binary modules, and they will install just fine, just like
Solaris. But just like for Solaris, you will only have features
maintainers consider relevant for you.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

