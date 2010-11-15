From: Jesper Juhl <jj@chaosbits.net>
Subject: Re: [PATCH] Reduce number of pointer dereferences in IPv6 netfilter
 LOG module function dump_packet()
Date: Mon, 15 Nov 2010 22:50:13 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1011152249160.20408@swampdragon.chaosbits.net>
References: <alpine.LNX.2.00.1011142241260.1253@swampdragon.chaosbits.net> <1289782215.2743.167.camel@edumazet-laptop> <alpine.LNX.2.00.1011152246050.20408@swampdragon.chaosbits.net>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-2008363228-1289857813=:20408"
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1011152246050.20408@swampdragon.chaosbits.net>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: Netfilter Core Team <coreteam@netfilter.org>, Jan Rekorajski <baggins@pld.org.pl>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2008363228-1289857813=:20408
Content-Type: TEXT/PLAIN; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Nov 2010, Jesper Juhl wrote:

> On Mon, 15 Nov 2010, Eric Dumazet wrote:
>=20
> > Le dimanche 14 novembre 2010 =E0 22:47 +0100, Jesper Juhl a =E9crit :
> > > By adding two pointer variables to=20
> > > net/ipv6/netfilter/ip6t_LOG.c::dump_packet() we can save 19 bytes of =
.text=20
> > > and many pointer dereferences.
> > >=20
> > > before:
> > >    text    data     bss     dec     hex filename
> > >    6258     600    3088    9946    26da net/ipv6/netfilter/ip6t_LOG.o
> > >=20
> > > after:
> > >    text    data     bss     dec     hex filename
> > >    6239     600    3088    9927    26c7 net/ipv6/netfilter/ip6t_LOG.o
> > >=20
> > >=20
> > > Please Cc me on replies.
> > >=20
> > >=20
> > > Signed-off-by: Jesper Juhl <jj@chaosbits.net>
> > > ---
> > >  ip6t_LOG.c |   16 ++++++++++------
> > >  1 file changed, 10 insertions(+), 6 deletions(-)
> > >=20
> > > diff --git a/net/ipv6/netfilter/ip6t_LOG.c b/net/ipv6/netfilter/ip6t_=
LOG.c
> > > index 09c8889..51d10a5 100644
> > > --- a/net/ipv6/netfilter/ip6t_LOG.c
> > > +++ b/net/ipv6/netfilter/ip6t_LOG.c
> [...]
> >=20
> > Same comment than previous patch, you add a NULL dereference.
> >=20
> Hopefully this is beter (same as change done to the other (ipv4) patch).
>=20
>=20
>=20
> Fewer pointer derefs and smaller .text size for
> net/ipv4/netfilter/ipt_LOG.c::dump_packet()
>=20
I'm an idiot, that should of course read

"net/ipv6/netfilter/ip6t_LOG.c::dump_packet()"

That'll teach me not to cut'n'paste descriptions :-(

--=20
Jesper Juhl <jj@chaosbits.net>            http://www.chaosbits.net/
Don't top-post http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please.

--8323328-2008363228-1289857813=:20408--
